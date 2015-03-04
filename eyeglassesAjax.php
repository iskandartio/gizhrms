<?php
	require_once("pages/startup.php");
	if ($type=='search')  {
		
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Frame Limit'));
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Frame'", "", array($employee_id));
		$last_invoice_val=db::select_single("employee_eyeglasses", "claim v", "user_id=? and claim_type='Frame' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		$last_invoice_paid=db::select_single("employee_eyeglasses", "paid v", "user_id=? and claim_type='Frame' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		
		$last_frame['date']=$last_invoice_date;
		$last_frame['val']=$last_invoice_val;
		$last_frame['paid']=$last_invoice_paid;
		
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Lens'", "", array($employee_id));
		$last_invoice_val=db::select_single("employee_eyeglasses", "claim v", "user_id=? and claim_type='Lens' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		$last_invoice_paid=db::select_single("employee_eyeglasses", "paid v", "user_id=? and claim_type='Lens' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		
		$last_lens['date']=$last_invoice_date;
		$last_lens['val']=$last_invoice_val;
		$last_lens['paid']=$last_invoice_paid;
		
		$result=Eyeglasses::get_table($limit, $last_frame, $last_lens);
		die($result);

	}
	if ($type=='save_frame') {
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Frame'", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,3)>$frame_invoice_date) {
				die("Can't reimburse because last invoice is less then 3 years ago");
			}
		}
		$total=$frame_invoice_val;
		if ($frame_invoice_val>750000) $total=750000;
		db::insert('employee_eyeglasses','claim_type, user_id, invoice_date, invoice_val, claim, paid', array('Frame', $user_id, $frame_invoice_date, $frame_invoice_val,$frame_invoice_val, $total));
		die;
	}
	if ($type=='save_lens') {
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Lens'", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,1)>$lens_invoice_date) {
				die("Can't reimburse because last invoice is less then 1 years ago");
			}
		}
		$total=$lens_invoice_val;
		db::insert('employee_eyeglasses','claim_type, user_id, invoice_date, invoice_val, claim, paid', array('Lens', $user_id, $lens_invoice_date, $lens_invoice_val,$lens_invoice_val, $total));
		die;
	}
	
?>