<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		if ($location_id=='') {
			$location_id=db::insertEasy('location', $_POST);
		} else {
			db::updateEasy('location', $_POST);
		}
		die ($location_id);
	}
	if ($type=='delete') {
		db::delete('location','location_id=?', array($location_id));
		die;
	}
?>
