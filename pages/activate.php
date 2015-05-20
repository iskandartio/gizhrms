<?php
	$res=db::select_one('m_user','user_id, user_name','activation_code=?','', array($_GET['link']));
	if (count($res)>0) {
		db::update('m_user','status_id', 'user_id=?', array(1, $res['user_id']));
		$_SESSION['activation_email']=$res['user_name'];
		setcookie("url", 'change_password');
		header("location: ".$_SESSION['home']);
	}
?>
