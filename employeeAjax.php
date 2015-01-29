<?php
require "pages/startup.php";
	if ($type=='search') {
		$_SESSION['filter_first_name']=$first_name;
		$_SESSION['filter_last_name']=$last_name;
		$filter="1=1";
		$arr=array();
		if ($first_name!='') {
			$filter.=" and a.first_name like ?";
			array_push($arr, "%$first_name%");
		}
		if ($last_name!='') {
			$filter.=" and a.last_name like ?";
			array_push($arr, "%$last_name%");
		}
		$res=db::select('applicants a inner join contract_history b on a.user_id=b.user_id and now() between b.start_date and b.end_date'
		,'a.user_id, a.first_name, a.last_name, b.project_name, b.project_location',$filter, 'a.first_name, a.last_name', $arr);
		$result="<table id='tbl_employee' class='tbl'>
		<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Project Name</th><th>Project Location</th><th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$user_id</td><td>$first_name</td><td>$last_name</td><td>$project_name</td><td>$project_location</td>
			<td>".getImageTags(array('edit'))." <button class='btn_update'>Change Project Data</button></td>
			</tr>";
		}
		$result.="</tbody></table>";
		die($result);
	}
	if ($type=='set_edit_id') {
		$_SESSION['edit_id']=$edit_id;
		die($_SESSION['edit_id']);
		
	}
	if ($type=='saveProject') {
		$_POST['user_id']=$_SESSION['edit_id'];
		$contract_history_id=$_SESSION['contract_history_id'];
		$user_id=$_POST['user_id'];
		if (strcmp($start_date, $end_date)>=0) die("End Date must be bigger then Start Date");
		$con=db::beginTrans();
		db::delete('contract_history','start_date>=? and user_id=?', array($start_date, $user_id), $con);
		$contract_history_id=db::select_single('contract_history','contract_history_id v','? between start_date and end_date and user_id=?','', array($start_date, $user_id), $con);
		db::update('contract_history','end_date','contract_history_id=?', array(shared::addDate($_POST['start_date'],-1), $contract_history_id), $con);
		$id=db::insertEasy('contract_history', $_POST, $con);
		if ($id<=0) {
			db::rollbackTrans($con);
			die("Failed");
		}
		db::commitTrans($con);
		die("Success");
	}

	if ($type=='save') {
		$_POST['user_id']=$_SESSION['edit_id'];
		$user_id=$_POST['user_id'];
		unset($_POST['user_name']);
		$rs=db::select_one('m_user','user_id, user_name','user_name=?', '', array($user_name));
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
			$_SESSION['edit_id']=$user_id;
			$contract_history_id=db::insert('contract_history','user_id, start_date, end_date', array($user_id, '1900-01-01', '3000-01-01'), $con);
			$_SESSION['contract_history_id']=$contract_history_id;
			$i=db::insertEasy('applicants', $_POST,$con);
		} else {
			$data['is_new']=0;
			$rs=db::select_one('m_user', 'user_name','user_id=?','', array($user_id), $con);
			if ($rs['user_name']!=$user_name) {
				$password=shared::random(10);
				$activation_code=shared::random(30);
			}
			db::ExecMe('update m_user set user_name=?, pwd=sha2(?,512), activation_code=?, status_id=null 
			where user_id=?', array($user_name, $password, $activation_code, $user_id), $con);
			$i=db::updateEasy('applicants', $_POST,$con);
			
			
		}
		if ($activation_code!="") {
			$role_id=db::select_single('m_role','role_id v','role_name=?','',array('applicant'), $con);
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
		if ($i>0) die("Success");
		die("Failed");
	}
	if ($type=='save_current_contract') {
		$user_id=$_SESSION['edit_id'];
		$_POST['contract_history_id']=$_SESSION['contract_history_id'];
		$contract_history_id=$_POST['contract_history_id'];
		$con=db::beginTrans();
		db::updateEasy('contract_history',$_POST, $con);
		if (isset($start_date)) {
			db::update('applicants','contract1_start_date, contract1_end_date','user_id=? and contract1_start_date is null', array($start_date, $end_date, $user_id), $con);
		}
		db::commitTrans($con);
		
		$salary_history=db::select('contract_history a
inner join contract_history b on a.user_id=b.user_id','b.*','a.contract_history_id=?', 'start_date desc',array($contract_history_id));
		
		die(json_encode(employee::get_salary_history_tbl($salary_history)));
		
	}

	
	if ($type=='save_contract_detail') {
		$con=db::beginTrans();
		$_POST['user_id']=$_SESSION['edit_id'];
		db::updateShort('applicants', 'user_id', $_POST, $con);
		$data['first']=employee::get_graph($contract1_start_date, $contract1_end_date, $am1_start_date, $am1_end_date, shared::addYear($contract1_start_date,2));
		$data['second']=employee::get_graph($contract2_start_date, $contract2_end_date, $am2_start_date, $am2_end_date, shared::addYear($contract2_start_date,1));
		
		db::commitTrans($con);
		$d=employee::getApplicantData($edit_id);
		$data['severance']=formatNumber($d['severance']);
		$data['service']=formatNumber($d['service']);
		
		die(json_encode($data));
	}
	if ($type=='add_language') {
		$combo_language="<select id='language_id' class='language_id'><option value=''>- Language -</option>";
		$combo_language.=language::getChoice();
		$combo_language.="<option value='-1'>Others</option>";
		$combo_language.="</select>";
		$res=db::select('language_skill','*');
		$combo_language_skill=shared::select_combo_complete($res, 'language_skill_id', "- Skill Level -",'language_skill_val');
		$str="<tr><td></td><td>".$combo_language." "._t2('language_val')."</td><td>".$combo_language_skill."</td><td>".getImageTags(array('save','cancel'))."</td></tr>";
		die($str);
	}
	if ($type=='save_language') {
		$_POST['user_id']=$_SESSION['edit_id'];
		if ($applicants_language_id=='') {
			$applicants_language_id=db::insertEasy('applicants_language',$_POST);
		} else {
			db::updateEasy('applicants_language',$_POST);
		}
		die($applicants_language_id);
	}
	if ($type=='delete_language') {
		$i=db::delete('applicants_language','applicants_language_id=?', array($applicants_language_id));
		die($i);
	}
?>