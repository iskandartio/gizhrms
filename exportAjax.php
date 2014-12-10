<?php
	require_once("pages/startup.php");
	if ($segment==1) {
		$_SESSION['export']=null;
	}
	$_SESSION['export'][$segment]=$data;
	
	if ($last==1) {
		echo $segment;
	}
	
?>
