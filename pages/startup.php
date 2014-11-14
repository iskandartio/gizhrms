<?php
	require_once("autoload.php");
	session_start();
	date_default_timezone_set('Asia/Jakarta');
	$_SESSION['db']=array('mysql:host=localhost:3307;dbname=hrms','root','123456');
	//$_SESSION['db']=array('mysql:host=mysql.idhostinger.com;dbname=u169820922_prop','u169820922_admin','host123456a!');
	
	$timezone = "Asia/Bangkok";
	if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone);
	
	foreach ($_POST as $key=>$value) {

		if (startsWith($key,'date')||endsWith($key,'date')) {
			
			$$key=dbDate($value);	
			$_POST[$key]=$$key;
		} else {
			$$key=$value;
		}
		
	}
	
	function _p($s) {
		echo $s;
	}
	function _d($s) {
		print_r($s);
		echo '<br/>';
	}
	function startsWith($haystack, $needle)
	{
		return $needle === "" || strpos($haystack, $needle) === 0;
	}
	function endsWith($haystack, $needle)
	{
		return $needle === "" || substr($haystack, -strlen($needle)) === $needle;
	}
	function _t($name, $value='', $size='', $type='text', $class='') {
		if ($value!='' && count($value)>0) $value=$value[$name];
		if (startsWith($name,'date')) {
			$value=formatDate($value);
		}
		$placeholder=ucwords(str_replace('_',' ',$name));
		
		_p("<input type='$type' id='$name' name='$name' class='$name' placeholder='$placeholder' value='$value'".($size=='' ? '' : "size='$size'")."/>");
	}
	function month_options() {
		$month_options='<option value=1>January</option>';
		$month_options.='<option value=2>February</option>';
		$month_options.='<option value=3>March</option>';
		$month_options.='<option value=4>April</option>';
		$month_options.='<option value=5>May</option>';
		$month_options.='<option value=6>June</option>';
		$month_options.='<option value=7>July</option>';
		$month_options.='<option value=8>August</option>';
		$month_options.='<option value=9>September</option>';
		$month_options.='<option value=10>October</option>';
		$month_options.='<option value=11>November</option>';
		$month_options.='<option value=12>December</option>';
		return $month_options;
	}
	function get_month_name($m) {
		if ($m==1) return 'Jan';
		if ($m==2) return 'Feb';
		if ($m==3) return 'Mar';
		if ($m==4) return 'Apr';
		if ($m==5) return 'May';
		if ($m==6) return 'Jun';
		if ($m==7) return 'Jul';
		if ($m==8) return 'Aug';
		if ($m==9) return 'Sep';
		if ($m==10) return 'Oct';
		if ($m==11) return 'Nov';
		if ($m==12) return 'Dec';
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
		if (strlen($d)<8) return "";
		return substr($d,8,2)."-".substr($d,5,2)."-".substr($d,0,4);
	}
	function formatDateName($d) {
		if (strlen($d)<8) return "";
		return substr($d,8,2)." ".get_month_name(substr($d,5,2))." ".substr($d,0,4);
	}
	function dbDate($d) {
		if ($d=='') return null;
		$y=substr($d,6,4);
		if (!checkNumeric($y)) return null;
		$m=substr($d,3,2);
		if (!checkNumeric($m)) return null;
		$dt=substr($d,0,2);
		
		if (!checkNumeric($dt)) return null;
		
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
	function getImageTags($types) {
		$s='';
		foreach($types as $t) {
			$s.='<img src="images/'.$t.'.png" class="btn_'.$t.'"/> ';
		}
		return $s;
		
	}
?>