<?php
	require_once("pages/startup.php");
	if ($_SESSION['role_name']!='admin') die;
	$currentDate= date('d-M-y');
function checkSalaryBand($salary_band, $check) {
	if ($salary_band==$check) return "checked";
}
	if (!isset($_SESSION['role_name'])) {
		die ("can't print!");
	}
	
	$res=job_applied::get_accepted($_GET['contract_history_id'], $_SESSION['role_name']);
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
/*	
	$result="<link rel='stylesheet' href='css/default.css'/>";
	$result.="<table><tr><td><img class='logoimg' src='images/logo.png' alt='PAKLIM' height='50px'></td><td><img class='logoimg' src='images/logo_web.jpg' height='50px'></td></tr></table><p>";
	$result.="<table class='tbl' style='margin:0 auto'><tr><th>Name</th><th>Job Title</th><th>Contract Duration</th><th>Salary(IDR)</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['name']."</td><td>".$row['job_title']."</td><td>".formatDateName($row['start_date'])." to ".formatDateName($row['end_date'])."</td>";
		$result.="<td>".formatNumber($row['salary'])."</td></tr>";
	}
	$result.="</table><p>";
	$admin_name="(".db::select_single('applicants', "concat(first_name,' ',last_name) v", 'user_id=?', '', array($_SESSION['uid'])).")";
	$nego_names=db::DoQuery("select concat(c.first_name,' ',c.last_name) name from vacancy_employee a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
left join applicants c on c.user_id=a.employee_id 
where b.vacancy_progress_val='Negotiation' and a.employee_id !=? and a.vacancy_id=?", array($_SESSION['uid'], $_GET['vacancy_id']));
	$nego_names_string="";
	foreach ($nego_names as $row) {
		$nego_names_string.=" (".$row['name'].") ";
	}
	$result.="<table width='80%' style='margin:0 auto'><tr><td style='text-align:center'>Processed by</td><td style='text-align:center'>Approved by</td></tr>";
	$result.="<tr><td height='200px' style='text-align:center'>$admin_name</td><td style='text-align:center'>$nego_names_string</td></tr></table>";

*/
?>
<style>
	.row {
		vertical-align:middle;
	}
	.tbl {
		border-collapse:collapse;
		width:100%;
		table-layout: fixed;
		font-family:calibri;
	}
	.row>td {
		border:1px;
		padding:8px;
		border-style:solid;
		vertical-align:middle;
		
	}
	.row>td>div {
		
		display:table-cell;
		vertical-align:middle;
		height:70px;
	}
	.row>td>div:first-child {
		float:left;
	}
	.float_left {
		float:left;
	}
	.float_right {
		float:right;
	}
	.center {
		text-align:center;
	}
	.no_left_border {
		border-left:0px!important;
	}
	.no_right_border {
		border-right:0px!important;
	}
	.no_bottom_border {
		border-bottom:0px!important;
	}
	.no_top_border {
		border-top:0px!important;
	}
	
	.small {
		font-size:smaller;
	}
	div.row:after {
		clear: both;
		content: '';
		display: block;
		height: 0;
	}
	.font13 {
		font-size:0.74em;
	}
	.font10 {
		font-size:10px;
	}
	.font14 {
		font-size:14px;
	}
	.min_height70  {
		height: 70px;
	}
	input[type=checkbox] {
		margin: 1px 1px 1px 1px;
		vertical-align:middle;
	}
	
	.margin_left50 {
		margin-left:4.2em;
		
	}
	.width80 {
		width:6.8em;
	}
	.width120 {
		width:11em;
	}
	.valign_top {
		vertical-align:top!important;
	}
	.thin_border {
		border-left:1px solid black;
		border-right:1px solid black;
		border-bottom:1px solid black;
		text-align:center;
	}
	
</style>
<script src="js/jquery.min.js"></script>
<script>
	$(function() {
		$('input[type=checkbox]').click(function(e) {
			e.preventDefault();
		});
	});
</script>
Human Resource Service Request � <?php _p($res['vacancy_type'])?>
<table width='800px' cellpadding="0" cellspacing="0"> 
<tr><td>
	<table cellpadding="0" cellspacing="0" class='tbl'>
	<tr class="row">
	<td width="200px">
	<div><img src="images/giz_simple.jpg" width="70px"></div>
	<div class="font10">
		<b>GERMAN INTERNATIONAL COOPERATION</b>
	</div>
	</td>
	<td class="center"><b>Service Request</b><br>Human Resources <?php _p($res['vacancy_type'])?></td>
	</tr>
	<tr class='row'><td class="no_bottom_border font13"><b>Project/Program Name</b></td><td class="font14"><?php _p($res['project_name'])?></td></tr>
	<tr class='row'><td class="no_top_border no_bottom_border font13"><b>Project Number</b></td><td class="font14"><?php _p($res['project_number'])?></td></tr>
	<tr class='row'><td class="no_top_border no_bottom_border font13"><b>Project Location</b></td><td class="font14"><?php _p($res['project_location'])?></td></tr>
	<tr class='row'><td class="no_top_border no_bottom_border font13"><b>Team Leader / Principle Advisor</b></td><td class="font14"><?php _p($res['team_leader']." / ".$res['principle_advisor'])?></td></tr>
	<tr class='row'><td class="no_bottom_border font13"><b>Name of Employee</b></td><td class="font14"><?php _p($res['name'])?></td></tr>
	<tr class='row'><td class="no_bottom_border no_top_border font13"><b>Current Title</b></td>
	<td class="font14"><?php _p($res['job_title'])?><span class='float_right font10'><b><i>for prolongation/ amendment request only</i></b></span></td></tr>
	<tr class='row'><td class="no_bottom_border no_top_border font13"><b>Responsible Superior</b></td>
	<td class="font14"><?php _p($res['responsible_superior'])?><span class='float_right font10'><b><i>Name or SAP no. of direct superior</i></b></span></td></tr>
	<tr class='row'><td class="no_bottom_border no_top_border font13"><b>Address</b></td><td class="font14 min_height70"><?php _p($res['address'])?></td></tr>
	<tr class='row'><td class="no_bottom_border no_top_border font13"><b>Personnel Number</b></td><td class="font14"><span class="float_right font10"><b><i>for new employee, will be filled by HR Section</i></b></span></td></tr>
	<tr class='row'><td colspan="2" class="font13"><b>Service Request is for:</b></td></tr>
	<tr class='row'>
	<td class="font13">
		<input type='checkbox' checked="checked"/>New Contract<br>
		<input type='checkbox'/>Contract Amendment<br>
		<input type='checkbox'/>Contract Extension/Prolongation<br>
		<div class='row'>
		<span class="float_left width80">Start of Contract</span>: <?php _p(formatDate($res['start_date']))?><br>
		</div>
		<span class="float_left width80">End of Contract</span>: <?php _p(formatDate($res['end_date']))?>
		
	</td>
	<td class="font13">
		<span class="float_left width120"><input type='checkbox' checked="checked"/>(Change) Position *</span><span class="float_left"> :  </span><span style='border-bottom:1px solid black;display:flex'> <?php _p($res['position'])?></span><p>
		<span class="float_left width120"><input type='checkbox' checked="checked"/>(Change) Salary Band * </span><span class="float_left"> :  </span><span style='border-bottom:1px solid black;display:flex'> <?php _p($res['salary_band'])?></span><p>
		<span class="float_left width120"><input type='checkbox'/>Terminate Contract on </span><span class="float_left"> :  </span><span style='border-bottom:1px solid black;display:flex'> &nbsp; </span><p>
		<input type='checkbox' checked="checked"/>Salary (or adjustment): IDR <?php _p(formatNumber($res['salary']))?> effective on: <?php _p(formatDate($res['start_date']))?><br>
		<input type='checkbox'/>Additional Allowance as ____ % or IDR <?php _p(formatNumber($res['allowance']))?> / <strike>month</strike> / lumpsum<br>
		effective on : __________________ till __________________ (**)<br>
		*attach updated TOR ; **attach the background
		
	</td></tr>
	<tr class="row font13"><td class="no_right_border"><input type="checkbox" checked />Job description attached</td>
	<td class="no_left_border"><input type="checkbox" checked />CV attached</td>
	</tr>
	<tr class="row font13"><td class="no_right_border">
		Proposed Salary Band:<br>
		<table class="font13" style='border-collapse:collapse'>
		<tr>
		<td>1</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'1'))?>/></td><td></td><td></td></tr>
		<tr><td>2A</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'2A'))?>/></td>
		<td> 2T</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'2T'))?>/></td></tr>
		<tr><td>3A</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'3A'))?>/></td>
		<td> 3T</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'3T'))?>/></td></tr>
		<tr><td>4A</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'4A'))?>/></td>
		<td> 4T</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'4T'))?>/></td></tr>
		<tr><td>5A</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'5A'))?>/></td>
		<td> 5T</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'5T'))?>/></td></tr>
		<tr><td>6A</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'6A'))?>/></td>
		<td> 6T</td><td><input type='checkbox' <?php _p(checkSalaryBand($res['salary_band'],'6T'))?>/></td></tr>
		</table>
	</td><td class="no_left_border valign_top">For Band 2 and above will automatically get a GIZ Email account. If this is not wanted, please check : <input type='checkbox'/>
	</td></tr>
	<tr class="row font13">
	<td colspan="2">
		<b>Family-related relationships to GIZ employee in ID / TL (name and position of relatives):</b><br><br>
		<b>Further information (if necessary):</b><div height='50px' style='vertical-align:top'><?php _p($further_info)?></div>
	</td></tr>
	<tr class="row font13">
		<td colspan="2" style='padding:0px'>
		<table style="border-collapse:collapse;padding:0px" class="font13">
			<tr>
				<td width="160px" rowspan="2" class="thin_border no_left_border">&nbsp;</td>
				<td width="160px" class="thin_border">Issued By</td>
				<td width="160px" class="thin_border">Received By</td>
				<td width="160px" class="thin_border">Approved By</td>
				<td width="160px" class="thin_border no_right_border">Finalized By</td></tr>
			<tr><td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td></tr>
			<tr><td class="thin_border no_left_border" height="60px">Signature (if by email type name)</td>
				<td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td>
				<td class="thin_border">&nbsp;</td></tr>
			<tr><td class="thin_border no_left_border no_bottom_border">Date</td>
				<td class="thin_border no_bottom_border"><?php _p($currentDate)?></td>
				<td class="thin_border no_bottom_border">&nbsp;</td>
				<td class="thin_border no_bottom_border">&nbsp;</td>
				<td class="thin_border no_bottom_border">&nbsp;</td></tr>
		</table>
		</td>
	</tr>
	</table>
</td></tr>
</table>

<?php 
die;
