<?php
class MedicalCheckup {
	static function get_table($limit, $last, $current) {
		$remainder=$limit;
		$result="";
		
		$result.="<table>
<tr><td>Medical Checkup</td><td>:</td><td>".formatNumber($limit)." / 3 years</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".formatDate(_lbl('date', $last))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".formatNumber(_lbl('val', $last))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".formatNumber(_lbl('paid', $last))."</td></tr>
<tr><td>Last Remarks</td><td>:</td><td>"._lbl('remarks', $last)."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("invoice_date", _lbl('date', $current))."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("invoice_val", formatNumber(_lbl('paid',$current)))."</td></tr>
<tr><td>Remarks</td><td>:</td><td>"._t2("remarks", _lbl('remarks',$current))."</td></tr>
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