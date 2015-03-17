<?php
	require_once("pages/startup.php");
	if ($type=='save_adj_salary') {		
		db::updateShort('applicants', 'user_id', $_POST);
		die("ok");
	}
	if ($type=='process_salary') {
		Employee::processSalaryAdjustment($start_date);
		
	}
	if ($type=='get_process_salary') {
		$res=Employee::get_process_salary_data();
		$result=Employee::get_process_salary_table($start_date, $res);
		
		die($result);
	}
?>