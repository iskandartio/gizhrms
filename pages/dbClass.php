<?php
class db {
	static function Connect($db_str='db') {
		$db=$_SESSION[$db_str];
		$db_driver=$db[0];
		$db_uid=$db[1];
		$db_pwd=$db[2];
		$con=new PDO($db_driver, $db_uid, $db_pwd);
		$con->setAttribute(PDO::ATTR_ERRMODE,true); 
		$con->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
		$conn[0]=$con;
		$conn[1]=shared::random(32);
		return $conn;
	}
	
	static function DoQuery($query, $params=array(), $con=null) {
		
		if (!isset($con)) $con= db::Connect();
		
		$res=$con[0]->prepare($query);
		$res->execute($params);
		$result= $res->fetchAll(PDO::FETCH_ASSOC);
		foreach ($result as $k=>$row) {
			foreach ($row as $key=>$value) {
				$result[$k][$key]=shared::sanitize($row[$key]);
			}
		}
		
		return $result;
	}
	
	static function DoQueryOne($query, $params=array(), $con=null) {
		$res=db::DoQuery($query, $params, $con);
		if (count($res)>0) {
			return $res[0];
		} 
		return null;
	}
	static function DoQuerySingle($query, $params=array(), $con=null) {
		$res=db::DoQueryOne($query, $params, $con);
		return $res['v']; 
	}
	
	static function Log($logs) {
		if (is_array($logs)) {
			foreach ($logs as $log) {
				if (!isset($log)) $log='null';
				file_put_contents("log.txt", $log."\n", FILE_APPEND | LOCK_EX);
			}	
		} else {
			file_put_contents("log.txt", $logs."\n", FILE_APPEND | LOCK_EX);
		}
		
	}
	static function execMeDebug($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
	 	foreach ($params as &$v) { 
			if (isset($v)) {
				$v = str_replace("'","''",$v);
				$v="'$v'";
			} else {
				$v="null";
			}
		} 
	    $query = vsprintf(str_replace("?","%s",$query), $params );
		$res = $con->exec($query);
		
		if (substr($query,0,6)=='insert') {
			return $con->lastInsertId();
		}
		return $res->rowCount();
	}
	static function ExecMe($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
		$res=$con[0]->prepare($query);
		$res->execute($params);
		if (substr($query,0,6)=='insert') {
			return $con[0]->lastInsertId();
		}
		return $res->rowCount();
	}

	
	static function select($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		return db::DoQuery($s, $params, $con);
	}
	
	static function select_with_count($tbl, $where='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		$s="select count(*) c from $tbl $where";
		$rs=db::DoQuery($s, $params, $con);
		
		return $rs[0]['c'];
	}
	static function select_one($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		$res = db::DoQuery($s, $params, $con);	
		if (count($res)>0) return $res[0]; else return null;
	}
	
	static function select_single($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		$res = db::select_one($tbl, $fields, $where, $order, $params, $con);
		if (isset($res['v'])) return $res['v']; else return null;
	}
	
	static function insert($tbl, $fields, $params=array(), $con=null) {
		array_push($params, _lbl('uid', $_SESSION));
		$flag=0;
		if ($tbl!='change_log' && $con==null) {
			$con=db::beginTrans();
			$flag=1;
		}
		$s="insert into $tbl($fields, updated_by, created_at) values(".substr(str_repeat(',?', count($params)),1).", now())";
		$retValue= db::ExecMe($s, $params, $con);
		if ($tbl!='change_log') {
			$changes=array();
			$f=explode(",",$fields);
			$i=0;
			foreach ($f as $val) {
				$changes[trim($val)]=$params[$i];
				$i++;
			}
			if (count($changes)>0) {
				db::insert('change_log','trans_id, tbl, changes', array($con[1], $tbl, json_encode($changes)), $con);
			}
		}
		if ($tbl!='change_log' && $flag==1) {
			db::commitTrans($con);
		}
		return $retValue;
	}
	static function insertEasy($tbl, $post, $con=null) {
		
		$fields="";
		$count=0;
		$params=array();
		foreach($post as $key=>$value) {
			if (is_array($post[$key])) {
				continue;
			}
			if ($key=='type') {
				continue;
			}
			if ($key==$tbl.'_id') {
				continue;
			}
			$fields.=",".$key;
			$count++;
			if ($value=='') {
				array_push($params, null);
			} else {
				array_push($params, $value);
			}
		}
		$fields=substr($fields,1);
		
		return db::insert($tbl, $fields, $params, $con);
	}
	
	static function updateEasy($tbl, $post, $con=null) {
		$fields="";
		$count=0;
		$params=array();
		foreach($post as $key=>$value) {
			if ($key=='type') {
				continue;
			}
			if (is_array($post[$key])) {
				continue;
			}
			if ($key==$tbl.'_id') {
				$where="$key=".$value;
				continue;
			}
			$fields.=",".$key;
			$count++;
			if ($value=='') {
				array_push($params, null);
			} else {
				array_push($params, $value);
			}
		}
		$fields=substr($fields,1);
		return db::update($tbl, $fields, $where, $params, $con);
	}
	
	static function update($tbl, $fields, $where, $params=array(), $con=null) {
		$flag=0;
		if ($con==null) {
			$con=db::beginTrans();
			$flag=1;
		}
		$where_count=substr_count($where,"?");
		$params_changes=array_slice($params, count($params)-$where_count);
		$id=str_replace("m_","",$tbl."_id");
		$before=db::select($tbl,'*', $where, $id, $params_changes, $con);
		$keys="";
		foreach ($before as $val) {
			$keys.=",".$val[$id];
		}
		if ($keys!="") $keys="(".substr($keys,1).")";
		array_unshift($params, _lbl('uid', $_SESSION));
		$s="update $tbl set updated_by=?, ".str_replace(',','=?,', $fields)."=?";
		if ($where!='') $s.=" where $where";
		$i=db::ExecMe($s, $params, $con);
		
		$after=db::select($tbl,'*', $id." in ".$keys, $id, array(), $con);
		
		if (count($after)>0) {
			$changes=array();
			foreach ($before as $i=>$res) {
				foreach ($res as $key=>$val) {
					
					if ($key!='updated_at') {
						if ($val!=$after[$i][$key]) {
							if ($val==null) $val='null';
							$val2=$after[$i][$key];
							if ($val2==null) $val2='null';
							$changes[$key]= $val."->".$val2;
						}
					}
				}
			}
			db::Log($changes);
			if (count($changes)>0) {
				db::insert('change_log','trans_id, tbl, changes', array($con[1],$tbl, json_encode($changes)), $con);
			}
		}
		if ($flag==1) db::commitTrans($con);
		return $i;
	}

	static function updateShort($tbl, $where, $post, $con=null) {
		
		$fields='';
		$params=array();
		foreach ($post as $key=>$val) {
			if (is_array($val)) continue;
			if ($key=='type') continue;
			if ($key==$where) continue;
			if ($fields!='') $fields.=",";
			$fields.=$key;
			if ($val=='') {
				array_push($params, null);
			} else {
				array_push($params, $val);
			}
		}
		
		array_push($params, $post[$where]);
		$where=str_replace(',','=?,', $where)."=?";
		
		return db::update($tbl, $fields, $where, $params, $con);
	}
	
	static function delete($tbl, $where, $params=array(), $con=null) {
		$flag=0;
		if ($con==null) {
			$con=db::beginTrans();
			
			$flag=1;
		}
		$s="delete from $tbl where $where";
		$retValue=db::ExecMe($s, $params, $con);
		if ($retValue>0) {
			$del = vsprintf(str_replace("?","%s",$where), $params);
			
			db::insert('change_log', 'trans_id, tbl, changes', array($con[1], $tbl, "del where $del"), $con);
		}
		if ($flag==1) {
		
			db::commitTrans($con);
		}
		return $retValue;
		
	}
	static function beginTrans($db_str='db') {
		$con=db::Connect($db_str);
		$con[0]->beginTransaction();
		return $con;
	}
	static function commitTrans($con) {
		$conn=$con[0];
		$conn->commit();
		$conn=null;
	}
	static function rollbackTrans($con) {
		$conn=$con[0];
		$conn->rollBack();
		$conn=null;
	}
	static function select_required($tbl, $fields=array(), $params=array()) {
		$result=array();
		$filter='(1=0';
		foreach($fields as $field) {
			$filter.=" or trim(ifnull($field,''))=''"; 
		}
		$filter.=") and user_id=?";
		$s="select * from $tbl where $filter";
		$res= db::DoQuery($s, $params);
		foreach ($res as $row) {
			foreach($fields as $field) {
				if ($row[$field]=='') {
					array_push($result, $field);
				}
			}
		}
		return $result;
	}
	static function saveSimple($tbl, $post) {
		$id=$post[$tbl.'_id'];
		if ($id=='') {
			$id=db::insertEasy($tbl, $post);
		} else {
			db::updateEasy($tbl, $post);
		}
		return $id;
	}
	
	static function deleteSimple($tbl, $key) {
		db::delete($tbl, $tbl."_id=?", array($key));
	}
	static function mysql_aes_key($key)	{
		$new_key = str_repeat(chr(0), 16);
		for($i=0,$len=strlen($key);$i<$len;$i++)
		{
			$new_key[$i%16] = $new_key[$i%16] ^ $key[$i];
		}
		return $new_key;
	}
	static function aes_encrypt($val, $key)
	{
		$key = db::mysql_aes_key($key);
		$pad_value = 16-(strlen($val) % 16);
		$val = str_pad($val, (16*(floor(strlen($val) / 16)+1)), chr($pad_value));
		return mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $val, MCRYPT_MODE_ECB, mcrypt_create_iv( mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB), MCRYPT_DEV_URANDOM));
	}
	static function aes_decrypt($val)
	{
		$key = mysql_aes_key('Ralf_S_Engelschall__trainofthoughts');
		$val = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $val, MCRYPT_MODE_ECB, mcrypt_create_iv( mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB), MCRYPT_DEV_URANDOM));
		return rtrim($val, "..16");
	}
}

