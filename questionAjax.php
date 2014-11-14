<?php
	require_once("pages/startup.php");

	if (isset($_POST)) {
	
		
		if ($type=='search') {
			$res=db::select('question','question_id,question_val','question_val like ?','', array("%$question_filter%"));
			$r='<table id="tbl_question" class="tbl">';
			$r.="<thead><tr><th>Question ID</th><th>Question<th></th></tr></thead>";
			foreach ($res as $row) {
				$r.="<tr><td>".$row['question_id']."</td><td>".$row['question_val']."</td>";
				$r.="<td>".getImageTags(array('edit','delete'))."</td></tr>";
			}
			$r.="</table>";
			die($r);
		}
		if ($type=='get_choices') {
			$sql="select choice_id,choice_val from choice where question_id=?";
			$res=db::DoQuery($sql, array($question_id));
			$r='';
			
			foreach($res as $row) {
				$r.="<tr><td>".$row['choice_id']."</td><td>".$row['choice_val']."</td>";
				$r.="<td><img src='images/edit.png' class='btn_edit_choice'/>";
				$r.=" <img src='images/delete.png' class='btn_delete_choice'/></td></tr>";
			}
			die($r);
		}
		if ($type=='delete_choice') {
			$res=db::delete('choice','question_id=? and choice_id=?', array($question_id,$choice_id));
			die;
		}
		if ($type=='delete') {
			$res=db::delete('question','question_id=?', array($question_id));
			die;
		}
		if ($type=='save') {
			$res=db::select_one('question','question_id','question_id=?','', array($question_id));
			$con=db::beginTrans();
			if (count($res)==0) {
				$question_id=db::insertEasy('question', $_POST, $con);
			} else {
				db::updateEasy('question', $_POST, $con);
			}
			$i=0;
			$res=db::select('choice','choice_id','question_id=?','',array($question_id));
			$choices=array();
			foreach ($res as $row) {
				$choices[$row['choice_id']]=1;
			}
			$i=0;
			foreach ($_POST['choice_id'] as $choice) {
				$choice_id=$_POST['choice_id'][$i];
				if ($choice_id=='') {
					db::insert('choice','choice_val, question_id, sort_id', array($_POST['choice_val'][$i], $question_id, $i), $con);
				} else {
					db::update('choice','choice_val, sort_id', 'choice_id=?', array($_POST['choice_val'][$i], $i, $choice_id), $con);
				}
				if (isset($choices[$choice_id])) {
					unset($choices[$choice_id]);
				}
				$i++;
			}
			foreach ($choices as $key=>$val) {
				db::delete('choice','choice_id=?',array($key));
			}
			db::commitTrans($con);
			die($question_id);
		}
	}
?>