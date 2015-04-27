<?php
class Applicant {
	static function validateApply() {
		$required=db::select_required('applicants', array('first_name','last_name','place_of_birth','date_of_birth','nationality_id','address','post_code','phone1','gender'), array($_SESSION['uid']));
		return $required;
	}
}
?>