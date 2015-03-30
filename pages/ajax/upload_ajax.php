<?php
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

		if (file_exists("pages/uploads/$file")) echo 'ok';
		die;
	}
}

foreach ($_FILES as $key=>$file) {
	
	if (!is_array($file['name'])) {
		UploadAFile($file, $key);
	} else {
		
		for ($c=0;$c<count($file['name']);$c++) {
			UploadAFile($file, $key,$c);
		}
	}	
}

function deleteFile($file) {
	if (file_exists($file)) {
		unlink($file);
	}
}
function UploadAFile($file, $type, $i=-1) {
	if ($i==-1) {
		$name=$file['name'];
		$tmp_name=$file['tmp_name'];
	} else {
		$name=$file['name'][$i];
		$tmp_name=$file['tmp_name'][$i];
	}
		
	$target_dir = "pages/uploads/";
	$file_name=$name;
	$ext=substr($file_name, strrpos($file_name, "."));
	if ($type=='uploadOthers') {
		$target_file = $target_dir . $_SESSION['user_id'].'-others-'.shared::random(5);		
		while (file_exists($target_file)) {
			$target_file = $target_dir . $_SESSION['user_id'].'-others-'.shared::random(5);
		}
		
	} else if ($type='uploadPhoto') {
		$target_file = $target_dir . $_SESSION['user_id'].'-photo';
	} else if ($type='uploadFileCV') {
		$target_file = $target_dir . $_SESSION['uid'].'-cv';
	} else if ($type='uploadFileLetter') {
		$target_file = $target_dir . $_SESSION['uid'].'-letter';
	}
	deleteFile($target_file.".png");
	deleteFile($target_file.".jpg");
	$target_file.=$ext;
	$uploadOk=1;
	if (move_uploaded_file($tmp_name, $target_file)) {
		echo "The file ". basename($name). " has been uploaded.";
	} else {
		echo "Sorry, there was an error uploading your file.";
	}
	if ($type=='uploadFileCV') {
		db::update('applicants','cv', 'user_id=?', array($ext, $_SESSION['uid']));
	} else if ($type=='uploadFileLetter') {
		db::update('applicants','letter', 'user_id=?', array($ext, $_SESSION['uid']));
	}
	
}




?>