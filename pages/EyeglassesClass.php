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
		inner join applicants b on a.user_id=b.user_id and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<='".date("$y-12-31")."'",'*','','a.invoice_date');
		$arr=array();
		foreach ($res as $rs) {
			$name=$rs['first_name']." ".$rs['last_name'];
			$invoice_date=$rs['invoice_date'];
			$claim_type=$rs['claim_type'];
			$paid=$rs['paid'];
			$arr[$name][$invoice_date][$claim_type]=$paid;
		}
		
		return $arr;
	}
	static function get_eyeglasses_paid_by_year($y) {
		$res=db::DoQuery("select year(a.invoice_date) year, a.claim_type, sum(a.paid) paid from employee_eyeglasses a
		inner join applicants b on a.user_id=b.user_id  and a.invoice_date<='".date("$y-12-31")."' and b.contract1_start_date<'".date("$y-12-31")."' 
		group by year(a.invoice_date), a.claim_type order by year(a.invoice_date) desc, a.claim_type");
		
		return $res;
	}
	
	static function get_summary_table($y, $res, $res_by_year) {
		$result="";
		$result.="<h1>GLASSES ALLOWANCE $y</h1>";
		$i=1;
		$result.="<div class='row'>
			<div class='float40 align_center border_left border_top bold'>No</div>
			<div class='float100 align_center border_left border_top bold'>Name</div>
			<div class='float100 align_center border_left border_top bold'>Date</div>
			<div class='float100 align_center border_left border_top bold'>Items</div>
			<div class='float100 align_center border_left border_top border_right bold'>Paid</div>
		</div>";
		foreach ($res as $name=>$rs) {			
			
			$result.="<div class='row border_left'>
				<div class='float40 align_center border_top'>".$i++."</div>
				<div class='float400 border_left'>
					<div class='float100 border_top'>".$name."</div>";
				$result.="<div class='float50'>";	
			foreach ($rs as $date=>$rs2) {
				
				$result.="	<div class='float300 border_left'>
					<div class='float100 border_top'>".formatDate($date)."</div>
					<div class='float50'>";
				foreach  ($rs2 as $claim_type=>$rs3) {
					$result.="<div class='float300  border_left'>
					<div class='float100 border_top'>".$claim_type."</div>
					<div class='float100 border_top border_left align_right border_right'>".formatNumber($rs3)."</div>
					</div>";
				}
				$result.="</div>
				</div>";
				
				
			}
			$result.="</div>
				</div>
			</div>";
		}
		$result.="<div class='row border_top' style='width:476px'>&nbsp</div>";
		foreach ($res_by_year as $rs) {
			$result.="<div class='row' style='width:270px'><div class='float140'>Total ".$rs['year']." ".$rs['claim_type']."</div><div class='float40'>:</div><div class='align_right rfloat100'>".formatNumber($rs['paid'])."</div></div>";
		}
		
		return $result;
	}
}
?>