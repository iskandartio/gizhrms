<?php
	require_once("startup.php");
	db::update('m_user','status_id=1', 'activation_code=?', array($_GET['link']));
?>