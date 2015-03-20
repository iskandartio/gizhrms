<?php
	if ($type=='search')  {
		
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Medical Checkup Limit'));
		$last_invoice_date=db::select_single("employee_medical_checkup", "max(invoice_date) v", "user_id=?", "", array($employee_id));
		$last_invoice_val=db::select_single("employee_medical_checkup", "claim v", "user_id=? and invoice_date=?", "", array($employee_id,$last_invoice_date));
		$last_invoice_paid=db::select_single("employee_medical_checkup", "paid v", "user_id=? and invoice_date=?", "", array($employee_id,$last_invoice_date));
		
		$last['date']=$last_invoice_date;
		$last['val']=$last_invoice_val;
		$last['paid']=$last_invoice_paid;
		$result=MedicalCheckup::get_table($limit, $last);
		die($result);

	}
	if ($type=='save') {
		$last_invoice_date=db::select_single("employee_medical_checkup", "max(invoice_date) v", "user_id=?", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,3)>$invoice_date) {
				die("Can't reimburse because last invoice is less then 3 years ago");
			}
		}
		$paid=$invoice_val*0.9;
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Medical Checkup Limit'));
		if ($paid>$limit) $paid=$limit;
		db::insert('employee_medical_checkup','user_id, invoice_date, invoice_val, claim, paid', array($user_id, $invoice_date, $invoice_val,$invoice_val, $paid));
		die;
	}

?>