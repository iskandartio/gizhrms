<?php
	if ($type=='save') {
		if ($pwd=="") {
			db::ExecMe("update email_from set host=?, security_type=?, port=?, user_name=?, sender_name=?", array($host,$security_type,$port,$user_name, $sender_name));
		} else {
			$pwd=shared::g_enc_half($pwd);
			db::ExecMe("update email_from set host=?, security_type=?, port=?, user_name=?, pwd=?, sender_name=?", array($host,$security_type,$port,$user_name,$pwd, $sender_name));
		}
		
		die;
	}
	if ($type=='show_email') {
		$row=db::select_one('email_setup','*','email_type=?', '', array($email_type));
		$result="";
		//$result.=shared::get_tinymce_script('#email_content');
		
		$result.="<h1>".$row['email_type_name']."</h1>";
		$result.="<input type='hidden' value='".$email_type."' id='email_type'/>";
		$result.="<table>
		<tr><td>Params</td><td>:</td><td>"._t2("params", $row['params'], "80")."</td></tr>
		<tr><td>Email To</td><td>:</td><td>"._t2("email_to", $row['email_to'])."</td></tr>
		<tr><td>Email CC</td><td>:</td><td>"._t2("email_cc", $row['email_cc'])."</td></tr>
		<tr><td>Email Subject</td><td>:</td><td>"._t2("email_subject", $row['email_subject'],"80")."</td></tr>
		<tr><td>Email Content</td><td>:</td><td><div id='email_content' style='border-style:dotted'>".$row['email_content']."</div></td></tr>
		</table>";
		$result.="<button class='btn_save_email'>Save Email Setting</button>";
		die ($result);

		
	}
	if ($type=='save_email') {
		$rs=db::select_one('email_setup','email_setup_id','email_type=?','',array($email_type));
		$_POST['email_setup_id']=$rs['email_setup_id'];
		db::updateEasy('email_setup', $_POST);
		die;
	}
?>