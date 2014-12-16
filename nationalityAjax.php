<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		if ($nationality_id=='') {
			$_POST['sort_id']=db::select_single("nationality", "ifnull(max(sort_id),0)+1 v");
			$nationality_id=db::insertEasy('nationality', $_POST);
		} else {
			db::updateEasy('nationality', $_POST);
		}
		die ($nationality_id);
	}
	if ($type=='delete') {
		db::delete('nationality','nationality_id=?', array($nationality_id));
		die;
	}
	if ($type=='up') {
		$con=db::beginTrans();
		$sort_id=db::select_single('nationality', 'sort_id v', 'nationality_id=?','', array($nationality_id), $con);
		$row=db::select_one('nationality','nationality_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update('nationality','sort_id','nationality_id=?', array($sort_id, $row['nationality_id']), $con);
			db::update('nationality','sort_id','nationality_id=?', array($row['sort_id'], $nationality_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$sort_id=db::select_single('nationality', 'sort_id v', 'nationality_id=?','', array($nationality_id), $con);
		$row=db::select_one('nationality','nationality_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update('nationality','sort_id','nationality_id=?', array($sort_id, $row['nationality_id']), $con);
			db::update('nationality','sort_id','nationality_id=?', array($row['sort_id'], $nationality_id), $con);
		}
		db::commitTrans($con);
		die;
	}
?>
