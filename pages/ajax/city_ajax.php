<?php
	if ($type=='load') {
		$res=db::select('province','*','','sort_id');
		$combo_province_def=shared::select_combo_complete($res, 'province_id', '-Province-','province_val');
		$res=db::select('city a 
		left join province b on a.province_id=b.province_id','a.*, b.province_val', "", 'a.city_val');

		$result="";
		
		$result.="<script src='js/city.js'></script> ";
		
		$result.="<button class='button_link' id='btn_add'>Add City</button>
<table id='tbl_city' class='tbl'>
<thead><tr><th></th><th>City</th><th>Province</th><th></th></tr><tbody>";

		foreach ($res as $row) {
			$result.="<tr><td>".$row['city_id']."</td><td>".$row['city_val']."</td>
			<td><span style='display:none'>".$row['province_id']."</span>".$row['province_val']."</td>
			<td>".getImageTags(array('edit', 'delete'))."</td>
			</tr>";
		}
		
		$result.="</tbody></table>";
		
		$data['combo_province_def']=$combo_province_def;
		$data['result']=$result;
		die(json_encode($data));
	}
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
