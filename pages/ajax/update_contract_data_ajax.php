<?php
if ($type=='getData') {
	$user_id=shared::getId('employee_choice', $user_id);
	$applicant=Employee::get_active_employee_one('a.user_id=?',array($user_id));
	$project_name_choice=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$result="";
	$result.="<h1>".$applicant['first_name']." ".$applicant['last_name']." <br>Last Project Date:".formatDate($applicant['start_date']).' to '.formatDate($applicant['end_date'])."</h1>";
	$result.=Employee::getProjectView($applicant, $project_name_choice,'update_contract_data');
	
	$data['result']=$result;
	$data['project_name_choice']=$project_name_choice;
	
	die(json_encode($data));
}
if ($type=='getProjectClass'||$type=='getProjectLocationClass') {
	require("pages/ajax/project_ajax.php");
	die;
}
if ($type=='save') {
	$_POST['user_id']=$_SESSION['user_id'];
	$contract_history_id=$_SESSION['contract_history_id'];
	$user_id=$_POST['user_id'];
	$end_date=db::select_single('employee', 'coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) v','user_id=?','',array($user_id));
	$_POST['end_date']=$end_date;
	if (strcmp($start_date, $end_date)>=0) die("End Date must be bigger then Start Date");
	$flag_salary_sharing=0;
	if (isset($_POST['salary_sharing_project_name'])) $flag_salary_sharing=1;
	if ($flag_salary_sharing==1) {
		$salary_sharing_project_name=$_POST['salary_sharing_project_name'];
		$salary_sharing_project_number=$_POST['salary_sharing_project_number'];
		$salary_sharing_percentage=$_POST['salary_sharing_percentage'];
		unset($_POST['salary_sharing_project_name']);
		unset($_POST['salary_sharing_project_number']);
		unset($_POST['salary_sharing_percentage']);
	}
	$con=db::beginTrans();
	db::delete('contract_history','start_date>=? and user_id=?', array($start_date, $user_id), $con);
	$contract_history_id=db::select_single('contract_history','contract_history_id v','? between start_date and end_date and user_id=?','', array($start_date, $user_id), $con);
	db::update('contract_history','end_date','contract_history_id=?', array(shared::addDate($start_date,-1), $contract_history_id), $con);
	$_POST['salary']=shared::encrypt($_POST['salary']);
	$contract_history_id=db::insertEasy('contract_history', $_POST, $con);
	if ($flag_salary_sharing==1){
		db::delete('salary_sharing','contract_history_id=?', array($contract_history_id), $con);
		foreach ($salary_sharing_project_name as $key=>$val) {
			db::insert('salary_sharing','contract_history_id, project_name, project_number, percentage'
			, array($contract_history_id, $val, $salary_sharing_project_number[$key], $salary_sharing_percentage[$key]),$con);
		}
	}
	
	if ($contract_history_id<=0) {
		db::rollbackTrans($con);
		die("Failed");
	}
	db::commitTrans($con);
	die("Success");
}

?>