<?php
require "pages/startup.php";
	foreach ($_POST as $key=>$value) {
		$$key=$value;
	}
	if ($type=='save') {
		if ($applicants_working_id=='') {
			$_POST['user_id']=$_SESSION['uid'];
			$applicants_working_id=db::insertEasy('applicants_working',$_POST);
			
		} else {
			db::updateEasy('applicants_working', $_POST);
		}
		die($applicants_working_id);
		
	}
	if ($type=='delete') {
		db::delete('applicants_working','applicants_working_id=?',array($applicants_working_id));
		die;
	}
	
?>