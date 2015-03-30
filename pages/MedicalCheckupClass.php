<?php
class MedicalCheckup {
	static function get_table($limit, $last) {
		$remainder=$limit;
		$result="";
		
		$result.="<table>
<tr><td>Medical Checkup</td><td>:</td><td>".formatNumber($limit)." / 3 years</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".($last['date']=='' ? '-' : formatDate($last['date']))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".($last['val']=='' ? '-' : formatNumber($last['val']))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".($last['paid']=='' ? '-' : formatNumber($last['paid']))."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("invoice_date")."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("invoice_val")."</td></tr>
</table>";
		$result.="<button class='button_link' id='btn_save'>Medical Checkup Claim</button><p>";
		
		return $result;
	}
	static function get_medical_checkup_paid($y) {
		$res=db::select("employee_medical_checkup a
		inner join employee b on a.user_id=b.user_id and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<'".date("$y-12-31")."'",'*','','a.invoice_date');
		return $res;
	}
	static function get_summary_table($y, $res) {
		$result="";
		$result.="<h1>MEDICAL CHECK-UP SUMMARY $y</h1>";
		$result.="<table class='tbl' id='tbl_medical_checkup'>
		<thead><tr><th width='40px'>No</th><th width='200px'>Name</th><th width='100px'>Date</th><th width='100px'>Paid</th></tr></thead><tbody>";
		$i=1;
		foreach ($res as $rs) {
			$name=$rs['first_name'].' '.$rs['last_name'];
			$result.="<tr><td align='center'>".$i++."</td><td>$name</td><td>".formatDate($rs['invoice_date'])."</td><td align='right'>".formatNumber($rs['paid'])."</td></tr>";
			
		}
		$result.="</tbody></table>";
		return $result;
	}
}
?>