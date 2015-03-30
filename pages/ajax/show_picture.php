<?php
header('Content-Type: image');
if (isset($_GET['a'])) {
	$im=imageCreateFromAny("pages/uploads/".$_SESSION['user_id']."-others-".$_GET['a']);
} else {
	if ($_SESSION['user_id']==0) {
		$im=imageCreateFromAny("images/no-photo.png");
	} else if (file_exists("pages/uploads/".$_SESSION['user_id']."-photo.jpg")) {
		$im=imageCreateFromAny("pages/uploads/".$_SESSION['user_id']."-photo.jpg");
	} else if (file_exists("pages/uploads/".$_SESSION['user_id']."-photo.png")) {
		$im=imageCreateFromAny("pages/uploads/".$_SESSION['user_id']."-photo.png");
	} else {
		$im=imageCreateFromAny("images/no-photo.png");
	}
}
imagejpeg($im);
imagedestroy($im);
die;
function imageCreateFromAny($filepath) { 
    $type = exif_imagetype($filepath); // [] if you don't have exif you could use getImageSize() 
    $allowedTypes = array( 
        1,  // [] gif 
        2,  // [] jpg 
        3,  // [] png 
        6   // [] bmp 
    ); 
    if (!in_array($type, $allowedTypes)) { 
        return false; 
    } 
    switch ($type) { 
        case 1 : 
            $im = imageCreateFromGif($filepath); 
        break; 
        case 2 : 
            $im = imageCreateFromJpeg($filepath); 
        break; 
        case 3 : 
            $im = imageCreateFromPng($filepath); 
        break; 
        case 6 : 
            $im = imageCreateFromBmp($filepath); 
        break; 
    } 
	return $im;  
} 
?>
