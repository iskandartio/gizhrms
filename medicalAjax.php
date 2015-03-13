<?php
	require_once("pages/startup.php");
	
	if ($type=='search')  {
		$data=Medical::getLimit($year, $employee_id, $medical_type);
		$limit=$data['limit'];
		$dependent=$data['dependent'];
		if ($year=='this_year') $y=date('Y');else $y=date('Y')-1;
		$res=db::select($medical_type,'*','user_id=? and year(invoice_date)=?','invoice_date',array($employee_id, $y));
		$result=Medical::get_table($limit, $dependent, $res);
		die($result);

	}
	if ($type=='get_add_claim') {
		$data=Medical::getLimit($year, $user_id, $medical_type);
		$total_limit=$data['limit']+$data['dependent'];
		$used=db::select_single($medical_type,'sum(paid) v','user_id=?','',array($user_id));
		if ($used==null) $used=0;
		$remainder = $total_limit-$used;
		
		$result=Medical::get_add_claim($total_limit, $remainder, $year);
		die($result);
	}
	if ($type=='save_all') {
		$arr=array();
		$con=db::beginTrans();
		$data=Medical::getLimit($year, $user_id, $medical_type);
		$total_limit=$data['limit']+$data['dependent'];
		$used=db::select_single($medical_type,'sum(paid) v','user_id=?','',array($user_id), $con);
		$remainder=$total_limit-$used;
		foreach($invoice_date as $key=>$inv_date) {
			$inv_val=$invoice_val[$key];
			$total=$inv_val;
			$paid=0.9*$total;
			if ($remainder<$paid) {
				$paid=$remainder;
				$total=100*$paid/90;
			}
			$remainder=$remainder-$paid;
			db::insert($medical_type,'user_id, invoice_date, invoice_val, claim, paid', array($user_id, $inv_date, $inv_val, $inv_val, $paid), $con);	
		}
		
		db::commitTrans($con);
		die;
	}
	if ($type=='delete_claim') {
		db::delete($medical_type,'user_id=? and invoice_date=?', array($user_id, $invoice_date));
		die;
	}
?>