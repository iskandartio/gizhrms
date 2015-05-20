<?php

	$res=Vacancy::getAcceptEmployee();
	
	$combo_vacancy=shared::select_combo_complete($res, 'vacancy_id', '- Vacancy -', 'vacancy');
	
	
?>
<script>
	var ajaxPage='accept_employee_ajax';
	$(function() {
		
		bindAll();
		
	});
	function bindAll() {
		bind('.btn_accept','click', Accept);
		bind('#vacancy_id','change', VacancyChange);
		fixSelect();
		if ($('#tbl_call_interview tbody').children().length>0) {
			$('#button').show();
		} else {
			$('#button').hide();
		}
		bind('.btn_cancel', 'click', Cancel);
		hideColumns('tbl_call_interview');
	}
	function Cancel() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='cancel_interview';
		data['id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
				return;
			}
			par.remove();
		}
		ajax(ajaxPage, data, success);
	}
	function VacancyChange() {
		loadData();
	}
	function loadData() {
		var data={}
		data['type']='shortlist';
		data['vacancy_id']=$('#vacancy_id').val();
		data['vacancy_progress_val']='Closing';
		var success=function(msg) {
			$('#search_result').html(msg);
			bindAll();
		}
		ajax(ajaxPage, data, success);
	}
	function Accept() {
		var data={};
		data['type']='closing';
		prepareDataText(data, ['vacancy_id']);
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
			} else {
				alert('Success');
				$('#tbl_call_interview').empty();
			}
			send_email();
		}
		ajax(ajaxPage, data, success);
	}

</script>
<div class='label'>Vacancy</div><div class='textbox'><?php _p($combo_vacancy);?></div>
<div id='search_result'>
</div>
<div id='button'>
	<button class='button_link btn_accept'>Accept as Employee</button> 
</div>