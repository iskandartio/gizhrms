<?php
	$res_question=db::select('question','question_id, question_val','','question_val');
	$res=db::select('vacancy_type','vacancy_type','','vacancy_type');
	$vacancy_type_options=shared::select_combo_complete($res, 'vacancy_type','- Vacancy Type -');
?>
<?php _p(shared::get_tinymce_script("#vacancy_description"));?>

<script>
	var fields=generate_assoc(['vacancy_id','vacancy_code','vacancy_code2','vacancy_name', 'vacancy_description', 'vacancy_criteria', 'vacancy_startdate', 'vacancy_enddate','vacancy_type','allowance']);
	var field_question=generate_assoc(['question_id','btn']);
	var table='tbl_vacancy';
	var currentRow=-1;
	$(function() {
		
		bind('#btn_add',"click", Add);
		bind('#btn_save',"click", Save);
		bind('#btn_search',"click", Search);
		
		setDatePicker();
		$('#date_filter').val('<?php _p(date('d-m-Y'))?>');
		$('#date_filter').change(function()  {
			
			Search();
		});
		Search();
		$('#input_vacancy tr:eq(0)').hide();
		fixSelect();
		numeric($('#allowance'));
	});
	function Add() {
		currentRow=-1;
		clearText(['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_startdate','vacancy_enddate','vacancy_type','allowance','vacancy_criteria']);
		clearDiv(['vacancy_description']);
		clear_checkbox('.question_id');
		$('#btn_save').html('Save');
		fixSelect();
	}
	function Edit() {
		currentRow=$(this).closest("tr").index();
		edit_data();
		
	}
	function edit_data() {
		var obj=$('#tbl_vacancy tbody tr:eq('+currentRow+')');
		inputText(obj, ['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_startdate','vacancy_enddate','allowance', 'vacancy_criteria'], fields);
		inputSelect(obj, ['vacancy_type'], fields);
		inputDiv(obj, ['vacancy_description'], fields);
		$('#btn_save').html('Update');
		data={};
		data['type']='get_questions';
		data['vacancy_id']=$('#vacancy_id').val();
		var success=function(msg) {
			clear_checkbox('.question_id');
			var question_id = jQuery.parseJSON(msg);
			$(question_id).each(function(idx, val) {
				$('.question_id[value="'+val+'"]').prop('checked', true);
				
			});
			fixSelect();
		}
		ajax("vacancy_ajax", data, success);
	}
	
	function Delete() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['vacancy_id']=getChild(par, 'vacancy_id', fields);
		var success=function(msg) {
			
			par.remove();
			Add();
		}
		ajax("vacancy_ajax", data, success);
		
	}
	function Cancel() {
	}
	function Save() {
		if (!validate_empty(['vacancy_code','vacancy_code2', 'vacancy_name','vacancy_start','vacancy_end','vacancy_type','allowance', 'vacancy_criteria'])) return;	
		var data={};
		data['type']='save';
		data=prepareDataText(data,['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_startdate','vacancy_enddate','vacancy_type','vacancy_criteria']);
		data=prepareDataDecimal(data,['allowance']);
		data=prepareDataHtml(data,['vacancy_description']);
		var question_id= new Array();
		$('.question_id').each(function(idx) {
			if ($(this).prop('checked')) {
				question_id.push($(this).attr('value'));	
			}
		});
		data['question_id']=question_id;
		
		var success=function(msg) {
			$('#freeze').hide();
			
			tbl='tbl_vacancy';
			if (currentRow>=0) {
				
				
			} else {
				$('#vacancy_id').val(msg);
				adder='<tr><td>';
				adder+=msg+"</td>"; 
				adder+='<td></td><td></td><td></td><td style="display:none"></td><td style="display:none"></td><td></td><td></td><td></td><td></td>';
				adder+="<td><?php _p(getImageTags(array('edit','delete')))?></td>";
				adder+='</tr>';	
				currentRow=$('#tbl_vacancy tbody').children().length;
				
				$('#tbl_vacancy tbody').append(adder);
				
				bindAll();
				$('#btn_save').html('Update');
				
			}
			setHtmlAllText(tbl, ['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_startdate', 'vacancy_enddate','allowance','vacancy_criteria']);
			setHtmlAllDiv(tbl, ['vacancy_description']);
			setHtmlAllSelect(tbl, ['vacancy_type']);		
			edit_data();
		}
		ajax("vacancy_ajax", data, success);
	}
	function Search() {
		var data={};
		data['type']='search';
		data['date_filter']=$('#date_filter').val();
		var success=function(msg) {
			$('#search_result').html(msg);
			bindAll();
			
		}
		ajax("vacancy_ajax", data, success);
		
	}
</script>
<?php _t("date_filter") ?>
<button class="button_link" id="btn_search">Search</button>
<div id="search_result"></div>
<button class="button_link" id="btn_add">Add New</button>
<table id='input_vacancy'>
<tr><td width='130px'>Vacancy ID</td><td>:</td><td><?php _t("vacancy_id")?></td></tr>
<tr><td>Vacancy Code *</td><td>:</td><td><?php _t("vacancy_code")?> <?php _t("vacancy_code2")?></td></tr>
<tr><td>Vacancy Name *</td><td>:</td><td><?php _t("vacancy_name")?></td></tr>
<tr><td>Vacancy Description *</td><td>:</td><td><div id="vacancy_description" style="border-style:dotted"></div></td></tr>
<tr><td>Questions for<br>Reference Check *</td><td>:</td><td><textarea id='vacancy_criteria' style='width:90%;height:50px'></textarea></td></tr>
<tr><td>Vacancy Start *</td><td>:</td><td><?php _t("vacancy_startdate")?></td></tr>
<tr><td>Vacancy End *</td><td>:</td><td><?php _t("vacancy_enddate")?></td></tr>
<tr><td>Vacancy Type *</td><td>:</td><td><?php _p($vacancy_type_options)?></td></tr>
<tr><td>Additional Allowance *</td><td>:</td><td><?php _t("allowance")?></td></tr>

<tr><td>Questions</td><td>:</td><td>
<?php 
	foreach ($res_question as $row) {
		_p(shared::create_checkbox('question_id', $row['question_val'], 0, $row['question_id']));
	}
?>
</td></tr>
</table>
<button class="button_link" id="btn_save">Save</button>