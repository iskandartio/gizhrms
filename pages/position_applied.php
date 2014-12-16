<?php
	function combo_vacancy($selected='') {
		$res=db::DoQuery("select a.vacancy_id, concat(a.vacancy_name,'(',a.vacancy_code,'-',a.vacancy_code2,')') vacancy from vacancy a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
where now() between a.vacancy_startdate and a.vacancy_enddate and ifnull(b.vacancy_progress_val,'')!='Closing'
order by vacancy_code",array($_SESSION['uid']));		
		$combo_vacancy=shared::select_combo($res,'vacancy_id','vacancy');
		return $combo_vacancy;
	}
	$pos=db::DoQuery("select a.job_applied_id, a.vacancy_id, b.vacancy_name from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where ifnull(c.vacancy_progress_val,'')!='Closing' and a.user_id=?",array($_SESSION['uid']));
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
		bind('#vacancy_id',"change", ShowJobDescription);
		$('#btn_apply').hide();
		<?php if (count($pos)==0) {
			_p("$('#tbl_job_applied').hide()");
		}?>
		
		bindAll();
		fixSelect();
	});
	function ShowJobDescription() {
		var data={};
		data['type']='show_job_desc';
		data['vacancy_id']=$('#vacancy_id').val();
		var success=function(msg) {
			$('#vacancy_description').html(msg);
			$('#tbl_question').hide();
			$('#btn_apply').hide();
			if (msg!='') {
				$('#btn_apply').html('Next');
				$('#btn_apply').show();
				bind('#btn_apply','click',ShowNext);
			}
			
		}
		ajax("applicantAjax.php", data, success);
	}
	function ShowNext() {
	
		ajaxShowNext($('#vacancy_id').val());
		
	}
	function Save() {};
	function Cancel() {};
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['job_applied_id']=getChild(par,'job_applied_id', main_fields);
		
		var success=function(msg) {
			$('#questions').html('');
			$('#btn_apply').hide();
			$('#vacancy_id').val(0);
			
			par.remove();
			if ($('#tbl_job_applied tbody tr').length==0) {
				$('#tbl_job_applied').hide();
			}
		}
		ajax("applicantAjax.php", data, success);
	};
	function Apply() {
		if (!validate_empty(['salary_expectation'])) return;
		var data={};
		data['type']='apply';
		data=prepareDataText(data, ['vacancy_id']);
		data=prepareDataDecimal(data, ['salary_expectation']);
		data['vacancy_id']=$('#vacancy_id').val();
		data=prepareDataCheckBox(data, ['negotiable']);
		var question=new Array();
		$('#tbl_question .question_id').each(function() {
			question.push(htmlDecode($(this).html()));
		});	
		data['question']=question;
		var answer=new Array();
		$('#tbl_question .cls_choice').each(function() {
			answer.push($(this).val());
		});	
		data['answer']=answer;
		var success=function(msg) {
			alert('Success');
			
			if (msg) {
				$('#tbl_job_applied').append(msg);
			}
			bindAll();
			$('#tbl_job_applied').show();
		}
		ajax("applicantAjax.php", data, success);
		
		
	}
	function Edit() {
		var par=$(this).closest("tr");
		var id=getChildHtmlSpanVal(par, 'vacancy_id', main_fields);
		
		$('#vacancy_id').val(id);
		ajaxShowNext(id);
		
	}
	
	function ajaxShowNext(val) {
		
		var data={};
		data['type']='show_next';
		data['vacancy_id']=val;
		var success=function(msg) {
			$('#questions').html(msg);
			hideColumns('tbl_question');
			After();
			fixSelect();
			numeric($('#salary_expectation'));
			
			
		}
		ajax("applicantAjax.php", data, success);
		
	}
	
	function After() {
		bind('.cls_choice',"change", ToggleApplyButton);
		
		ToggleApplyButton();
		$('#vacancy_description').html('');
		$('#btn_apply').html('Apply');
		$('#btn_apply').show();
		$('#tbl_question tbody tr').each(function(idx) {
			if ($(this).children("td:eq(2)").children("select").children("option:selected").val()==0) {
				$('#btn_apply').hide();
			}
		});
		
		bind('#btn_apply','click',Apply);
		
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
	<tr><th></th><th>Position Applied</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach ($pos as $row) {
		_p("<tr><td>".$row['job_applied_id']."</td><td><span style='display:none'>".$row['vacancy_id']."</span>".$row['vacancy_name']."</td>");
		_p("<td>".getImageTags(array('edit','delete'))."</td></tr>");
	} ?>
	</tbody>
</table>

<table>
<tr><td>Apply for</td><td>:</td><td><select id='vacancy_id' title='Position Applied'><option value=> - Position Applied - </option><?php _p(combo_vacancy())?></select></td></tr>
</table>
<span id="vacancy_description"></span>
<span id='questions'></span><br/>
<button class='button_link' id='btn_apply'>Apply</button>