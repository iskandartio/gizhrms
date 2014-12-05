<?php
require "pages/startup.php";
	foreach ($_POST as $key=>$value) {
		$$key=$value;
	}
	if ($_POST['type']=='save') {
		if ($applicants_reference_id=='') {
			$_POST['user_id']=$_SESSION['uid'];
			$applicants_reference_id=db::insertEasy('applicants_reference', $_POST);
		} else {
			db::updateEasy('applicants_reference', $_POST);
		}
		die($applicants_reference_id);
	}
	if ($_POST['type']=='save_other') {
		if ($applicants_other_reference_id=='') {
			$_POST['user_id']=$_SESSION['uid'];
			$applicants_other_reference_id=db::insertEasy('applicants_other_reference', $_POST);
		} else {
			db::updateEasy('applicants_other_reference', $_POST);
		}
		die($applicants_other_reference_id);
	}

	if ($type=='delete_other') {
		db::delete('applicants_other_reference','applicants_other_reference_id=?',array($applicants_other_reference_id));
		die;
	}
	
?>