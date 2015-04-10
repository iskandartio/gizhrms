<?php
	if ($type=='change_password') {
		if (db::select_with_count('m_user', 'user_id=? and pwd=?', array($_SESSION['uid'], $old_password))==0) die("old password not match!");
		
		db::update('m_user','pwd','user_id=?',array($new_password, $_SESSION['uid']));
		die("success");
	}
?>