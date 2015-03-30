<?php
if ($type=='load_working') {
	$user_id=$_SESSION['user_id'];	
	$res=Employee::get_working_res($user_id, 'applicants');
	$result=Employee::get_working_table($res, 'applicants');
	$data['result']=$result;
	die(json_encode($data));

}
if ($type=='delete_working') {
	$user_id=$_SESSION['user_id'];
	if ($tbl=='employee') {
		$_working_id=$employee_working_id;
	} else {
		$_working_id=$applicants_working_id;
	}
	db::delete($tbl.'_working',$tbl.'_working_id=?', array($_working_id));
	die;
}

if ($type=='save_working') {
	$user_id=$_SESSION['user_id'];
	$_POST['user_id']=$user_id;
	unset($_POST['tbl']);
	if ($tbl=='employee') {
		$_working_id=$employee_working_id;
	} else {
		$_working_id=$applicants_working_id;
	}
	if ($_working_id=='') {
		$_working_id=db::insertEasy($tbl."_working",$_POST);
		
	} else {
		db::updateEasy($tbl."_working", $_POST);
	}
	die($_working_id);
}

?>