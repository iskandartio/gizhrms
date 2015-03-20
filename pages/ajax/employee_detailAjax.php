<?php
require_once "../pages/startup.php";
	if ($type=='findContractHistoryById') {
		$salary_history=db::select_one('contract_history','*','contract_history_id=?', '',array($contract_history_id));
		die(json_encode($salary_history));
	}
		

	

?>