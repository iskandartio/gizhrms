<?php
	require_once("pages/startup.php");
	if ($type=='change_password') {
		if ($new_password!=$confirm_password) die("confirm password not match!");
		$hash_old_password=hash('sha512',$old_password);
		if (db::select_with_count('m_user', 'user_id=? and pwd=?', array($_SESSION['uid'], $hash_old_password))==0) die("old password not match!");
		db::update('m_user','pwd','user_id=?',array(hash('sha512', $new_password), $_SESSION['uid']));
		die("success");
	}
?>