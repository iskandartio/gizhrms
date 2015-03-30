<?php
	if ($type=='load') {
		$res=db::select('countries','*','','code');
		$result="";
		$result.="<script src='js/countries.js'></script>";
		$result.="<button class='button_link' id='btn_add'>Add Countries</button>
	<table id='tbl_countries' class='tbl'>
	<thead><tr><th></th><th>Countries</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['countries_id']."</td><td>".$row['countries_val']."</td>
		<td>".getImageTags(array('edit', 'delete'))."</td>
		</tr>";
		}
		$result.="</tbody></table>";
		
		die($result);
	}
	if ($type=='save') {
		if ($countries_id=='') {
			
			$countries_id=db::insertEasy('countries', $_POST);
		} else {
			db::updateEasy('countries', $_POST);
		}
		die ($countries_id);
	}
	if ($type=='delete') {
		db::delete('countries','countries_id=?', array($countries_id));
		die;
	}

?>
