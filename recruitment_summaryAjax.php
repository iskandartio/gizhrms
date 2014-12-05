<?php
	require_once("pages/startup.php");
	if ($type=='update_interview') {
		db::update('vacancy_timeline','interview_date, interview_time, interview_place','vacancy_timeline_id=?', array($interview_date, $interview_time, $interview_place, $vacancy_timeline_id));
		die;
	}
?>