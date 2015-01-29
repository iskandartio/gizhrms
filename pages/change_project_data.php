<?php
	
	$edit_id=$_SESSION['edit_id'];
	$applicant=db::select_one('contract_history a
left join applicants b on a.user_id=b.user_id'
, 'a.*, b.first_name, b.last_name', 'a.user_id=?', 'start_date desc', array($edit_id));
	
	$sql="select salary_band from salary_band order by salary_band";
	$res=db::DoQuery($sql);
	$salary_band_option=shared::select_combo_complete($res, 'salary_band', '-Choose One-', '', $applicant['salary_band']);
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
	}
	function Back() {
		location.href="employee";
	}
	function SaveProject() {
		if (!validate_empty(['start_date','end_date'])) return;
		var data={}
		data['type']="saveProject";
		data=prepareDataText(data, ['salary_band','reason','start_date','end_date', 'project_name','project_number','project_location','principal_advisor','team_leader','responsible_superior','SAP_No','position','job_title']);
		data=prepareDataDecimal(data, ['salary']);
		var success=function(msg) {
			alert(msg);
			if (msg=='Success') {
				location.href="employee_detail";
			}
		}
		ajax('employeeAjax.php', data, success);
	}
</script>
<button id='btn_back' class='button_link'>Back</button>
<h1><?php _p($applicant['first_name']." ".$applicant['last_name']) ?></h1>
<div id="div_current_contract">

<table>
	<tr><td>Start Date</td><td>:</td><td><?php _t("start_date", date('Y-m-d'));?></td></tr>
	<tr><td>End Date</td><td>:</td><td><?php _t("end_date");?></td></tr>
	<tr><td>Project Name</td><td>:</td><td><?php _t("project_name", $applicant);?></td></tr>
	<tr><td>Project Number</td><td>:</td><td><?php _t("project_number", $applicant);?></td></tr>
	<tr><td>Project Location</td><td>:</td><td><?php _t("project_location", $applicant);?></td></tr>
	<tr><td>Principal Advisor</td><td>:</td><td><?php _t("principal_advisor", $applicant);?></td></tr>
	<tr><td>Team Leader</td><td>:</td><td><?php _t("team_leader", $applicant);?></td></tr>
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
