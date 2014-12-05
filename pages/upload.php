<?php
require_once "pages/startup.php";
$type=$_GET['type'];
if (isset($_GET['user_id'])) {
	$user_id=$_GET['user_id'];
	
	$user_id=shared::validate_download($user_id, $_SESSION['uid'], $_SESSION['role_name']);
	
} else {
	$user_id=$_SESSION['uid'];
}
$ext=db::select_single("applicants", "$type v", "user_id=?","", array($user_id));


$file=$user_id."-$type".$ext;

if (file_exists("uploads/$file")) {
	header('Content-Disposition: attachment; filename="'.basename($file).'"');
	ob_clean();
    flush();
	
	readfile("uploads/$file");
	
	exit;
} else {
	header('Content-Disposition: attachment;');
}


?>
