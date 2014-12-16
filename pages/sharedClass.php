<?php
class shared {
	static function get_session($data, $def) {
		if (!isset($_SESSION[$data])) return $def;
		return $_SESSION[$data];
	}
	static function validate_download($user_id, $uid, $role_name) {
		if ($user_id==$uid || $role_name==$user_id) return $user_id;
		$res=db::DoQuery("select a.employee_id from vacancy_employee a
inner join vacancy b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id>b.vacancy_progress_id
inner join job_applied c on c.vacancy_id=a.vacancy_id and c.user_id=?
where a.employee_id=?", array($user_id, $uid));
		if (count($res)>0) return $user_id;
		return 0;
	}
	static function email($email_type, $params, $con=null) {
		db::Log($params);
		$e=db::select_one("email_setup","*","email_type='$email_type'","",array(), $con);
		foreach ($params as $key=>$val) {
			$e['email_to']=str_replace("@$key", $val, $e['email_to']);
			$e['email_cc']=str_replace("@$key", $val, $e['email_cc']);
			$e['email_bcc']=str_replace("@$key", $val, $e['email_bcc']);
			$e['email_subject']=str_replace("@$key", $val, $e['email_subject']);
			$e['email_content']=str_replace("@$key", $val, $e['email_content']);
		}
		db::Log($e);
		if (isset($e) && $e['email_content']!="") {
			db::insert("email", "email_from, email_to, email_cc, email_bcc, email_subject, email_content"
				, array($e['email_from'], $e['email_to'], $e['email_cc'], $e['email_bcc'], $e['email_subject'], $e['email_content']), $con);
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
		
			return "<img src='captcha.php'/><p>Input the word above:</br><input type='text' id='captcha_text'/>";
			
		}
		return "";
	}
	static function select_combo($res, $id, $val='', $selected='') {
-		$result='';
		if ($val=='') $val=$id;
		foreach ($res  as  $row) {
			$result.="<option value='".$row[$id]."'".($selected==$row[$id] ? "selected" : "").">".$row[$val]."</option>";
		}
		return $result;
	}
	static function select_combo_complete($res, $id, $def, $val='', $selected='') {
		$result="<select id=$id><option value=''>$def</option>".shared::select_combo($res, $id, $val, $selected)."</select>";
		return $result;
	}
	static function sanitize($tag) {
	
		//$tag= str_replace("</span","&lt;/span", $tag);
		$tag= str_replace("<input","&lt;input", $tag);
		$tag= str_replace("<textarea","&lt;textarea", $tag);
		
		//$tag= str_replace("'","&#39;", $tag);
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
					$tag_validate=substr($tag_validate,1);
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
		unset($_SESSION["tbl_$tbl"]);
		if (!isset($_SESSION["tbl_$tbl"])) {
			$res=db::select($tbl,"$tbl"."_id, $tbl"."_val");
			$result=array();
			foreach($res as $row) {
				$result[$row["$tbl"."_id"]]=$row["$tbl"."_val"];
				
				
			}
			$_SESSION["tbl_$tbl"]=$result;
		}
		if (!isset($_SESSION["tbl_$tbl"][$id])) {
			return null;
		}
		return $_SESSION["tbl_$tbl"][$id];
	}
	static function create_checkbox($id, $label, $selected) {
		$selected= $selected==0 ? '' : 'checked';
		return "<input type='checkbox' id='$id' $selected/><label for='$id'>$label</label>";
	}
	static function send_all_email() {
		$res=db::select('email','*','sent=0');
		foreach ($res as $row) {
			if (SendEmail::send_email($row['email_to'], $row['email_subject'], $row['email_content'])) {
				db::ExecMe("update email set sent=now() where email_id=?", array($row['email_id']));
			}
		}
	}
	static function get_tinymce_script($obj) {
		$result="";
		$result.='
		<script src="js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
tinymce.init({
    selector: "div#'.$obj.'",
	inline:true,
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
		$current = $date1; 
		$datetime2 = date_create($date2); 
		$count = 0; 
		while(date_create($current) < $datetime2){ 
			$current = gmdate("Y-m-d", strtotime("+1 day", strtotime($current))); 
			$count++; 
		} 
		return $count; 
	} 
}