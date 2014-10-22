<?php
require "pages/startup.php";
	foreach ($_POST as $key=>$value) {
		$$key=$value;
	}
	if ($_POST['type']=='save') {
		if ($applicants_language_id=='') {
			$applicants_language_id=db::insert('applicants_language','user_id, language_id, language_skill_id', array($_SESSION['uid'], $language_id, $language_skill_id));
		} else {
			db::update('applicants_language','language_id, language_skill_id', 'applicants_language_id=?', array($language_id, $language_skill_id, $applicants_language_id));
		}
		die($applicants_language_id);
	}
	if ($_POST['type']=='save_other') {
		if ($applicants_other_language_id=='') {
			$applicants_other_language_id=db::insert('applicants_other_language','user_id, language_val, language_skill_id', array($_SESSION['uid'], $language_val, $language_skill_id));
		} else {
			db::update('applicants_other_language','language_val, language_skill_id', 'applicants_other_language_id=?', array($language_val, $language_skill_id, $applicants_other_language_id));
		}
		die($applicants_other_language_id);
	}
	if ($type=='delete') {
		db::delete('applicants_language','applicants_language_id=?',array($applicants_language_id));
		die;
	}
	if ($type=='delete_other') {
		db::delete('applicants_other_language','applicants_other_language_id=?',array($applicants_other_language_id));
		die;
	}
	
?>