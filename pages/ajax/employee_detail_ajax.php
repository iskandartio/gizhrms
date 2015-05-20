<?php
shared::prepOM(isset($om) ? 1 : 0);
if ($type=='load_personal_data')  {
	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
	$combo_gender=shared::select_combo_complete(db::select('gender','*'),'gender','-Gender-','gender',$applicant['gender']);
	$combo_title=shared::select_combo_complete(db::select('title','*'),'title','-Title-','title',$applicant['title']);
	$combo_marital_status=shared::select_combo_complete(db::select('marital_status','*'),'marital_status','-Status-','marital_status',$applicant['marital_status']);
	$res_nationality=db::select('nationality','*','','nationality_val');
	array_push($res_nationality, array("nationality_id"=>"-1", "nationality_val"=>"Others"));
	$combo_nationality=shared::select_combo_complete($res_nationality,'nationality_id','-Nationality-','nationality_val',$applicant['nationality_id']);
	$combo_country=shared::select_combo(db::select('country','*'),'country_id','country_val')."<option value='-1'>Other *</option>";
	$combo_country=shared::set_selected($applicant['country_id'], $combo_country);
	
	$combo_province=shared::select_combo_complete(db::select('province','*'),'province_id','-Province-','province_val',$applicant['province_id']);
	$res=db::select('city','*','','city_val');
	$city_option=array();
	foreach ($res as $rs) {
		if (!isset($city_option[$rs['province_id']])) $city_option[$rs['province_id']]=array();
		array_push($city_option[$rs['province_id']], array("city_id"=>$rs['city_id'], "city_val"=>$rs['city_val']));
		
	}
	if (isset($city_option[$applicant['province_id']])) {
		$res=$city_option[$applicant['province_id']];
	} else {
		$res=null;
	}
	$combo_city=shared::select_combo_complete($res,'city_id','-City-','city_val',$applicant['city_id']);
	
	$result="";
	$result.="<form id='data' action='upload_ajax' method='post' enctype='multipart/form-data' target='hidden_upload'>
	<div class='row'><div class='label'>Photo</div><div class='label width200'><input type='file' id='uploadPhoto' name='uploadPhoto' accept='.png,.jpg'></div>
	<button class='button_link' id='btn_upload'>Upload</button>
	<IFRAME id='hidden_upload' name='hidden_upload' src='' onLoad='uploadDone()'
		style='width:0;height:0;border:0px solid #fff'></IFRAME>
	</div> 
	</form>";
		$result.="<table>
	<tr><td>Title *</td><td>:</td><td>".$combo_title."</td></tr>
	<tr><td>First Name *</td><td>:</td><td>"._t2("first_name",$applicant)."</td></tr>
	<tr><td>Last Name *</td><td>:</td><td>"._t2("last_name", $applicant)."</td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td>"._t2("place_of_birth", $applicant)."</td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td>"._t2("date_of_birth", $applicant)."</td></tr>
	<tr><td>Gender *</td><td>:</td><td>".$combo_gender."</td></tr>
	<tr><td>Marital Status</td><td>:</td><td>".$combo_marital_status."</td></tr>
	<tr><td>Nationality *</td><td>:</td><td>".$combo_nationality." "._t2("nationality_val", $applicant)."</td></tr>
	<tr><td valign='top'>Address *</td><td>:</td><td><textarea class='address' cols='30' rows='3'>".$applicant['address']."</textarea><br/>
	<select id='country_id' class='country_id'><option value='' disabled selected>-Country-</option>".$combo_country."</select> "._t2("country_name", $applicant)."<br/>
	".$combo_province." ".$combo_city."
	<tr><td>Post Code *</td><td>:</td><td>"._t2("post_code", $applicant)."</td></tr>
	<tr><td>Phone1 *</td><td>:</td><td>"._t2("phone1", $applicant)."</td></tr>
	<tr><td>Phone2</td><td>:</td><td>"._t2("phone2", $applicant)."</td></tr>
	<tr><td>Email</td><td>:</td><td>"._t2("user_name",$applicant,"","text","","Email")."</td></tr>
	<tr><td>Private Email</td><td>:</td><td>"._t2("email",$applicant,"","text","","Email")."</td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea class='computer_skills' cols='30' rows='3'>".$applicant['computer_skills']."</textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea class='professional_skills' cols='30' rows='3'>".$applicant['professional_skills']."</textarea></td></tr>
	<tr><td>Account Bank</td><td>:</td><td>"._t2("account_bank", $applicant)."</td></tr>
	<tr><td>Account Number</td><td>:</td><td>"._t2("account_number", $applicant)."</td></tr>
	<tr><td>Emergency Phone</td><td>:</td><td>"._t2("emergency_phone", $applicant)."</td></tr>
	<tr><td>Emergency Email</td><td>:</td><td>"._t2("emergency_email", $applicant)."</td></tr>
	</table>
	<button class='button_link' id='btn_save'>Save</button>";
	$data['result']=$result;
	$data['city_option']=$city_option;
	die(json_encode($data));
}

if ($type=='save_personal_data') {
	
	$_POST['user_id']=$_SESSION['user_id'];
	
	$user_id=$_POST['user_id'];
	unset($_POST['user_name']);
	$rs=db::select_one('m_user','user_id, user_name','user_name=? and user_id!=?', '', array($user_name,$user_id));
	if ($rs['user_name']!=null) {
		$data['err']="Email already used by another user";
		die(json_encode($data));
	}
	$con=db::beginTrans();
	
	$activation_code="";
	if ($user_id==0) {
		$data['is_new']=1;
		$activation_code=shared::random(30);
		$password=shared::random(10);
		$user_id=db::ExecMe('insert into m_user(user_name, pwd, activation_code) values(?,sha2(?,512),?)', array($user_name, $password, $activation_code), $con);
		
		$contract_history_id=db::insert('contract_history','user_id, start_date, end_date', array($user_id, '1900-01-01', '3000-01-01'), $con);
		$_SESSION['contract_history_id']=$contract_history_id;
		$_POST['contract1_end_date']='3000-01-01';
		$_POST['user_id']=$user_id;
		$i=db::insertEasy('employee', $_POST,$con);
		$_SESSION['user_id']=$user_id;
		
	} else {
		$data['is_new']=0;
		
		$rs=db::select_one('m_user', 'user_name','user_id=?','', array($user_id), $con);
		if ($rs['user_name']!=$user_name) {
			$password=shared::random(10);
			$password_hash=hash('sha512', $password);
			$activation_code=shared::random(30);
			db::ExecMe('update m_user set user_name=?, pwd=?, activation_code=?, status_id=null 
				where user_id=?', array($user_name, $password_hash, $activation_code, $user_id), $con);
		}
		$i=db::updateShort('employee', 'user_id', $_POST,$con);
	}
	if ($activation_code!="") {
		$role_id=db::select_single('m_role','role_id v','role_name=?','',array('employee'), $con);
		db::delete('m_user_role','user_id=?', array($user_id), $con);
		db::insert('m_user_role','user_id, role_id', array($user_id, $role_id), $con);
		$param=array();
		$param['email']=$user_name;
		$param['link']=$_SESSION['home']."activate?link=".$activation_code;
		$param['password']=$password;
		shared::email("register", $param, $con);			
	}
	db::commitTrans($con);
	if ($activation_code!="") {
		$data['type']='register';
		$data['id']=$user_id;
		die(json_encode($data));
	}
	$data['type']='edit_employee';
	die(json_encode($data));
}

if ($type=='load_employee_project') {
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$project_view=Employee::getProjectView($applicant, $combo_project_name_def, isset($om) ? 'readonly':'');
	
	$result=$project_view;
	
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='load_project_history') {
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
	$salary_history=Employee::get_salary_history_res($applicant['contract_history_id']);
	shared::setId('employee_detail_contract_history_id', 'contract_history_id', $salary_history);
	$result="";
	$result.="<h1>Salary History</h1>
<table id='tbl_salary_history' class='tbl'>
<thead><tr><th>id</th><th>Date</th><th>Project</th><th>Leader</th><th>Position</th><th>Salary</th><th>HRSR</th></tr></thead><tbody>";
	$result.=Employee::get_salary_history_tbl($salary_history);
	$result.="</tbody></table>";
	$data['result']=$result;
	die(json_encode($data));
}

if ($type=='load_contract_data') {
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($_SESSION['user_id']));
	foreach ($applicant as $key=>$val) {
		$$key=$val;
	}
	$severanceData=shared::calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
		, $am1_start_date, $am1_end_date
		, $contract2_start_date, $contract2_end_date
		, $am2_start_date, $am2_end_date);
	$contract_data_view=Employee::getContractDataView($applicant, $severanceData);
	$result=$contract_data_view;
	$data['result']=$result;
	die(json_encode($data));
}

if ($type=='save_contract_detail') {
	
	if ($am1_start_date!="") {
		if ($am1_start_date<=$contract1_end_date) die("First Amendment not Valid");
		if ($am1_start_date>=$am1_end_date) die("First Amendment not Valid");
	}
	if ($contract2_start_date!="") {
		if ($contract2_start_date<=$am1_end_date) die("Contract Extension not Valid");
		if ($contract2_start_date>=$contract2_end_date) die("Contract Extension not Valid");
	}
	if ($am2_start_date!="") {
		if ($am2_start_date<=$contract2_end_date) die("Second Amendment not Valid");
		if ($am2_start_date>=$am2_end_date) die("Second Amendment not Valid");
	}
	
	
	$con=db::beginTrans();
	
	$_POST['user_id']=$_SESSION['user_id'];
	$user_id=$_POST['user_id'];
	
	$res_before = db::DoQuery("select coalesce(am2_start_date, contract2_start_date, am1_start_date, contract1_start_date) start_date, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date from employee where user_id=?", array($user_id), $con);
	
	db::updateShort('employee', 'user_id', $_POST, $con);
	$res = db::DoQuery("select coalesce(am2_start_date, contract2_start_date, am1_start_date, contract1_start_date) start_date, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date from employee where user_id=?", array($user_id), $con);
	$end_date=$res[0]['end_date'];
	$start_date=$res[0]['start_date'];
	$res=db::DoQuery("select max(end_date) end_date from contract_history where user_id=?", array($user_id), $con);
	if ($res[0]['end_date']>$end_date) {
		db::ExecMe("update contract_history set end_date=? where user_id=? and end_date=?", array($end_date, $user_id, $res[0]['end_date']), $con);
	} else if ($res[0]['end_date']<$end_date) {
		db::ExecMe("insert into contract_history(".$_SESSION['contract_history_fields'].") 
		 select ?,?,?".str_replace("user_id, start_date, end_date", "",$_SESSION['contract_history_fields'])." from contract_history where user_id=? and end_date=?", array($user_id, $start_date, $end_date, $user_id, $res[0]['end_date']), $con);
	}
	$data['first']=Employee::get_graph($contract1_start_date, $contract1_end_date, $am1_start_date, $am1_end_date, shared::addYear($contract1_start_date,2));
	$data['second']=Employee::get_graph($contract2_start_date, $contract2_end_date, $am2_start_date, $am2_end_date, shared::addYear($contract2_start_date,1));
	
	db::commitTrans($con);
	
	$applicant=Employee::get_active_employee_one("a.user_id=?", array($user_id));	
	$severanceData=shared::calculateSeverance($applicant['salary'], $applicant['contract1_start_date'], $applicant['contract1_end_date']
		, $applicant['am1_start_date'], $applicant['am1_end_date'], $applicant['contract2_start_date'], $applicant['contract2_end_date']
		, $applicant['am2_start_date'], $applicant['am2_end_date']);
	$data['severance']=formatNumber($severanceData['severance']);
	$data['service']=formatNumber($severanceData['service']);
	$data['housing']=formatNumber($severanceData['housing']);
	die(json_encode($data));
}
if ($type=='load_dependents') {
	$user_id=$_SESSION['user_id'];
	$applicant=db::select_one('employee','spouse_name, marry_date, spouse_entitled','user_id=?','',array($user_id));
	$res=Employee::get_dependent_res($user_id);
	$result=Employee::get_dependent_table($res, $applicant['spouse_name'], $applicant['marry_date'], $applicant['spouse_entitled']);
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='getRelationChoice') {
	$res=db::select('relation','*','','sort_id');
	$choice=shared::select_combo_complete($res, 'relation','-Relation-');
	die($choice);
}
if ($type=='save_spouse') {
	db::update('employee','spouse_name, marry_date, spouse_entitled','user_id=?', array($spouse_name, $marry_date, $spouse_entitled, $_SESSION['user_id']));
}
if ($type=='save_dependent') {
	$user_id=$_SESSION['user_id'];
	$_POST['user_id']=$user_id;

	$dob=dbDate($dob);
	if ($employee_dependent_id=='') {
		$employee_dependent_id=db::insert('employee_dependent','user_id, relation, name, date_of_birth, entitled', array($user_id,$relation,$name,$dob, $entitled));
	} else {
		db::update('employee_dependent', 'relation, name, date_of_birth, entitled', 'employee_dependent_id=?', array($relation, $name, $dob, $entitled,$employee_dependent_id));
	}
	die ($employee_dependent_id);
}
if ($type=='delete_dependent') {
	db::delete('employee_dependent','employee_dependent_id=?',array($employee_dependent_id));
	die;
}

if ($type=='load_language') {
	$user_id=$_SESSION['user_id'];
	$language_choice=language::getChoice();
	$language_skill_choice=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id','-Skill-','language_skill_val');
	$language=db::select('employee_language a
		left join language b on a.language_id=b.language_id
		left join language_skill c on c.language_skill_id=a.language_skill_id'
		,'ifnull(a.language_val, b.language_val) language_val, a.language_id, a.language_skill_id, c.language_skill_val, a.employee_language_id'
		,'user_id=?','language_val', array($user_id));
	$result="";
	
	$result.="<button id='btn_add_language' class='button_link'>Add</button>
	<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>";
	foreach($language as $row) {
		$result.='<tr><td>'.$row['employee_language_id'].'</td>';
		$result.='<td><span style="display:none">'.$row['language_id'].'</span> '.$row['language_val'].'</td>';
		$result.='<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>';
		$result.="<td>".getImageTags(array('edit','delete'))."</td>";
		$result.="</tr>";
		
	}
	$result.="</tbody>	</table>";
	$data['result']=$result;
	$data['language_choice']=$language_choice;
	$data['language_skill_choice']=$language_skill_choice;
	die(json_encode($data));


}
if ($type=='load_working') {
	$user_id=$_SESSION['user_id'];	
	$res=Employee::get_working_res($user_id, 'employee');
	$result=Employee::get_working_table($res, 'employee');
	$data['result']=$result;
	die(json_encode($data));
}
if ($type=='load_education') {
	$combo_education_def=shared::select_combo_complete(db::select('education','education_id, education_val','','sort_id'),'education_id', '-Education', 'education_val');
	$combo_countries_def=shared::select_combo_complete(db::select('countries','*','','countries_val'), 'countries_id','-Country-','countries_val','','150px');
	$res=db::select('employee_education','*','user_id=?', 'year_from, year_to', array($_SESSION['user_id']));
	$result="";
	$result.="<button class='button_link btn_add'>Add New</button>";
	$result.="<table class='tbl' id='tbl_education'>
	<thead><tr><th>ID</th><th>Education Level *</th><th>Major</th><th>Name of Education Institution *</th><th>From Year *</th><th>To Year *</th><th>Country *</th><th></th></tr></thead><tbody>";
	foreach ($res as $rs) {
		$result.="<tr><td>".$rs['employee_education_id']."</td>
			<td><span class='hidden'>".$rs['education_id']."</span>".shared::get_table_data('education', $rs['education_id'])."</td><td>".$rs['major']."</td><td>".$rs['place']."</td>
			<td>".$rs['year_from']."</td><td>".$rs['year_to']."</td>
			<td><span class='hidden'>".$rs['countries_id']."</span>".shared::get_table_data('countries', $rs['countries_id'])."</td><td>".getImageTags(['edit','delete'])."</td></tr>";
	}
	$result.="</tbody></table>";
	$adder="<tr><td></td><td>$combo_education_def</td><td>"._t2('major')."</td><td>"._t2('place')."</td>
			<td>"._t2('year_from','',3)."</td><td>"._t2('year_to','',3)."</td><td>".$combo_countries_def."</td><td>".getImageTags(['save','delete'])."</tr>";
	
	$data['result']=$result;
	$data['education_choice']=$combo_education_def;
	$data['countries_choice']=$combo_countries_def;
	$data['adder']=$adder;

	die(json_encode($data));
}
if ($type=='save_education') {
	$_POST['user_id']=$_SESSION['user_id'];
	if ($employee_education_id=='') {
		$employee_education_id=db::insertEasy('employee_education', $_POST);
	} else {
		db::updateEasy('employee_education', $_POST);
	}
	die($employee_education_id);
}
if ($type=='delete_education') {
	db::delete('employee_education', 'employee_education_id=?', array($employee_education_id));
	die;
}
if ($type=='load_pictures') {
	$result="";
	$result.="<form id='data' action='upload_ajax' method='post' enctype='multipart/form-data' target='hidden_upload'>
<div class='row'><div class='label'>Other Pics</div><div class='label width200'><input type='file' id='uploadOthers' name='uploadOthers[]' accept='.png,.jpg' multiple></div>
<button class='button_link' id='btn_upload'>Upload</button>
<IFRAME id='hidden_upload' name='hidden_upload' src='' onLoad='uploadOthersDone()'
	style='width:0;height:0;border:0px solid #fff'></IFRAME>
</div> 
</form>";
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
if ($type=='save_current_contract') {
	$user_id = $_SESSION['user_id'];
	$_POST['contract_history_id'] = $_SESSION['contract_history_id'];
	$contract_history_id=$_POST['contract_history_id'];
	$con=db::beginTrans();
	if (!isset($start_date)) {
		unset($_POST['start_date']);
		unset($_POST['end_date']);
	}
	
	$flag_salary_sharing=0;
	if (isset($_POST['salary_sharing_project_name'])) $flag_salary_sharing=1;
	if ($flag_salary_sharing==1) {
		$salary_sharing_project_name=$_POST['salary_sharing_project_name'];
		$salary_sharing_project_number=$_POST['salary_sharing_project_number'];
		$salary_sharing_percentage=$_POST['salary_sharing_percentage'];
		unset($_POST['salary_sharing_project_name']);
		unset($_POST['salary_sharing_project_number']);
		unset($_POST['salary_sharing_percentage']);
	}
	if ($_POST['reason']=='') $_POST['reason']="Initial Salary";
	$_POST['salary']=shared::encrypt($_POST['salary']);
	db::updateEasy('contract_history',$_POST, $con);
	if (isset($start_date)) {
		db::update('employee','contract1_start_date, contract1_end_date','user_id=? and contract1_start_date is null', array($start_date, $end_date, $user_id), $con);
	}
	if ($flag_salary_sharing==1){
		db::delete('salary_sharing','contract_history_id=?', array($contract_history_id), $con);
		foreach ($salary_sharing_project_name as $key=>$val) {
			db::insert('salary_sharing','contract_history_id, project_name, project_number, percentage'
			, array($contract_history_id, $val, $salary_sharing_project_number[$key], $salary_sharing_percentage[$key]),$con);
		}
	}
	db::commitTrans($con);
	die;
}
//Language
if ($type=='add_language') {
	$combo_language_def=shared::select_combo_complete(language::getAll(), 'language_id','-Language-','language_val');
	$combo_language_def=str_replace("</select>","<option value='-1'>Others</option></select>", $combo_language_def);
	$combo_language_skill=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id', "- Skill Level -",'language_skill_val');
	$str="<tr><td></td><td>".$combo_language_def." "._t2('language_val')."</td><td>".$combo_language_skill."</td><td>".getImageTags(array('save','cancel'))."</td></tr>";
	die($str);
}
if ($type=='save_language') {
	$_POST['user_id']=$_SESSION['user_id'];
	if ($employee_language_id=='') {
		$employee_language_id=db::insertEasy('employee_language',$_POST);
	} else {
		db::updateEasy('employee_language',$_POST);
	}
	die($employee_language_id);
}
if ($type=='delete_language') {
	$i=db::delete('employee_language','employee_language_id=?', array($employee_language_id));
	die($i);
}

if ($type=='set_contract_history_id') {
	$id=shared::getId('employee_detail_contract_history_id', $id);
	$_SESSION['contract_history_id']=$id;
	die;
}

//working_ajax_link
if ($type=='delete_working'||$type=='save_working') {
	require("pages/ajax/working_ajax.php");
}

//project_ajax link
if ($type=='getProjectClass'||$type=='getProjectLocationClass') {
	require("pages/ajax/project_ajax.php");
}

?>