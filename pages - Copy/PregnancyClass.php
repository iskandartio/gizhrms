<?php
class Pregnancy {
	static function get_table($limit, $res) {
		$remainder=$limit;
		$result="";
		$result.="<h2>Entitlement</h2>";
		$result.="<table>
<tr><td>Employee/Dependent</td><td>:</td><td align='right'>".formatNumber($limit)."</td></tr>
</table>";
		$result.="<button class='button_link' id='popup_detail_btn'>Add Claim</button>";
		$result.="<table class='tbl' id='tbl_claim'><thead><tr><th></th><th>Date</th><th>Invoice<br>(Rp)</th><th>Total<br>(Rp)</th><th>Paid 90%<br>(Rp)</th><th>Remainder</th><th></th></thead><tbody>";
		foreach ($res as $rs) {
			$invoice_date=json_decode($rs['invoice_date']);
			$invoice_val=json_decode($rs['invoice_val']);
			$paid=0.9*$rs['claim'];
			$remainder-=$paid;
			
			$rowspan=count($invoice_date);
			$i=0;
			foreach ($invoice_date as $date) {
				$result.="<tr>";
				$result.="<td>".$rs['employee_pregnancy_id']."</td>";
				$result.="<td>".formatDate($date)."</td><td align='right'>".formatNumber($invoice_val[$i])."</td>";
				if ($i==0) $result.="<td rowspan='$rowspan' align='right'>".formatNumber($rs['claim'])."</td><td rowspan='$rowspan' align='right'>".formatNumber($paid)."</td>
				<td rowspan='$rowspan' align='right'>".formatNumber($remainder)."</td>
				<td rowspan='$rowspan'><img src='images/edit.png' class='btn_edit_claim'/> <img src='images/delete.png' class='btn_delete_claim'/></td>";
				$result.="</tr>";
				$i++;
			}
			
		}
		$result.="</tbody></table>";
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