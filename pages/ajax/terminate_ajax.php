<?php
if ($type=='getData') {
	$user_id=shared::getId('employee_choice', $user_id);
	$_SESSION['user_id']=$user_id;
	$result=Employee::getShowTerminateImmediately();
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='calculate_severance') {
	$result=Employee::getShowTerminate($terminate_date);
	die($result);
}
if ($type=='terminate') {
	if (!isset($terminate_date)) $terminate_date=null;
	Employee::terminate($severance, $service, $housing, $new_severance, $reason, $terminate_date);
	die;
}
?>