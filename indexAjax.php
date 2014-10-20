<?php
require "pages/startup.php";
	if ($_POST['type']=='login') {
		$res=db::select_one('m_user','user_id, user_name, pwd', 'user_name=? and pwd=sha2(?,512)','',array($_POST['email'], $_POST['password']));
		if (count($res)==0) {
			echo 'Wrong User Name or Password!';
			die;
		}
		$_SESSION['uid']=$res['user_id'];
		$_SESSION['email']=$_POST['email'];
		$_SESSION['pwd']=$_POST['password'];
		echo "position_applied";
		die;
	}
	if ($_POST['type']=='register') {
		if ($_POST['password']!=$_POST['confirm_password']) {
			echo 'Confirm password not matched!';
			die;
		}
		$res=db::select_one('m_user','user_name','user_name=?','',array($_POST['email']));
		if (count($res)>0) {
			echo 'User already exists!';
			die;
		}
		$user_id=db::ExecMe('insert into m_user(user_name, pwd) values(?,sha2(?,512))', array($_POST['email'], $_POST['password']));
		$_SESSION['uid']=$res['user_id'];
		$_SESSION['email']=$_POST['email'];
		$_SESSION['pwd']=$_POST['password'];
		$role_id=db::select_single('m_role','role_id v','role_name=?','',array('applicant'));
		db::insert('m_user_role','user_id, role_id', array($user_id, $role_id));
		echo "position_applied";
		die;
	}
?>