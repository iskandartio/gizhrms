<?php
	require_once("pages/startup.php");
	if ($type=='search')  {
		
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Medical Checkup Limit'));
		$res=db::select_one('applicants','gender,contract1_start_date start_date
		, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date','user_id=? and contract1_start_date<curdate()','',array($employee_id));
		$flag=true;
		
		if ($flag) {
			if (date('Y')== substr($res['start_date'],0,4)) {
				$month=substr($res['start_date'], 5,2);
				if ($res['end_date']<date('Y-12-31')) {
					$m=substr($res['end_date'], 5,2);
				} else {
					$m=12;
				}
				$limit=$limit*($m-$month+1)/12;
			}
		}
		$res=db::select('employee_medical_checkup','*','user_id=?','invoice_date',array($employee_id));
		$result=medical_checkup::get_table($limit, $res);
		die($result);

	}
	if ($type=='get_add_claim') {
		$_SESSION['employee_medical_checkup_id']=$employee_medical_checkup_id;
		$rs=db::select_one('employee_medical_checkup','*','employee_medical_checkup_id=?','',array($employee_medical_checkup_id));
		$result=medical_checkup::get_add_claim($rs);
		die($result);
	}
	if ($type=='save_all') {
		$arr=array();
		foreach($_POST['invoice_date'] as $d)  {
			array_push($arr, dbDate($d));
		}
		$invoice_date=json_encode($arr);
		$invoice_val=json_encode($_POST['invoice_val']);
		$total=0;
		foreach ($_POST['invoice_val'] as $val) {
			$total+=$val;
		}
		$employee_medical_checkup_id=$_SESSION['employee_medical_checkup_id'];
		if ($employee_medical_checkup_id==0) {
			db::insert('employee_medical_checkup','user_id, invoice_date, invoice_val, claim', array($user_id, $invoice_date, $invoice_val, $total));
		} else {
			db::update('employee_medical_checkup','invoice_date, invoice_val, claim','employee_medical_checkup_id=?', array($invoice_date, $invoice_val, $total, $employee_medical_checkup_id));
		}
		die;
	}
	if ($type=='delete_claim') {
		db::delete('employee_medical_checkup','employee_medical_checkup_id=?', array($employee_medical_checkup_id));
		die;
	}
?>