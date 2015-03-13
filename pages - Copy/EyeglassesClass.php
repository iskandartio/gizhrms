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
	static function get_add_claim($rs) {
		$result="";
		$result.="<button class='button_link' id='btn_add_claim'>Add Another Claim</button>";
		$result.="<table id='tbl_add_claim' class='tbl'>";
		$result.="<thead><tr><th>Invoice Date</th><th>Invoice Value</th><th></th></tr></thead><tbody>";
		if ($rs==null) {
			$result.="<tr><td>"._t2("invoice_date")."</td><td align='right'>"._t2("invoice_val")."</td><td>".getImageTags(['save','delete'])."</td></tr>";
		} else {
			$invoice_date=json_decode($rs['invoice_date']);
			$invoice_val=json_decode($rs['invoice_val']);
			$i=0;
			
			foreach ($invoice_date as $date) {
				$result.="<tr><td>"._t2("invoice_date", $date)."</td><td align='right'>"._t2("invoice_val", formatNumber($invoice_val[$i++]))."</td>
				<td>".getImageTags(['save','delete'])."</td></tr>";
				
			}
			
		}
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='btn_save_all'>Save All</button>";
		return $result;
	}
}
?>