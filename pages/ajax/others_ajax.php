<?php
	if ($type=='load_gender') {
		$res=db::select('gender','*','','sort_id');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add</button>
				<table id='tbl_gender' class='tbl'>
				<thead><tr><th></th><th>Gender</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['gender_id']."</td>
				<td>"._t2("gender", $row['gender'])."</td>
				<td>".getImageTags(array('save', 'delete', 'up','down'))."</td>
				</tr>";
		}
		$adder="<tr><td></td><td>"._t2("gender")."</td><td>".getImageTags(['save','delete','up','down'])."</td></tr>";
		
		$data['result']=$result;
		$data['adder']=$adder;
		die(json_encode($data));
	}
	if ($type=='load_relation') {
		$res=db::select('relation','*','','sort_id');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add</button>
				<table id='tbl_relation' class='tbl'>
				<thead><tr><th></th><th>Relation</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['relation_id']."</td>
				<td>"._t2("relation", $row['relation'])."</td>
				<td>".getImageTags(array('save', 'delete', 'up','down'))."</td>
				</tr>";
		}
		$adder="<tr><td></td><td>"._t2("relation")."</td><td>".getImageTags(['save','delete','up','down'])."</td></tr>";
		$data['result']=$result;
		$data['adder']=$adder;
		die(json_encode($data));
	}
	if ($type=='save_gender') {		
		if ($gender_id=='') {
			$_POST['sort_id']=db::select_single("gender", "ifnull(max(sort_id),0)+1 v");
			$gender_id=db::insertEasy('gender', $_POST);
		} else {
			db::updateEasy('gender', $_POST);
		}
		die ($gender_id);
	}
	if ($type=='delete_gender') {
		db::delete('gender','gender_id=?', array($gender_id));
		die;
	}
	if ($type=='up_gender') {
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
	if ($type=='down_gender') {
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
	if ($type=='save_relation') {		
		if ($relation_id=='') {
			$_POST['sort_id']=db::select_single("relation", "ifnull(max(sort_id),0)+1 v");
			$relation_id=db::insertEasy('relation', $_POST);
		} else {
			db::updateEasy('relation', $_POST);
		}
		die ($relation_id);
	}
	if ($type=='delete_relation') {
		db::delete('relation','relation_id=?', array($relation_id));
		die;
	}
	if ($type=='up_relation') {
		$con=db::beginTrans();
		$sort_id=db::select_single('relation', 'sort_id v', 'relation_id=?','', array($relation_id), $con);
		$row=db::select_one('relation','relation_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update('relation','sort_id','relation_id=?', array($sort_id, $row['relation_id']), $con);
			db::update('relation','sort_id','relation_id=?', array($row['sort_id'], $relation_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down_relation') {
		$con=db::beginTrans();
		$sort_id=db::select_single('relation', 'sort_id v', 'relation_id=?','', array($relation_id), $con);
		$row=db::select_one('relation','relation_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update('relation','sort_id','relation_id=?', array($sort_id, $row['relation_id']), $con);
			db::update('relation','sort_id','relation_id=?', array($row['sort_id'], $relation_id), $con);
		}
		db::commitTrans($con);
		die;
	}

?>
