<?php


	function combo_position_applied($selected='') {
		$res=db::DoQuery('select a.vacancy_id, concat(a.vacancy_name,"(",a.vacancy_code,")") vacancy from vacancy a
where now() between vacancy_startdate and vacancy_enddate
order by vacancy_code',array($_SESSION['uid']));
		
		$combo_position_applied=shared::select_combo($res,'vacancy_id','vacancy');
		return $combo_position_applied;
	}
	$pos=db::DoQuery('select a.job_applied_id, a.description, a.vacancy_id, b.vacancy_name from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id where user_id=?',array($_SESSION['uid']));
	$required=db::select_required('applicants', array('first_name','last_name','place_of_birth','date_of_birth'), array($_SESSION['uid']));
	$err='';
	if (count($required)>0) {
		$err="You must complete the required field(s):<br/>";
	}
	foreach($required as $r) {
		if ($r=='first_name') {
			$err.="First Name<br/>";
		} else if ($r=='last_name') {
			$err.="Last Name<br/>";
		} else if ($r=='place_of_birth') {
			$err.="Place of Birth<br/>";
		} else if ($r=='date_of_birth') {
			$err.="Date of Birth<br/>";
		}
	}
?>
<script>
	var fields=generate_assoc(['question_id']);
	var main_fields=generate_assoc(['job_applied_id', 'vacancy_id', 'btn']);
	var table='tbl_job_applied';
	$(function() {
		bind('#position_applied',"change", ChangeQuestion);
		$('#btn_apply').hide();
		bind('#btn_apply','click',Apply);
		<?php if (count($pos)==0) {
			_p("$('#tbl_job_applied').hide()");
		}?>
		
		bindAll();
	});
	function Save() {};
	function Cancel() {};
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		data='type=delete&job_applied_id='+getChild(par,'job_applied_id', main_fields);
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				$('#questions').html('');
				$('#btn_apply').hide();
				$('#position_applied').val(0);
				
				par.remove();
				if ($('#tbl_job_applied tbody tr').length==0) {
					$('#tbl_job_applied').hide();
				}
			}
		});
	};
	function Apply() {
		var data='type=apply&vacancy_id='+$('#position_applied').val();
		$('#tbl_question .question_id').each(function() {
			data+='&question[]='+$(this).html();
		});	
		$('#tbl_question .cls_choice').each(function() {
			data+='&answer[]='+$(this).val();
		});	
		$('#freeze').show();		
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data:data,
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				
				if (msg) {
					$('#tbl_job_applied').append(msg);
				}
				bindAll();
				$('#tbl_job_applied').show();
			}
		});
		
	}
	function Edit() {
		var par=$(this).closest("tr");
		var id=getChildHtmlSpanVal(par, 'vacancy_id', main_fields);
		
		$('#position_applied').val(id);
		ajaxChangeQuestion(id);
		
	}
	function ChangeQuestion() {
		ajaxChangeQuestion($(this).val());
		
	}
	function ajaxChangeQuestion(val) {
		$('#freeze').show();
		$.ajax({
			type : 'post',
			url : 'applicantAjax.php',
			data : 'type=change_question&vacancy_id='+val, 
			success : function(msg) {
				$('#freeze').hide();
				$('#questions').html(msg);
				hideColumns('tbl_question');
				After();
			}
		});
	}
	
	function After() {
		bind('.cls_choice',"change", ToggleApplyButton);
		
		ToggleApplyButton();
	}
	
	function ToggleApplyButton() {
		
		flag=false;
		$('#btn_apply').hide();
		$( "select[id^='choice']" ).each(function(index) {
		
			
			if ($(this).val()==0) {
				flag=false;
				return;
			} else {
				flag=true;
			}
			
		});
		
		if (flag) $('#btn_apply').show();
	}
	
</script>
<?php _p($err)?>
<table class='tbl' id='tbl_job_applied'>
	<thead>
	<tr><th></th><th>Position Applied</th><th>Job Description</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach ($pos as $row) {
		_p("<tr><td>".$row['job_applied_id']."</td><td><span style='display:none'>".$row['vacancy_id']."</span>".$row['vacancy_name']."</td>");
		_p("<td>".$row['description']."</td>");
		_p("<td>".getImageTags(array('edit','delete'))."</td></tr>");
	} ?>
	</tbody>
</table>

<table>
<tr><td>Apply for</td><td>:</td><td><select id='position_applied'><option value=> - Position Applied - </option><?php _p(combo_position_applied())?></select></td></tr>
</table>
<span id='questions'></span>
<button class='button_link' id='btn_apply'>Apply</button>