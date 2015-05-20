<?php
function checkSalaryBand($salary_band, $check) {
	if ($salary_band==$check) return "checked='checked'";
}
	$currentDate= date('d-M-y');

	
	$res=db::select_one('contract_history a left join employee b on a.user_id=b.user_id
		left join project_name d on d.project_name=a.project_name
		left join project_number e on e.project_number=a.project_number
		left join project_location f on f.project_location=a.project_location
		','a.*, d.principal_advisor, d.financial_controller, e.team_leader, f.office_manager
		, b.address, b.contract1_start_date, b.contract1_end_date, b.am1_start_date, b.am1_end_date
		, b.contract2_start_date, b.contract2_end_date, b.am2_start_date, b.am2_end_date'
		,'contract_history_id=?','', array($_SESSION['contract_history_id']));
	$resBefore=db::select_one("contract_history a
inner join (select max(end_date) end_date from contract_history where user_id=? and contract_history_id!=?) b
on a.user_id=? and a.end_date=b.end_date
left join employee c on c.user_id=a.user_id
", "a.*", "", "", array($res['user_id'], $res['contract_history_id'], $res['user_id']));
	$salary_sharing=db::select('salary_sharing','*','contract_history_id=?','', array($res['contract_history_id']));
	$further_info="";
	
	if ($res['working_time']<100&&$res['working_time']!=null) {
		$further_info="Working Time : ".$res['working_time']." %";
	}
	$salary_sharing_str="";
	foreach ($salary_sharing as $rs) {
		if ($rs['percentage']==100) break;
		if ($salary_sharing_str!='') $salary_sharing_str.=", ";
		$salary_sharing_str.=$rs['project_name']." ".$rs['project_number'].' '.$rs['percentage']."%";
	}
	if ($salary_sharing_str!="") $salary_sharing_str="Salary sharing : ".$salary_sharing_str;
	if ($further_info!="") $further_info.=", ";
	$further_info.=$salary_sharing_str;
	if ($res==null) die;

$stylesheet="
body {
	font-family:calibri;
	font-size:12px;
}

.tbl {
	border-collapse:collapse;
}
.right-border {
	border-right:1px solid black;
}
.left-border {
	border-left:1px solid black;
}
.bottom-border {
	border-bottom:1px solid black;
}
.center {
	text-align:center;
}
.top-border {
	border-top:1px solid black;
}
.padding6 {
	padding:6px;
	
}
@page {
    margin-top: 1cm;
    margin-bottom: 1cm;
    margin-left: 1cm;
    margin-right: 1cm;
}
.title {
	border-left:1px solid black;
	padding:6px;
	height:30px;
}
.title-right {
	border-top:1px solid black;
	border-right:1px solid black;
	padding:6px;
	height:30px;
}
.remarks {
	border-top:1px solid black;
	font-size:8px;
	font-weight:bold;
	text-align:right;
	vertical-align:top;
	font-style:italic;
	border-right:1px solid black;
}
.tall {
	height:60px!important;
	vertical-align:top;
}
.taller {
	height:100px!important;
	vertical-align:top;
}
.top-right {
	border-top:1px solid black;
	border-right:1px solid black;
}
";

if ($res['am1_end_date']==null) {
	$terminate_date="";
} else if ($res['contract2_end_date']==null) {
	$terminate_date=$res['contract1_end_date'];
} else if ($res['am2_end_date']==null) {
	$terminate_date=$res['am1_end_date'];
} else {
	$terminate_date=$res['contract2_end_date'];
}

$html="Human Resource Service Request ".$res['vacancy_type']."
<table width='100%' class='tbl'><tr><td class='top-border left-border' width='80px'><img src='images/giz_simple.jpg' width='70px'></td><td class='top-right' width='160px' valign='middle'><b>GERMAN INTERNATIONAL<br>COOPERATION</b>
</td><td class='top-right center' height='100px' colspan='2'><b>Service Request</b><br>Human Resources<br>".$res['vacancy_type']."</td></tr>
<tr><td colspan='2' class='title top-border'>Project/Program Name</td>
<td colspan='2' class='title top-right'>".$res['project_name']."</td></tr>
<tr><td colspan='2' class='title'>Project Number</td>
<td colspan='2' class='title top-right'>".$res['project_number']."</td></tr>
<tr><td colspan='2' class='title'>Project Location</td>
<td colspan='2' class='title top-right'>".$res['project_location']."</td></tr>
<tr><td colspan='2' class='title'>Principal Advisor / Team Leader</td>
<td colspan='2' class='title top-right'>"._name($res['principal_advisor'])." / "._name($res['team_leader'])."</td></tr>
<tr><td colspan='2' class='title top-border'>Name of Employee</td>
<td colspan='2' class='title top-right'>"._name($res['user_id'])."</td></tr>
<tr><td colspan='2' class='title'>Current Title</td>
<td class='title top-border'>".$res['job_title']."</td><td class='remarks'>for prolongation/ amendment request only</td></tr>
<tr><td colspan='2' class='title'>Responsible Superior</td>
<td class='title top-border'>"._name($res['responsible_superior'])." / ".$res['SAP_No']."</td><td class='remarks'>Name or SAP no. of direct superior</td></tr>
<tr><td colspan='2' class='title tall'>Address</td>
<td colspan='2' class='title top-right tall'>".$res['address']."</td></tr>
<tr><td colspan='2' class='title'>Personnel Number</td>
<td class='title top-border'></td><td class='remarks'>for new employee, will be filled by HR Section</td></tr>
<tr><td colspan='4' class='title top-right'>Service Request is for:</td></tr>
<tr><td colspan='2' class='title top-right' valign='top'>
	<input type='checkbox' ".($res['contract1_end_date']==$res['end_date'] ? "checked='checked'" : "")."/>New Contract
	<br><input type='checkbox' ".($res['am1_end_date']==$res['end_date'] ||$res['am2_end_date']==$res['end_date'] ? "checked='checked'" : "")."/>Contract Amendment
	<br><input type='checkbox' ".($res['contract2_end_date']==$res['end_date'] ? "checked='checked'" : "")."/>Contract Extension/Prolongation
	<br><br><table cellpadding='0' cellspacing='0'><tr><td>Start of Contract</td><td>:</td><td>".formatDateName($res['start_date'])."</td></tr>
	<tr><td>End of Contract</td><td>:</td><td>".formatDateName($res['end_date'])."</td></tr></table>
</td><td colspan='2' class='top-right'>
	<table width='97%' cellpadding='3' cellspacing='0'><tr><td width='140px'>
	<input type='checkbox' ".($res['job_position']!=_lbl('job_position',$resBefore) ? "checked='checked'" : "")."/>(Change) Position*</td>
	<td width='10px'> : </td>
	<td class='bottom-border'>".$res['job_position']."</td>
	</tr>
	<tr><td>
	<input type='checkbox' ".($res['salary_band']!=_lbl('salary_band',$resBefore) ? "checked='checked'" : "")."/>(Change) Salary Band*</td><td> : </td>
	<td class='bottom-border'>".$res['salary_band']."</td>
	</tr><tr><td>
	<input type='checkbox' ".($terminate_date!='' ? "checked='checked'" : "")."/>Terminate Contract on</td><td> : </td>
	<td class='bottom-border'>".formatDateName($terminate_date)."</td>
	</tr><tr><td>
	<input type='checkbox' ".($res['salary']!=_lbl('salary',$resBefore) ? "checked='checked'" : "")."/>Salary (or adjustment)</td><td> : </td>
	<td><u>IDR ".formatNumber(shared::decrypt($res['salary']))."</u> Effective on: <u>".formatDateName($res['start_date'])."</u></td>
	</tr><tr><td colspan='3'>
	<input type='checkbox' ".($res['allowance']>0 ? "checked='checked'" : "")."/>Additional Allowance as _____% or IDR ".formatNumber($res['allowance'])."
	/<strike>month</strike>/lumpsum
	<br>effective on : __________________ till __________________ (**)
	<br>*attach updated TOR ; **attach the background</td>
	</tr></table></td></tr>";
	if ($res['contract1_start_date']==$res['start_date']) {
		$html.="
		<tr>
		<td colspan='2' class='title top-border'><input type='checkbox' checked='checked'/>Job description attached</td>
		<td colspan='2' class='title-right'><input type='checkbox' checked='checked'/>CV attached</td></tr>";
	}
	$html.="<tr><td colspan='2' class='title top-border'>
	Proposed Salary Band:<br>
	<table cellpadding='2' cellspacing='0'>
		<tr>
		<td>1</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'1')."/></td><td></td><td></td></tr>
		<tr><td>2A</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'2A')."/></td>
		<td> 2T</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'2T')."/></td></tr>
		<tr><td>3A</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'3A')."/></td>
		<td> 3T</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'3T')."/></td></tr>
		<tr><td>4A</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'4A')."/></td>
		<td> 4T</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'4T')."/></td></tr>
		<tr><td>5A</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'5A')."/></td>
		<td> 5T</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'5T')."/></td></tr>
		<tr><td>6A</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'6A')."/></td>
		<td> 6T</td><td><input type='checkbox' ".checkSalaryBand($res['salary_band'],'6T')."/></td></tr>
	</table>
	</td><td colspan='2' class='title-right' valign='top'>
	For Band 2 and above will automatically get a GIZ Email account. If this is not wanted, please check : <input type='checkbox'/>
	</td></tr>
	<tr><td colspan='4' class='title top-right taller'>
	<b>Family-related relationships to GIZ employee in ID / TL (name and position of relatives):</b><br><br>
	<b>Further information (if necessary):</b>".$further_info."</td></tr>
	<tr><td colspan='4' style='padding:0!important' class='left-border bottom-border'>
		<table style='border-collapse:collapse;width:100%;text-align:center'>
		<tr>
			<td width='20%' rowspan='2' class='top-right'>&nbsp;</td>
			<td width='20%' class='top-right'>Issued By</td>
			<td width='20%' class='top-right'>Received By</td>
			<td width='20%' class='top-right'>Approved By</td>
			<td width='20%' class='top-right no_right_border'>Finalized By</td></tr>
		<tr><td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td></tr>
		<tr><td class='top-right' height='60px'>Signature (if by email type name)</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td></tr>
		<tr><td class='top-right'>Date</td>
			<td class='top-right'>".$currentDate."</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td>
			<td class='top-right'>&nbsp;</td></tr>
		</table>
	</td></tr>
	</table>";
	

//echo "<style>".$stylesheet."</style>";
//echo $html;
//die;

include("pages/MPDF/mpdf.php");
$mpdf=new mPDF('c'); 
$mpdf->SetDisplayMode('fullpage');


$mpdf->WriteHTML($stylesheet,1);	// The parameter 1 tells that this is css/style only and no body/html/text

$mpdf->WriteHTML($html);

$mpdf->Output();

exit;
?>