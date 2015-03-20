<?php
	if ($type=='load') {
		$res=db::select('nationality','*','','sort_id');
		$result="";
		$result.="<script src='js/nationality.js'></script>";
		$result.="<button class='button_link' id='btn_add'>Add Nationality</button>
	<table id='tbl_nationality' class='tbl'>
	<thead><tr><th></th><th>Nationality</th><th></th></tr><tbody>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['nationality_id']."</td><td>".$row['nationality_val']."</td>
		<td>".getImageTags(array('edit', 'delete'))."</td>
		</tr>";
		}
		$result.="</tbody></table>";
		
		die($result);
	}
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

?>
