<?php
require "pages/startup.php";
	foreach ($_POST as $key=>$value) {
		$$key=$value;
	}
	if ($_POST['type']=='save') {
		if ($applicants_education_id=='') {
			$applicants_education_id=db::insert('applicants_education','user_id, education_id, major, place, year_from, year_to, country', array($_SESSION['uid'], $education_id, $major, $place, $year_from, $year_to, $country));
		} else {
			db::update('applicants_education','education_id, major, place, year_from, year_to, country', 'applicants_education_id=?', array($education_id, $major, $place, $year_from, $year_to, $country, $applicants_education_id));
		}
		die($applicants_education_id);
	}
	if ($type=='delete') {
		db::delete('applicants_education','applicants_education_id=?',array($applicants_education_id));
		die;
	}
	
?>