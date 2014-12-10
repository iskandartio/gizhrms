<?php
	require("pages/startup.php");
	if ($_POST['type']=='set_user_id') {
		$_SESSION['employee.user_id']=$_POST['user_id'];
		die;
	}
	if ($_POST['type']=='save') {
		if ($_SESSION['employee.user_id']=='') {
			db::ExecMe("insert into applicants(first_name, last_name, gender, nationality) values(?,?,?,?)"
				, array($_POST['first_name'],$_POST['last_name'],$_POST['gender'],$_POST['nationality']));
		} else {
			db::ExecMe('update applicants set first_name=?, last_name=?, gender=?, nationality=? where user_id=?'
				, array($_POST['first_name'],$_POST['last_name'],$_POST['gender'],$_POST['nationality'], $_SESSION['employee.user_id']));
		}
		die;
	}
?>
