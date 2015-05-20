<?php
if ($type=='save_pay_medical') {
	$id=shared::getId('pay_medical_'.$medical_type.'_id', $id);
	db::update($medical_type, 'paid_status', $medical_type."_id=?", array(1, $id));
}
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

?>