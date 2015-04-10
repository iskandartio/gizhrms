<?php
	if ($type=='search_pay_medical')  {
		$result="";
		$result.=Medical::getMedicalTable("employee_outpatient");
		$result.=Medical::getMedicalTable("employee_pregnancy");
		
		$res=db::select('employee_eyeglasses','*','ifnull(paid_status,0)=0');
		$result.="<h1>Eye Glasses</h1>";
		$result.="<table class='tbl' id='tbl_eyeglasses'><thead><tr><th></th><th>Employee</th><th>Claim Type</th><th>Invoice<br>Date</th><th>Invoice<br>(Rp)</th><th>Paid<br>(Rp)</th><th>Remarks</th><th></th></tr></thead><tbody>";
		shared::setId('pay_medical_employee_eyeglasses_id', 'employee_eyeglasses_id', $res);
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['id']."</td><td>"._name($rs['user_id'])."</td><td>".$rs['claim_type']."</td>
				<td>".formatDate($rs['invoice_date'])."</td><td align='right'>".formatNumber($rs['invoice_val'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
				<td>".$rs['remarks']."</td><td><button class='btn_paid' medical_type='employee_eyeglasses'>Pay</button></td></tr>";
		}
		$result.="</tbody></table>";
		
		$res=db::select('employee_medical_checkup','*','ifnull(paid_status,0)=0');
		$result.="<h1>Medical Checkup</h1>";
		$result.="<table class='tbl' id='tbl_medical_checkup'><thead><tr><th></th><th>Employee</th><th>Invoice<br>Date</th><th>Invoice<br>(Rp)</th><th>Paid<br>(Rp)</th><th>Remarks</th><th></th></tr></thead><tbody>";
		shared::setId('pay_medical_employee_medical_checkup_id', 'employee_medical_checkup_id', $res);
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['id']."</td><td>"._name($rs['user_id'])."</td>
				<td>".formatDate($rs['invoice_date'])."</td><td align='right'>".formatNumber($rs['invoice_val'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
				<td>".$rs['remarks']."</td><td><button class='btn_paid' medical_type='employee_medical_checkup'>Pay</button></td></tr>";
		}
		$result.="</tbody></table>";
		
		die($result);
	}
	if ($type=='save_pay_medical') {
		$id=shared::getId('pay_medical_'.$medical_type.'_id', $id);
		db::update($medical_type, 'paid_status', $medical_type."_id=?", array(1, $id));
	}
	if ($type=='search')  {
		
		if ($year=='this_year') $y=date('Y');else $y=date('Y')-1;
		$res_dependents=EmployeeDependents::getLegitimateDependents($y, $employee_id);
		$res_employee=Employee::get_active_employee_simple_one('a.user_id=? and a.contract1_start_date<=?', array($employee_id, date('Y-12-31')));
		
		if (count($res_employee)==0) {
			$data['result']='No Employee';
			$data['adder']='';
			
			die(json_encode($data));
		}
		
		$data=Medical::getLimit($year, $employee_id, $medical_type, $res_dependents, $res_employee);
		$limit=$data['limit'];
		$dependent=$data['dependent'];
		$res=db::select($medical_type,'*','user_id=? and year(invoice_date)=?','input_date',array($employee_id, $y));
		shared::setId($medical_type."_id", $medical_type."_id", $res);
		$result=Medical::get_table($limit, $dependent, $res, $res_dependents, $res_employee, $medical_type);
		$adder="<tr><td></td><td>"._t2("invoice_date")."</td><td align='right'>"._t2("invoice_val")."</td>
				<td>"._t2("remarks")."</td>
				<td align='right'></td><td align='right'></td><td align='right'></td>
				<td>".getImageTags(['save','delete'])."</td></tr>";
		$data['result']=$result;
		$data['adder']=$adder;
		die(json_encode($data));
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
	if ($type=='save') {
		if (Employee::validateEmployee($user_id)==0) die("Failed");
		$arr=array();
		
		if ($id!="") {
			
			$id=shared::getId($medical_type.'_id', $id);
		}
		$con=db::beginTrans();
		$data=Medical::getLimit($year, $user_id, $medical_type);
		$total_limit=$data['limit']+$data['dependent'];
		$used=db::select_single($medical_type,'sum(paid) v','user_id=? and '.$medical_type.'_id!=?','',array($user_id, $id), $con);
		$remainder=$total_limit-$used;			
		$total=$invoice_val;
		$paid=0.9*$total;
		if ($remainder<$paid) {
			$paid=$remainder;
			$total=100*$paid/90;
		}
		$remainder=$remainder-$paid;
		if ($id=='') {
			$id=db::insert($medical_type,'user_id, invoice_date, invoice_val, remarks, claim, paid,input_date', array($user_id, $invoice_date, $invoice_val, $remarks, $total, $paid, date('Y-m-d')), $con);	
		} else {
			db::update($medical_type, 'user_id, invoice_date, invoice_val, remarks, claim, paid, input_date', $medical_type.'_id=?'
			, array($user_id, $invoice_date, $invoice_val, $remarks, $total, $paid, date('Y-m-d'), $id), $con);
		}
		db::commitTrans($con);
		$new_id=shared::random(12);
		$_SESSION[$medical_type.'_id'][$new_id]=$id;
		$data['id']=$new_id;
		$data['claim']=formatNumber($total);
		$data['paid']=formatNumber($paid);
		$data['remainder']=formatNumber($remainder);
		die(json_encode($data));
	}
	if ($type=='delete') {
		$id=shared::getId($medical_type.'_id', $id);
		db::delete($medical_type, $medical_type.'_id=?', array($id));
		die;
	}
	if ($type=='change_employee_choice') {
		if ($year=='this_year') $y=date('Y');else $y=date('Y')-1;
		$d=date("$y-m-d");
		die(Employee::getComboEmployee($d));
	}
?>