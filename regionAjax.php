<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		if ($region_id=='') {
			$_POST['sort_id']=db::select_single("region", "ifnull(max(sort_id),0)+1 v");
			$region_id=db::insertEasy('region', $_POST);
		} else {
			db::updateEasy('region', $_POST);
		}
		die ($region_id);
	}
	if ($type=='delete') {
		db::delete('region','region_id=?', array($region_id));
		die;
	}
	if ($type=='up') {
		$con=db::beginTrans();
		$sort_id=db::select_single('region', 'sort_id v', 'region_id=?','', array($region_id), $con);
		$row=db::select_one('region','region_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update('region','sort_id','region_id=?', array($sort_id, $row['region_id']), $con);
			db::update('region','sort_id','region_id=?', array($row['sort_id'], $region_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$sort_id=db::select_single('region', 'sort_id v', 'region_id=?','', array($region_id), $con);
		$row=db::select_one('region','region_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update('region','sort_id','region_id=?', array($sort_id, $row['region_id']), $con);
			db::update('region','sort_id','region_id=?', array($row['sort_id'], $region_id), $con);
		}
		db::commitTrans($con);
		die;
	}

?>
