<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		if ($province_id=='') {
			$_POST['sort_id']=db::select_single("province", "ifnull(max(sort_id),0)+1 v");
			$province_id=db::insertEasy('province', $_POST);
		} else {
			db::updateEasy('province', $_POST);
		}
		die ($province_id);
	}
	if ($type=='delete') {
		db::delete('province','province_id=?', array($province_id));
		die;
	}
?>
