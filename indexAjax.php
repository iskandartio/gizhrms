<?php
	require "pages/startup.php";
	if ($type=='get_captcha_text') {
		die (shared::get_captcha_text());
	}
	if ($type=='login') {
		$data['err']='';
		$res=db::select_one('m_user','user_id, user_name, pwd', 'status_id=1 and user_name=? and pwd=sha2(?,512)','',array($_POST['email'], $_POST['password']));
		$_SESSION['time']=microtime();
		$_SESSION['check_abused']=$_SESSION['check_abused']+1;
		
		if (count($res)==0) {
			$data['err']='Wrong User Name or Password or Not Activated!';			
			$data['captcha_tag']=shared::get_captcha_text();
			die (json_encode($data));
		}
		$_SESSION['check_abused']=0;
		$_SESSION['uid']=$res['user_id'];
		$_SESSION['email']=$_POST['email'];
		$_SESSION['pwd']=$_POST['password'];
		$res=db::DoQuery('select b.role_name from m_user_role a
		left join m_role b on a.role_id=b.role_id
		where a.user_id=?',array($_SESSION['uid']));
		$_SESSION['role_name']=$res[0]['role_name'];
		if ($_SESSION['role_name']=='applicant') {
			$data['url']= "position_applied";
		} else if ($_SESSION['role_name']=='admin') {
			$data['url']=  "vacancy";
		} else if ($_SESSION['role_name']=='employee') {
			$data['url']=  "filter";
		}
		die (json_encode($data));
	} 
	if ($type=='register') {
		$data['err']='';
		$data['captcha_tag']=shared::get_captcha_text(true);
		if ($_POST['password']!=$_POST['confirm_password']) {
			$data['err']='Confirm password not matched!';
			$data['focus']='#confirm_password';
			die (json_encode($data));
		}
		$res=db::select_one('m_user','user_name','user_name=?','',array($_POST['email']));
		if (count($res)>0) {
			$data['err']= 'User already exists!';
			$data['focus']='#email';
			die (json_encode($data));
		}
		$con=db::beginTrans();
		$activation_code=shared::random(30);
		$user_id=db::ExecMe('insert into m_user(user_name, pwd, activation_code) values(?,sha2(?,512),?)', array($_POST['email'], $_POST['password'], $activation_code), $con);
		$_SESSION['uid']=$res['user_id'];
		$_SESSION['email']=$_POST['email'];
		$_SESSION['pwd']=$_POST['password'];
		$role_id=db::select_single('m_role','role_id v','role_name=?','',array('applicant'), $con);
		db::insert('m_user_role','user_id, role_id', array($user_id, $role_id), $con);
		$param=array();
		$param['email']=$email;
		$param['link']=$activation_code;
		shared::email("register", $param, $con);
		db::commitTrans($con);
		
		$data['url']= "";
		die (json_encode($data));
	}
	if ($type=='forgotPassword') {
		$data['err']='';
		$con=db::beginTrans();
		$password=shared::random(10);
		$exists=db::ExecMe("update m_user set pwd=sha2(?,512) where user_name=?", array($password, $email), $con);
		if ($exists>0) {
			$param['email']=$email;
			$param['password']=$password;
			shared::email("forgot_password", $param, $con);
		} else {
			$data['err']='You have not registered';
		}
		db::commitTrans($con);
		$data['url']= "";
		die (json_encode($data));
		
	}
	if ($type=='set_session') {
		$_SESSION[$session_key]=$session_value;
		
		die;
	}
?>