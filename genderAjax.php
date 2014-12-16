<?php
	require_once("pages/startup.php");
	if ($type=='save') {
		
		if ($gender_id=='') {
			$_POST['sort_id']=db::select_single("gender", "ifnull(max(sort_id),0)+1 v");
			$gender_id=db::insertEasy('gender', $_POST);
		} else {
			db::updateEasy('gender', $_POST);
		}
		die ($gender_id);
	}
	if ($type=='delete') {
		db::delete('gender','gender_id=?', array($gender_id));
		die;
	}
	if ($type=='up') {
		$con=db::beginTrans();
		$sort_id=db::select_single('gender', 'sort_id v', 'gender_id=?','', array($gender_id), $con);
		$row=db::select_one('gender','gender_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update('gender','sort_id','gender_id=?', array($sort_id, $row['gender_id']), $con);
			db::update('gender','sort_id','gender_id=?', array($row['sort_id'], $gender_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$sort_id=db::select_single('gender', 'sort_id v', 'gender_id=?','', array($gender_id), $con);
		$row=db::select_one('gender','gender_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update('gender','sort_id','gender_id=?', array($sort_id, $row['gender_id']), $con);
			db::update('gender','sort_id','gender_id=?', array($row['sort_id'], $gender_id), $con);
		}
		db::commitTrans($con);
		die;
	}
?>
