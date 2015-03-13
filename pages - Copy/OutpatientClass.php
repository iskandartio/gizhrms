<?php
class Outpatient {
	static function get_table($limit, $dependent, $res) {
		$remainder=$limit+$dependent;
		$result="";
		$result.="<h2>Entitlement</h2>";
		$result.="<table>
<tr><td>Employee</td><td>:</td><td align='right'>".formatNumber($limit)."</td></tr>
<tr><td>Dependents</td><td>:</td><td align='right'>".formatNumber($dependent)."</td></tr>
<tr><td>Total</td><td>:</td><td align='right'> <b><u>".formatNumber($remainder)."</u></b></td></tr>
</table>";
		$result.="<button class='button_link' id='popup_detail_btn'>Add Claim</button>";
		$result.="<button class='button_link' id='print_medical_data'>Print Medical Data</button>";
		$result.="<table class='tbl' id='tbl_claim'><thead><tr><th>Date</th><th>Invoice<br>(Rp)</th><th>Total<br>(Rp)</th><th>Paid 90%<br>(Rp)</th><th>Remainder</th><th></th></thead><tbody>";
		$result.="<tr><td colspan='5' align='right'>".formatNumber($remainder)."</td><td></td></tr>";
		$arr=array();
		foreach($res as $rs) {
			if (!isset($arr[$rs['invoice_date']]['invoice_val'])) $arr[$rs['invoice_date']]['invoice_val']=array();
			array_push($arr[$rs['invoice_date']]['invoice_val'], $rs['invoice_val']);	
			if (!isset($arr[$rs['invoice_date']]['paid'])) $arr[$rs['invoice_date']]['paid']=0;
			$arr[$rs['invoice_date']]['paid']+=$rs['paid'];	
			if (!isset($arr[$rs['invoice_date']]['claim'])) $arr[$rs['invoice_date']]['claim']=0;
			$arr[$rs['invoice_date']]['claim']+=$rs['claim'];	
		}
		foreach ($arr as $key=>$val) {
			$paid=$arr[$key]['paid'];
			$invoice_val=$arr[$key]['invoice_val'];
			$claim=$arr[$key]['claim'];
			$remainder-=$paid;
			$result.="<tr>";
			$result.="<td>".formatDate($key)."</td><td align='right'>";
			foreach ($invoice_val as $inv_val) {
				$result.="<div>".formatNumber($inv_val)."</div>";
			}
			$result.="</td>";
			$result.="<td align='right'>".formatNumber($claim)."</td><td align='right'>".formatNumber($paid)."</td>
			<td align='right'>".formatNumber($remainder)."</td>
			<td><img src='images/delete.png' class='btn_delete_claim'/></td>";
			$result.="</tr>";
		}
		
		$result.="</tbody></table>";
		return $result;
	}
	static function get_add_claim($limit, $remainder, $year) {
		$result='';
		$result.="<input type='hidden' class='year' value='".$year."'/>";
		if ($year=='this_year') $result.="Current Year"; else $result.="Last Year";
		$result.="<div class='row'><div class='label'>Limit</div><div class='label'>".formatNumber($limit)."</div></div>";
		$result.="<div class='row'><div class='label'>Remainder</div><div class='label'>".formatNumber($remainder)."</div></div>";
		
		$result.="<button class='button_link' id='btn_add_claim'>Add Another Claim</button>";
		$result.="<table id='tbl_add_claim' class='tbl'>";
		$result.="<thead><tr><th>Invoice Date</th><th>Invoice Value</th><th></th></tr></thead><tbody>";
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='btn_save_all'>Save All</button>";
		return $result;
	}
	static function getLimit($year, $employee_id) {
		if ($year=='this_year') {
			$y=date('Y');
		} else {
			$y=date('Y')-1;
		}
		$limit_def=db::select_single('settings','setting_val v','setting_name=?','',array('Outpatient Limit'));
		$dependent_limit=db::select_single('settings','setting_val v','setting_name=?','',array('Dependent Limit'));
		$res=db::select_one('applicants','marry_date, contract1_start_date start_date
		, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date','user_id=? and contract1_start_date<curdate()','',array($employee_id));
		$start_date=$res['start_date'];
		$end_date=$res['end_date'];
		
		$limit=self::get_limit($limit_def, $start_date, $start_date, $res['end_date'], $y);
		$dependent=0;
		if ($res['marry_date']!=null) {
			$dependent+=self::get_limit($dependent_limit, $res['marry_date'], $start_date, $end_date, $y);
		}
		$res=db::select('employee_dependent', 'relation, date_of_birth', "user_id=? and date_add(date_of_birth, interval 22 year)>curdate()", 'date_of_birth limit 3', array($employee_id));
		foreach ($res as $rs) {
			$dependent+=self::get_limit($dependent_limit, $rs['date_of_birth'], $start_date, $end_date, $y);
		}
		$data['limit']=$limit;
		$data['dependent']=$dependent;
		return $data;
	}
	static function get_limit($limit, $start_date, $start_date2, $end_date, $y) {
		if ($start_date<$start_date2) $start_date=$start_date2;
		if ($y< substr($start_date,0,4)) return 0;
		if ($y== substr($start_date,0,4)) {
			$month=substr($start_date, 5,2);
			if ($end_date<date("$y-12-31")) {
				$m=substr($end_date, 5,2);
			} else {
				$m=12;
			}
			$limit=$limit*($m-$month+1)/12;
		}
		return $limit;
	}
}
?>