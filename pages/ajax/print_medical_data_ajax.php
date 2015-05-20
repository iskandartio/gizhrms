<?php
	$user_id=$_GET['user_id'];
	$user_id=shared::getId('employee_choice',$user_id);
	$year=$_GET['year'];
	if ($year=='this_year') $y=date('Y'); else $y=date('Y')-1;
	$data=Medical::getLimit($year, $user_id, $medical_type);
	$limit=$data['limit'];
	$dependent=$data['dependent'];
	
	$remainder=$limit+$dependent;
	$app=Employee::get_active_employee_one("a.user_id=?", array($user_id));
	
	$res_dependents=db::select('employee_dependent','*','user_id=?','', array($user_id));
	$res_salary_sharing=db::select('salary_sharing','*','contract_history_id=?','',array($app['contract_history_id']));
	$input_date=db::select_single($medical_type, 'max(input_date) v', 'user_id=?', '', array($user_id));
	
	$res=db::select($medical_type,'*','user_id=?','input_date, invoice_date',array($user_id));
	$result="";
	$result.="<style>
		.float50 {
			float:left;width:50px;
		}
		.float100 {
			float:left;width:100px;
		}
		.float140 {
			float:left;width:140px;
		}
		.float150 {
			float:left;width:150px;
		}
		.float200 {
			float:left;width:200px;
		}
		.float300 {
			float:left;width:300px;
		}
		.float480 {
			float:left;width:480px;
		}
		.align_right {
			text-align:right;
		}
		.div_margin {
			margin-left:20px;
		}
		.border_top {
			border-top:1px dotted black;
		}
		.border_bottom {
			border-bottom:1px dotted black;
		}
		.border_bottom_solid {
			border-bottom:1px solid black;
		}
		div.row {
			padding-bottom:10px;
		}
		div.row:after {
			clear: both;
			content: '';
			display: block;
			height: 0;
			
		}
		.tbl {
			border-collapse:collapse;
		}
		.tbl td, .tbl th {
			border:1px solid black;
			padding:3px;
		}
		.footer {
			position: absolute;
			bottom: 0;
			width: 644px;
			height: 100px;
		}
		.height90 {
			height:90px;
		}
		.float50p {
			float:left;
			width:50%;
		}
		.float80p {
			float:left;
			width:80%;
		}
		body {
			font-family:calibri;
		}
	";
	$result.="</style>";
	$result.="<h4>GIZ PAKLIM</h4>";
	if ($medical_type=='employee_outpatient'){
		$result.="<h4>OUTPATIENT CLAIM SUMMARY</h4>";
	} else {
		$result.="<h4>PREGNANCY MEDICAL CARE SUMMARY</h4>";
	}
	$result.="<div class='row'><div class='float50p'>
	<div class='float200'>
		<div><u>Entitlement:</u></div>
		<div class='float100'>Employee</div><div class='align_right'>".formatNumber($limit)."&nbsp</div>
		<div class='float100'>Dependents</div><div class='align_right border_bottom float100'>".formatNumber($dependent)."&nbsp</div>
		<div class='float100'>Total (Rp.)</div><div class='align_right'>".formatNumber($limit+$dependent)."&nbsp</div>";
	$result.="<div class='row'></div>";
	$result.="<div><u>Salary Sharing:</u></div>";
	foreach ($res_salary_sharing as $rs) {
		$result.="<div class='float150'>".$rs['project_name']." ".$rs['project_number']."</div><div>".$rs['percentage']." %</div>";
	}
	$result.="</div></div>";
	$result.="<div>
		<div class='float100'>Name</div><div>".$app['first_name'].' '.$app['last_name']."</div>
		<div class='float100'>Project Name</div><div>".$app['project_name']."&nbsp</div>
		<div class='float100'>Year</div><div>".$y."&nbsp</div>
		<div class='float100'>PN</div><div>".$app['project_number']."&nbsp</div>
		<div class='float100'>Join Date</div><div>".formatDate($app['contract1_start_date'])."</div>
		<div class='float100'>Acc No</div>
		<div class='float100'>
			<div>".$app['account_number']."</div>
			<div>".$app['account_bank']."</div>
		</div>
	</div></div>";
	
	$result.="<div class='row'><div class='float80p'>";
	$result.="<table class='tbl' id='tbl_claim'><thead><tr><th width='100px'>Invoice Date</th><th width='80px'>Invoice<br>(Rp)</th>
	<th width='80px'>Total<br>(Rp)</th><th width='80px'>Paid 90%<br>(Rp)</th><th width='80px'>Remainder</th></thead><tbody>";
	$result.="<tr><td colspan='5' align='right'>".formatNumber($remainder)."</td></tr>";
	$bgcolor='white';
	$total=0;
	foreach ($res as $key=>$rs) {
		
		if ($input_date==$rs['input_date']) {
			$total+=$rs['paid'];
			$bgcolor='yellow';
		} else {
			$bgcolor='white';
		}
		$remainder-=$rs['paid'];
		$result.="<tr style='background-color:$bgcolor'>";
		$result.="<td>".formatDate($rs['invoice_date'])."</td>";
		$result.="<td align='right'>".formatNumber($rs['invoice_val'])."</td>";
		$result.="<td align='right'>".formatNumber($rs['claim'])."</td>";
		$result.="<td align='right'>".formatNumber($rs['paid'])."</td>
		<td align='right'>".formatNumber($remainder)."</td>";
		$result.="</tr>";
	}
	
	$result.="</tbody></table>";
	$result.="Total Paid = Rp".formatNumber($total);
	$result.="</div>";
	if (count($res_dependents)>0||($app['spouse_name']!=''&&$app['spouse_name']!=null)) {
		$result.="<div><u>Dependents:</u><br>";
		if ($app['spouse_name']!=''&&$app['spouse_name']!=null) {
			$result.="<div class='float50'>Spouse</div>: ".$app['spouse_name']."<br>";
		}
		
		foreach ($res_dependents as $rs) {
			$result.="<div class='float50'>".$rs['relation']."</div>: ".$rs['name']."<br>";
		}
		$result.="</div>";
		
	}
	$result.="</div>";
	$result.="<div style='float:left;width:30%'>
		<div class='float140 border_bottom_solid height90'>Prepared By,</div></div>
		<div style='float:left;width:30%'><div class='float140 border_bottom_solid height90'>Acknowledged by,</div></div>
		<div style='float:left;width:30%'><div class='float140 border_bottom_solid height90'>Approved by,</div></div>";
	echo $result;
?>