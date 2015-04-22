<?php
if ($type=='terminate') {
	if (!isset($terminate_date)) $terminate_date=null;
	Employee::terminate($severance, $service, $housing, $new_severance, $reason, $terminate_date);
}
if ($type=='stop') {
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

if ($type=='show_stop') {
	$_SESSION['user_id']=$user_id;
	$result=Employee::getShowTerminate('');
	die($result);
}
if ($type=='search_expiring') {
	$res=Employee::get_expiring_res();
	$result=Employee::get_expiring_table($res);
	die($result);
}
if ($type=='save_recontract') {
	$user_id=$_SESSION['user_id'];
	$res=db::select('contract_history','*','end_date>? and user_id=?','', array($start_date, $user_id));
	if (count($res)>0) die("Start Contract is not valid");
	$flag_salary_sharing=0;
	
	$_POST['user_id']=$user_id;
	if (isset($_POST['salary_sharing_project_name'])) $flag_salary_sharing=1;
	if ($flag_salary_sharing==1) {
		$salary_sharing_project_name=$_POST['salary_sharing_project_name'];
		$salary_sharing_project_number=$_POST['salary_sharing_project_number'];
		$salary_sharing_percentage=$_POST['salary_sharing_percentage'];
		unset($_POST['salary_sharing_project_name']);
		unset($_POST['salary_sharing_project_number']);
		unset($_POST['salary_sharing_percentage']);			
	}
	if ($_POST['reason']=='') $_POST['reason']="Initial Salary";
	$con=db::beginTrans();
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($user_id));
	
	foreach ($applicant as $key=>$val) {
		$$key=$val;
	}
	
	$severanceData=shared::calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
, $am1_start_date, $am1_end_date
, $contract2_start_date, $contract2_end_date
, $am2_start_date, $am2_end_date);
	$severance=$severanceData['severance'];
	$service=$severanceData['service'];
	$housing=$severanceData['housing'];
	
	$sql="insert into employee_history(user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
	, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, severance, service, housing)
	select user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
	, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, ?,?,? from employee where user_id=?";
	db::ExecMe($sql, array($severance, $service, $housing, $user_id), $con);
	
	db::ExecMe('update employee set contract1_start_date=?, contract1_end_date=?
	, am1_start_date=null, am1_end_date=null
	, contract2_start_date=null, contract2_end_date=null
	, am2_start_date=null, am2_end_date=null
	where user_id=?',array($_POST['start_date'], $_POST['end_date'], $user_id), $con);
	
	db::ExecMe('insert into contract_history2 select * from contract_history where user_id=?', array($user_id), $con);
	db::ExecMe("insert into salary_sharing2(user_id, end_date, project_name, percentage, project_number)
			select b.user_id, b.end_date, a.project_name, a.percentage, a.project_number from salary_sharing a
			left join contract_history b on a.contract_history_id=b.contract_history_id 
			where b.user_id=?", array($user_id), $con);
	

	db::ExecMe('delete a from salary_sharing a left join contract_history b on a.contract_history_id=b.contract_history_id where b.user_id=?', array($user_id), $con);
	db::ExecMe('delete from contract_history where user_id=?', array($user_id), $con);
	$_POST['salary']=shared::encrypt($_POST['salary']);
	$contract_history_id=db::insertEasy('contract_history',$_POST, $con);
	
	if ($flag_salary_sharing==1){
		foreach ($salary_sharing_project_name as $key=>$val) {
			db::insert('salary_sharing','contract_history_id, project_name, project_number, percentage'
			, array($contract_history_id, $val, $salary_sharing_project_number[$key], $salary_sharing_percentage[$key]),$con);
		}
	}
	db::commitTrans($con);
	die;
}
//project_ajax link
if ($type=='getProjectClass'||$type=='getProjectLocationClass') {
	require("pages/ajax/project_ajax.php");
}

?>