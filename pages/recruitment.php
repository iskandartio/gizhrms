<?php
	
?>
<script>
	var fields=generate_assoc(['vacancy_id','vacancy_progress_id','vacancy','vacancy_progress','#applicants','btn']);
	var fields_detail=generate_assoc(['user_id','first_name','last_name','dtl','ranking_id','user_comment','btn']);
	var ajaxPage='recruitment_ajax';
	$(function() {
		loadData();
	});
	function bindHeader() {
		bind('.btn_search','click', Search);
		hideColumnsArr('tbl_recruitment',['vacancy_id','vacancy_progress_id'], fields);
	}
	function loadData() {
		var data={}
		data['type']='getAll';
		var success=function(msg) {
			$('.vacancy_list').html(msg);
			bindHeader();
		}
		ajax(ajaxPage,data, success);
	}
	function bindTblDetail() {
		bind('.btn_detail','click', PopupDetail);
		bind('.btn_save','click', Save);
		$('#popup_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		hideColumnsArr('tbl_recruitment_detail',['user_id'], fields_detail);
		fixSelect();
	}
	function Search() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='search';
		data=prepareDataHtml(data, ['vacancy_id','vacancy_progress_id'], par, fields);
		var success=function(msg) {
			$('.applicant_list').html(msg);
			bindTblDetail();
		}
		ajax(ajaxPage,data, success);
	}
	function PopupDetail() {
		var data={};
		data['type']='show_detail';
		data['user_id']=getChildHtml($(this).closest("tr"), 'user_id', fields_detail);
		data['vacancy_id']=$('.vacancy_id','.applicant_list').val();
		var success=function(msg) {
			$('#popup_detail').html(msg);
			
			$('#popup_detail').dialog("open");
			
		};
		ajax(ajaxPage, data, success);
	}
	function Save() {
		var f=fields_detail;
		var par=$(this).closest("tr");
		var data={}
		data['type']='save';
		data=prepareDataText(data,['ranking_id','user_comment'], par, f);
		data=prepareDataHtml(data,['user_id'], par, f);
		data=prepareDataMultiInput(data, ['vacancy_id','vacancy_employee_id'], '.applicant_list');
		
		var success=function(msg) {
			if (msg!='') alert(msg);
		}
		ajax(ajaxPage, data, success);
	}
</script>
<div class='vacancy_list'></div>
<div class='applicant_list'></div>
<div id="popup_detail"></div>