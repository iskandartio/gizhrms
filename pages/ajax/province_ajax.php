<?php
	if ($type=='load') {
		$res=db::select('region','*','','sort_id');
		$combo_region_def=shared::select_combo_complete($res, 'region_id', '-Region-','region_val');
		$res=db::select('province a 
		left join region b on a.region_id=b.region_id','a.*, b.region_val', '', 'b.sort_id, a.sort_id');

		$result="";
		$result.="<script src='js/province.js'></script>";
		$result.="<button class='button_link' id='btn_add'>Add Province</button>
<table id='tbl_province' class='tbl'>
<thead><tr><th></th><th>Province</th><th>Region</th><th></th></tr><tbody>";
		foreach ($res as $row) {
		$result.="<tr><td>".$row['province_id']."</td><td>".$row['province_val']."</td>
	<td><span style='display:none'>".$row['region_id']."</span>".$row['region_val']."</td>
	<td>".getImageTags(array('edit', 'delete'))."</td>
	</tr>";
		}
		$result.="</tbody></table>";
		$data['combo_region_def']=$combo_region_def;
		$data['result']=$result;
		die(json_encode($data));
	}
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
