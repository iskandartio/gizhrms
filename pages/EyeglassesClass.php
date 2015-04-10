<?php
class Eyeglasses {
	static function get_table($limit, $last_frame, $last_lens, $current_frame, $current_lens) {
		$remainder=$limit;
		$result="";
		
		$result.="<table>
<tr><td>Frame</td><td>:</td><td>".formatNumber($limit)." / 3 years</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".formatDate(_lbl('date', $last_frame))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".formatNumber(_lbl('val', $last_frame))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".formatNumber(_lbl('paid', $last_frame))."</td></tr>
<tr><td>Last Remarks</td><td>:</td><td>"._lbl('remarks', $last_frame)."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("frame_invoice_date", _lbl('date', $current_frame))."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("frame_invoice_val", formatNumber(_lbl('val', $current_frame)))."</td></tr>
<tr><td>Remarks</td><td>:</td><td>"._t2("frame_remarks", _lbl('remarks', $current_frame))."</td></tr>
</table>";
		$result.="<button class='button_link' id='btn_save_frame'>Frame Claim</button><p>";
		
		$result.="<table>
<tr><td>Lens</td><td>:</td><td>Once a year</td></tr>
<tr><td>Last Invoice Date</td><td>:</td><td>".formatDate(_lbl('date', $last_lens))."</td></tr>
<tr><td>Last Invoice Value</td><td>:</td><td>".formatNumber(_lbl('val', $last_lens))."</td></tr>
<tr><td>Last Paid</td><td>:</td><td>".formatNumber(_lbl('paid', $last_lens))."</td></tr>
<tr><td>Last Remarks</td><td>:</td><td>"._lbl('remarks', $last_frame)."</td></tr>
<tr><td>Invoice Date</td><td>:</td><td>"._t2("lens_invoice_date", _lbl('date', $current_lens))."</td></tr>
<tr><td>Invoice Value</td><td>:</td><td>"._t2("lens_invoice_val", formatNumber(_lbl('val',$current_lens)))."</td></tr>
<tr><td>Remarks</td><td>:</td><td>"._t2("lens_remarks", _lbl('remarks', $current_lens))."</td></tr>
</table>";
		$result.="<button class='button_link' id='btn_save_lens'>Lens Claim</button><p>";
		return $result;
	}
	static function get_eyeglasses_paid($y) {
		$params=array();
		$tbl="employee_eyeglasses a
		inner join employee b on a.user_id=b.user_id and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<='".date("$y-12-31")."'";
		if (isset($_SESSION['project_location'])) {
			$tbl.=" inner join contract_history c on c.user_id=a.user_id and coalesce(b.am2_end_date, b.contract2_end_date, b.am1_end_date, b.contract1_end_date)=c.end_date and c.project_location in (".$_SESSION['in_project_location'].")";
			$params=array_merge($params, $_SESSION['project_location']);
		}
		$res=db::select($tbl,'a.*','','b.first_name, b.last_name, a.invoice_date, a.claim_type', $params);
		$rowspanArr=array();
		foreach ($res as $rs) {
			$name=_name($rs['user_id']);
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
			$name=_name($rs['user_id']);
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