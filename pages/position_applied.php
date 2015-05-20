<?php
	
	function combo_vacancy($selected='') {
		$res=db::DoQuery("select a.vacancy_id, concat(a.vacancy_name,'(',a.vacancy_code,'-',a.vacancy_code2,')') vacancy from vacancy a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
where curdate() between a.vacancy_startdate and a.vacancy_enddate 
order by vacancy_code");		
		$combo_vacancy=shared::select_combo($res,'vacancy_id','vacancy');
		return $combo_vacancy;
	}
	$pos=db::DoQuery("select a.job_applied_id, a.vacancy_id, b.vacancy_name from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where curdate() between b.vacancy_startdate and b.vacancy_enddate and a.user_id=?",array($_SESSION['uid']));
	
	$required=Applicant::validateApply();
	$err='';
	if (count($required)>0) {		
		foreach($required as $r) {
		$err.="<li>".shared::toggleCase($r)."</li>";
	}
	}
	if (db::select_with_count('applicants_education','user_id=?', array($_SESSION['uid']))==0) {
		$err.="<li>Education</li>";
	}
	if (db::select_single('applicants','no_working_exp v','user_id=?','', array($_SESSION['uid']))==1) {
	} else {
		if (db::select_with_count('applicants_working','user_id=?', array($_SESSION['uid']))==0) {
			$err.="<li>Working Experience</li>";
		}
	}
	if (db::select_with_count('applicants_language','user_id=? and language_skill_id>0', array($_SESSION['uid']))<3) {
		$err.="<li>Language (You must fill 3 languages)</li>";
	}
	if (db::select_with_count('applicants_reference','user_id=?', array($_SESSION['uid']))<1) {
		$err.="<li>Reference</li>";
	}
	
	if ($err!=''){
		$err="You must complete the required data:<br/>".$err;
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
			$('#questions').hide();
			$('#btn_apply').hide();
			if (msg!='') {
				$('#btn_apply').html('Next');
				$('#btn_apply').show();
				bind('#btn_apply','click',ShowNext);
			}
			
		}
		ajax("applicant_ajax", data, success);
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
		ajax("applicant_ajax", data, success);
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
			var d=jQuery.parseJSON(msg);
			if (d['err']!='') {
				alert(d['err']);
				return;
			}
			
			
			$('#tbl_job_applied').append(d['data']);
			
			bindAll();
			$('#tbl_job_applied').show();
			
		}
		ajax("applicant_ajax", data, success);
		
		
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
			$('#questions').show();
			hideColumns('tbl_question');
			After();
			numeric($('#salary_expectation'));
			fixSelect();
			
			
		}
		ajax("applicant_ajax", data, success);
		
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
<font color='red'><?php _p($err)?></font>
<?php if ($err=='') {?>
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
<?php }?>