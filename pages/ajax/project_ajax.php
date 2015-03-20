<?php
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
		$data['principal_advisor_name'] = _name($data['principal_advisor']);
		$data['financial_controller_name'] = _name($data['financial_controller']);
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
		$data['team_leader_name']=_name($data['team_leader']);
		die(json_encode($data));
	}
	if ($type=='getProjectClass') {
		$project_name=db::select('project_name','*');
		$project_number=db::select('project_number','*');
		$result=array();
		foreach ($project_name as $key=>$val) {
			$result[$val['project_name']]['principal_advisor']=$val['principal_advisor'];
			$result[$val['project_name']]['principal_advisor_name']=_name($val['principal_advisor']);
			$result[$val['project_name']]['financial_controller']=$val['financial_controller'];
			$result[$val['project_name']]['financial_controller_name']=_name($val['financial_controller']);
			$result[$val['project_name']]['project_number']=array();
		}
		foreach ($project_number as $key=>$val) {
			$result[$val['project_name']]['project_number'][$val['project_number']]['team_leader']=$val['team_leader'];
			$result[$val['project_name']]['project_number'][$val['project_number']]['team_leader_name']=_name($val['team_leader']);
		}
		die(json_encode($result));
	}
?>