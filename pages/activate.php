<?php
	require_once("startup.php");
	
	db::ExecMe("update m_user set status_id=1 where activation_code=?", array($_GET['link']));
	
	//db::update('m_user','status_id=1', 'activation_code=?', array($_GET['link']));
?>