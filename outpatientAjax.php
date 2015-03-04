<?php
	require_once("pages/startup.php");
	if ($type=='search')  {
		$limit=db::select_single('settings','setting_val v','setting_name=?','',array('Outpatient Limit'));
		$dependent_limit=db::select_single('settings','setting_val v','setting_name=?','',array('Dependent Limit'));
		$res=db::select_one('applicants','contract1_start_date start_date
		, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date','user_id=? and contract1_start_date<curdate()','',array($employee_id));
		if (date('Y')== substr($res['start_date'],0,4)) {
			$month=substr($res['start_date'], 5,2);
			if ($res['end_date']<date('Y-12-31')) {
				$m=substr($res['end_date'], 5,2);
			} else {
				$m=12;
			}
			$limit=$limit*($m-$month+1)/12;
		}
		
		$res=db::select('employee_dependent', 'relation, date_of_birth', "user_id=?", 'date_of_birth', array($employee_id));
		$dependent=0;
		foreach ($res as $rs) {
			if ($rs['relation']!='Spouse'&&date('Y')== substr($rs['date_of_birth'],0,4)) {
				$month=substr($rs['date_of_birth'], 5,2);
				$dep=$dependent_limit*(12-$month+1)/12;
			} else {
				$dep=$dependent_limit;
			}
			$dependent+=$dep;
		}		
		$res=db::select('employee_outpatient','*','user_id=?','invoice_date',array($employee_id));
		$result=Outpatient::get_table($limit, $dependent, $res);
		die($result);

	}
	if ($type=='get_add_claim') {
		$_SESSION['employee_outpatient_id']=$employee_outpatient_id;
		$rs=db::select_one('employee_outpatient','*','employee_outpatient_id=?','',array($employee_outpatient_id));
		$result=Outpatient::get_add_claim($rs);
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
		$employee_outpatient_id=$_SESSION['employee_outpatient_id'];
		if ($employee_outpatient_id==0) {
			db::insert('employee_outpatient','user_id, invoice_date, invoice_val, claim', array($user_id, $invoice_date, $invoice_val, $total));
		} else {
			db::update('employee_outpatient','invoice_date, invoice_val, claim','employee_outpatient_id=?', array($invoice_date, $invoice_val, $total, $employee_outpatient_id));
		}
		die;
	}
	if ($type=='delete_claim') {
		db::delete('employee_outpatient','employee_outpatient_id=?', array($employee_outpatient_id));
		die;
	}
?>