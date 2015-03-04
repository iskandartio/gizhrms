<?php

	$res=Vacancy::getCurrentVacancy();
	$vacancy_arr=array();
	foreach ($res as $rs) {
		$vacancy_arr[$rs['vacancy_id']]['vacancy']=$rs['vacancy'];
		$vacancy_arr[$rs['vacancy_id']]['next_vacancy_progress'][$rs['next_vacancy_progress_id']]=$rs['process_name'];
	}
	$res=array();
	foreach ($vacancy_arr as $key=>$val) {
		$arr['vacancy']=$val['vacancy'];
		$arr['vacancy_id']=$key;
		array_push($res, $arr);
	}
	
	$combo_vacancy=shared::select_combo_complete($res, 'vacancy_id', '- Vacancy -', 'vacancy');
	
	$js_vacancy_progress=json_encode($vacancy_arr);
	
?>
<script>
	var js_vacancy_progress=<?php _p($js_vacancy_progress)?>;
		
	$(function() {
		
		bindAll();
		
	});
	function bindAll() {
		bind('.btn_interview','click', Interview);
		bind('#vacancy_id','change', VacancyChange);
		bind('#next_vacancy_progress_id','change', VacancyProgressChange);
		fixSelect();
		if ($('#tbl_call_interview tbody').children().length>0) {
			$('#button').show();
		} else {
			$('#button').hide();
		}
	}
	function VacancyChange() {
		$('#next_vacancy_progress_id').empty();
		if ($(this).val()>0) {
			var arr=js_vacancy_progress[$(this).val()]['next_vacancy_progress'];
			for (key in arr) {
				$('#next_vacancy_progress_id').append("<option value='"+key+"'>"+arr[key]+"</option>");
			}
		}
		fixSelect();
		loadData();
	}
	function VacancyProgressChange() {
		loadData();
	}
	function loadData() {
		var data={}
		data['type']='shortlist';
		data['vacancy_id']=$('#vacancy_id').val();
		data['next_vacancy_progress_id']=$('#next_vacancy_progress_id').val();
		var success=function(msg) {
			$('#search_result').html(msg);
			if ($('#next_vacancy_progress_id  option:selected').html()=='Shortlist') {
				hideColumnsArr('tbl_filter_applicant', ['interview_place','interview_date','interview_time'],fields);
			}
			bindAll();
		}
		ajax("filter_applicantAjax.php", data, success);
	}
	function Interview() {
		var data={};
		data['type']='interviewall';
		prepareDataText(data, ['vacancy_id', 'next_vacancy_progress_id']);
		data['ask_reference']=$('#ask_reference').prop('checked') ? 1 : 0;
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
			} else {
				alert('Success');
				
				$.ajax({
					type : "post",
					url : "send_email.php"						
				});
				
			}
		}
		ajax("filter_applicantAjax.php", data, success);
	}

</script>
<div class='label'>Vacancy</div><div class='textbox'><?php _p($combo_vacancy);?></div>
<div class='label'>Vacancy Progress</div><div class='textbox'><select id='next_vacancy_progress_id'></select></div>
<div id='search_result'>
</div>
<div id='button'>
	<input type='checkbox' id='ask_reference'/><label for='ask_reference'>Ask for Reference</label>
	<button class='btn_interview'>Call for Interview</button> 
</div>