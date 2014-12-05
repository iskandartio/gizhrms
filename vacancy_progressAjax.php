<?php
	require_once("pages/startup.php");
	if ($type=='delete') {
		die(db::delete('vacancy_progress','vacancy_progress_id=? and required=2', array($vacancy_progress_id)));
	}
	if ($type=='save') {
		$con=db::beginTrans();
		if ($vacancy_progress_id=='') {
			$_POST['sort_id']=db::select_single('vacancy_progress', 'max(sort_id)+1 v','','',array(),$con);
			$_POST['required']=0;
			$vacancy_progress_id=db::insertEasy('vacancy_progress', $_POST);
		} else {
			db::updateEasy('vacancy_progress', $_POST);
		}
		db::commitTrans($con);
		die($vacancy_progress_id);
	}
	if ($type=='up') {
		$con=db::beginTrans();
		$sort_id=db::select_single('vacancy_progress', 'sort_id v', 'vacancy_progress_id=?','', array($vacancy_progress_id), $con);
		$row=db::select_one('vacancy_progress','vacancy_progress_id, sort_id', 'sort_id<?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update('vacancy_progress','sort_id','vacancy_progress_id=?', array($sort_id, $row['vacancy_progress_id']), $con);
			db::update('vacancy_progress','sort_id','vacancy_progress_id=?', array($row['sort_id'], $vacancy_progress_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$sort_id=db::select_single('vacancy_progress', 'sort_id v', 'vacancy_progress_id=?','', array($vacancy_progress_id), $con);
		$row=db::select_one('vacancy_progress','vacancy_progress_id, sort_id', 'sort_id>?','sort_id', array($sort_id), $con);
		if ($row) {
			db::update('vacancy_progress','sort_id','vacancy_progress_id=?', array($sort_id, $row['vacancy_progress_id']), $con);
			db::update('vacancy_progress','sort_id','vacancy_progress_id=?', array($row['sort_id'], $vacancy_progress_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='show_email') {
	
		$row=db::select_one('email_setup','*','email_type=?', '', array($email_type));
		$result="";
		$result.=shared::get_tinymce_script('email_content');
		
		$result.="<h1>".$vacancy_progress_val." $invitereject</h1>";
		$result.="<input type='hidden' value='".$email_type."' id='email_type'/>";
		$result.="<table>
		<tr><td>Params</td><td>:</td><td>"._t2("params", $row['params'], "80")."</td></tr>
		<tr><td>Email To</td><td>:</td><td>"._t2("email_to", $row['email_to'])."</td></tr>
		<tr><td>Email Subject</td><td>:</td><td>"._t2("email_subject", $row['email_subject'])."</td></tr>
		<tr><td>Email Content</td><td>:</td><td><div id='email_content' style='border-style:dotted'>".$row['email_content']."</div></td></tr>
		</table>";
		$result.="<button class='btn_save_email'>Save Email Setting</button>";
		die ($result);
	}
	if ($type=='save_email') {
		$res=db::select('email_setup','email_setup_id','email_type=?','',array($email_type));
		if (count($res)==0) {
			db::insertEasy('email_setup', $_POST);
		} else {
			$_POST['email_setup_id']=$res[0]['email_setup_id'];
			db::updateEasy('email_setup', $_POST);
		}
		die;
	}
?>