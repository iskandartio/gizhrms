<?php
	require("pages/startup.php");

	$res=db::DoQuery("show tables");
	
	foreach ($res as $rs) {	
		$sql="alter table ".$rs[key($rs)]." add updated_by int, add created_at datetime NULL
		, add updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP";
		$sql="alter table ".$rs[key($rs)]." change column created_at 
			created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP";
		
		db::ExecMe($sql);
	}
	
?>