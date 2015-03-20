<?php
	if ($type=='load') {
		$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
		$salary_history=Employee::get_salary_history_res($applicant['contract_history_id']);
		$result="";
		$result.="<h1>Salary History</h1>
<table id='tbl_salary_history' class='tbl'>
<thead><tr><th>id</th><th>Date</th><th>Project</th><th>Leader</th><th>Position</th><th>Salary</th><th></th></tr></thead><tbody>";
		$result.=Employee::get_salary_history_tbl($salary_history);
		$result.="</tbody></table>";
		$data['result']=$result;
		die(json_encode($data));
	}
?>