<?php

	if ($type=='load')  {
		$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
		$combo_gender=shared::select_combo_complete(db::select('gender','*'),'gender','-Gender-','gender',$applicant['gender']);
		$combo_marital_status=shared::select_combo_complete(db::select('marital_status','*'),'marital_status','-Status-','marital_status',$applicant['marital_status']);
		$combo_nationality=shared::select_combo_complete(db::select('nationality','*'),'nationality_id','-Nationality-','nationality_val',$applicant['nationality_id']);
		$combo_country=shared::select_combo(db::select('country','*'),'country_id','country_val',$applicant['country_id']);
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
		$result.="<script src='js/personal_data.js'></script>";
		$result.="<form id='data' action='upload_ajax' method='post' enctype='multipart/form-data' target='hidden_upload'>
<div class='row'><div class='label'>Photo</div><div class='label width200'><input type='file' id='uploadPhoto' name='uploadPhoto' accept='.png,.jpg'></div>
<button class='button_link' id='btn_upload'>Upload</button>
<IFRAME id='hidden_upload' name='hidden_upload' src='' onLoad='uploadDone()'
        style='width:0;height:0;border:0px solid #fff'></IFRAME>
</div> 
</form>";
		$result.="<table>
	<tr style='display:none'><td>Applicants ID</td><td>:</td><td>"._t2("applicants_id",$applicant)."</td></tr>
	<tr><td>First Name *</td><td>:</td><td>"._t2("first_name",$applicant)."</td></tr>
	<tr><td>Last Name *</td><td>:</td><td>"._t2("last_name", $applicant)."</td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td>"._t2("place_of_birth", $applicant)."</td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td>"._t2("date_of_birth", $applicant)."</td></tr>
	<tr><td>Gender</td><td>:</td><td>".$combo_gender."</td></tr>
	<tr><td>Marital Status</td><td>:</td><td>".$combo_marital_status."</td></tr>
	<tr><td>Nationality *</td><td>:</td><td>".$combo_nationality."</td></tr>
	<tr><td valign='top'>Address *</td><td>:</td><td><textarea class='address' cols='30' rows='3'>".$applicant['address']."</textarea><br/>
	<select id='country_id' class='country_id'><option value='' disabled selected>-Country-</option>".$combo_country."<option value=-1>Other *</option></select> "._t2("country_name", $applicant)."<br/>
	".$combo_province.$combo_city."
	<tr><td>Post Code *</td><td>:</td><td>"._t2("post_code", $applicant)."</td></tr>
	<tr><td>Phone1 *</td><td>:</td><td>"._t2("phone1", $applicant)."</td></tr>
	<tr><td>Phone2</td><td>:</td><td>"._t2("phone2", $applicant)."</td></tr>
	<tr><td>Email *</td><td>:</td><td>"._t2("user_name",$applicant,"","text","","Email")."</td></tr>
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
	
	if ($type=='save') {
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
			$_POST['user_id']=$user_id;
			$_SESSION['user_id']=$user_id;
			$contract_history_id=db::insert('contract_history','user_id, start_date, end_date', array($user_id, '1900-01-01', '3000-01-01'), $con);
			$_SESSION['contract_history_id']=$contract_history_id;
			$_POST['contract1_end_date']='3000-01-01';
			$i=db::insertEasy('applicants', $_POST,$con);
		} else {
			$data['is_new']=0;
			$rs=db::select_one('m_user', 'user_name','user_id=?','', array($user_id), $con);
			if ($rs['user_name']!=$user_name) {
				$password=shared::random(10);
				$activation_code=shared::random(30);
				db::ExecMe('update m_user set user_name=?, pwd=sha2(?,512), activation_code=?, status_id=null 
					where user_id=?', array($user_name, $password, $activation_code, $user_id), $con);
			}
			$i=db::updateEasy('applicants', $_POST,$con);
			
			
		}
		if ($activation_code!="") {
			$role_id=db::select_single('m_role','role_id v','role_name=?','',array('employee'), $con);
			db::insert('m_user_role','user_id, role_id', array($user_id, $role_id), $con);
			$param=array();
			$param['email']=$user_name;
			$param['link']=$activation_code;
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
		unset($_SESSION['employee']);
		die(json_encode($data));
		
	}
?>