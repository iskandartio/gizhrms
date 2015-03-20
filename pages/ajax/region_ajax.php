<?php
	if ($type=='load') {
		$res=db::select('region','*','','sort_id');
		$result="";
		$result.="<script src='js/region.js'></script>";
		$result.="<button class='button_link' id='btn_add'>Add Region</button>
	<table id='tbl_region' class='tbl'>
	<thead><tr><th></th><th>Region</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['region_id']."</td><td>".$row['region_val']."</td>
		<td>".getImageTags(array('edit', 'delete', 'up', 'down'))."</td>
		</tr>";
		}
		$result.="</tbody></table>";
		
		die($result);
	}
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
