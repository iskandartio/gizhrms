<?php
require_once('pages/class.phpmailer.php');
require_once('pages/startup.php');
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded

Class SendEmail {
	static function send_email($send_to, $cc_to, $subject, $body, $attachment=null) {
		$rs=db::select_one("email_from","*");
		$mail             = new PHPMailer();

		$body             = preg_replace("/\\\\/",'',$body); 

		$mail->IsSMTP(); // telling the class to use SMTP
		$mail->Host       = "mail.yourdomain.com"; // SMTP server
		$mail->SMTPDebug  = 1;                     // enables SMTP debug information (for testing)
												   // 1 = errors and messages
												   // 2 = messages only
		$mail->SMTPAuth   = true;                  // enable SMTP authentication
		$mail->SMTPSecure = $rs['security_type'];                 // sets the prefix to the servier

		$mail->Host       = $rs['host'];      // sets GMAIL as the SMTP server
		$mail->Port       = $rs['port'];                   // set the SMTP port for the GMAIL server
		$mail->Username   = $rs['user_name'];  // GMAIL username
		$mail->Password   = shared::g_decrypt($rs['pwd']);            // GMAIL password

		$mail->SetFrom($rs['user_name'], $rs['sender_name']);

		//$mail->AddReplyTo("iskandar.tio@gmail.com","GIZ");

		$mail->Subject    = $subject;

		//$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

		$mail->MsgHTML($body);

		$address = explode(";",$send_to);
		foreach ($address as $addr) {
			$mail->AddAddress($addr);
		}
		$address = explode(";",$cc_to);
		foreach ($address as $addr) {
			$mail->AddCC($addr);
		}
		if ($attachment!=null && $attachment!='') {
			$mail->AddAttachment($attachment,'Vacancy Description.pdf');
		}
		if(!$mail->Send()) {
		  //return "Mailer Error: " . $mail->ErrorInfo;
		  return false;
		} else {
		  return true;
		}
	}
}
?>