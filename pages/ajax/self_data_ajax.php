<?php
if ($type=='load_personal_data')  {
	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
	$result="";
	$result.="<table>
	<tr><td>Title *</td><td>:</td><td>"._lbl("title", $applicant)."</td></tr>
	<tr><td>First Name *</td><td>:</td><td>"._lbl("first_name",$applicant)."</td></tr>
	<tr><td>Last Name *</td><td>:</td><td>"._lbl("last_name", $applicant)."</td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td>"._lbl("place_of_birth", $applicant)."</td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td>".formatDate(_lbl("date_of_birth", $applicant))."</td></tr>
	<tr><td>Gender</td><td>:</td><td>"._lbl("gender", $applicant)."</td></tr>
	<tr><td>Marital Status</td><td>:</td><td>"._lbl("marital_status", $applicant)."</td></tr>
	<tr><td>Nationality *</td><td>:</td><td>".shared::get_table_data('nationality_id', $applicant);
	if (_lbl('nationality_id', $applicant)==-1) $result.=" "._lbl("nationality_val", $applicant);
	$result.="</td></tr>
	<tr><td valign='top'>Address *</td><td>:</td><td>"._lbl('address', $applicant)."<br/>
	".shared::get_table_data("country_id", $applicant);
	if (_lbl('country_id', $applicant)==-1) $result.=" "._lbl("country_name", $applicant)."<br/>";
	$result.=" ".shared::get_table_data("province_id", $applicant)." ".shared::get_table_data("city_id", $applicant)."
	<tr><td>Post Code *</td><td>:</td><td>"._lbl("post_code", $applicant)."</td></tr>
	<tr><td>Phone1 *</td><td>:</td><td>"._lbl("phone1", $applicant)."</td></tr>
	<tr><td>Phone2</td><td>:</td><td>"._lbl("phone2", $applicant)."</td></tr>
	<tr><td>Email *</td><td>:</td><td>"._lbl("user_name",$applicant,"","text","","Email")."</td></tr>
	<tr><td>Computer Skills</td><td>:</td><td>"._lbl("computer_skills", $applicant)."</td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td>"._lbl("professional_skills", $applicant)."</td></tr>
	<tr><td>Account Bank</td><td>:</td><td>"._lbl("account_bank", $applicant)."</td></tr>
	<tr><td>Account Number</td><td>:</td><td>"._lbl("account_number", $applicant)."</td></tr>
	<tr><td>Emergency Phone</td><td>:</td><td>"._lbl("emergency_phone", $applicant)."</td></tr>
	<tr><td>Emergency Email</td><td>:</td><td>"._lbl("emergency_email", $applicant)."</td></tr>
	</table>";
	$data['result']=$result;
	
	die(json_encode($data));
}


if ($type=='load_employee_project') {
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
	
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$project_view=Employee::getProjectView($applicant, $combo_project_name_def, 'readonly');
	$result=$project_view;
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='load_dependents') {
	$user_id=$_SESSION['user_id'];
	$applicant=db::select_one('employee','*','user_id=?','',array($user_id));
	$result="<table><tr><td>Spouse</td><td>:</td><td>"._lbl('spouse_name', $applicant)."</td></tr>";
	$result.="<tr><td>Date of Marriage</td><td>:</td><td>".formatDate(_lbl('marry_date',$applicant))."</td></tr>";
	$result.="<tr><td>Entitled</td><td>:</td><td>".($applicant['spouse_entitled']==0 ? 'No' : 'Yes')."</td></tr>";
	$result.="</table>";
	$result.="<h2>Dependents</h2>";
	$res=db::select('employee_dependent','*','user_id=?','date_of_birth', array($user_id));
	$result.="<table class='tbl' id='tbl_result'><thead><tr><th>Relation</th><th>Name</th><th>DOB</th><th>Entitled</th></tr></thead><tbody>";
	foreach ($res as $rs) {
		$result.="<tr><td>".$rs['relation']."</td><td>".$rs['name']."</td><td>".formatDate($rs['date_of_birth'])."</td><td>".($rs['entitled']==0 ? 'No' : 'Yes')."</td></tr>";
	}
	$result.="</tbody></table>";
	$data['result']=$result;
	die(json_encode($data));
}

if ($type=='load_language') {
	$user_id=$_SESSION['user_id'];
	$language=db::select('employee_language a
		left join language b on a.language_id=b.language_id
		left join language_skill c on c.language_skill_id=a.language_skill_id'
		,'ifnull(a.language_val, b.language_val) language_val, a.language_id, a.language_skill_id, c.language_skill_val, a.employee_language_id'
		,'user_id=?','language_val', array($user_id));
	$result="";
	
	$result.="<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>Language</th><th>Skill Level</th></tr>
	</thead>
	<tbody>";
	foreach($language as $row) {
		$result.='<td><span style="display:none">'.$row['language_id'].'</span> '.$row['language_val'].'</td>';
		$result.='<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>';
		$result.="</tr>";
		
	}
	$result.="</tbody>	</table>";
	$data['result']=$result;
	die(json_encode($data));


}
if ($type=='load_working') {
	$user_id=$_SESSION['user_id'];	
	$res=db::select('employee_working a
		left join business b on a.business_id=b.business_id
		left join countries c on c.countries_id=a.countries_id
		','a.*, b.business_val, c.countries_val','user_id=?','year_from, month_from', array($user_id));
	$result="";
	$result.="<table class='tbl' id='tbl_working'>
	<thead><tr><th colspan='2'>From</th><th colspan='2'>To</th><th>Employer</th><th>Country</th><th>Job Title</th><th>Nature of Business</th><th>Contact</th><th>Leave Reason</th></tr></thead>
	<tbody>";
		
	foreach($res as $row) {
		
		$result.='<tr>';
		$result.='<td style="border-right:0 !important">'.get_month_name($row['month_from']).'</td>';
		$result.='<td style="border-left:0 !important">'.$row['year_from'].'</td>';
		$result.='<td style="border-right:0 !important">'.get_month_name($row['month_to']).'</td>';
		$result.='<td style="border-left:0 !important">'.$row['year_to'].'</td>';
			
		$result.='<td>'.$row['employer'].'</td>';
		$result.='<td>'.$row['countries_val']."</td>";
		$result.='<td>'.$row['job_title'].'</td>';
		$result.='<td>'.$row['business_val']."</td>";
		$result.='<td>'.($row['may_contact']==0 ? 'None' : '<span id="_email">'.$row['email'].'</span> <span id="_phone">'.$row['phone']).'</span></td>';
		$result.='<td>'.$row['leave_reason'].'</td>';
		$result.="</tr>";
			
	}
	$result.="</tbody></table>";
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='load_education') {
	$res=db::select('employee_education','*','user_id=?', 'year_from, year_to', array($_SESSION['user_id']));
	$result="";
	$result.="<table class='tbl' id='tbl_education'>
	<thead><tr><th>Education Level *</th><th>Major</th><th>Name of Education Institution *</th><th>From Year *</th><th>To Year *</th><th>Country *</th></tr></thead><tbody>";
	foreach ($res as $rs) {
		$result.="<tr>
			<td>".shared::get_table_data('education', $rs['education_id'])."</td><td>".$rs['major']."</td><td>".$rs['place']."</td>
			<td>".$rs['year_from']."</td><td>".$rs['year_to']."</td>
			<td>".shared::get_table_data('countries', $rs['countries_id'])."</td></tr>";
	}
	$result.="</tbody></table>";
	$data['result']=$result;
	
	die(json_encode($data));
}

if ($type=='load_pictures') {
	$result="";
	$file_pattern="pages/uploads/".$_SESSION['user_id']."-others-";
	$result.="<div class='div_pic_collection'>";
	foreach (glob("$file_pattern*.*") as $filename) {
		$short=str_replace($file_pattern,'',$filename);
		$link="show_picture_ajax?a=".$short;
		$result.="<span><a href='$link' target='_blank'><img align='top' style='margin:5px;padding:5px;width:200px;border:1px solid black' src='$link'/></a>
		<img style='margin-left:-12px;height:30px;white-space:nowrap' src='images/delete.png' class='btn_delete'><span class='key hidden'>$short</span></span>";	
	}
	$result.=" </div>";
	$data['result']=$result;
	
	die(json_encode($data));
}
if ($type=='delete_file') {
	$file_name="pages/uploads/".$_SESSION['user_id']."-others-".$a;
	unlink($file_name);
	die;
}
if ($type=='load_historical_contract') {
	if ($_SESSION['role_name']!='admin') die;
	$res=db::select("employee_history","*","user_id=?","contract1_start_date", array($_SESSION['user_id']));
	$res_current=db::select('employee','*','user_id=?','', array($_SESSION['user_id']));
	$res_all=array_merge($res, $res_current);
	$result="";
	if (count($res)>0) {
		$join_date=$res[0]['contract1_start_date'];
	} else {
		$join_date=$res_current[0]['contract1_start_date'];
	}
	$cycle_num=1;
	$result.="Join Date : ".formatDate($join_date);
	$result.="<table class='tbl'><thead><tr><th></th><th>From</th><th>To</th></tr></thead><tbody>";
	foreach ($res_all as $rs) {
		if ($cycle_num%2==0) $bgcolor='white'; else $bgcolor='white';
		$result.="<tr style='background-color:aliceblue'><td colspan='3'>Contract Cycle ".$cycle_num."</td></tr>";
		$result.="<tr style='background-color:$bgcolor'><td>Initial Contract</td><td>".formatDate($rs['contract1_start_date'])."</td><td>".formatDate($rs['contract1_end_date'])."</td></tr>";
		$result.="<tr style='background-color:$bgcolor'><td>Prolongation / Extension</td><td>".formatDate($rs['am1_start_date'])."</td><td>".formatDate($rs['am1_end_date'])."</td></tr>";
		$result.="<tr style='background-color:$bgcolor'><td>2nd Contract</td><td>".formatDate($rs['contract2_start_date'])."</td><td>".formatDate($rs['contract2_end_date'])."</td></tr>";
		$result.="<tr style='background-color:$bgcolor'><td>Amendment of 2nd Contract</td><td>".formatDate($rs['am2_start_date'])."</td><td>".formatDate($rs['am2_end_date'])."</td></tr>";
		$cycle_num++;
	}
	$result.="</tbody></table>";
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='load_medical') {
	$year='this_year';
	$y=date('Y');
	$medical_type='employee_outpatient';
	$employee_id=$_SESSION['user_id'];
	$res_dependents=EmployeeDependents::getLegitimateDependents($y, $employee_id);
	$res_employee=Employee::get_active_employee_simple_one('a.user_id=? and a.contract1_start_date<=?', array($employee_id, date('Y-12-31')));
	
	if (count($res_employee)==0) {
		$data['result']='No Employee';
		$data['adder']='';
		
		die(json_encode($data));
	}
	$result="";
	$result.="<h1>Outpatient</h1>";
	$result.=Medical::selfDataMedical($employee_id, $medical_type, $res_dependents, $res_employee, $year);
	$medical_type='employee_pregnancy';
	$result.="<h1>Pregnancy</h1>";
	$result.=Medical::selfDataMedical($employee_id, $medical_type, $res_dependents, $res_employee, $year);
	
	$res=db::select('employee_eyeglasses','*','user_id=?','invoice_date desc', array($employee_id));
	$result.="<h1>Eye Glasses</h1>";
	$result.="<table class='tbl' id='tbl_eyeglasses'><thead><tr><th>Claim Type</th><th>Invoice<br>Date</th><th>Invoice<br>(Rp)</th><th>Paid<br>(Rp)</th><th>Remarks</th></tr></thead><tbody>";
	shared::setId('pay_medical_employee_eyeglasses_id', 'employee_eyeglasses_id', $res);
	foreach ($res as $rs) {
		$result.="<tr><td>".$rs['claim_type']."</td>
			<td>".formatDate($rs['invoice_date'])."</td><td align='right'>".formatNumber($rs['invoice_val'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
			<td>".$rs['remarks']."</td></tr>";
	}
	$result.="</tbody></table>";
		
	$res=db::select('employee_medical_checkup','*','user_id=?','invoice_date desc', array($employee_id));
	$result.="<h1>Medical Checkup</h1>";
	$result.="<table class='tbl' id='tbl_medical_checkup'><thead><tr><th>Invoice<br>Date</th><th>Invoice<br>(Rp)</th><th>Paid<br>(Rp)</th><th>Remarks</th></tr></thead><tbody>";
	shared::setId('pay_medical_employee_medical_checkup_id', 'employee_medical_checkup_id', $res);
	foreach ($res as $rs) {
		$result.="<tr><td>".formatDate($rs['invoice_date'])."</td><td align='right'>".formatNumber($rs['invoice_val'])."</td><td align='right'>".formatNumber($rs['paid'])."</td>
			<td>".$rs['remarks']."</td></tr>";
	}
	$result.="</tbody></table>";
	
	$data['result']=$result;
	die(json_encode($data));
}
?>