<?php
	$res_question=db::select('question','question_id, question_val','','question_val');
	
	
?>

<script>
	var fields=generate_assoc(['vacancy_id','vacancy_code','vacancy_code2','vacancy_name', 'vacancy_description', 'vacancy_startdate', 'vacancy_enddate']);
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
	});
	function Add() {
		currentRow=-1;
		clearText(['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate']);
		clear_checkbox('question_id');
		$('#btn_save').html('Save');
	}
	function Edit() {
		currentRow=$(this).closest("tr").index();
		edit_data();
		
	}
	function edit_data() {
		var obj=$('#tbl_vacancy tbody tr:eq('+currentRow+')');
		inputText(obj, ['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate']);
		$('#btn_save').html('Update');
		data={};
		data['type']='get_questions';
		data['vacancy_id']=$('#vacancy_id').val();
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data: $.param(data),
			success: function(msg) {
				clear_checkbox('question_id');
				var question_id = jQuery.parseJSON(msg);
				$(question_id).each(function(idx, val) {
					$('#question_id_'+val).prop('checked',true);
				});
			}
		});
	}
	
	function Delete() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['vacancy_id']=getChild(par, 'vacancy_id');
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data: $.param(data),
			success: function(msg) {
				alert("Success");
				par.remove();
				Add();
			}
		});
	}
	function Cancel() {
	}
	function Save() {
		if (!validate_empty(['vacancy_code','vacancy_code2', 'vacancy_name','vacancy_description','vacancy_start','vacancy_end'])) return;	
		var data={};
		data['type']='save';
		data=prepareDataText(data,['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate']);
		var question_id= new Array();
		$.each($( "input[id^='question_id_']" ), function(idx) {
			if ($(this).prop('checked')) {
				question_id.push($(this).attr('id').replace("question_id_",""));	
				
			}
			
		});
		data['question_id']=question_id;
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:$.param(data),
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				tbl='tbl_vacancy';
				if (currentRow>=0) {
					setHtmlAllText(tbl, ['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_description','vacancy_startdate', 'vacancy_enddate']);
					
					
				} else {
					$('#vacancy_id').val(msg);
					adder='<tr><td>';
					adder+=msg+"</td>"; 
					adder+='<td></td><td></td><td></td><td></td><td></td><td></td>';
					adder+='<td><?php _p(getImageTags(array('edit','delete')))?></td>';
					adder+='</tr>';	
					currentRow=$('#tbl_vacancy tbody').children().length;
					
					$('#tbl_vacancy tbody').append(adder);
					setHtmlAllText(tbl, ['vacancy_id','vacancy_code','vacancy_code2','vacancy_name','vacancy_description','vacancy_startdate', 'vacancy_enddate']);
					
					bindAll();
					$('#btn_save').html('Update');
					
				}
				edit_data();
			}
		});
		
	}
	function Search() {
		var data={};
		data['type']='search';
		data['date_filter']=$('#date_filter').val();
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:$.param(data),
			success: function(msg) {
				$('#search_result').html(msg);
				bindAll();
				
			}
		});
	}
</script>
<?php _t("date_filter") ?>
<button class="button_link" id="btn_search">Search</button>
<div id="search_result"></div>
<button class="button_link" id="btn_add">Add New</button>
<table id='input_vacancy'>
<tr><td>Vacancy ID</td><td>:</td><td><?php _t("vacancy_id")?></td></tr>
<tr><td>Vacancy Code *</td><td>:</td><td><?php _t("vacancy_code")?> <?php _t("vacancy_code2")?></td></tr>
<tr><td>Vacancy Name *</td><td>:</td><td><?php _t("vacancy_name")?></td></tr>
<tr><td>Vacancy Description *</td><td>:</td><td><textarea id="vacancy_description" cols="30" rows="3"></textarea></td></tr>
<tr><td>Vacancy Start *</td><td>:</td><td><?php _t("vacancy_startdate")?></td></tr>
<tr><td>Vacancy End *</td><td>:</td><td><?php _t("vacancy_enddate")?></td></tr>

<tr><td>Questions</td><td>:</td><td>
<?php 
	foreach ($res_question as $row) {
		_p("<input type='checkbox' id='question_id_".$row['question_id']."' value='".$row['question_id']."'/> <label for='question_id_".$row['question_id']."'>".$row['question_val']."</label>");
	}
?>
</td></tr>
</table>
<button class="button_link" id="btn_save">Save</button>