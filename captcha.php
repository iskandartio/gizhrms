<?php
require "pages/startup.php";
$_SESSION['captcha_text']=shared::random();
Captcha::phpcaptcha($_SESSION['captcha_text'], 200,15,30);
class Captcha
{	

	static public function phpcaptcha($text, $imgWidth,$noiceLines=0,$noiceDots=0)
	{	
		/* Settings */
		$zoom=$imgWidth/120;
		$imgHeight=$imgWidth/3;
		$c[0]=array(255,rand(0,100), rand(0,100));
		$c[1]=array(rand(0,100),255, rand(0,100));
		$c[2]=array(rand(0,100),rand(0,100),255);
		$i=rand(0,2);
		$textColor=$c[$i];
		for (;$i<2;$i++) {
			$c[$i]=$c[$i+1];
		}
		$i=rand(0,1);
		$noiceColor=$c[$i];
		
		$backgroundColor=$c[($i==0? 1: 0)];
		$font = './font/monofont.ttf';/* font */
		$fontSize = $imgHeight * 0.75;
		
		$im = imagecreatetruecolor($imgWidth, $imgHeight);	
		$textColor = imagecolorallocate($im, $textColor[0],$textColor[1],$textColor[2]);			
		
		
		$backgroundColor = imagecolorallocate($im, $backgroundColor[0],$backgroundColor[1],$backgroundColor[2]);
		
		$noiceColor = imagecolorallocate($im, $noiceColor[0],$noiceColor[1],$noiceColor[2]);

		list($x, $y) = Captcha::ImageTTFCenter($im, $text, $font, $fontSize);	
		$def_y=$y;
		for ($i=0;$i<strlen($text);$i++) {
			imagettftext($im, $fontSize, 0, $x, $y, $textColor, $font, $text[$i]);		
			//imagestring($im, 5, $x, $y, $text[$i], $textcolor);
			$x=$x+15*$zoom;
			$y=$def_y+rand(-7*$zoom,-3);
		}
		
				
		if($noiceDots>0){/* generating the dots randomly in background */
		for( $i=0; $i<$noiceDots; $i++ ) {
			imagefilledellipse($im, mt_rand(0,$imgWidth),
			mt_rand(0,$imgHeight), 3, 3, $noiceColor);
			imageellipse($im, mt_rand(0,$imgWidth),
			mt_rand(0,$imgHeight), 15, 8, $textColor);
		}}		
		
		/* generating lines randomly in background of image */
		
		
		if($noiceLines>0){
		
			
			for( $i=0; $i<$noiceLines; $i++ ) {				
				imageline($im, mt_rand(0,$imgWidth), mt_rand(0,$imgHeight),
				mt_rand(0,$imgWidth), mt_rand(0,$imgHeight), $noiceColor);
			}
		}				
		
		imagefill($im,0,0,$backgroundColor);
		if(isset($_SESSION)){
			$_SESSION['captcha_code'] = $text;/* set random text in session for captcha validation*/
		}
		imagejpeg($im,NULL,90);/* Showing image */
		//header('Content-Type: image/jpeg');/* defining the image type to be shown in browser widow */
		imagedestroy($im);/* Destroying image instance */
	
		
		
	}
	
		
	/*function to get center position on image*/
	static protected function ImageTTFCenter($image, $text, $font, $size, $angle = 8) 
	{
		$xi = imagesx($image);
		$yi = imagesy($image);
		$box = imagettfbbox($size, $angle, $font, $text);
		$xr = abs(max($box[2], $box[4]));
		$yr = abs(max($box[5], $box[7]));
		$x = intval(($xi - $xr) / 2);
		$y = intval(($yi + $yr) / 2);
		return array($x, $y);	
	}
}
?>