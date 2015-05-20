<?php
	if ($type=='search')  {
		$employee_id=shared::getId('employee_choice', $employee_id);
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Medical Checkup Limit'));
		$last_invoice_date=db::select_single("employee_medical_checkup", "max(invoice_date) v", "user_id=? and paid_status=1", "", array($employee_id));
		$rs=db::select_one("employee_medical_checkup", "*", "user_id=? and invoice_date=? and paid_status=1", "", array($employee_id,$last_invoice_date));
		$last=array();
		$current=array();
		if ($rs!=null) {
			$last['date']=$last_invoice_date;
			$last['val']=$rs['claim'];
			$last['paid']=$rs['paid'];
			$last['remarks']=$rs['remarks'];
		}
		$rs=db::select_one("employee_medical_checkup", "*", "user_id=? and ifnull(paid_status,0)=0", "", array($employee_id));
		if ($rs!=null) {
			$current['date']=$rs['invoice_date'];
			$current['val']=$rs['claim'];
			$current['paid']=$rs['paid'];
			$current['remarks']=$rs['remarks'];
		
		}
		
		$result=MedicalCheckup::get_table($limit, $last, $current);
		die($result);

	}
	if ($type=='save') {
		$user_id=shared::getId('employee_choice', $user_id);
		$last_invoice_date=db::select_single("employee_medical_checkup", "max(invoice_date) v", "user_id=? and paid_status=1", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,3)>$invoice_date) {
				die("Can't reimburse because last invoice is less then 3 years ago");
			}
		}
		$paid=$invoice_val*0.9;
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Medical Checkup Limit'));
		if ($paid>$limit) {
			die("Over limit, please check your input");
			$paid=$limit;
		}
		$id=db::select_single('employee_medical_checkup', 'employee_medical_checkup_id v', "user_id=? and ifnull(paid_status,0)=0", "", array($user_id));
		if ($id==null) {
			db::insert('employee_medical_checkup','user_id, invoice_date, invoice_val, remarks, claim, paid', array($user_id, $invoice_date, $invoice_val, $remarks, $invoice_val, $paid));
		} else {
			
			db::update('employee_medical_checkup','invoice_date, invoice_val, remarks, claim, paid', 'employee_medical_checkup_id=?', array($invoice_date, $invoice_val, $remarks, $invoice_val, $paid, $id));
		}
		die;
	}

?>