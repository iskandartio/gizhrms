<?php
	$res=db::DoQuery("select a.user_id, a.first_name, a.last_name from applicants a
left join  m_user_role b on a.user_id=b.user_id 
left join m_role c on c.role_id=b.role_id 
where role_name='employee' order by a.first_name, a.last_name");
	$combo_user="<select id='employee_id' class='user_id'><option value=''>-User-</option>";
	foreach ($res as $row) {
		$combo_user.="<option value='".$row['user_id']."'>".$row['first_name']." ".$row['last_name']."</option>";
	}
	$res=db::select('business','business_id,business_val','','sort_id');
	$combo_business="<select id='filter_business'><option value=''>-Nature of Business-</option>";
	foreach ($res as $row) {
		$combo_business.="<option value='".$row['business_id']."'>".$row['business_val']."</option>";
	}
	$combo_business.="</select>";
	
	$res=db::select('vacancy_progress','vacancy_progress_id, status_val, sort_id','','sort_id');
	$combo_status='';
	$status_choice="var status_arr={";
	$first=true;
	foreach ($res as $row) {
		$combo_status.="<option value='".$row['vacancy_progress_id']."'>".$row['status_val']."</option>";
		if (!$first) {
			$status_choice.=",";
		} else  {
			$first=false;
		}
		$status_choice.= $row['vacancy_progress_id'].":'".$row['status_val']."'";
	}
	$status_choice.="}";
	if ($_SESSION['role_name']=='employee')  {
		$res=db::DoQuery("select distinct a.vacancy_id, b.vacancy_code, b.vacancy_name, b.vacancy_progress_id from vacancy_employee a
left join vacancy b on b.vacancy_id=a.vacancy_id 
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where a.employee_id=? and c.status_val!='closing'", array($_SESSION['uid']));
	} else {
		$res=db::select('vacancy','vacancy_id, vacancy_code, vacancy_name, vacancy_progress_id','curdate() between vacancy_startdate and vacancy_closedate','vacancy_code');
	}
	$combo_vacancy='';
	$vacancy_progress="var vacancy_progress={";
	$first=true;
	foreach ($res as $row) {
		if (!$first) {
			$vacancy_progress.=",";
		} else  {
			$first=false;
		}
		$combo_vacancy.="<option value='".$row['vacancy_id']."'>".$row['vacancy_code']."-".$row['vacancy_name']."</option>";	
		$vacancy_progress.= $row['vacancy_id'].":'".$row['vacancy_progress_id']."'";
	}
	
	$vacancy_progress.="}";
?>
<script>
	var fields={'user_id':0, 'ranking_id':7, 'user_comment':8, 'btn':9}
	var field_user=generate_assoc(['vacancy_employee_id','employee_id','btn']);
	<?php _p($status_choice);?>;
	<?php _p($vacancy_progress);?>;
	$(function() {
		bind('#vacancy_id','change',ChangeVacancyId);
		bind('#vacancy_progress_id','change',ChangeVacancyProgressId);
		bind('#search','click',Search);
		bind('#next_vacancy_progress_id','change',ChangeNextVacancyProgressId);
		bind('#btn_shortlist',"click", Shortlist);
		
		$('#btn_add_user').hide();
		$('#btn_shortlist').hide();
		bind("#btn_add_user","click", AddUser);
		hideColumns('tbl_user');
		
		fixSelect();
	});
	function Delete() {
		var par=$(this).parent().parent();
		var data="type=delete&vacancy_id="+$('#vacancy_id').val()+"&user_id="+getChild(par, 'user_id');
		$.ajax({
			type:'post',
			url: 'filter_applicantAjax.php',
			data:data,
			success:function(msg) {
				alert('Removed from shortlist');
				btnChange(par, ['save','interview']);
				
				bind('.btn_save',"click",Save);
				bind('.btn_interview',"click",Interview);
			}
		});
	}
	function Shortlist() {
		var data="type=shortlist&vacancy_id="+$('#vacancy_id').val()+"&vacancy_progress_id="+$('#vacancy_progress_id').val()+"&next_vacancy_progress_id="+$('#next_vacancy_progress_id').val();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data:data,
			success: function(msg) {
				$('#search_result').html(msg);
				bind('.btn_save',"click",Save);
				bind('.btn_delete',"click",Delete);
				bind('#interview_all',"click", InterviewAll);
				bind('#closing',"click", Closing);
				$('#tbl_filter_applicant tbody tr').each(function() { 
					var v=$(this).children("td:eq("+fields['ranking_id']+")").children("select");
					$(v).data("originalValue", $(v).val());
				});
			}
		});
	}
	function Closing() {
		var data="type=closing&vacancy_id="+$('#vacancy_id').val()+"&next_vacancy_progress_id="+$('#next_vacancy_progress_id').val();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data:data,
			success:function(msg) {
				alert('Success');
				Search();
			}
		});
	}
	function InterviewAll() {
		var data="type=interviewall&vacancy_id="+$('#vacancy_id').val()+"&next_vacancy_progress_id="+$('#next_vacancy_progress_id').val();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data:data,
			success:function(msg) {
				alert('Success');
				Search();
			}
		});
	}
	function Search() {
		var data='type=search';
		data=prepareDataText(data,['vacancy_id','vacancy_progress_id','next_vacancy_progress_id', 'filter_name','filter_city','filter_business','filter_computer_skill','filter_professional_skill']);
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data : data,
			success: function(msg) {
				$('#freeze').hide();
				$('#search_result').html(msg);
				bind('.btn_save',"click",Save);
				bind('.btn_interview',"click",Interview);
				bind('.btn_delete',"click",Delete);
				hideColumns('tbl_filter_applicant');
				$('#tbl_filter_applicant tbody tr').each(function() { 
					var v=$(this).children("td:eq("+fields['ranking_id']+")").children("select");
					$(v).data("originalValue", $(v).val());
				});
			}
		});
	}
	function Interview() {
		var par=$(this).parent().parent();
		$('#freeze').show();
		data="type=interview";
		data+="&vacancy_id="+$('#vacancy_id').val();
		data+="&next_vacancy_progress_id="+$('#next_vacancy_progress_id').val();
		data+="&user_id="+getChild(par,'user_id');
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				alert("Added to shortlist");
				btnChange(par, ['save','delete']);
				bind('.btn_save',"click", Save);
				bind('.btn_delete',"click", Delete);
			}
		});
	}
	function ChangeVacancyId() {
		var progress=vacancy_progress[$('#vacancy_id').val()];
		if (progress=='') {
			progress=0;
		}
		$('#vacancy_progress_id').val(progress);
		ChangeVacancyProgressId();
		
		
		fixSelect();
		
	}
	function ChangeNextVacancyProgressId() {
		var data="type=get_user";
		data+="&vacancy_progress_id="+$('#next_vacancy_progress_id').val(); 
		data+="&vacancy_id="+$('#vacancy_id').val(); 
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data : data,
			success: function(msg) {
				$('#tbl_user tbody').empty();
				$('#tbl_user tbody').append(msg);
				bind('.btn_delete_user',"click", DeleteUser);
				hideColumns('tbl_user');
			}
		});
		$('#tbl_filter_applicant tbody').empty();
		$('#btn_add_user').show();
		$('#btn_shortlist').show();
	}
	function ChangeVacancyProgressId() {
		progress=$('#vacancy_progress_id').val();
		$('#next_vacancy_progress_id').empty();
		$('#next_vacancy_progress_id').append("<option selected value='' disabled>Next Vacancy Progress</option>");
		
		var i=0;
		for (key in status_arr) {
			if (key>progress) {
				$('#next_vacancy_progress_id').append("<option value='"+key+"'"+(i==0?' selected':'')+">"+status_arr[key]+"</option>");
				i++;
			}
		}
		ChangeNextVacancyProgressId();
	}
	function Save() {
		par=$(this).closest("tr");
		var data='type=save';
		data+="&vacancy_id="+$('#vacancy_id').val();
		data+="&next_vacancy_progress_id="+$('#next_vacancy_progress_id').val();
		
		
		for (key in fields) {
			if (key!='btn') data+="&"+key+"="+getChild(par, key);
		}
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data: data,
			success:function(msg) {
				$('#freeze').hide();
				var v=$(par).children("td:eq("+fields['ranking_id']+")").children("select");
				$(v).data("originalValue", $(v).val());
				alert('Success');
				
			}
		});
		
	}
	
		
	function AddUser() {
		var a="<tr><td></td><td>";
		a+="<?php _p($combo_user)?>";
		a+="</td><td><img src='images/save.png' class='btn_save_user'/> <img src='images/delete.png' class='btn_delete_user'/></td></tr>";
		$('#tbl_user tbody').append(a);
		
		bind('.user_id','change',ValidateUser);
		bind('.btn_save_user',"click", SaveUser);
		bind('.btn_delete_user',"click", DeleteUser);
	}
	function ValidateUser() {
		validate_user(this);
	}
	function validate_user(obj) {
		var par=$(obj).closest("tr");
		var f=true;
		current_idx=par.index();
		
		current_val=getChild(par, 'employee_id', field_user);
		par=$('#tbl_user tbody tr');
		$.each(par, function(idx) {
			
			if (idx!=current_idx) {
				v=getChild($(this), 'employee_id', field_user);
				if (v==current_val) {
					alert('User already exists!');
					f=false;
					return false;
				}
			}
		});
		
		return f;
		
	}
	function SaveUser() {
		if (!validate_user(this)) {
			
			return;
		}
		par=$(this).closest("tr");
		if (getChild(par,'employee_id', field_user)=='') {
			par.remove();
			return;
		}
		var data="type=add_user";
		data+="&employee_id="+getChild(par,'employee_id',field_user);
		data+="&vacancy_progress_id="+$('#next_vacancy_progress_id').val(); 
		data+="&vacancy_id="+$('#vacancy_id').val(); 
		alert(data);
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				setHtmlText(par, 'vacancy_employee_id',msg, field_user);
				selectedToLabel(par, 'employee_id', field_user);
				setHtmlText(par, 'btn', "<img src='images/delete.png' class='btn_delete_user'/>", field_user);
				bind('.btn_delete_user',"click", DeleteUser);
			}
		});
		
	}
	function DeleteUser() {
		par=$(this).closest("tr");
		var data="type=delete_user";
		data+="&vacancy_employee_id="+getChild(par,'vacancy_employee_id',field_user);
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'filter_applicantAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				par.remove();		
				
			}
		});
		
		
	}
</script>
<select id="vacancy_id">
<option selected value=''>Vacancy</option>
<?php _p($combo_vacancy) ?>
</select> <select id="vacancy_progress_id">
<option selected value=''>Vacancy Progress</option>
<?php _p($combo_status)?>
</select> 
<p>
<select id="next_vacancy_progress_id">
<option selected value=''>Next Vacancy Progress</option>

</select>
<?php if ($_SESSION['role_name']=='admin') {?>
<button class="button_link" id="btn_add_user">Add User</button> 
<button class="button_link" id="btn_shortlist">Shortlist</button>
<?php }?>
<table id="tbl_user" class="tbl">
	<thead><tr><th>Vacancy User Id<th>User</th>
<?php 
if ($_SESSION['role_name']=='admin') {
	_p("<th></th>");
}?>
	</tr></thead>
	<tbody></tbody>
</table>

<p>

<?php _t("filter_name") ?> 
<?php _t("filter_city") ?> 
<?php _p($combo_business) ?> 
<?php _t("filter_computer_skill") ?> 
<?php _t("filter_professional_skill") ?>
<button id="search" class="button_link">Search</button>
<p>
<div id="search_result"></div>