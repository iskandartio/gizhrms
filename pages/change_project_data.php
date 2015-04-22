<?php
	$user_id=$_SESSION['user_id'];
	$applicant=Employee::get_active_employee_one('a.user_id=?',array($user_id));
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$project_view=Employee::getProjectView($applicant, $combo_project_name_def,'change_project_data');
?>
<script src='js/ProjectView.js'></script>
<script>
	var combo_project_name="<?php _p($combo_project_name_def) ?>";
	$(function() {
		var a=new projectView("#div_current_contract", beforeSave, afterSave, "change_project_data_ajax");
		a.project_name_choice=combo_project_name;
		a.type='save_change_project';
		bindAll();
	});
	function beforeSave() {
		var p=$('#div_current_contract');
		if (!validate_empty_col(p,['start_date'])) return false;
		return true;
	}
	function afterSave(msg) {
		location.href="change_project_data";
	}
	function bindAll() {
		bind('#btn_back','click',Back);
	}
	function Back() {
		location.href="employee";
	}

</script>
<button id='btn_back' class='button_link'>Back</button>
<h1><?php _p($applicant['first_name']." ".$applicant['last_name']." <br>Last Project Date:".formatDate($applicant['start_date']).' to '.formatDate($applicant['end_date'])) ?></h1>
<div id="div_current_contract">
<?php _p($project_view) ?>
</div>
