<?php
Class EmployeeDependents {
	static function getLegitimateDependents($y, $employee_id) {
		$res=db::select('employee_dependent', '*', "user_id=? and entitled=1 and date_add(date_of_birth, interval 23 year)>'".date("$y-12-31")."'", 'date_of_birth', array($employee_id));
		return $res;
	}
}
?>