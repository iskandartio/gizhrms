<?php
	if ($type=='save_adj_salary') {	
		
		$_POST['adj_salary']=shared::encrypt($adj_salary);
		db::updateShort('employee', 'user_id', $_POST);
		die;
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