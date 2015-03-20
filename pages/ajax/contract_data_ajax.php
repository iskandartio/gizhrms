<?php
	if ($type=='load') {
		$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
		foreach ($applicant as $key=>$val) {
			$$key=$val;
		}
		$severanceData=shared::calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
			, $am1_start_date, $am1_end_date
			, $contract2_start_date, $contract2_end_date
			, $am2_start_date, $am2_end_date);
		$contract_data_view=Employee::getContractDataView($applicant, $severanceData);
		$result=$contract_data_view;
		$result.="<script src='js/contract_data.js'></script>";
		$data['result']=$result;
		die(json_encode($data));
	}
?>