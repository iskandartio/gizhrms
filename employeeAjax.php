<?php
require "pages/startup.php";
	if ($type=='search') {
		$_SESSION['filter_first_name']=$first_name;
		$_SESSION['filter_last_name']=$last_name;
		$filter="";
		$arr=array();
		if ($first_name!='') {
			$filter.=" and a.first_name like ?";
			array_push($arr, "%$first_name%");
		}
		if ($last_name!='') {
			$filter.=" and a.last_name like ?";
			array_push($arr, "%$last_name%");
		}
		db::Log($filter);
		db::Log($arr);
		$res=employee::get_active_employee($filter, $arr);

		$result="<table id='tbl_employee' class='tbl'>
		<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Project Name</th><th>Project Location</th><th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$user_id</td><td>$first_name</td><td>$last_name</td><td>$project_name</td><td>$project_location</td>
			<td><button class='btn_edit_project'>Edit Project Data</button> 
			<button class='btn_update'>Change Project Data</button> 
			<button class='btn_edit_dependent'>Edit Dependents</button> 
			</td>
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
			db::Log("contract_history_id=".$contract_history_id);
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
		if (!isset($start_date)) {
			unset($_POST['start_date']);
			unset($_POST['end_date']);
		}
		$salary_sharing_project_name=$_POST['salary_sharing_project_name'];
		$salary_sharing_project_number=$_POST['salary_sharing_project_number'];
		$salary_sharing_percentage=$_POST['salary_sharing_percentage'];
		unset($_POST['salary_sharing_project_name']);
		unset($_POST['salary_sharing_project_number']);
		unset($_POST['salary_sharing_percentage']);
		db::updateEasy('contract_history',$_POST, $con);
		if (isset($start_date)) {
			db::update('applicants','contract1_start_date, contract1_end_date','user_id=? and contract1_start_date is null', array($start_date, $end_date, $user_id), $con);
		}
		db::delete('salary_sharing','contract_history_id=?', array($contract_history_id), $con);
		foreach ($salary_sharing_project_name as $key=>$val) {
			db::insert('salary_sharing','contract_history_id, project_name, project_number, percentage'
			, array($contract_history_id, $val, $salary_sharing_project_number[$key], $salary_sharing_percentage[$key]),$con);
		}
		db::commitTrans($con);
		
		$salary_history=db::select('contract_history a
inner join contract_history b on a.user_id=b.user_id','b.*','a.contract_history_id=?', 'start_date desc',array($contract_history_id));
		
		die(json_encode(employee::get_salary_history_tbl($salary_history)));
		
	}

	
	if ($type=='save_contract_detail') {
		$con=db::beginTrans();
		
		$_POST['user_id']=$_SESSION['edit_id'];
		$edit_id=$_POST['user_id'];
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
		$combo_language_def=shared::select_combo_complete(language::getAll(), 'language_id','-Language-','language_val');
		$combo_language_def=str_replace("</select>","<option value='-1'>Others</option></select>", $combo_language_def);
		$combo_language_skill=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id', "- Skill Level -",'language_skill_val');
		$str="<tr><td></td><td>".$combo_language_def." "._t2('language_val')."</td><td>".$combo_language_skill."</td><td>".getImageTags(array('save','cancel'))."</td></tr>";
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
	if ($type=='terminate') {
		
		db::update('applicants','contract_state','user_id=?',array('Terminate', $user_id));
		die;
	}
	if ($type=='recontract') {
		$name=db::select_single('applicants',"concat(first_name,' ',last_name) v", 'user_id=?','',array($user_id));
		$res=db::select_one('contract_history','*','user_id=?','end_date desc', array($user_id));
		$result=employee::get_recontract_table($name, $res);
		die($result);
	}
	if ($type=='save_recontract') {
		$con=db::beginTrans();
		db::ExecMe('update applicants set contract1_start_date=?, contract1_end_date=?
		, am1_start_date=null, am1_end_date=null
		, contract2_start_date=null, contract2_end_date=null
		, am2_start_date=null, am2_end_date=null
		where user_id=?',array($start_date, $end_date, $user_id), $con);
		db::ExecMe('insert into contract_history2 select * from contract_history where user_id=?', array($user_id), $con);
		db::ExecMe('delete from contract_history where user_id=?', array($user_id), $con);
		db::insertEasy('contract_history',$_POST, $con);
		db::commitTrans($con);
		die;
	}
	if ($type=='search_expiring') {
		$res=employee::get_expiring_res();
		$result=employee::get_expiring_table($res);
		die($result);
	}
	if ($type=='get_dependent') {
		$_SESSION['edit_id']=$user_id;
		$res=employee::get_dependent_res($user_id);
		$user_name=employee::get_user_name($user_id);
		$result=employee::get_dependent_table($user_name, $res);
		die($result);
	}
	if ($type=='save_dependent') {
		$user_id=$_SESSION['edit_id'];
		$_POST['user_id']=$user_id;
		if ($employee_dependent_id=='') {
			$employee_dependent_id=db::insertEasy('employee_dependent', $_POST);
		} else {
			db::updateEasy('employee_dependent', $_POST);
		}
		die ($employee_dependent_id);
	}
	if ($type=='delete_dependent') {
		db::delete('employee_dependent','employee_dependent_id=?',array($employee_dependent_id));
		die;
	}
		die;
?>