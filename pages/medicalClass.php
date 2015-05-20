<?php
Class Medical {


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
	static function get_table($limit, $dependent, $res, $res_dependents, $res_employee, $medical_type) {
		$remainder=$limit+$dependent;
		$result="";
		
		$result.="<div class='row'><div class='float200'>Entitlement:";
		$result.="<table>
<tr><td>Join Date</td><td>:</td><td>".formatDate(_lbl('contract1_start_date', $res_employee))."</td></tr>
<tr><td>Employee</td><td>:</td><td align='right'>".formatNumber($limit)."</td></tr>
<tr><td>Dependents</td><td>:</td><td align='right'>".formatNumber($dependent)."</td></tr>
<tr><td>Total</td><td>:</td><td align='right'> <b><u>".formatNumber($remainder)."</u></b></td></tr>
</table></div><div class='float300'>
		<div class='row'>Spouse : ".$res_employee['spouse_name']."</div>
		<div class='row'>Date of Marriage : ".formatDate($res_employee['marry_date'])."</div>
		<div class='row'><b>".($res_employee['spouse_entitled']==1 ? "" : "* spouse not entitled")."</b></div>
		<table class='tbl' id='tbl_dependents'>
		<tr><th>Relation</th><th>Name</th><th>DOB</th></tr>";
		foreach ($res_dependents as $rs) {
			$result.="<tr><td>".$rs['relation']."</td><td>".$rs['name']."</td><td>".formatDate($rs['date_of_birth'])."</td></tr>";
		}
		$result.="</table>
		</div></div>";
		
		
		$result.="<button class='button_link' id='btn_add'>Add Claim</button>";
		$result.="<button class='button_link' id='print_medical_data'>Print Medical Data</button>";
		$result.="<table class='tbl' id='tbl_claim'><thead><tr><th></th><th>Invoice Date</th><th>Invoice<br>(Rp)</th><th>Remarks</th><th>Total<br>(Rp)</th><th>Paid 90%<br>(Rp)</th><th>Remainder</th><th></th></thead><tbody>";
		$result.="<tr><td></td><td colspan='6' align='right'>".formatNumber($remainder)."</td><td></td></tr>";
		$last_input_date='';
		$bgcolor='aliceblue';
		foreach ($res as $key=>$rs) {
			if ($last_input_date!=$rs['input_date']) {
				if ($bgcolor=='aliceblue') $bgcolor='ghostwhite'; else $bgcolor='aliceblue';
				$last_input_date=$rs['input_date'];
			} 
			$remainder-=$rs['paid'];
			$result.="<tr style='background-color:".$bgcolor."'><td>".$rs['id']."</td><td>".formatDate($rs['invoice_date']);
			$result.="<td align='right'>".formatNumber($rs['invoice_val'])."</td>";
			$result.="<td>".$rs['remarks']."</td>";
			$result.="<td align='right'>".formatNumber($rs['claim'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
			<td align='right'>".formatNumber($remainder)."</td>";
			if ($rs['paid_status']==1) {
				$result.="<td>&nbsp;</td>";
			} else {
				$result.="<td>".getImageTags(['edit','delete'])."</td>";
			}
			$result.="</tr>";
		}
		
		$result.="</tbody></table>";
		
		return $result;
	}
	
	static function get_limit($limit, $start_date, $start_date2, $end_date, $y) {
		if ($start_date<$start_date2) $start_date=$start_date2;
		if ($end_date<$start_date) return 0;
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
	
	
	static function getLimit($year, $employee_id, $medical_type, $res_dependents=null, $res_employee=null) {
		if ($year=='this_year') {
			$y=date('Y');
		} else {
			$y=date('Y')-1;
		}
		if ($medical_type=='employee_outpatient') {
			$limit_def=db::select_single('settings','setting_val v','setting_name=?','',array('Outpatient Limit'));
			$dependent_limit=db::select_single('settings','setting_val v','setting_name=?','',array('Dependent Limit'));
			if ($res_employee==null) {
				$res_employee=Employee::get_active_employee_simple_one('a.user_id=?', array($employee_id));
			}
			$start_date=$res_employee['start_date'];
			$end_date=$res_employee['end_date'];
			
			$limit=Medical::get_limit($limit_def, $start_date, $start_date, $res_employee['end_date'], $y);
			$dependent=0;
			if ($res_employee['marry_date']!=null) {
				if ($res_employee['spouse_entitled']==1) {
					
					$dependent+=Medical::get_limit($dependent_limit, $res_employee['marry_date'], $start_date, $end_date, $y);
				}
			}
			if ($res_dependents==null) {
				$res_dependents=EmployeeDependents::getLegitimateDependents($y, $employee_id);
			}
			
			foreach ($res_dependents as $rs) {
				$dob=$rs['date_of_birth'];
				$end_date2=$end_date;
				if (date('Y', strtotime($dob))+22==$y) {
					if (shared::addYearOnly($dob, 22)<$end_date) $end_date2=shared::addYearOnly($dob, 22);
				}
				
				$dependent+=Medical::get_limit($dependent_limit, $rs['date_of_birth'], $start_date, $end_date2, $y);
				
			}	
			
			$data['limit']=$limit;
			$data['dependent']=$dependent;
		} else {
			$limit_def=db::select_single('settings','setting_val v','setting_name=?','',array('Pregnancy Limit'));
			if ($res_employee==null) {
				$res_employee=Employee::get_active_employee_simple_one('a.user_id=?', array($employee_id));
				
			}
			$start_date=$res_employee['start_date'];
			$end_date=$res_employee['end_date'];
			$limit=0;
			$dependent=0;
			if ($res_employee['gender']=='Male') {
				if ($res_employee['spouse_entitled']==1) {
					$dependent=Medical::get_limit($limit_def, $res_employee['marry_date'], $start_date, $res_employee['end_date'], $y);
				}
			} else {
				$limit=Medical::get_limit($limit_def, $start_date, $start_date, $res_employee['end_date'], $y);
			}
			$data['limit']=$limit;
			$data['dependent']=$dependent;
		}
		return $data;
	}
	static function getResMany($y, $tbl, $project_name, $project_number, $project_location) {
		$sql_b="select a.user_id, max(a.end_date) end_date from contract_history a
			where a.end_date>=?";
		$params=array();
		array_push($params, date("$y-01-01"));
		if ($project_name!='') {
			$sql_b.=" and a.project_name=?";
			array_push($params, $project_name);
		}
		if ($project_number!='') {
			$sql_b.=" and a.project_number=?";
			array_push($params, $project_number);
		}

		if ($project_location!='') {
			$sql_b.=" and a.project_location=?";
			array_push($params, $project_location);
		}
		if (isset($_SESSION['project_location'])) {
			$sql_b.=" and a.project_location in (".$_SESSION['in_project_location'].")";
			$params=array_merge($params, $_SESSION['project_location']);
		}
		$sql_b.=" group by a.user_id";
		
		$sql="
			select a.start_date, a.end_date, c.* from contract_history a
			inner join ($sql_b) b on a.user_id=b.user_id and a.end_date=b.end_date 
			inner join $tbl c on c.user_id=a.user_id";
		
		$resMany=db::DoQuery($sql, $params);
		
		return $resMany;
	}
	static function getLimitMany($y, $medical_type, $resMany) {
		$data=array();
		if ($medical_type=='employee_outpatient') {
			$limit_def=db::select_single('settings','setting_val v','setting_name=?','',array('Outpatient Limit'));
			$dependent_limit=db::select_single('settings','setting_val v','setting_name=?','',array('Dependent Limit'));
			foreach ($resMany as $res) { 
				$start_date=$res['start_date'];
				$end_date=$res['end_date'];
				$user_id=$res['user_id'];
				$limit=Medical::get_limit($limit_def, $start_date, $start_date, $res['end_date'], $y);
				$dependent=0;
				if ($res['marry_date']!=null) {
					$dependent+=Medical::get_limit($dependent_limit, $res['marry_date'], $start_date, $end_date, $y);
				}
				$data[$user_id]['start_date']=$start_date;
				$data[$user_id]['end_date']=$end_date;
				$data[$user_id]['limit']=$limit;
				$data[$user_id]['dependent']=$dependent;
				$data[$user_id]['name']=$res['first_name']." ".$res['last_name'];
			}
			$resMany=db::select("employee_dependent a"
				, 'a.relation, a.date_of_birth, a.user_id'
				, "date_add(a.date_of_birth, interval 22 year)>'".date("$y-12-31")."'"
				, 'a.date_of_birth limit 3');
			foreach ($resMany as $rs) {
				$user_id=$rs['user_id'];
				if (isset($data[$user_id])) {
					$dependent=$data[$user_id]['dependent'];
					$start_date=$data[$user_id]['start_date'];
					$end_date=$data[$user_id]['end_date'];
					$dependent+=Medical::get_limit($dependent_limit, $rs['date_of_birth'], $start_date, $end_date, $y);
					$data[$user_id]['dependent']=$dependent;
				}
			}
		} else {
			$limit_def=db::select_single('settings','setting_val v','setting_name=?','',array('Pregnancy Limit'));
			foreach ($resMany as $res) { 
				$user_id=$res['user_id'];
				$start_date=$res['start_date'];
				$end_date=$res['end_date'];
				$limit=0;
				$dependent=0;
				if ($res['gender']=='Male') {
					if ($res['marry_date']!=null && $res['spouse_entitled']==1) {
						$dependent=Medical::get_limit($limit_def, $res['marry_date'], $start_date, $res['end_date'], $y);
					}
				} else {
					$limit=Medical::get_limit($limit_def, $start_date, $start_date, $res['end_date'], $y);
				}
				
				if ($limit!=0||$dependent!=0) {
					$data[$user_id]['limit']=$limit;
					$data[$user_id]['dependent']=$dependent;
					$data[$user_id]['start_date']=$start_date;
					$data[$user_id]['end_date']=$end_date;
					$data[$user_id]['name']=$res['first_name']." ".$res['last_name'];
				}
				
			}
		}
		return $data;
	}
	static function getPaidMany($medical_type, $resMany) {
		$data=array();
		foreach ($resMany as $rs) {
			$data[$rs['user_id']]=$rs['paid'];
		}
		return $data;
	}
	static function medicalSummaryTable($year, $data_limit, $data_paid, $medical_type) {
		if ($year=='this_year') {
			$y=date('Y');
		} else {
			$y=date('Y')-1;
		}
		$result="";
		if ($medical_type=='employee_outpatient') {
			$result.="<h1>OUTPATIENT REIMBURSEMENT SUMMARY ".$y."</h1>";
		} else {
			$result.="<h1>PREGNANCY REIMBURSEMENT SUMMARY ".$y."</h1>";
		}
		$result.="<table class='tbl' id='tbl_outpatient'>
		<thead><tr><th>No</th><th width='200px'>Name</th><th width='100px'>";
		if ($medical_type=='employee_outpatient') {
			$result.="Entitled Outpatient Reimbursement";
		} else {
			$result.="Entitled Pregnancy Reimbursement";
		}
		$result.="</th><th width='100px'>Claimed</th>
		<th width='100px'>Balance</th><th>Remarks</th><th>Start Date</th><th>End Date</th></tr></thead><tbody>";
		$i=1;
		$sum_paid=0;
		$sum_limit=0;
		foreach ($data_limit as $key=>$val) {
			$limit=$val['limit']+$val['dependent'];
			$sum_limit+=$limit;
			$paid=0;
			if (isset($data_paid[$key])) {
				$paid=$data_paid[$key];
			}
			$sum_paid+=$paid;
			$remarks="";
			if ($val['end_date'] < date("$y-12-31")) {
				$remarks='Contract Ended';
			}
			$result.="<tr><td align='center'>".$i++."</td><td>".$val['name']."</td><td align='right'>".formatNumber($limit)."</td><td align='right'>".formatNumber($paid)."</td><td align='right'>".formatNumber($limit-$paid)."</td>
			<td>$remarks</td><td>".formatDate($val['start_date'])."</td><td>".formatDate($val['end_date'])."</td></tr>";
		}
		$result.="<tr style='background-color: #447CB5;color: white'><td colspan='2'align='right'>Total</td><td align='right'>".formatNumber($sum_limit)."</td>
		<td align='right'>".formatNumber($sum_paid)."</td><td align='right'>".formatNumber($sum_limit-$sum_paid)."</td><td colspan='3'>&nbsp;</td></tr>
		</tbody></table>";
		return $result;
	}
	static function getMedicalTable($medical_type) {
		$res=db::select($medical_type, "*", "ifnull(paid_status,0)=0", "user_id, input_date");
		shared::setId('pay_medical_'.$medical_type.'_id', $medical_type.'_id', $res);
		$result="";
		if ($medical_type=='employee_outpatient') {
			$result.="<h1>Outpatient</h1>";
		} else {
			$result.="<h1>Pregnancy</h1>";
		}
		$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>Employee</th><th>Invoice Date</th><th>Invoice<br>(Rp)</th><th>Paid<br>(Rp)</th>
				<th>Remarks</th><th></th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs["id"]."</td><td>"._name($rs['user_id'])."</td><td>".formatDate($rs['invoice_date'])."</td>
			<td align='right'>".formatNumber($rs['invoice_val'])."</td>
			<td align='right'>".formatNumber($rs['paid'])."</td>
			<td>".$rs['remarks']."</td>";
			$result.="<td><button class='btn_paid' medical_type='".$medical_type."'>Pay</button></td></tr>";
		}
		$result.="</tbody></table>";
		return $result;
	}
	static  function selfDataMedical($employee_id, $medical_type, $res_dependents, $res_employee, $year) {
		if ($year=='this_year') {
			$y=date('Y');
		} else {
			$y=date('Y')-1;
		}
		$data=Medical::getLimit($year, $employee_id, $medical_type, $res_dependents, $res_employee);
		$limit=$data['limit'];
		$dependent=$data['dependent'];
		$res=db::select($medical_type,'*','user_id=? and year(invoice_date)=?','input_date',array($employee_id, $y));
		$remainder=$limit+$dependent;
		$result="";
		$result.="<div class='row'><div class='float200'>Entitlement:";
		$result.="<table>
	<tr><td>Join Date</td><td>:</td><td>".formatDate(_lbl('contract1_start_date', $res_employee))."</td></tr>
	<tr><td>Employee</td><td>:</td><td align='right'>".formatNumber($limit)."</td></tr>
	<tr><td>Dependents</td><td>:</td><td align='right'>".formatNumber($dependent)."</td></tr>
	<tr><td>Total</td><td>:</td><td align='right'> <b><u>".formatNumber($remainder)."</u></b></td></tr>
	</table></div><div class='float300'>
		<div class='row'>Spouse : ".$res_employee['spouse_name']."</div>
		<div class='row'>Date of Marriage : ".formatDate($res_employee['marry_date'])."</div>
		<div class='row'><b>".($res_employee['spouse_entitled']==1 ? "" : "* spouse not entitled")."</b></div>
		<table class='tbl' id='tbl_dependents'>
		<tr><th>Relation</th><th>Name</th><th>DOB</th></tr>";
		foreach ($res_dependents as $rs) {
			$result.="<tr><td>".$rs['relation']."</td><td>".$rs['name']."</td><td>".formatDate($rs['date_of_birth'])."</td></tr>";
		}
		$result.="</table>
		</div></div>";
		
		
		$result.="<table class='tbl' id='tbl_claim'><thead><tr><th>Invoice Date</th><th>Invoice<br>(Rp)</th><th>Remarks</th><th>Total<br>(Rp)</th><th>Paid 90%<br>(Rp)</th><th>Remainder</th></thead><tbody>";
		$result.="<tr><td colspan='6' align='right'>".formatNumber($remainder)."</td></tr>";
		$last_input_date='';
		$bgcolor='aliceblue';
		foreach ($res as $key=>$rs) {
			if ($last_input_date!=$rs['input_date']) {
				if ($bgcolor=='aliceblue') $bgcolor='ghostwhite'; else $bgcolor='aliceblue';
				$last_input_date=$rs['input_date'];
			} 
			$remainder-=$rs['paid'];
			$result.="<tr style='background-color:".$bgcolor."'><td>".formatDate($rs['invoice_date']);
			$result.="<td align='right'>".formatNumber($rs['invoice_val'])."</td>";
			$result.="<td>".$rs['remarks']."</td>";
			$result.="<td align='right'>".formatNumber($rs['claim'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
			<td align='right'>".formatNumber($remainder)."</td>";
			$result.="</tr>";
		}
		
		$result.="</tbody></table>";
		return $result;
	}
}
?>