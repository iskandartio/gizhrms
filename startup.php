<?php
	require_once("autoload.php");
	session_start();
	if(function_exists('date_default_timezone_set')) date_default_timezone_set('Asia/Jakarta');
	$_SESSION['db']=array('mysql:host=localhost:3307;dbname=inv','root','123456');
	//$_SESSION['db']=array('mysql:host=mysql.idhostinger.com;dbname=u169820922_prop','u169820922_admin','host123456a!');
	

	function _p($s) {
		echo $s;
	}
	function _d($s) {
		print_r($s);
		echo '<br/>';
	}
	function _t($name, $value='', $size='', $type='text', $class='') {
		_p("<input type='$type' id='$name' class='$name' name='$name' value='$value'".($size==''?'':"size='$size'")."/>");
	}
	function _l($link, $key, $val) {
		_p("<a href='$link?key=$key'>$val</a>&nbsp;");
	}
	function cNum($str) {
		if (strlen($str)==0) return 0;
		return str_replace(',','',$str);
		
	}
	function esc($s) {
		return str_replace("'","''",$s);
	}
	function proper($string) {
		$string = strtolower($string);
		$string = substr_replace($string, strtoupper(substr($string, 0, 1)), 0, 1);
		return $string;
	}
	function _get($s) {
		return isset($_GET[$s]) ? $_GET[$s] : "";
	}
	function month_to_int($m) {
		if ($m=="Jan")
			return "01";
		if ($m=="Feb" || $m=="Peb")
			return "02";
		if ($m=="Mar")
			return "03";
		if ($m=="Apr")
			return "04";
		if ($m=="May" || $m=="Mei")
			return "05";
		if ($m=="Jun")
			return "06";
		if ($m=="Jul")
			return "07";
		if ($m=="Aug" || $m=="Agust")
			return "08";
		if ($m=="Sep")
			return "09";
		if ($m=="Oct" || $m=="Okt")
			return "10";
		if ($m=="Nov" || $m=="Nop")
			return "11";
		if ($m=="Dec" || $m=="Des")
			return "12";
		return "";
	}

	function conv_date($s) {
		if ($s == null) {
			return "";
		}
		if (strlen($s) < 8)
			return "";
		return substr($s,7) . "-" . month_to_int(substr($s,3,3)) . "-" . substr($s,0, 2);
	}
	function formatDate($d) {
		
		return substr($d,8,2)."-".substr($d,5,2)."-".substr($d,0,4);
	}
	function dbDate($d) {
		if ($d=='') return '';
		$y=substr($d,6,4);
		if (!checkNumeric($y)) return '';
		$m=substr($d,3,2);
		if (!checkNumeric($m)) return '';
		$dt=substr($d,0,2);
		
		if (!checkNumeric($dt)) return '';
		
		return substr($d, 6, 4)."-".substr($d,3,2)."-".substr($d,0,2);
	}
	function checkNumeric($s) {
		if ($s=='') return false;
		for ($i=0;$i<strlen($s);$i++) {	
			if ($s[$i]<'0'||$s[$i]>'9') return false;
		}
		return true;
	}
	function formatNumber($s) {
		if ($s=='') return '';
		$s=round($s,5);
		$s=str_replace(',','',$s);
		
		if (strpos($s,'.')) {
			$z=explode('.', $s);
		} else {
			$z[0] = $s;
		}
		
		$j=strlen($z[0])%3;
		if ($j==0) $j=3;
		$r=substr($z[0],0, $j);
		while ($j<strlen($z[0])) {
			
			$r.=",".substr($z[0], $j, 3);
			
			$j+=3;
		}
		if (count($z)>1) {
			$r.=".".$z[1];
		}
		return $r;
	}
?>