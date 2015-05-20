<?php
class shared {
	static function contract_reminder_email() {
		$data=ContractReminder::getData();
		if (count($data)==0) return;
		$params=array();
		$params['days']=db::select_single('settings','setting_val v',"setting_name='Contract Reminder'");
		$params['signature']=db::select_single("signature", 'signature v');
					
		ContractReminder::forAdmin($data, $params);
		ContractReminder::forTeamLeader($data, $params);
		ContractReminder::forEmployee($data, $params);
		
		
		db::ExecMe("update contract_history a inner join (
select user_id, max(end_date) end_date from contract_history a
left join settings b on b.setting_name='Contract Reminder'
where DATE_ADD(curdate(),INTERVAL b.setting_val DAY)>=end_date and contract_reminder_email is null
group by user_id) b on a.user_id=b.user_id set a.contract_reminder_email=1");
		
	}
	static function get_session($data, $def) {
		if (!isset($_SESSION[$data])) return $def;
		return $_SESSION[$data];
	}
	static function validate_download($user_id, $uid) {
		if (isset($_SESSION['allowed_module']['filter_applicant'])) return $user_id;
		if ($user_id==$uid) return $user_id;
		$res=db::DoQuery("select a.employee_id from vacancy_employee a
inner join vacancy b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id>b.vacancy_progress_id
inner join job_applied c on c.vacancy_id=a.vacancy_id and c.user_id=?
where a.employee_id=?", array($user_id, $uid));
		if (count($res)>0) return $user_id;
		return 0;
	}
	static function email($email_type, $params, $con=null) {
		$e=db::select_one("email_setup","*","email_type='$email_type'","",array(), $con);
		if ($e==null) return;
		$signature=db::select_single("signature", 'signature v');
		$admin_email=db::select_single("settings", 'setting_val v',"setting_name='Admin Email'");

		$params['admin_email']=$admin_email;
		$params['signature']=$signature;
		foreach ($params as $key=>$val) {
			
			$e['email_to']=str_replace("@$key", $val, $e['email_to']);
			$e['email_cc']=str_replace("@$key", $val, $e['email_cc']);
			$e['email_bcc']=str_replace("@$key", $val, $e['email_bcc']);
			$e['email_subject']=str_replace("@$key", $val, $e['email_subject']);
			$e['email_content']=str_replace("@$key", $val, $e['email_content']);
		}
		$attachment='';
		if ($e['attachment']==1) $attachment=$params['attachment'];
		
		if ($e['email_content']!="") {
			db::insert("email", "email_from, email_to, email_cc, email_bcc, email_subject, email_content, attachment"
				, array($e['email_from'], $e['email_to'], $e['email_cc'], $e['email_bcc'], $e['email_subject'], $e['email_content'], $attachment), $con);
		}
	}
	static function random($characters=6,$letters = '2345678bcdfhjkmnprstvwxyz'){
		$str='';
		for ($i=0; $i<$characters; $i++) { 
			$str .= substr($letters, mt_rand(0, strlen($letters)-1), 1);
		}
		return $str;
	}
	static function set_selected($val, $str) {
		return str_replace("value='".$val."'", "value='".$val."' selected", $str);
	}
	static function get_captcha_text($forced=false) {
		$_SESSION['captcha_text']="";
		if ($_SESSION['check_abused']>10 || $forced) {
			return shared::get_captcha_string();
		}
		return "";
	}
	static function get_captcha_string()  {
		return "<img src='captcha_ajax'/><br><span class='span_link' id='change_captcha_text'>Change Captcha Text</span><p>Input the word above:</br><input type='text' id='captcha_text'/>";
	}
	static function select_combo($res, $id, $val='', $selected='') {
-		$result='';
		if ($val=='') $val=$id;
		foreach ($res  as  $row) {
			$result.="<option value='".$row[$id]."'".($selected==$row[$id] ? "selected" : "").">".$row[$val]."</option>";
		}
		return $result;
	}
	static function select_combo_complete($res, $id, $def, $val='', $selected='', $width='') {
		$style='';
		if ($width!='') $style="style='max-width:$width'";
		$result="<select $style id='$id' class='$id' title='$id'><option value=''>$def</option>";
		if ($res!=null) $result.=shared::select_combo($res, $id, $val, $selected);
		$result.="</select>";
		
		return $result;
	}
	static function sanitize($tag) {
	
		$tag= str_replace("<input","&lt;input", $tag);
		$tag= str_replace("<textarea","&lt;textarea", $tag);
		
		$tag= str_replace("'","&#39;", $tag);
		//$tag= str_replace('"',"&#34;", $tag);
		
		return $tag;
		/*
		$allowedTag=array('b','i','u','ul','li','h1','h2','h3');
		$tagArr=array();
		$tagHash=array();
		$r="";

		$start=-1;
		$idx=0;
		$flag=false;
		
		for ($i=0;$i<strlen($tag);$i++) {
			
			if ($tag[$i]=='<') {
				$start=$i;
				$r.=substr($tag,$idx, $i-$idx);
				
			} else if ($start>-1 && ($tag[$i]=='>' || $tag[$i]==' ')) {
				$tag_validate=substr($tag,$start+1,$i-$start-1);
				$flag=true;
				if ($tag_validate[0]=='/') {
					$tag_validate=substr($tag_validate,1);-*
					if (!array_search($tag_validate,$allowedTag)) {
						$flag=false;
					}
					if ($flag) {
						$index = array_search($tag_validate, $tagArr);
						if ($index == count($tagArr)-1) {
							array_pop($tagArr);
							unset($tagHash[$tag_validate]);
							$flag=true;
						} else {
							$flag=false;
							
							for ($j=count($tagArr)-1;$j>=0;$j--) {
								if ($tagArr[$j]==$tag_validate) {
									$flag=true;
									unset($tagHash[$tagArr[$j]]);
									array_pop($tagArr);
									break;
								} else {
									$i1=$tagHash[$tagArr[$j]];
									
			
									$r=substr($r,0,$i1).str_replace("<", "&lt;",substr($r, $i1));
		
									unset($tagHash[$tagArr[$j]]);
									array_pop($tagArr);
								}
							}
						}
					}
				} else {
					if (array_search($tag_validate,$allowedTag)>=0) {
						$flag=true;
						array_push($tagArr, $tag_validate);
						$tagHash[$tag_validate]=$start;
					} else {
						$flag=false;
						
					}
					

				}
				if (!$flag) {
					$r.=str_replace("<","&lt;",substr($tag, $start, $i-$start+1));
				} else {
					
					$r.=substr($tag,$start, $i-$start+1);
					
				}
				
				$idx=$i+1;
				$start=-1;
				
			}
			
		}
		foreach ($tagHash as $key) {
			$i1=$tagHash[$key];
			$r=str_replace("<", "&lt;",substr(r,0,i1-1).substr(r,i1));
		}
		if ($r=='') $r=$tag;
		return $r;
		*/
	}
	static function get_table_data($tbl, $id) {
		if (is_array($id)) {
			$id=_lbl($tbl, $id);
			$tbl=str_replace("_id","",$tbl);
		}
		
		if (!isset($_SESSION["tbl_$tbl"])) {
			$res=db::select($tbl,"$tbl"."_id, $tbl"."_val");
			$result=array();
			foreach($res as $row) {
				$result[$row["$tbl"."_id"]]=$row["$tbl"."_val"];
			}
			$_SESSION["tbl_$tbl"]=$result;
			$_SESSION["tbl_$tbl"]['read_time']=date('Y-m-d H:i:s');
			if (isset($_SESSION["tbl_$tbl"][$id])) {
				return $_SESSION["tbl_$tbl"][$id];
			} else {
				return null;
			}
		}
		
		if (!isset($_SESSION["tbl_$tbl"]['read_time'])) {
			unset($_SESSION["tbl_$tbl"]);
			return self::get_table_data($tbl, $id);
		} else {
			$updated_at= db::select_single($tbl, 'max(updated_at) v');
			
			if ($updated_at>$_SESSION["tbl_$tbl"]['read_time']) {
				unset($_SESSION["tbl_$tbl"]);
				return self::get_table_data($tbl, $id);
			}
		}
		
		if (isset($_SESSION["tbl_$tbl"][$id])) {
			return $_SESSION["tbl_$tbl"][$id];
		} else {
			return null;
		}
	}
	
	static function create_checkbox($id, $label, $selected="", $value="", $class="") {
		$selected= $selected==0 ? '' : 'checked';
		if ($class=='') $class=$id;
		if ($value=='') $value=$id;
		return "<label><input type='checkbox' class='$class' id='$id' value='$value' $selected/>$label</label>";
	}
	static function send_all_email() {
		$res=db::select('email','*','sent=0');
		foreach ($res as $row) {
			if (SendEmail::send_email($row['email_to'], $row['email_cc'], $row['email_subject'], $row['email_content'], $row['attachment'])) {
				db::ExecMe("update email set sent=now() where email_id=?", array($row['email_id']));
			}
		}
	}
	static function get_tinymce_script($obj) {
		$result="";
		$result.='
		<script src="js/tinymce/tinymce.min.js"></script>
		<script src="js/tinymce/jquery.tinymce.min.js"></script>
<script type="text/javascript">
tinymce.remove();
tinymce.init({
    selector: "'.$obj.'",
	inline:true,
	fontsize_formats: "8pt 9pt 10pt 11pt 12pt 26pt 36pt",
    theme: "modern",
    plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
    ],
    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
    toolbar2: "preview | forecolor backcolor emoticons",
    image_advtab: true,
	paste_retain_style_properties : "color background text-align font-size display",
	forced_root_block : false,
	force_br_newlines : true,
    force_p_newlines : false,

});
</script>';
	return $result;
	}
	static function is_leap_year($year)
	{
		return ((($year % 4) == 0) && ((($year % 100) != 0) || (($year %400) == 0)));
	}
	static function count_year($start_date, $end_date) {
		$year1=date('Y', $start_date);
		$year2=date('Y', $end_date);
		$leap=0;
		$count_year=0.0;
		for ($y=$year1;$y<=$year2;$y++) {
			$y2=mktime(0,0,0,12,31,$y);
			
			if (shared::is_leap_year($y)) {
				$test=mktime(0,0,0,2,29,$y);
				if ($start_date<=$test && $test<=$end_date) {
					$leap=1;
				}
			}
			$count_year++;
		}
		
		return $leap;
	}
	static function count_days($start_date, $end_date) {
		$year1=date('Y', $start_date);
		$year2=date('Y', $end_date);
		
	}
	
	static function get_date_diff($date1, $date2) { 
	
		if ($date1==null) return 0;
		if ($date2==null) return 0;
		$current = $date1; 
		$datetime2 = date_create($date2); 
		$count = 0; 
		while(date_create($current) < $datetime2){ 
			$current = gmdate("Y-m-d", strtotime("+1 day", strtotime($current))); 
			$count++; 
		} 
		return $count; 
	} 
	static function dateDiff ($start, $end) {
		if ($start==null) return 0;
		if ($end==null) return 0;
		return round((strtotime($end)-strtotime($start))/86400);
	}
	static function addYearOnly($d,$y) {
		$d=substr($d, 0, 10);
		$year=substr($d, 0,4);
		$year=$year+$y;
		$month=substr($d,5,2);
		$date=substr($d, 8); 
		
		return shared::fixDate($year, $month, $date);
	}
	static function addYear($d, $y) {	
		$d=substr($d, 0, 10);
		$year=substr($d, 0,4);
		$month=substr($d,5,2);
		$date=substr($d, 8)-1; 
		if ($date<=0) $date=$date-1;
		$year= $year+ $y;
		return shared::fixDate($year, $month, $date);
		
		
	}
	
	static function fixDate($year, $month, $date) {
		
		$v=0;
		if ($date==0) $date=-1;
		while ($date<=0) {
			$month=$month-1;
			if ($month==0) {
				$year=$year-1;
				$month=12;
			}
			if ($month==4||$month==6||$month==9||$month==11) {
				$date=31+$date;
			} else if ($month==2) {
				if (shared::is_leap_year($year)) {
					$date=30+$date;
				} else {
					$date=29+$date;
				}
			} else {
				$date=32+$date;
			}
			$v=1;
		} 
		
		if ($v==0) {
			$d=$year."-".shared::zerofill($month)."-".shared::zerofill($date);
			if ($date<29) return $d;
			if ($date<=31) {
				if ($month==1||$month==3||$month==5||$month==7||$month==8||$month==10) return $d;
			}
			
			if ($date<=30) {
				if ($month==4||$month==6||$month==9||$month==11) return $d;
			}
			if ($date<=29) {
				if ($month==2 && shared::is_leap_year($year)) return $d;
			}
						
			if ($month==4||$month==6||$month==9||$month==11) {
				$date=$date-30;
			} else if ($month==2) {
				if (shared::is_leap_year($year)) {
					$date=$date-29;
				} else {
					$date=$date-28;
				}
			} else {
				$date=$date-31;
			}
			$month=$month+1;
			
			if ($month==13) {
				$month=1;
				$year=$year+1;
			}
		}
		return $year."-".shared::zerofill($month)."-".shared::zerofill($date);
		
	}
	static function zerofill($int) {
		if (strlen($int)==1) return "0".$int;
		return $int;
	}
	static function addDate($d, $i) {
		$year=substr($d, 0,4);
		$month=substr($d, 5,2);
		$date=substr($d, 8)+$i;
		if ($date<=0) $date=$date-1;
		
		return shared::fixDate($year, $month, $date);
	}
	static function addArray(&$arr, $s, $v) {
		if (!isset($arr[$s])) $arr[$s]=array();
		array_push($arr[$s], $v);
	}
	static function validateEmpty($rs, $arr)  {
		foreach ($arr as $s) {
			if (strlen($rs[$s])<1) {
				return self::toggleCase($s)." can't be empty";
			}
		}
		return "";
	}
	static function toggleCase($s) {
		return ucwords(str_replace('_',' ',$s));
		
	}
	static function joinContractHistory($right, $left) {
		$s=" and $right.end_date=coalesce($left.am2_end_date, $left.contract2_end_date, $left.am1_end_date, $left.contract1_end_date)";
		return $s;		
	}
	static function calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
	, $am1_start_date, $am1_end_date
	, $contract2_start_date, $contract2_end_date
	, $am2_start_date, $am2_end_date) {
		
		$numDays=array();
		array_push($numDays, shared::dateDiff($contract1_start_date, $contract1_end_date));
		array_push($numDays, shared::dateDiff($am1_start_date, $am1_end_date));
		array_push($numDays, shared::dateDiff($contract2_start_date, $contract2_end_date));
		array_push($numDays, shared::dateDiff($am2_start_date, $am2_end_date));
		$sumDays= array_sum($numDays);
		$severance=0;
		$service=0;
		
		if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,1))>$sumDays) {
			$severance=$salary;
		} else if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,2))>$sumDays) {
			$severance=2*$salary;
		} else if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,3))>$sumDays) {
			$severance=3*$salary;
		} else {
			$severance=4*$salary;
			$service=2*$salary+0.15*$severance;
		}
		$housing=0.15*($severance+$service);
		$data['severance']=$severance;
		$data['service']=$service;
		$data['housing']=$housing;
		$data['numDays']=$numDays;
		return $data;
	}
	static function generate_key($key) {
		$_SESSION['key']=hash('ripemd128', $key, true);
		
	}
	static function encrypt($text, $key="") {
		if ($key=="") $key = $_SESSION['key'];
		$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
		$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		
		$ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key,
									 $text, MCRYPT_MODE_CBC,$iv);
		$ciphertext = $iv . $ciphertext;
		$rand=rand(0,255);
		$seed=1000;
		$enc="";
		while ($seed>0) {
			$i=rand(0,255);
			$enc.=chr($i);
			$seed-=$i;
		}
		$seed=-$seed;
		
		for ($i=0;$i<strlen($ciphertext);$i++) {
			$i2=ord($ciphertext[$i])+$seed;
			if ($i2>256) $i2=$i2-256;
			$seed=$i2;
			$enc.=chr($i2);
		}
		$enc=base64_encode($enc);
		return $enc;
	}
	static function decrypt($enc) {
		if ($enc==null) return "";
		$enc=base64_decode($enc);
		$seed=0;
		$i=0;
		while ($seed<1000) {
			$seed+=ord($enc[$i]);
			$i++;
		}
		
		$seed=$seed-1000;
		$dec="";
		
		for (;$i<strlen($enc);$i++) {
			$i2=ord($enc[$i])-$seed;
			$seed=ord($enc[$i]);
			if ($i2<0) $i2=$i2+256;
			$dec.=chr($i2);
		}
		
		$key = $_SESSION['key'];
		$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
		$iv = substr($dec, 0, $iv_size);
		$dec = substr($dec, $iv_size);
		$plaintext_dec = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $dec, MCRYPT_MODE_CBC, $iv));
		return $plaintext_dec;
	}
	static function genEncSalaryAll() {
		$res=db::DoQuery("select a.user_id, b.contract_history_id, b.salary from employee a
		inner join contract_history b on a.user_id=b.user_id");
		foreach ($res as $rs) {
			$sql="update contract_history set salary=? where contract_history_id=?";
			$salary=shared::encrypt($rs['salary']);
			db::ExecMe($sql, array($salary, $rs['contract_history_id']));
		}
	}
	static function genEncApplicantsSalary($user_id, $con) {
		$rs=db::select_one('applicants','*','user_id=?','', $con);
		
		$sql="update applicants set salary=? where user_id=?";
		db::ExecMe($sql, array(shared::encrypt($rs['salary']), $user_id), $con);
	}
	static function genEncSalaryByContractHistoryId($contract_history_id, $con=null) {
		$res=db::DoQuery("select a.user_id, a.salary from contract_history a where a.contract_history_id=?", array($contract_history_id), $con);

		foreach ($res as $rs) {
			$sql="update contract_history set salary=? where contract_history_id=?";
			$salary=shared::encrypt($rs['salary']);
			db::ExecMe($sql, array($salary, $contract_history_id), $con);
		}
	}
		
	static function generateEncSalary($user_id) {
		db::ExecMe("delete from salary_enc where user_id=?", array($user_id));
		$res=db::DoQuery("select a.user_id, b.contract_history_id, b.salary from employee a
		inner join contract_history b on a.user_id=b.user_id");
		foreach ($res as $rs) {
			$sql="insert into salary_enc(contract_history_id, user_id, salary_enc) values(?,?,?)";
			db::ExecMe($sql, array($rs['contract_history_id'], $user_id, shared::encrypt($rs['salary'])));
		}
	}

	static function generateEncSalaryByContractHistory($contract_history_id, $user_id, $con=null) {
		db::ExecMe("delete from salary_enc where contract_history_id=?", array($contract_history_id), $con);
		$res=db::DoQuery("select a.salary from contract_history a where a.contract_history_id=?", array($contract_history_id), $con);
		foreach ($res as $rs) {
			$sql="insert into salary_enc(contract_history_id, user_id, salary_enc) values(?,?,?)";
			db::ExecMe($sql, array($contract_history_id, $user_id, shared::encrypt($rs['salary'])), $con);
			db::ExecMe("update contract_history set salary=0 where contract_history_id=?", array($contract_history_id), $con);
		}
	}
	
	static function generateEncSalaryForEmployee() {
		$res=db::DoQuery("select a.user_id, b.contract_history_id, b.salary, c.pwd from employee a
		inner join contract_history b on a.user_id=b.user_id
		left join m_user c on c.user_id=a.user_id");
		foreach ($res as $rs) {
			db::ExecMe("delete from salary_enc2 where user_id=?", array($rs['user_id']));
			$sql="insert into salary_enc2(contract_history_id, user_id, salary_enc) values(?,?,?)";
			
			db::ExecMe($sql, array($rs['contract_history_id'], $rs['user_id'], shared::encrypt($rs['salary'], substr($rs['pwd'],0,32))));
		}
	}
	static function fixSalary($res, $field="") {
		if ($field=="") $field='salary';
		foreach($res as $key=>$rs) {
			$res[$key][$field]=shared::decrypt($rs[$field]);
		}
		return $res;
	}
	static function copyToData($res, $data, $arr) {
		foreach ($arr as $key) {
			$data[$key]=$res[$key];
		}
		return $data;
	}
	static function getId($type, $id) {
		if (!isset($_SESSION[$type][$id])) return "";
		$old_id=$_SESSION[$type][$id];
		return $old_id;
	}
	static function setId($session_name, $id_real, &$res) {
		unset($_SESSION[$session_name]);
		foreach ($res as $key=>$rs) {
			$id=shared::random(12);
			$_SESSION[$session_name][$id]=$rs[$id_real];
			$res[$key]['id']=$id;
		}
	}
	static function g_encrypt($text) {
		$text=str_replace("\n","", $text);
		$ciphertext = GibberishAES::enc($text, "giz_hrms_iskandar_tio");
		$enc=shared::g_enc_half($ciphertext);
		return $enc;
	}
	static function g_enc_half($ciphertext) {
		$rand=rand(0,255);
		$seed=1000;
		$enc="";
		while ($seed>0) {
			$i=rand(0,255);
			$enc.=chr($i);
			$seed-=$i;
		}
		$seed=-$seed;
		
		for ($i=0;$i<strlen($ciphertext);$i++) {
			$i2=ord($ciphertext[$i])+$seed;
			if ($i2>256) $i2=$i2-256;
			$seed=$i2;
			$enc.=chr($i2);
		}
		$enc=base64_encode($enc);
		return $enc;
	}
	static function g_dec_half($enc) {
		$enc=base64_decode($enc);
		$seed=0;
		$i=0;
		while ($seed<1000) {
			$seed+=ord($enc[$i]);
			$i++;
		}
		
		$seed=$seed-1000;
		$dec="";
		
		for (;$i<strlen($enc);$i++) {
			$i2=ord($enc[$i])-$seed;
			$seed=ord($enc[$i]);
			if ($i2<0) $i2=$i2+256;
			$dec.=chr($i2);
		}
		return $dec;
	}
	static function g_decrypt($enc) {
		if ($enc==null) return "";
		if ($enc=="") return "";
		$dec=shared::g_dec_half($enc);
		$plaintext_dec = GibberishAES::dec($dec, "giz_hrms_iskandar_tio");
		return $plaintext_dec;
	}
	static function setArr(&$z, $val) {
		if (!isset($z)) {
			$z=array();
		}
		array_push($z, $val);
	}
	static function create_menu($res) {
		$menu=array();
		foreach ($res as $rs) {
			if ($rs['sub_module']==1) continue;
			shared::setArr($menu[$rs['category_name']], $rs);
		}
		$result="";
		foreach ($menu as $key =>$val) {
			if (!isset($_SESSION['menu']['menu_'.$key]) || $_SESSION['menu']['menu_'.$key]=="true") {
				$result.="<span id='menu_".$key."'><img src='images/collapse_alt.png' class='btn_collapse' title='Collapse'/>$key</span><ul>";
			} else {
				$result.="<span id='menu_".$key."'><img src='images/expand_alt.png' class='btn_collapse' title='Expand'/>$key</span><ul style='display:none'>";
			}
			foreach ($val as $rs) {
				if ($rs['sub_module']==1) continue;
				$result.="<li class='".$rs['module_name']."'><a href='".$_SESSION['home_dir'].$rs['module_name']."'>".$rs['module_description']."</a></li>";
			}
			$result.="</ul>";
			
		}
		$result.="<a style='margin-left:20px' class='button_link' href='".$_SESSION['home_dir']."'>Logout</a>";
		
		return $result;
	}
	static function prepOM($om) {
		if ($om==1) {
			$res=db::select('project_location','*', 'office_manager=?','', array($_SESSION['uid']));
			$_SESSION['project_location']=array();
			foreach ($res as $rs) {
				array_push($_SESSION['project_location'], $rs['project_location']);
			}
			$_SESSION['in_project_location']= substr(str_repeat(",?", count($res)),1);
		} else {
			unset($_SESSION['project_location']);
			unset($_SESSION['in_project_location']);
		}
	}
	static function prepPA($pa) {
		if ($pa==1) {
			$res=db::select('project_name','*', 'principal_advisor=?','', array($_SESSION['uid']));
			$_SESSION['project_name']=array();
			foreach ($res as $rs) {
				array_push($_SESSION['project_name'], $rs['project_name']);
			}
			$_SESSION['in_project_name']= substr(str_repeat(",?", count($res)),1);
		} else {
			unset($_SESSION['project_name']);
			unset($_SESSION['in_project_name']);
		}
	}
	static function getKeyFromValue($data, $value) {
		foreach ($data as $key=>$val) {
			if ($val==$value)  {
				return $key;
			}
		}
		return $value;
	}
	static function setDataTable($res, $fields=array()) {
		if (count($res)==0) return "No Data";
		if (count($fields)==0) {
			foreach ($res[0] as $key=>$val) {
				array_push($fields, $key);
			}
		}
		$result="<table id='data_table' class='hidden'>";
		$result.="<tr>";
		foreach ($fields as $f) {
			$result.="<th>".proper($f)."</th>";
		}
		$result.="</tr>";
		foreach ($res as $row) {
			$result.="<tr>";
			foreach ($fields as $f) {
				if (strpos($f,'date') !== false) {
					$result.="<td>".substr($row[$f],0,10)."</td>";
				} else {
					$result.="<td>".$row[$f]."</td>";
				}
			}
			$result.="</tr>";
		}
		
		$result.="</table>";
		
		return $result;
	}
}