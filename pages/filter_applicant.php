<?php
	$res=db::DoQuery("select a.user_id, a.first_name, a.last_name from applicants a
left join  m_user_role b on a.user_id=b.user_id 
left join m_role c on c.role_id=b.role_id 
where role_name='employee' order by a.first_name, a.last_name");
	$combo_user="";
	foreach ($res as $row) {
		if ($combo_user!="") $combo_user.=",";
		$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
	}
	$combo_user="[".$combo_user."]";
/*
	$combo_user="<select id='employee_id' class='user_id' title='User'><option value=''>-User-</option>";
	foreach ($res as $row) {
		$combo_user.="<option value='".$row['user_id']."'>".$row['first_name']." ".$row['last_name']."</option>";
	}
*/
	$res=db::select('business','business_id,business_val','','sort_id');
	$combo_business="<select id='filter_business' title='Nature of Business'><option value=''>-Nature of Business-</option>";
	foreach ($res as $row) {
		$combo_business.="<option value='".$row['business_id']."'>".$row['business_val']."</option>";
	}
	$combo_business.="</select>";
	
	$res=db::select('vacancy_progress','vacancy_progress_id, vacancy_progress_val, sort_id','','sort_id');
	$combo_status='';
	$status_choice_sorted="var status_arr_sorted=[";
	$status_choice="var status_arr={";
	$first=true;
	foreach ($res as $row) {
		$combo_status.="<option value='".$row['vacancy_progress_id']."'>".$row['vacancy_progress_val']."</option>";
		if (!$first) {
			$status_choice.=",";
			$status_choice_sorted.=",";
		} else  {
			$first=false;
		}
		$status_choice.= $row['vacancy_progress_id'].":'".$row['vacancy_progress_val']."'";
		$status_choice_sorted.="'".$row['vacancy_progress_id']."'";
	}
	$status_choice.="}";
	$status_choice_sorted.="]";
	if ($_SESSION['role_name']=='employee')  {
		$res=db::DoQuery("select distinct a.vacancy_id, concat(b.vacancy_name, ' (', b.vacancy_code, '-', b.vacancy_code2, ')') vacancy, b.vacancy_progress_id from vacancy_employee a
left join vacancy b on b.vacancy_id=a.vacancy_id 
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where a.employee_id=? and ifnull(c.vacancy_progress_val,'')!='Closing'", array($_SESSION['uid']));
	} else {
		$res=db::DoQuery("select a.vacancy_id, concat(a.vacancy_name, ' (', a.vacancy_code, '-', a.vacancy_code2, ')') vacancy, a.vacancy_progress_id from vacancy a 
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
where ifnull(b.vacancy_progress_val,'')!='Closing' order by a.vacancy_code, a.vacancy_code2");
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
		$combo_vacancy.="<option value='".$row['vacancy_id']."'>".$row['vacancy']."</option>";	
		$vacancy_progress.= $row['vacancy_id'].":'".$row['vacancy_progress_id']."'";
	}
	
	$vacancy_progress.="}";
?>
<script>
	var fields={'user_id':0, 'ranking_id':4, 'user_comment':5, 'interview_place':6, 'interview_date':7, 'interview_time':8, 'btn':9}
	var field_closing=generate_assoc(['contract_history_id','user_id','first_name','last_name','job','contract_duration','salary','salary_band','btn']);
	var field_user=generate_assoc(['vacancy_employee_id','employee_id','btn']);
	<?php _p($status_choice);?>;
	<?php _p($status_choice_sorted);?>;
	<?php _p($vacancy_progress);?>;
	$(function() {
		bind('#vacancy_id','change',ChangeVacancyId);
		bind('#vacancy_progress_id','change',ChangeVacancyProgressId);
		bind('#search','click',Search);
		bind('#next_vacancy_progress_id','change',ChangeNextVacancyProgressId);
		bind('#btn_shortlist',"click", Shortlist);
		
		$('#btn_add_user').hide();
		$('#div_shortlist').hide();
		bind("#btn_add_user","click", AddUser);
		hideColumns('tbl_user');
		$('#filter_question').hide();
		$('#toggle_filter_question').bind("click",ToggleFilterQuestion);
		
		fixSelect();
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		numeric($('#salary_expectation_start'));
		numeric($('#salary_expectation_end'));
	});
	


	function ShowDetail() {
		var data={};
		data['type']='show_detail';
		data['user_id']=getChild($(this).closest("tr"), 'user_id');
		data['vacancy_id']=$('#vacancy_id').val();
		var success=function(msg) {
			$('#show_detail').html(msg);
			
			$('#show_detail').dialog("open");
			
		};
		ajax("filter_applicantAjax.php", data, success);
	}
	
	function ToggleFilterQuestion(){
		if ($('#filter_question').css('display')=='none') {
			$('#filter_question').show();
			$(this).html('Hide Filter Question');
		} else {
			$('#filter_question').hide();
			$(this).html('Show Filter Question');
		}
	}
	
	function Delete() {
		var par=$(this).parent().parent();
		var data={};
		data['type']='delete';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		data['user_id']=getChild(par, 'user_id');
		var success=function(msg) {
			
			if (msg=='Closing') {
				btnChange(par, ['accept','reject'], field_closing);
				$('#closing').hide();
			} else {
				btnChange(par, ['save','interview','reject']);
				$('#div_shortlist').hide();
			}
			
			bind('.btn_save',"click",Save);
			bind('.btn_interview',"click",Interview);
			bind('.btn_reject',"click",Reject);
			bind('.btn_accept',"click",Accept);
			
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Restart() {
		var par=$(this).parent().parent();
		var data={};
		data['type']='restart';
		data['vacancy_id']=$('#vacancy_id').val();
		data['user_id']=getChild(par, 'user_id');
		data['vacancy_progress_id']=$('#vacancy_progress_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var success=function(msg) {
			if (msg=='Closing') {
				btnChange(par,['accept','reject']);
			} else {
				btnChange(par, ['save','interview','reject']);
			}
			
			bind('.btn_save',"click",Save);
			bind('.btn_interview',"click",Interview);
			bind('.btn_reject',"click",Reject);
			bind('.btn_accept',"click",Accept);
		}
		ajax("filter_applicantAjax.php", data, success);

	}
	
	function Shortlist() {
		var data={};
		data['type']='shortlist';
		data['vacancy_id']=$('#vacancy_id').val();
		data['vacancy_progress_id']=$('#vacancy_progress_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var success=function(msg) {
			$('#search_result').html(msg);
			bind('.btn_accept',"click",Accept);
			bind('.btn_save',"click",Save);
			bind('.btn_delete',"click",Delete);
			bind('#interview_all',"click", InterviewAll);
			bind('#closing',"click", Closing);
			hideColumns('tbl_filter_applicant');
			$('#tbl_filter_applicant tbody tr').each(function() { 
				var v=$(this).children("td:eq("+fields['ranking_id']+")").children("select");
				$(v).data("originalValue", $(v).val());
			});
			setDatePicker();
			hideColumnsArr('tbl_result', ['contract_history_id','user_id'], field_closing);
			$('input[id="salary"]').each(function(idx) {
				numeric($(this));
			});
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Closing() {
		var data={};
		data['type']='closing';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var success=function(msg) {
			alert('Success');
			Search();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function InterviewAll() {
		if (!validate_empty(['interview_date','interview_time'])) return;
		
		var data={};
		data['type']='interviewall';
		prepareDataText(data, ['vacancy_id','next_vacancy_progress_id','vacancy_progress_id']);
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
			} else {
				alert('Success');
				Search();
				$.ajax({
					type : "post",
					url : "send_email.php"						
				});
			}
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Search() {
		if (!validate_empty(['vacancy_id','vacancy_progress_id','next_vacancy_progress_id'])) return;
		var data={};
		data['type']='search';
		data=prepareDataText(data,['vacancy_id','vacancy_progress_id','next_vacancy_progress_id', 'filter_name'
		,'filter_city','filter_business','filter_computer_skill','filter_professional_skill','age_start','age_end']);
		data=prepareDataDecimal(data,['salary_expectation_start','salary_expectation_end']);
		data['filter_rejected']=$('#filter_rejected').prop('checked');
		var filter_array=new Array();
		$('select[id^="filter_answer_"]').each(function(idx) {
			var filter_answer={};
			
			filter_answer[$(this).attr("id").replace("filter_answer_","")]=$(this).val();
			filter_array.push(filter_answer);
		});
		data['filter_answer']=filter_array;
		var success=function(msg) {
			$('#search_result').html(msg);
			bind('.btn_save',"click",Save);
			
			bind('.btn_interview',"click", Interview);
			bind('.btn_reject',"click", Reject);
			bind('.btn_delete',"click",Delete);
			bind('.btn_restart',"click",Restart);
			bind('.btn_detail',"click",ShowDetail);
			bind('.btn_accept',"click",Accept);
			hideColumns('tbl_filter_applicant');
			$('#tbl_filter_applicant tbody tr').each(function() { 
				var v=$(this).children("td:eq("+fields['ranking_id']+")").children("select");
				$(v).data("originalValue", $(v).val());
			});
			fixSelect();
			setDatePicker();
			hideColumnsArr('tbl_result',['contract_history_id','user_id'],field_closing);
			
			$('input[id="salary"]').each(function(idx) {
				numeric($(this));
			});
			
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	function Accept() {
		par=$(this).closest("tr");
		var data={};
		data['type']="accept";
		data['job_title']=getChild(par,'job_title',field_closing,'job');
		data['position']=getChild(par,'position',field_closing,'job');
		data['project_name']=getChild(par,'project_name',field_closing,'job');
		data['project_number']=getChild(par,'project_number',field_closing,'job');
		data['principal_advisor']=getChild(par,'principal_advisor',field_closing,'job');
		data['team_leader']=getChild(par,'team_leader',field_closing,'job');
		data['project_location']=getChild(par,'project_location',field_closing,'job');
		data['responsible_superior']=getChild(par,'responsible_superior',field_closing,'job');
		data['SAP_No']=getChild(par,'SAP_No',field_closing,'job');
		data['start_date']=getChild(par,'start_date',field_closing,'contract_duration');
		data['end_date']=getChild(par,'end_date',field_closing,'contract_duration');
		data['salary']=cNum(getChild(par,'salary',field_closing));
		data['salary_band']=getChild(par,'salary_band',field_closing);
		data['user_id']=getChild(par,'user_id',field_closing);
		data['contract_history_id']=getChild(par,'contract_history_id',field_closing);
		prepareDataText(data, ['vacancy_id','next_vacancy_progress_id']);
		var success=function(msg) {
			Search();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Interview() {
		var par=$(this).parent().parent();
		
		var data={};
		data['type']='interview';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		data['user_id']=getChild(par,'user_id');
		
		for (key in fields) {
			if (key!='btn') data[key]=getChild(par, key);
		}
		var success=function(msg) {
			
			if (msg!='') {
				alert(msg);
				return;
			}
			btnChange(par, ['save','delete']);
			bind('.btn_save',"click", Save);
			bind('.btn_delete',"click", Delete);
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Reject() {
		var par=$(this).parent().parent();
		var data={};
		data['type']='reject';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		data['user_id']=getChild(par,'user_id');
		var success=function(msg) {
			btnChange(par, ['restart']);
			
			bind('.btn_restart',"click", Delete);
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function ChangeVacancyId() {
		var progress=vacancy_progress[$('#vacancy_id').val()];
		if (progress=='') {
			progress=0;
		}
		$('#vacancy_progress_id').val(progress);
		ChangeQuestion();
		
		
		
		
	}
	function ChangeQuestion() {
		var data={};
		data['type']='get_question';
		data['vacancy_id']=$('#vacancy_id').val();
		var success=function(msg) {
			$('#filter_question').html(msg);
			ChangeVacancyProgressId();
			fixSelect();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function ChangeNextVacancyProgressId() {
		var data={};
		data['type']='get_user';
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val(); 
		data['vacancy_id']=$('#vacancy_id').val(); 
		var success=function(msg) {
			$('#tbl_user tbody').empty();
			$('#tbl_user tbody').append(msg);
			bind('.btn_delete_user',"click", DeleteUser);
			hideColumns('tbl_user');
	
			if (data['next_vacancy_progress_id']) {
				$('#btn_add_user').show();
				$('#div_shortlist').show();
			}
		}
		ajax("filter_applicantAjax.php", data, success);
		$('#tbl_filter_applicant tbody').empty();
		
		fixSelect();
	}
	function ChangeVacancyProgressId() {
		progress=$('#vacancy_progress_id option:selected').index();
		$('#next_vacancy_progress_id').empty();
		$('#next_vacancy_progress_id').append("<option selected value='' disabled>Next Vacancy Progress</option>");
		
		
		for (var i=0;i<status_arr_sorted.length;i++) {
			if (i>=progress) {
				$('#next_vacancy_progress_id').append("<option value='"+status_arr_sorted[i]+"'"+(i==0?' selected':'')+">"+status_arr[status_arr_sorted[i]]+"</option>");
				
			}
		}
		ChangeNextVacancyProgressId();
		
	}
	function Save() {
		par=$(this).closest("tr");
		if ($('#interview_all').length>0) {
			if (!validate_empty_tbl(par, ['interview_date','interview_place','interview_time'])) return;
		}
		var data={};
		data['type']='save';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		
		
		for (key in fields) {
			if (key!='btn') data[key]=getChild(par, key);
		}
		
		var success=function(msg) {
			var v=$(par).children("td:eq("+fields['ranking_id']+")").children("select");
			$(v).data("originalValue", $(v).val());
			alert('Success');
			
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	function autoCompleteEmployee() {
		$('.user_id').autocomplete({
			matchContains: true,
			minLength: 0,
			source : <?php _p($combo_user)?>,
			focus: function( event, ui ) {
				$(this).val(ui.item.label);
				
				return false;
			},
			select: function( event, ui ) {
				$(this).data("id", ui.item.value);
				return false;
			}
		}).focus(function() {
			$(this).autocomplete('search', $(this).val())
		});
		
	}
		
	function AddUser() {
		var a="<tr><td></td><td>";
		//a+="<?php _p($combo_user)?>";
		a+="<?php _t("user_id");?>";
		a+="</td><td><img src='images/save.png' class='btn_save_user'/> <img src='images/delete.png' class='btn_delete_user'/></td></tr>";
		$('#tbl_user tbody').append(a);
		
		bind('.user_id','change',ValidateUser);
		bind('.btn_save_user',"click", SaveUser);
		bind('.btn_delete_user',"click", DeleteUser);
		autoCompleteEmployee();
		hideColumns('tbl_user');
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
		var data={};
		data['type']='add_user';
		data['employee_id']=getChild(par,'employee_id',field_user);
		data['vacancy_progress_id']=$('#next_vacancy_progress_id').val(); 
		data['vacancy_id']=$('#vacancy_id').val(); 
		
		var success=function(msg) {
			setHtmlText(par, 'vacancy_employee_id',msg, field_user);
			selectedToLabel(par, 'employee_id', field_user);
			setHtmlText(par, 'btn', "<img src='images/delete.png' class='btn_delete_user'/>", field_user);
			bind('.btn_delete_user',"click", DeleteUser);
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	function DeleteUser() {
		par=$(this).closest("tr");
		var data={};
		data['type']='delete_user';
		data['vacancy_employee_id']=getChild(par,'vacancy_employee_id',field_user);
		var success=function(msg) {
			par.remove();		
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
</script>
<select id="vacancy_id" title='Vacancy'>
<option selected value=''>Vacancy</option>
<?php _p($combo_vacancy) ?>
</select> <select id="vacancy_progress_id" title='Recruitment Process'>
<option selected value=''>Vacancy Progress</option>
<?php _p($combo_status)?>
</select> 
<p>
<select id="next_vacancy_progress_id" title='Next Recruitment Process'>
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
<button id="toggle_filter_question" class='button_link'>Show Question Filter</button>
<div id="filter_question"></div>
<div id="advance_filter">
	<table>
		<tr><td>Salary Expectation</td><td>:</td><td><?php _t("salary_expectation_start")?> &nbsp;to <?php _t("salary_expectation_end")?></td></tr>
		<tr><td>Age</td><td>:</td><td><?php _t("age_start")?> &nbsp;to <?php _t("age_end")?></td></tr>
	</table>
</div>
<input type="checkbox" id="filter_rejected"/><label for="filter_rejected">Filter Rejected</label>
<?php _t("filter_name") ?> 
<?php _t("filter_city") ?> 
<?php _p($combo_business) ?> 
<?php _t("filter_computer_skill") ?> 
<?php _t("filter_professional_skill") ?> 

<button id="search" class="button_link">Search</button>
<p>
<div id="search_result"></div>
<div id="show_detail"></div>