<?php
	if ($type=='terminate') {
		if (!isset($terminate_date)) $terminate_date=null;
		Employee::terminate($severance, $service, $housing, $new_severance, $reason, $terminate_date);
	}
	if ($type=='save_terminate') {
		
		db::update('employee','contract_state','user_id=?',array('Terminate', $user_id));
		die;
	}
	
	if ($type=='show_recontract') {
		$_SESSION['user_id']=$user_id;
		$applicant=Employee::get_active_employee_one('a.user_id=?', array($user_id));	
		$project_name_choice=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
		$result=Employee::getShowTerminate('', $applicant, 'recontract');
		$result.=Employee::getProjectView($applicant, $project_name_choice, 'recontract');
		$data['result']=$result;
		$data['project_name_choice']=$project_name_choice;
		die(json_encode($data));
	}
	if ($type=='show_terminate') {
		$_SESSION['user_id']=$user_id;
		$result=Employee::getShowTerminate('');
		die($result);
	}

	if ($type=='search_expiring') {
		$res=Employee::get_expiring_res();
		$result=Employee::get_expiring_table($res);
		die($result);
	}

?>