<?php
	if ($type=='load') {
		$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
		$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
		$project_view=Employee::getProjectView($applicant, $combo_project_name_def);
		
		$result=$project_view;
		$data['result']=$result;
		$data['project_name_choice']=$combo_project_name_def;
		die(json_encode($data));
	}
?>