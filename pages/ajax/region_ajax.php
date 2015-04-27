<?php
if ($type=='load') {
	if ($tbl=='region') {
		$res=db::select('region','*','','sort_id');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add Region</button>
			<table id='tbl_region' class='tbl'>
			<thead><tr><th></th><th>Region</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['region_id']."</td><td>".$row['region_val']."</td>
				<td>".getImageTags(array('edit', 'delete', 'up', 'down'))."</td>
				</tr>";
		}
		$result.="</tbody></table>";
		$adder="<tr><td></td><td>"._t2("region_val")."</td><td>".getImageTags(array('edit', 'delete', 'up', 'down'))."</td></tr>";
	} else if ($tbl=='province') {
		$region_choice=shared::select_combo_complete(db::select('region','*','','sort_id'), 'region_id', '-Region-', 'region_val');
		$res=db::select('province a left join region b on a.region_id=b.region_id','a.*, b.region_val','','b.sort_id, a.sort_id');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add Province</button>
			<table id='tbl_province' class='tbl'>
			<thead><tr><th></th><th>Province</th><th>Region</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['province_id']."</td><td>".$row['province_val']."</td>
				<td><span style='display:none'>".$row['region_id']."</span>".$row['region_val']."</td>
				<td>".getImageTags(array('edit', 'delete', 'up', 'down'))."</td>
				</tr>";
		}
		$result.="</tbody></table>";
		$adder="<tr><td></td><td>"._t2("province_val")."</td><td>".$region_choice."</td><td>".getImageTags(array('save', 'delete'))."</td></tr>";
		$data['region_choice']=$region_choice;
	} else if ($tbl=='city') {
		$province_choice=shared::select_combo_complete(db::select('province','*','','sort_id'), 'province_id', '-Province-', 'province_val');
		$res=db::select('city','*','','city_val');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add City</button>
			<table id='tbl_city' class='tbl'>
			<thead><tr><th></th><th>City</th><th>Province</th><th></th></tr><tbody>";
			
		foreach ($res as $row) {
			$result.="<tr><td>".$row['city_id']."</td><td>".$row['city_val']."</td>
				<td><span style='display:none'>".$row['province_id']."</span>".shared::get_table_data('province', $row['province_id'])."</td>
				<td>".getImageTags(array('edit', 'delete'))."</td>
				</tr>";
		}
		$result.="</tbody></table>";
		$adder="<tr><td></td><td>"._t2("city_val")."</td><td>".$province_choice."</td><td>".getImageTags(array('save', 'delete'))."</td></tr>";
		$data['province_choice']=$province_choice;
	} else if ($tbl=='countries') {
		$res=db::select('countries','*','','countries_val');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add Country</button>
			<table id='tbl_countries' class='tbl'>
			<thead><tr><th></th><th>Country</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['countries_id']."</td><td>".$row['countries_val']."</td>
				<td>".getImageTags(array('edit', 'delete'))."</td>
				</tr>";
		}
		$result.="</tbody></table>";
		$adder="<tr><td></td><td>"._t2("countries_val")."</td><td>".getImageTags(array('save', 'delete'))."</td></tr>";
	} else if ($tbl=='nationality') {
		$res=db::select('nationality','*','','nationality_val');
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add Nationality</button>
			<table id='tbl_nationality' class='tbl'>
			<thead><tr><th></th><th>Nationality</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['nationality_id']."</td><td>".$row['nationality_val']."</td>
				<td>".getImageTags(array('edit', 'delete'))."</td>
				</tr>";
		}
		$result.="</tbody></table>";
		$adder="<tr><td></td><td>"._t2("nationality_val")."</td><td>".getImageTags(array('save', 'delete'))."</td></tr>";
	}
	$data['result']=$result;
	$data['adder']=$adder;
	die(json_encode($data));
}

if ($type=='save') {
	if ($tbl=='region') {
		if ($region_id=="") {
			$con=db::beginTrans();
			$sort_id=db::select_single('region', 'ifnull(max(sort_id),0)+1 v','','',array(), $con);
			$region_id=db::insert('region','region_val,sort_id', array($region_val, $sort_id), $con);
			db::commitTrans($con);
		} else {
			db::update('region','region_val', 'region_id=?', array($region_val, $region_id));
		}
		die($region_id);
	} else if ($tbl=='province') {
		if ($province_id=="") {
			$con=db::beginTrans();
			$sort_id=db::select_single('province', 'ifnull(max(sort_id),0)+1 v','','',array(), $con);
			$province_id=db::insert('province','province_val, region_id, sort_id', array($province_val, $region_id, $sort_id), $con);
			db::commitTrans($con);
		} else {
			db::update('province','province_val, region_id', 'province_id=?', array($province_val, $region_id,$province_id));
		}
		die($province_id);
	} else if ($tbl=='city') {
		if ($city_id=="") {
			$con=db::beginTrans();
			$city_id=db::insert('city','city_val, province_id', array($city_val, $province_id), $con);
			db::commitTrans($con);
		} else {
			db::update('city','city_val, province_id', 'city_id=?', array($city_val, $province_id,$city_id));
		}
		die($city_id);
	} else if ($tbl=='countries') {
		if ($countries_id=="") {
			$con=db::beginTrans();
			$countries_id=db::insert('countries','countries_val', array($countries_val), $con);
			db::commitTrans($con);
		} else {
			db::update('countries','countries_val', 'countries_id=?', array($countries_val,$countries_id));
		}
		die($countries_id);
	} else if ($tbl=='nationality') {
		if ($nationality_id=="") {
			$con=db::beginTrans();
			$nationality_id=db::insert('nationality','nationality_val', array($nationality_val), $con);
			db::commitTrans($con);
		} else {
			db::update('nationality','nationality_val', 'nationality_id=?', array($nationality_val,$nationality_id));
		}
		die($nationality_id);
	}
}
if ($type=='up'||$type=='down') {
	$con=db::beginTrans();
	$table=$tbl;
	$sort_id=db::select_single($table, 'sort_id v', $tbl.'_id=?','', array($id), $con);
	$sort_id2=db::select_single($table, 'sort_id v', $tbl.'_id=?','', array($id2), $con);
	db::update($table,'sort_id',$tbl.'_id=?', array($sort_id, $id2), $con);
	db::update($table,'sort_id',$tbl.'_id=?', array($sort_id2, $id), $con);
	db::commitTrans($con);
	die;
}
if ($type=='delete') {
	db::delete($tbl, $tbl.'_id=?', array($_POST[$tbl."_id"]));
	die;
}
?>