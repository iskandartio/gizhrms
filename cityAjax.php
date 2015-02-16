<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		if ($city_id=='') {
			$city_id=db::insertEasy('city', $_POST);
		} else {
			db::updateEasy('city', $_POST);
		}
		die ($city_id);
	}
	if ($type=='delete') {
		db::delete('city','city_id=?', array($city_id));
		die;
	}
?>
