<?php
class Applicant {
	static function validateApply() {
		$required=db::select_required('applicants', array('first_name','last_name','place_of_birth','date_of_birth','nationality','address','post_code','phone1'), array($_SESSION['uid']));
		return $required;
	}
}
?>