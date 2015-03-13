<?php
	$res=employee::get_active_employee_simple();
	$combo_user="";
	$arr=array();
	foreach ($res as $row) {
		if ($combo_user!="") $combo_user.=",";
		$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
		array_push($arr,array('label'=>$row['first_name']." ".$row['last_name'], 'value'=>$row['user_id']));
	}
	
	$combo_user=json_encode($arr);
	
/*
	$combo_user="<select id='employee_id' class='user_id' title='User'><option value=''>-User-</option>";
	foreach ($res as $row) {
		$combo_user.="<option value='".$row['user_id']."'>".$row['first_name']." ".$row['last_name']."</option>";
	}
*/	
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-', 'project_name');
	
	$res=db::select('business','business_id,business_val','','sort_id');
	$combo_business="<select id='filter_business' title='Nature of Business'><option value=''>-Nature of Business-</option>";
	foreach ($res as $row) {
		$combo_business.="<option value='".$row['business_id']."'>".$row['business_val']."</option>";
	}
	$combo_business.="</select>";
	
	$res=db::select('vacancy_progress','vacancy_progress_id, vacancy_progress_val, sort_id','','sort_id');
	$combo_status='';
	$status_choice_sorted=array();
	$status_choice=array();
	foreach ($res as $row) {
		$combo_status.="<option value='".$row['vacancy_progress_id']."'>".$row['vacancy_progress_val']."</option>";
		$status_choice[$row['vacancy_progress_id']]=$row['vacancy_progress_val'];
		array_push($status_choice_sorted, $row['vacancy_progress_id']);
	}
	
	$res=db::DoQuery("select a.vacancy_id, concat(a.vacancy_name, ' (', a.vacancy_code, '-', a.vacancy_code2, ')') vacancy
, a.vacancy_progress_id, a.next_vacancy_progress_id from vacancy a 
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
where ifnull(b.vacancy_progress_val,'')!='Closing' order by a.vacancy_code, a.vacancy_code2");
	
	$combo_vacancy='';
	$vacancy_progress=array();
	foreach ($res as $row) {
		$combo_vacancy.="<option value='".$row['vacancy_id']."'>".$row['vacancy']."</option>";	
		$vacancy_progress[$row['vacancy_id']]['vacancy_progress_id']=$row['vacancy_progress_id'];
		$vacancy_progress[$row['vacancy_id']]['next_vacancy_progress_id']=$row['next_vacancy_progress_id'];
	}
	
?>
<script>
	var fields={'user_id':0, 'ranking_id':4, 'user_comment':5, 'interview_place':6, 'interview_date':7, 'interview_time':8, 'btn':9}
	var field_closing=generate_assoc(['contract_history_id','user_id','name','job','contract_duration','btn']);
	var field_user=generate_assoc(['vacancy_employee_id','employee_id','btn']);
	var project_name_choice="<?php _p($combo_project_name_def)?>";
	var status_choice=<?php _p(json_encode($status_choice))?>;
	var status_choice_sorted=<?php _p(json_encode($status_choice_sorted))?>;
	var vacancy_progress=<?php _p(json_encode($vacancy_progress));?>;
	$(function() {
		bind('#vacancy_id','change',ChangeVacancyId);
		bind('#vacancy_progress_id','change',ChangeVacancyProgressId);
		bind('#search','click',Search);
		bind('#next_vacancy_progress_id','change',ChangeNextVacancyProgressId);
		
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
	function bindClosing() {
		bind('.project_name','change', ChangeProjectName);
		bind('.project_number','change', ChangeProjectNumber);
		bind('.btn_deleteSalarySharing','click',DeleteSalarySharing);
	}


	function ShowDetail() {
		var data={};
		data['type']='show_detail';
		data['user_id']=getChildHtml($(this).closest("tr"), 'user_id', fields);
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
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var f=fields;
		if ($('#next_vacancy_progress_id option:selected').html()=='Closing') {
			f=field_closing;
		}
		data['user_id']=getChildHtml(par, 'user_id', f);
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
		var f=fields;
		if ($('#next_vacancy_progress_id option:selected').html()=='Closing') {
			f=field_closing;
		}
		data['user_id']=getChildHtml(par, 'user_id', f);
		data['vacancy_progress_id']=$('#vacancy_progress_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var success=function(msg) {
			if (msg=='Closing') {
				btnChange(par,['accept','reject'], field_closing);
			} else {
				btnChange(par, ['save','interview','reject'], fields);
			}
			
			bind('.btn_save',"click",Save);
			bind('.btn_interview',"click",Interview);
			bind('.btn_reject',"click",Reject);
			bind('.btn_accept',"click",Accept);
		}
		ajax("filter_applicantAjax.php", data, success);

	}
	

	function Closing() {
		var data={};
		data['type']='closing';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		data['user_id']=getChildHtml(par, 'user_id', f);
		var success=function(msg) {
			alert('Success');
			Search();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Search() {
		if (!validate_empty(['vacancy_id','next_vacancy_progress_id'])) return;
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
			if ($('#next_vacancy_progress_id  option:selected').html()=='Shortlist') {
				hideColumnsArr('tbl_filter_applicant', ['interview_place','interview_date','interview_time'],fields);
			}
			bind('.btn_save',"click",Save);
			
			bind('.btn_interview',"click", Interview);
			bind('.btn_reject',"click", Reject);
			bind('.btn_delete',"click",Delete);
			bind('.btn_restart',"click",Restart);
			bind('.btn_detail',"click",ShowDetail);
			bind('.btn_accept',"click",Accept);
			bind('.btn_add','click',AddSalarySharing);
			bind('.btn_deleteSalarySharing','click',DeleteSalarySharing);
			$('#tbl_result tbody td').css('vertical-align','top');
			hideColumns('tbl_filter_applicant');
			$('#tbl_filter_applicant tbody tr').each(function() { 
				var v=$(this).children("td:eq("+fields['ranking_id']+")").children("select");
				$(v).data("originalValue", $(v).val());
			});
			setDatePicker();
			hideColumnsArr('tbl_result',['contract_history_id','user_id'],field_closing);
			
			$('input[id="salary"]').each(function(idx) {
				numeric($(this));
			});
			bindClosing();
			fixSelect();
			
			
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	
	function Accept() {
		var par=$(this).closest("tr");
		var p=getChildObj(par, 'job', field_closing);
		if (!validate_empty_col(p,['job_title','position','project_name','project_number','project_location','responsible_superior'])) return;
		p=getChildObj(par, 'contract_duration', field_closing);
		if (!validate_empty_col(p,['start_date','end_date','salary','salary_band'])) return;
		var data={};
		data['type']="accept";
		
		data = prepareDataMultiInput(data
		, ['job_title','position','principle_advisor','team_leader','project_location'
		,'responsible_superior','SAP_No','project_name','project_number']
		, getChildObj(par, 'job', field_closing));
		
		data=prepareDataMultiInput(data, ['start_date','end_date','salary','salary_band'], getChildObj(par, 'contract_duration', field_closing));
		data=prepareDataHtml(data, ['user_id','contract_history_id'], par, field_closing);
		data= prepareDataText(data, ['vacancy_id','next_vacancy_progress_id']);
		data['working_time']=$(par).find('.working_time').val();
		var p= getChildObj(par, 'contract_duration', field_closing);
		data['salary_sharing_project_name']=new Array();
		data['salary_sharing_project_number']=new Array();
		data['salary_sharing_percentage']=new Array();
		var percentage=0;
		var flag=false;
		$(p).find('.div_salary_sharing').find('.row').each(function(idx) {
			data['salary_sharing_project_name'].push($(this).find('.project_name').val());
			data['salary_sharing_project_number'].push($(this).find('.project_number').val());
			data['salary_sharing_percentage'].push($(this).find('.percentage').val());
			percentage=percentage+1*$(this).find('.percentage').val();
			flag=true;
		});
		if (percentage!=100 && flag) {
			alert('salary sharing not correct');
			return;
		}

		var success=function(msg) {
		
			Search();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Interview() {
		var par=$(this).closest("tr");
		
		var data={};
		data['type']='interview';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		data=prepareDataText(data, ['interview_place','interview_date','interview_time','ranking_id','user_comment'], par, fields);
		data=prepareDataHtml(data, ['user_id'], par, fields);

		var success=function(msg) {
			
			if (msg!='') {
				alert(msg);
				return;
			}
			btnChange(par, ['save','delete'], fields);
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
		var f=fields;
		if ($('#next_vacancy_progress_id option:selected').html()=='Closing') {
			f=field_closing;
		}
		data['user_id']=getChildHtml(par,'user_id', f);
		var success=function(msg) {
			btnChange(par, ['restart'], f);
			
			bind('.btn_restart',"click", Delete);
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function ChangeVacancyId() {
		var progress=vacancy_progress[$('#vacancy_id').val()]['vacancy_progress_id'];
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
	function ChangeVacancyProgressId() {
		var progress=$('#vacancy_progress_id').val();
		var next_progress=vacancy_progress[$('#vacancy_id').val()]['next_vacancy_progress_id'];
		$('#next_vacancy_progress_id').empty();
		$('#next_vacancy_progress_id').append("<option selected value='' disabled>Next Vacancy Progress</option>");
		var start=false;
		if (progress=='') start=true;
		for (var i=0;i<status_choice_sorted.length;i++) {
			if (start) {
				$('#next_vacancy_progress_id').append("<option value='"+status_choice_sorted[i]+"'"+(status_choice_sorted[i]==next_progress ?' selected':'')+">"+status_choice[status_choice_sorted[i]]+"</option>");			
			} else if (status_choice_sorted[i]==progress) {
				var start=true;				
			}
		}
		if ($('#next_vacancy_progress_id').val()==null) $('option:eq(1)','#next_vacancy_progress_id').prop('selected',true);
		ChangeNextVacancyProgressId();
		
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
			$('#tbl_filter_applicant tbody').empty();
			$('#tbl_result tbody').empty();
			fixSelect();
		}
		ajax("filter_applicantAjax.php", data, success);
		
		
		
	}

	function Save() {
		par=$(this).closest("tr");
		if ($('#interview_all').length>0) {
			if ($('#next_vacancy_progress_id option:selected').html()!='Shortlist') {
				if (!validate_empty_tbl(par, ['interview_date','interview_place','interview_time'])) return;
			}
		}
		var data={};
		data['type']='save';
		data['vacancy_id']=$('#vacancy_id').val();
		data['vacancy_progress_id']=$('#vacancy_progress_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
	
		if ($('#next_vacancy_progress_id option:selected').html()=='Shortlist') {
			data=prepareDataText(data, ['ranking_id','user_comment'], par, fields);	
		} else {
			data=prepareDataText(data, ['interview_place','interview_date','interview_time','ranking_id','user_comment'], par, fields);
		}
		data=prepareDataHtml(data, ['user_id'], par, fields);
		
		var success=function(msg) {
			var v=$(par).children("td:eq("+fields['ranking_id']+")").children("select");
			$(v).data("originalValue", $(v).val());
			alert('Success');
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	function autoCompleteEmployee() {
		$('.employee_id').autocomplete({
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
		a+="<?php _t("employee_id");?>";
		a+="</td><td><img src='images/save.png' class='btn_save_user'/> <img src='images/delete.png' class='btn_delete_user'/></td></tr>";
		$('#tbl_user tbody').append(a);
		
		bind('.employee_id','change',ValidateUser);
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
		
		current_val=getChildHtml(par, 'employee_id', field_user);
		par=$('#tbl_user tbody tr');
		$.each(par, function(idx) {
			
			if (idx!=current_idx) {
				v=getChildHtml($(this), 'employee_id', field_user);
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
		if (getChildHtml(par,'employee_id', field_user)=='') {
			par.remove();
			return;
		}
		var data={};
		data['type']='add_user';
		data['employee_id']=getChildHtml(par,'employee_id',field_user);
		data['vacancy_progress_id']=$('#next_vacancy_progress_id').val(); 
		data['vacancy_id']=$('#vacancy_id').val(); 
		
		var success=function(msg) {
			
			setHtmlText(par, 'vacancy_employee_id',msg, field_user);
			textToLabel(par, ['employee_id'], field_user);
			setHtmlText(par, 'btn', "<img src='images/delete.png' class='btn_delete_user'/>", field_user);
			bind('.btn_delete_user',"click", DeleteUser);
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}
	function DeleteUser() {
		par=$(this).closest("tr");
		var data={};
		data['type']='delete_user';
		data['vacancy_employee_id']=getChildHtml(par,'vacancy_employee_id',field_user);
		var success=function(msg) {
			par.remove();		
		}
		ajax("filter_applicantAjax.php", data, success);
		
	}

	function AddSalarySharing() {
	
		var s="<div class='row'><div class='label width120'>"+project_name_choice+"</div>";
		s+="<div class='label width120'><select class='project_number'><option value=''>-Project Number-</option></select></div>";
		s+="<div class='label width80'><?php _t("percentage","","1")?> % ";
		s+=getImageTags(['delete'],'SalarySharing');
		s+="</div></div>";
		var p=$(this).closest(".row").next();
		$(p).append(s);
		var par=$(this).closest("tr");
		var obj=getChild(par, 'job', fields);
		$(p).find('.project_name_id:last').val($(obj).find('.project_name_id').val());
		bindClosing();
		fixSelect();
		
	}
	function ChangeProjectName() {
		var data={}
		data['type']='getProjectNameAndNumber';
		data['project_name']=$(this).val();
		
		par=$(this).closest(".row");
		if (par.length==0) par=$(this).closest("td");
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			par.find('.project_number').html(d['combo_project_number']);
			par.find('.team_leader').html(d['team_leader']);
			par.find('.principle_advisor').html('');
			fixSelect();
		}
		ajax('projectAjax.php',data, success);
	}
	function ChangeProjectNumber() {
		if ($(this).closest('.div_salary_sharing').length>0) return;
		var data={}
		data['type']='getProjectNumberByName';
		data['project_number']=$(this).val();
		par=$(this).closest(".row");
		if (par.length==0) par=$(this).closest("td");
		var success=function(msg) {
			par.find('.principle_advisor').html(msg);
		}
		ajax('projectAjax.php',data, success);
	}
	function DeleteSalarySharing() {
		$(this).closest(".row").remove();
	}
</script>
<div class='label width160'>Vacancy</div><div class='textbox'><select id="vacancy_id" title='Vacancy'>
<option selected value=''>Vacancy</option>
<?php _p($combo_vacancy) ?>
</select></div>

<div class='label width160'>Current Recruitment Process</div><div class='textbox'>
<select id="vacancy_progress_id" title='Recruitment Process'>
<option selected value=''>Vacancy Progress</option>
<?php _p($combo_status)?>
</select></div>
<div class='label width160'>Next Recruitment Process</div><div class='textbox'>
<select id="next_vacancy_progress_id" title='Next Recruitment Process'>
<option selected value=''>Next Vacancy Progress</option>

</select></div>
<?php if ($_SESSION['role_name']=='admin') {?>
<button class="button_link" id="btn_add_user">Add User</button> 
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
		<tr><td>Age</td><td>:</td><td><?php _t("age_start","","2")?> &nbsp;to <?php _t("age_end","","2")?></td></tr>
	</table>
</div>
<input type="checkbox" id="filter_rejected"/><label for="filter_rejected">Filter Rejected</label>
<?php _t("filter_name") ?> 
<?php _t("filter_city") ?> 
<?php _p($combo_business) ?> 
<?php _t("filter_computer_skill") ?> 
<?php _t("filter_professional_skill") ?> 
<br/>
<button id="search" class="button_link">Search</button>
<p>
<div id="search_result"></div>
<div id="show_detail"></div>