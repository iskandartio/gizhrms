<?php
require_once "pages/startup.php";


$type=$_GET['type'];

$ext=db::select_single("applicants", "$type v", "user_id=?","", array($_SESSION['uid']));
$file=$_SESSION['uid']."-$type".$ext;

if (file_exists("uploads/$file")) {
	header('Content-Disposition: attachment; filename="'.$file.'"');
	readfile("uploads/$file");
} else {
	header('');
}


?>
