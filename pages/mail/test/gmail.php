<?php
require_once('../class.phpmailer.php');
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded

$mail             = new PHPMailer();

$body             = file_get_contents('contents.html');
$body             = preg_replace("/\\\\/",'',$body); 

$mail->IsSMTP(); // telling the class to use SMTP
$mail->Host       = "mail.yourdomain.com"; // SMTP server
$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
                                           // 1 = errors and messages
                                           // 2 = messages only
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->SMTPSecure = "tls";                 // sets the prefix to the servier
$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
$mail->Port       = 587;                   // set the SMTP port for the GMAIL server
$mail->Username   = "iskandar.tio@gmail.com";  // GMAIL username
$mail->Password   = "gmailstunt1";            // GMAIL password

$mail->SetFrom('zhao.iskandar@gmail.com', 'GIZ');

$mail->AddReplyTo("iskandar.tio@gmail.com","GIZ");

$mail->Subject    = "jdioj fdsjio fuwieo jioas";

$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

$mail->MsgHTML($body);

$address = "zhao.iskandar@gmail.com";
$mail->AddAddress($address, "Zhao Iskandar");

$mail->AddAttachment("images/edit.png");      // attachment
$mail->AddAttachment("images/delete.png"); // attachment
$mail->AddAttachment("images/save.png"); // attachment

if(!$mail->Send()) {
  echo "Mailer Error: " . $mail->ErrorInfo;
} else {
  echo "Message sent!";
}
?>