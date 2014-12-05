<?php
require_once('libs/mail/class.phpmailer.php');
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded

Class SendEmail {
	static function send_email($send_to, $subject, $body) {
		$mail             = new PHPMailer();

		$body             = preg_replace("/\\\\/",'',$body); 

		$mail->IsSMTP(); // telling the class to use SMTP
		$mail->Host       = "mail.yourdomain.com"; // SMTP server
		$mail->SMTPDebug  = 1;                     // enables SMTP debug information (for testing)
												   // 1 = errors and messages
												   // 2 = messages only
		$mail->SMTPAuth   = true;                  // enable SMTP authentication
		$mail->SMTPSecure = "tls";                 // sets the prefix to the servier
		$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
		$mail->Port       = 587;                   // set the SMTP port for the GMAIL server
		$mail->Username   = "iskandar.tio@gmail.com";  // GMAIL username
		$mail->Password   = "gmailstunt1";            // GMAIL password

		$mail->SetFrom('iskandar.tio@gmail.com', 'Iskandar Tio');

		//$mail->AddReplyTo("iskandar.tio@gmail.com","GIZ");

		$mail->Subject    = $subject;

		//$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

		$mail->MsgHTML($body);

		$address = $send_to;
		$mail->AddAddress($address, "");

		if(!$mail->Send()) {
		  //return "Mailer Error: " . $mail->ErrorInfo;
		  return false;
		} else {
		  return true;
		}
	}
}
?>