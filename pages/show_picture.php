<?php
header('Content-Type: image');

if (file_exists("uploads/".$_SESSION['user_id']."-photo.jpg")) {
	$im=imageCreateFromAny("uploads/".$_SESSION['user_id']."-photo.jpg");
} else if (file_exists("uploads/".$_SESSION['user_id']."-photo.png")) {
	$im=imageCreateFromAny("uploads/".$_SESSION['user_id']."-photo.png");
} else {
	$im=imageCreateFromAny("images/no-photo.png");
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
