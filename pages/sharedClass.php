<?php
class shared {
	static function select_combo($res, $id, $val='', $selected='') {
	$result='';
	if ($val=='') $val=$id;
	foreach ($res  as  $row) {
		$result.="<option value='".$row[$id]."'".($selected==$row[$id] ? "selected" : "").">".$row[$val]."</option>";
	}
	return $result;
}
}

