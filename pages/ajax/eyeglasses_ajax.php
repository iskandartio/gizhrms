<?php
	if ($type=='search')  {
		$last_frame=array();
		$current_frame=array();
		$last_lens=array();
		$current_lens=array();
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Frame Limit'));
		$employee_id=shared::getId('employee_choice', $employee_id);
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Frame' and paid_status=1", "", array($employee_id));
		
		$rs=db::select_one("employee_eyeglasses", "claim, paid, remarks", "user_id=? and claim_type='Frame' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		
		if (count($rs)>0) {
			$last_frame['date']=$last_invoice_date;
			$last_frame['val']=$rs['claim'];
			$last_frame['paid']=$rs['paid'];
			$last_frame['remarks']=$rs['remarks'];
		}
		$rs=db::select_one("employee_eyeglasses", "invoice_date, claim, paid, remarks", "user_id=? and claim_type='Frame' and ifnull(paid_status,0)=0", "", array($employee_id));
		if (count($rs)>0) {
			$current_frame['date']=$rs['invoice_date'];
			$current_frame['val']=$rs['claim'];
			$current_frame['paid']=$rs['paid'];
			$current_frame['remarks']=$rs['remarks'];
		}
		
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Lens' and paid_status=1", "", array($employee_id));
		$rs=db::select_one("employee_eyeglasses", "claim, paid, remarks", "user_id=? and claim_type='Lens' and invoice_date=?", "", array($employee_id,$last_invoice_date));
		if (count($rs)>0) {
			$last_lens['date']=$last_invoice_date;
			$last_lens['val']=$rs['claim'];
			$last_lens['paid']=$rs['paid'];
			$last_lens['remarks']=$rs['remarks'];
		}
		$rs=db::select_one("employee_eyeglasses", "*", "user_id=? and claim_type='Lens' and ifnull(paid_status,0)=0", "", array($employee_id));
		if (count($rs)>0) {
			$current_lens['date']=$rs['invoice_date'];
			$current_lens['val']=$rs['claim'];
			$current_lens['paid']=$rs['paid'];
			$current_lens['remarks']=$rs['remarks'];
		}
		
		$result=Eyeglasses::get_table($limit, $last_frame, $last_lens, $current_frame, $current_lens);
		die($result);

	}
	if ($type=='save_frame') {
		$user_id=shared::getId('employee_choice', $user_id);
		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Frame' and paid_status=1", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,3)>$frame_invoice_date) {
				die("Can't reimburse because last invoice is less then 3 years ago");
			}
		}
		$total=$frame_invoice_val;
		if ($frame_invoice_val>750000) $total=750000;
		$id=db::select_single('employee_eyeglasses', 'employee_eyeglasses_id v', "user_id=? and claim_type='Frame' and ifnull(paid_status,0)=0", "", array($user_id));
		if ($id==null) {
			db::insert('employee_eyeglasses','claim_type, user_id, invoice_date, invoice_val, remarks, claim, paid', array('Frame', $user_id, $frame_invoice_date, $frame_invoice_val, $frame_remarks, $frame_invoice_val, $total));
		} else {
			db::update('employee_eyeglasses','invoice_date, invoice_val, remarks, claim, paid', 'employee_eyeglasses_id=?', array($frame_invoice_date, $frame_invoice_val, $frame_remarks, $frame_invoice_val, $total, $id));
		}
		die;
	}
	if ($type=='save_lens') {
		$user_id=shared::getId('employee_choice', $user_id);
		if (Employee::validateEmployee($user_id)==0) {
			die("Failed");
		}

		$last_invoice_date=db::select_single("employee_eyeglasses", "max(invoice_date) v", "user_id=? and claim_type='Lens' and paid_status=1", "", array($user_id));
		if ($last_invoice_date!=null) {
			if (shared::addYear($last_invoice_date,1)>$lens_invoice_date) {
				die("Can't reimburse because last invoice is less then 1 years ago");
			}
		}
		$total=$lens_invoice_val*0.9;
		$id=db::select_single('employee_eyeglasses', 'employee_eyeglasses_id v', "user_id=? and claim_type='Lens' and ifnull(paid_status,0)=0", "", array($user_id));
		if ($id==null) {
			db::insert('employee_eyeglasses','claim_type, user_id, invoice_date, invoice_val, remarks, claim, paid', array('Lens', $user_id, $lens_invoice_date, $lens_invoice_val, $lens_remarks, $lens_invoice_val, $total));
		} else {
			db::update('employee_eyeglasses','invoice_date, invoice_val, remarks, claim, paid', 'employee_eyeglasses_id=?', array($lens_invoice_date, $lens_invoice_val, $lens_remarks, $lens_invoice_val, $total, $id));
		}

		die;
	}
	
?>