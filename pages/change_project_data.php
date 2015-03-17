<?php

	$user_id=$_SESSION['user_id'];
	
	$applicant=Employee::get_active_employee_one('a.user_id=?',array($user_id));
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$project_view=Employee::getProjectView($applicant, $combo_project_name_def,'change_project_data');
?>
<script>
	var combo_project_name="<?php _p($combo_project_name_def) ?>";
	$(function() {
		bindProjectView();
		bindAll();
		setDatePicker();
		numeric($('#salary'));
		fixSelect();
	});
	function bindAll() {
		bind('#btn_back','click',Back);
	}
	function Back() {
		location.href="employee";
	}
function SaveProject() {
	var p=$('#div_current_contract');
	var data={}
	data['type']='saveProject';
	var success=function(msg) {
		location.href="employee";
	}
	if (!validate_empty_col(p,['start_date'])) return false;
	if (!SaveProject2(p, data, success)) return;
}
function SaveProject2(p, data, func) {
	if (!validate_empty_col(p,['job_title','position','project_name_id','project_number_id','project_location','responsible_superior','salary','salary_band'])) return false;
	data = prepareDataMultiInput(data
	, ['job_title','position','project_name','project_number','team_leader','principal_advisor','financial_controller','project_location'
	,'responsible_superior','SAP_No','salary','salary_band','working_time','reason','start_date','end_date']
	, p);
	
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
		return false;
	}
	
	var success=function(msg) {
		$('#tbl_salary_history tbody').empty();
		$('#tbl_salary_history').append(msg);
		hideColumns('tbl_salary_history');
		if (func) func();
	}
	ajax('employeeAjax.php',data, success);
}
</script>
<button id='btn_back' class='button_link'>Back</button>
<h1><?php _p($applicant['first_name']." ".$applicant['last_name']." <br>Last Project Date:".formatDate($applicant['start_date']).' to '.formatDate($applicant['end_date'])) ?></h1>
<div id="div_current_contract">
<?php _p($project_view) ?>
</div>
