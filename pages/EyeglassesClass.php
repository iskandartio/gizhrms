<?php
class Eyeglasses {
	static function get_table($limit, $last_frame, $last_lens) {
		$remainder=$limit;
		$result="";
		
		$result.="<table>
<tr><td>Frame</td><td>:</td><td>".formatNumber($limit)." / 3 years</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".($last_frame['date']=='' ? '-' : formatDate($last_frame['date']))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".($last_frame['val']=='' ? '-' : formatNumber($last_frame['val']))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".($last_frame['paid']=='' ? '-' : formatNumber($last_frame['paid']))."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("frame_invoice_date")."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("frame_invoice_val")."</td></tr>
</table>";
		$result.="<button class='button_link' id='btn_save_frame'>Frame Claim</button><p>";
		
		$result.="<table>
<tr><td>Lens</td><td>:</td><td>Once a year</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".($last_lens['date']=='' ? '-' : formatDate($last_lens['date']))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".($last_lens['val']=='' ? '-' : formatNumber($last_lens['val']))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".($last_lens['paid']=='' ? '-' : formatNumber($last_lens['paid']))."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("lens_invoice_date")."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("lens_invoice_val")."</td></tr>
</table>";
		$result.="<button class='button_link' id='btn_save_lens'>Lens Claim</button><p>";
		return $result;
	}
	static function get_eyeglasses_paid($y) {
		$res=db::select("employee_eyeglasses a
		inner join employee b on a.user_id=b.user_id and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<='".date("$y-12-31")."'",'*',''
		,'b.first_name, b.last_name, a.invoice_date, a.claim_type');
		$rowspanArr=array();
		foreach ($res as $rs) {
			$name=$rs['first_name'].' '.$rs['last_name'];
			if (isset($rowspanArr[$name])) {
				$rowspanArr[$name]=$rowspanArr[$name]+1;
			} else {
				$rowspanArr[$name]=1;
			}
		}
		$data['rowspanArr']=$rowspanArr;
		$data['res']=$res;
		return $data;
	}
	static function get_eyeglasses_paid_by_year($y) {
		$res=db::DoQuery("select year(a.invoice_date) year, a.claim_type, sum(a.paid) paid from employee_eyeglasses a
		inner join employee b on a.user_id=b.user_id  and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<'".date("$y-12-31")."' 
		group by year(a.invoice_date), a.claim_type order by year(a.invoice_date) desc, a.claim_type");
		
		return $res;
	}
	
	static function get_summary_table($y, $data, $res_by_year) {
		$result="";
		$result.="<h1>GLASSES ALLOWANCE $y</h1>";
		$i=1;
		$rowspanArr=$data['rowspanArr'];
		$res=$data['res'];
		$result.="<table class='tbl' id='tbl_eyeglasses'>";
		$result.="<thead><tr><th style='width:32px'>No</th><th style='width:120px'>Name</th><th style='width:80px'>Date</th>
			<th style='width:80px'>Items</th><th style='width:100px'>Paid</th></tr></thead><tbody>";
		$last_name="";
		$bgcolor="white";
		foreach ($res as $rs) {
			$name=$rs['first_name']." ".$rs['last_name'];
			$rowspan=$rowspanArr[$name];
			if ($last_name!=$name) {
				if ($bgcolor=='white') {
					$bgcolor='#EEFFFF';
				} else {
					$bgcolor='white';
				}
				$result.="<tr><td style='width:32px;vertical-align:top;text-align:center;background-color:$bgcolor' rowspan='$rowspan'>".$i++."</td>
					<td style='width:120px;vertical-align:top;background-color:$bgcolor' rowspan='$rowspan'>".$name."</td>";
				$last_name=$name;
			} else {
				$result.="<tr>";
			}
			$result.="<td style='width:80px;background-color:$bgcolor'>".formatDate($rs['invoice_date'])."</td>";
			$result.="<td style='width:80px;background-color:$bgcolor'>".$rs['claim_type']."</td>";
			$result.="<td style='width:80px;background-color:$bgcolor;text-align:right'>".formatNumber($rs['paid'])."</td></tr>";
		}
		$result.="</tbody></table>";
		foreach ($res_by_year as $rs) {
			$result.="<div class='row'>
				<div class='float150'>Total ".$rs['claim_type']." ".$rs['year']."</div>
				<div class='float110 align_right'>: ".formatNumber($rs['paid'])."</div></div>";
		}
		return $result;
	}
}
?>