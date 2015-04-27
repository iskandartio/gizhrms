<?php
if ($type=='load_working') {
	$user_id=$_SESSION['user_id'];	
	$no_working_exp=db::select_single('applicants','no_working_exp v','user_id=?','', array($_SESSION['uid']));
	if ($no_working_exp==1) {
		$result="You have no working experience, please add if you have one";
	} else {
		$result="<button class='button_link no_working_exp'>No Working Experience</button>";
	}
	$res=Employee::get_working_res($user_id, 'applicants');
	$result.=Employee::get_working_table($res, 'applicants');
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
if ($type=='no_working_exp') {
	$con=db::beginTrans();
	db::update('applicants','no_working_exp','user_id=?', array(1, $_SESSION['uid']), $con);
	db::delete('applicants_working','user_id=?', array($_SESSION['uid']), $con);
	db::commitTrans($con);
	die;
}
?>