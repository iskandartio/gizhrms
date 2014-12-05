<?php
require_once("pages/startup.php");

if (isset($_FILES["uploadFileCV"]["name"])) {
	$target_dir = "uploads/";

	$file_name=$_FILES["uploadFileCV"]["name"];
	$ext_cv=substr($file_name, strrpos($file_name, "."));
	$target_file = $target_dir . $_SESSION['uid'].'-cv'.$ext_cv;

	$uploadOk=1;

	if (move_uploaded_file($_FILES["uploadFileCV"]["tmp_name"], $target_file)) {
		echo "The file ". basename( $_FILES["uploadFileCV"]["name"]). " has been uploaded.";
	} else {
		echo "Sorry, there was an error uploading your file.";
	}
	$file_name=$_FILES["uploadFileLetter"]["name"];
	$ext_letter=substr($file_name, strrpos($file_name, "."));
	$target_file = $target_dir . $_SESSION['uid'].'-letter'.$ext_letter;

	if (move_uploaded_file($_FILES["uploadFileLetter"]["tmp_name"], $target_file)) {
		echo "The file ". basename( $_FILES["uploadFileLetter"]["name"]). " has been uploaded.";
	} else {
		echo "Sorry, there was an error uploading your file.";
	}
	db::update('applicants','cv,letter', 'user_id=?', array($ext_cv, $ext_letter, $_SESSION['uid']));
	die;
}
if (isset($_POST)) {
	if (isset($_POST['type'])) {
		$type=$_POST['type'];
		if (isset($_POST['user_id'])) {
			$user_id=shared::validate_download($user_id, $_SESSION['uid'], $_SESSION['role_name']);
		} else {
			$user_id=$_SESSION['uid'];
		}
		$ext=db::select_single("applicants", "$type v", "user_id=?","", array($user_id));
		$file=$user_id."-$type".$ext;

		if (file_exists("uploads/$file")) echo 'ok';
		die;
	}
}
?>