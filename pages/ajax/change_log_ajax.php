<?php
if ($type=='search') {
	$params=array();
	$filter='';
	if ($from_change_date!='') {
		$filter.=" and a.created_at>=?";
		array_push($params, $from_change_date." ".$time_from);
	}
	if ($to_change_date!='') {
		$filter.=" and a.created_at<=?";
		array_push($params, $to_change_date." ".$time_to);
	}
	if ($changes!='') {
		$filter.=" and a.changes like ?";
		array_push($params, "%".$changes."%");
	}
	if ($updated_by!='') {
		$filter.=" and b.user_name like ?";
		array_push($params, "%".$updated_by."%");
	}
	$sql="create temporary table temp
		select distinct trans_id from change_log a left join m_user b on a.updated_by=b.user_id
		where 1=1$filter";
	$con=db::beginTrans();
	db::ExecMe($sql, $params, $con);
	$res=db::select('change_log a 
		left join m_user b on a.updated_by=b.user_id
		inner join temp c on c.trans_id=a.trans_id','a.*, b.user_name', '', '',array(), $con);
	$result="<table class='tbl'><tr><th>User Name</th><th>Table</th><th width='400px'>Changes</th><th>Time</th></tr>";
	$last="";
	$background='white';
	foreach ($res as $rs) {
		if ($last!=$rs['trans_id']) {
			if ($background=='white') $background='aliceblue'; else $background='white';
			$last=$rs['trans_id'];
		}
		$result.="<tr style='background-color:$background'><td>".$rs['user_name']."</td><td>".$rs['tbl']."</td>
			<td><div style='width:400px;overflow-y:hidden'>".str_replace(',','<br>', str_replace("<","&lt;",$rs['changes']))."</div></td><td>".formatDateTime($rs['created_at'])."</td>";
		$result.="</tr>";
	}
	$result.="</table>";
	die($result);
}
?>