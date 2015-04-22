<?php
	if ($type=='load') {
		$res=db::select($tbl,'*','','sort_id');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add</button>
				<table id='tbl_$tbl' class='tbl'>
				<thead><tr><th></th><th>".proper($tbl)."</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$val= (isset($row[$tbl]) ? $row[$tbl] : $row[$tbl."_val"]);
			$result.="<tr><td>".$row[$tbl.'_id']."</td>
				<td>"._t2($tbl, $val)."</td>
				<td>".getImageTags(array('save', 'delete', 'up','down'))."</td>
				</tr>";
		}
		$adder="<tr><td></td><td>"._t2($tbl)."</td><td>".getImageTags(['save','delete','up','down'])."</td></tr>";
		
		$data['result']=$result;
		$data['adder']=$adder;
		die(json_encode($data));
	}
	if ($type=='delete') {
		db::delete($tbl, $tbl.'_id=?', array($id));
		die;
	}	

	if ($type=='save') {
		$rs=db::select_one($tbl, "*");
		if (isset($rs[$tbl])) {
			$field_val=$tbl;
		} else {
			$field_val=$tbl."_val";
		}
		$sort_id=db::select_single($tbl, "ifnull(max(sort_id),0)+1 v");
		if ($id=='') {
			
			$id=db::insert($tbl, $tbl."_id, ".$field_val.", sort_id", array($id, $val,  $sort_id));
		} else {
			db::update($tbl, $field_val, $tbl.'_id=?', array($val, $id));
		}
		die ($id);
	}

	if ($type=='up') {
		$con=db::beginTrans();
		$sort_id=db::select_single($tbl, 'sort_id v', $tbl.'_id=?','', array($id), $con);
		$row=db::select_one($tbl,$tbl.'_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update($tbl,'sort_id',$tbl.'_id=?', array($sort_id, $row[$tbl.'_id']), $con);
			db::update($tbl,'sort_id',$tbl.'_id=?', array($row['sort_id'], $id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$sort_id=db::select_single($tbl, 'sort_id v', $tbl.'_id=?','', array($id), $con);
		$row=db::select_one($tbl,$tbl.'_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update($tbl,'sort_id',$tbl.'_id=?', array($sort_id, $row[$tbl.'_id']), $con);
			db::update($tbl,'sort_id',$tbl.'_id=?', array($row['sort_id'], $id), $con);
		}
		db::commitTrans($con);
		die;
	}

?>
