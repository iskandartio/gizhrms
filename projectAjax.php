<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		$id=db::saveSimple('project_name', $_POST);
		die($id);
	}
	if ($type=='saveProjectNumber') {
		$id=db::saveSimple('project_number', $_POST);
		die($id);
	}
	if ($type=='delete') {
		db::deleteSimple('project_name', $project_name_id);
		die;
	}
	if ($type=='deleteProjectNumber') {
		db::deleteSimple('project_number', $project_number_id);
		die;
	}
	if ($type=='getProjectNumberTable') {
		$res=Project::getProjectNumber();
		die(Project::getProjectNumberTable($res));
	}
	if ($type=='getProjectNameAndNumber') {
		$res=Project::getProjectNameByName($project_name);
		if (count($res)>0) {
			$data['principal_advisor']=$res[0]['principal_advisor'];
			$data['financial_controller']=$res[0]['financial_controller'];
		} else {
			$data['principal_advisor']=null;
			$data['financial_controller']=null;
		}
		$data['principal_advisor_name'] = _lbl($data['principal_advisor'],  $_SESSION['employee']);
		$data['financial_controller_name'] = _lbl($data['financial_controller'],  $_SESSION['employee']);
		$res=Project::getProjectNumberByProjectName($project_name);
		$data['combo_project_number']=shared::select_combo_complete($res, 'project_number', '-Project Number-', 'project_number');
		die(json_encode($data));
	}
	if ($type=='getProjectNumberByName') {
		$res=Project::getProjectNumberByName($project_number);
		if (count($res)>0) {
			$data['team_leader']=$res[0]['team_leader'];
		} else {
			$data['team_leader']=null;
		}
		$data['team_leader_name']=_lbl($data['team_leader'], $_SESSION['employee']);
		die(json_encode($data));
	}
?>