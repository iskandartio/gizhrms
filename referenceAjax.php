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
			$applicants_other_reference_id=db::insert('applicants_other_reference','user_id, reference_val, reference_skill_id', array($_SESSION['uid'], $reference_val, $reference_skill_id));
		} else {
			db::update('applicants_other_reference','reference_val, reference_skill_id', 'applicants_other_reference_id=?', array($reference_val, $reference_skill_id, $applicants_other_reference_id));
		}
		die($applicants_other_reference_id);
	}
	if ($type=='delete') {
		db::delete('applicants_reference','applicants_reference_id=?',array($applicants_reference_id));
		die;
	}
	if ($type=='delete_other') {
		db::delete('applicants_other_reference','applicants_other_reference_id=?',array($applicants_other_reference_id));
		die;
	}
	
?>