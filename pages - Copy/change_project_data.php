<?php
	
	$edit_id=$_SESSION['edit_id'];
	$end_date=db::select_single('applicants', 'coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) v','user_id=?','',array($edit_id));
	$applicant=db::select_one('contract_history a
left join applicants b on a.user_id=b.user_id
left join project_name c on c.project_name=a.project_name
left join project_number d on d.project_number=a.project_number'
, 'a.*, b.first_name, b.last_name, c.project_name_id, d.project_number_id', 'a.user_id=?', 'start_date desc', array($edit_id));
	
	$sql="select salary_band from salary_band order by salary_band";
	$res=db::DoQuery($sql);
	$salary_band_option=shared::select_combo_complete($res, 'salary_band', '-Choose One-', '', $applicant['salary_band']);
	$combo_project_name=shared::select_combo_complete(Project::getProjectName(), 'project_name_id', '-Project Name-', 'project_name', $applicant['project_name_id']);
	$combo_project_number=shared::select_combo_complete(Project::getProjectNumberByProjectName($applicant['project_name_id']), 'project_number_id', '-Project Number-', 'project_number', $applicant['project_number_id']);
?>
<script>
	$(function() {
		
		bindAll();
		setDatePicker();
		numeric($('#salary'));
	});
	function bindAll() {
		bind('#btn_save_project','click', SaveProject);
		bind('#btn_back','click',Back);
		bind('#project_name_id','change',ChangeProjectName);
		bind('#project_number_id','change',ChangeProjectNumber);
	}
	function Back() {
		location.href="employee";
	}
	function SaveProject() {
		if (!validate_empty(['start_date','end_date'])) return;
		var data={}
		data['type']="saveProject";
		data=prepareDataText(data, ['salary_band','reason','start_date','project_location','responsible_superior','SAP_No','position','job_title']);
		data=prepareDataHtml(data, ['team_leader','principle_advisor']);
		data['project_name']=$('.project_name_id').find('option:selected').html();
		data['project_number']=$('.project_number_id').find('option:selected').html();
		data=prepareDataDecimal(data, ['salary']);
		var success=function(msg) {
			alert(msg);
			if (msg=='Success') {
				location.href="employee_detail";
			}
		}
		ajax('employeeAjax.php', data, success);
	}
	function ChangeProjectName() {
		var data={}
		data['type']='getProjectNameAndNumber';
		data['project_name_id']=$(this).val();
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('.project_number_id').html(d['combo_project_number']);
			$('#team_leader').html(d['team_leader']);
			$('#principle_advisor').html('');
			fixSelect();
		}
		ajax('projectAjax.php',data, success);
	}
	function ChangeProjectNumber() {
		var data={}
		data['type']='getProjectNnumberById';
		data['project_number_id']=$(this).val();
		var success=function(msg) {
			$('#principle_advisor').html(msg);
		}
		ajax('projectAjax.php',data, success);
	}
</script>
<button id='btn_back' class='button_link'>Back</button>
<h1><?php _p($applicant['first_name']." ".$applicant['last_name']." <br>Last Project Date:".formatDate($applicant['start_date']).' to '.formatDate($applicant['end_date'])) ?></h1>
<div id="div_current_contract">

<table>
	<tr><td>Start Date</td><td>:</td><td><?php _t("start_date");?></td></tr>
	<tr><td>End Date</td><td>:</td><td><?php _p(formatDate($end_date));?></td></tr>
	<tr><td>Project Name</td><td>:</td><td><?php _p($combo_project_name)?></td></tr>
	<tr><td>Team Leader</td><td>:</td><td><span id='team_leader'><?php _p(_lbl("team_leader", $applicant));?></span></td></tr>
	<tr><td>Project Number</td><td>:</td><td><?php _p($combo_project_number);?></td></tr>
	<tr><td>Principle Advisor</td><td>:</td><td><span id='principle_advisor'><?php _p(_lbl("principle_advisor", $applicant));?></span></td></tr>

	<tr><td>Project Location</td><td>:</td><td><?php _t("project_location", $applicant);?></td></tr>
	
	<tr><td>Responsible Superior</td><td>:</td><td><?php _t("responsible_superior", $applicant);?></td></tr>
	<tr><td>SAP No</td><td>:</td><td><?php _t("SAP_No", $applicant);?></td></tr>
	<tr><td>Position</td><td>:</td><td><?php _t("position", $applicant);?></td></tr>
	<tr><td>Job Title</td><td>:</td><td><?php _t("job_title", $applicant, "60");?></td></tr>
</table>
<h1>Salary</h1>
<table>
	<tr><td>Salary</td><td>:</td><td><?php _t("salary", formatNumber($applicant['salary']));?></td></tr>
	<tr><td>Salary Band</td><td>:</td><td><?php _p($salary_band_option) ?></td></tr>
	<tr><td>Reason</td><td>:</td><td><?php _t("reason", $applicant);?></td></tr>
</table>
<button class='button_link' id='btn_save_project'>Change Project</button>

</div>
