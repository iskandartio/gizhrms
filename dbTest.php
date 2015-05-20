<?php
	require("pages/startup.php");

	$res=db::DoQuery("show tables");
	
	foreach ($res as $rs) {	
		$sql="alter table ".$rs[key($rs)]." change column created_at created_at datetime NOT NULL";
		db::ExecMe($sql);
	}
	
?>