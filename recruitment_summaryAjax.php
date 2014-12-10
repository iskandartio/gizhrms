<?php
	require_once("pages/startup.php");
	if ($type=='update_interview') {
	
		db::updateEasy('vacancy_interview', $_POST);
		die;
	}
?>