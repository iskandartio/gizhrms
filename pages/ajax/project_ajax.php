<?php
	if ($type=='load_project_name') {
		$res=db::select("project_name","*","","project_name");
		$result="<button class='button_link btn_add'>Add</button>";
		$result.="<table class='tbl' id='tbl_project_name'>";
		$result.="<thead><tr><th></th><th>Project Name</th><th>Principal Advisor</th><th>Financial Controller</th><th>&nbsp;</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['project_name_id']."</td><td>".$rs['project_name']."</td>
			<td><span class='principal_advisor hidden'>".shared::getKeyFromValue($_SESSION['employee_choice'], $rs['principal_advisor'])."</span>
			<span class='principal_advisor_name'>"._name($rs['principal_advisor'])."</span></td>
			<td><span class='financial_controller hidden'>".shared::getKeyFromValue($_SESSION['employee_choice'], $rs['financial_controller'])."</span>
			<span class='financial_controller_name'>"._name($rs['financial_controller'])."</span></td>
			<td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		$data['result']=$result;
		die(json_encode($data));
	}
	if ($type=='delete_project_name') {
		db::delete('project_name','project_name_id=?', array($project_name_id));
		die;
	}
	if ($type=='save_project_name') {
		$_POST['principal_advisor']=shared::getId('employee_choice', $_POST['principal_advisor']);
		$_POST['financial_controller']=shared::getId('employee_choice', $_POST['financial_controller']);
		if ($project_name_id=='') {
			$project_name_id=db::insertEasy('project_name',$_POST);
		} else {
			db::updateEasy('project_name',$_POST);
		}
		die($project_name_id);
	}

	if ($type=='load_project_number') {
		$res=db::select("project_number","*","","project_number");
		$result="<button class='button_link btn_add'>Add</button>";
		$result.="<table class='tbl' id='tbl_project_number'>";
		$result.="<thead><tr><th></th><th>Project Number</th><th>Team Leader</th><th>Project Name</th><th>&nbsp;</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['project_number_id']."</td><td>".$rs['project_number']."</td>
			<td><span class='team_leader hidden'>".shared::getKeyFromValue($_SESSION['employee_choice'], $rs['team_leader'])."</span>
			<span class='team_leader_name'>"._name($rs['team_leader'])."</span></td>
			<td>".$rs['project_name']."</td>
			<td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		$data['result']=$result;
		die(json_encode($data));
	}
	if ($type=='delete_project_number') {
		db::delete('project_number','project_number_id=?', array($project_number_id));
		die;
	}
	if ($type=='save_project_number') {
		$_POST['team_leader']=shared::getId('employee_choice', $_POST['team_leader']);
		if ($project_number_id=='') {
			$project_number_id=db::insertEasy('project_number',$_POST);
		} else {
			db::updateEasy('project_number',$_POST);
		}
		die($project_number_id);
	}
	
	if ($type=='load_project_location') {
		$res=db::select("project_location","*","","project_location");
		$result="<button class='button_link btn_add'>Add</button>";
		$result.="<table class='tbl' id='tbl_project_location'>";
		$result.="<thead><tr><th></th><th>Project Location</th><th>Office Manager</th><th>Project Name</th><th>&nbsp;</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['project_location_id']."</td><td>".$rs['project_location']."</td>
			<td><span class='office_manager hidden'>".shared::getKeyFromValue($_SESSION['employee_choice'], $rs['office_manager'])."</span>
			<span class='office_manager_name'>"._name($rs['office_manager'])."</span></td>
			<td>".$rs['project_name']."</td>
			<td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		$data['result']=$result;
		die(json_encode($data));
	}
	if ($type=='delete_project_location') {
		db::delete('project_location','project_location_id=?', array($project_location_id));
		die;
	}
	if ($type=='save_project_location') {
		$_POST['office_manager']=shared::getId('employee_choice', $_POST['office_manager']);
		if ($project_location_id=='') {
			$project_location_id=db::insertEasy('project_location',$_POST);
		} else {
			db::updateEasy('project_location',$_POST);
		}
		die($project_location_id);
	}
	
	
	
	if ($type=='getProjectNameChoice') {
		$res=db::select("project_name","*","","project_name");
		$result=shared::select_combo_complete($res, 'project_name','-Project Name-','project_name');
		die($result);
	}
	if ($type=='getProjectClass') {	
		$project_name=db::select('project_name','*');
		$project_number=db::select('project_number','*');
		$project_location=db::select('project_location','*');
		$sql="select a.project_name, a.user_id as responsible_superior, concat(b.first_name,' ',b.last_name) full_name from contract_history a
			inner join employee b on coalesce(b.am2_end_date, b.contract2_end_date, b.am1_end_date, b.contract1_end_date)=a.end_date and b.user_id=a.user_id 
			and ifnull(b.contract_state,'')!='Terminate'
			where a.job_title='Senior Advisor'";
		$senior_officer=db::DoQuery($sql);
		
		$result=array();
		foreach ($project_name as $key=>$val) {
			$result[$val['project_name']]['principal_advisor']=$val['principal_advisor'];
			$result[$val['project_name']]['principal_advisor_name']=_name($val['principal_advisor']);
			$result[$val['project_name']]['financial_controller']=$val['financial_controller'];
			$result[$val['project_name']]['financial_controller_name']=_name($val['financial_controller']);
			$result[$val['project_name']]['project_number']=array();
			$result[$val['project_name']]['project_location']=array();
			$result[$val['project_name']]['senior_officer']=array();
		}
		foreach ($project_number as $key=>$val) {
			$result[$val['project_name']]['project_number'][$val['project_number']]['team_leader']=$val['team_leader'];
			$result[$val['project_name']]['project_number'][$val['project_number']]['team_leader_name']=_name($val['team_leader']);
		}
		foreach ($project_location as $key=>$val) {
			$result[$val['project_name']]['project_location'][$val['project_location']]['office_manager']=$val['office_manager'];
			$result[$val['project_name']]['project_location'][$val['project_location']]['office_manager_name']=_name($val['office_manager']);
		}
		foreach ($senior_officer as $key=>$val) {
			$result[$val['project_name']]['senior_officer'][$val['responsible_superior']]=$val['full_name'];
		}
		die(json_encode($result));
	}
	if ($type=='getProjectLocationClass') {
		$project_location=db::select('project_location','*');
		$result=array();
		foreach ($project_location as $key=>$val) {
			$result[$val['project_location']]['office_manager']=$val['office_manager'];
			$result[$val['project_location']]['office_manager_name']=_name($val['office_manager']);
		}
		die(json_encode($result));
	}
?>