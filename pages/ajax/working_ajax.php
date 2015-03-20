<?php

if ($type=='load') {
	$user_id=$_SESSION['user_id'];	
	$res=Employee::get_working_res($user_id);
	$result=Employee::get_working_table($res);
	$result.="<script src='js/working.js'></script>";
	$data['result']=$result;
	die(json_encode($data));

}
?>