<?php
class shared {
	static function select_combo($res, $id, $val='', $selected='') {
-		$result='';
		if ($val=='') $val=$id;
		foreach ($res  as  $row) {
			$result.="<option value='".$row[$id]."'".($selected==$row[$id] ? "selected" : "").">".$row[$val]."</option>";
		}
		return $result;
	}
	static function sanitize($tag) {
	
		$tag= str_replace("</span","&lt;/span", $tag);
		$tag= str_replace("<input","&lt;input", $tag);
		$tag= str_replace("<textarea","&lt;textarea", $tag);
		
		$tag= str_replace("'","&#39;", $tag);
		$tag= str_replace('"',"&#34;", $tag);
		
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
}

