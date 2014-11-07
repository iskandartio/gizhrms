<?php
	$res=db::select('question','question_id, question','','question');
	$combo_question=shared::select_combo($res,'question_id', 'question');
?>

<script>
	var fields=generate_assoc(['vacancy_id','vacancy_code','vacancy_name', 'vacancy_description', 'vacancy_startdate', 'vacancy_enddate','vacancy_closedate']);
	var field_question=generate_assoc(['question_id','btn']);
	var table='tbl_vacancy';
	var currentRow=-1;
	$(function() {
		bind('#btn_add',"click", Add);
		bind('#btn_save',"click", Save);
		bind('#btn_search',"click", Search);
		bind('#btn_add_question',"click", AddQuestion);
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
		clearText(['vacancy_id','vacancy_code','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate','vacancy_closedate']);
		$('#tbl_question tbody').empty();
	}
	function Edit() {
		currentRow=$(this).closest("tr").index();
		edit_data();
		
	}
	function edit_data() {
		var obj=$('#tbl_vacancy tbody tr:eq('+currentRow+') td:eq(1)');
		inputText(obj, ['vacancy_id','vacancy_code','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate','vacancy_closedate']);
		$('#btn_save').html('Update');
		
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:'type=get_questions&vacancy_id='+$('#vacancy_id').val(),
			success: function(msg) {
				$('#tbl_question tbody').empty();
				$('#tbl_question tbody').append(msg);
				bind('.btn_delete_question',"click", DeleteQuestion);
				setDatePicker();
			}
		});
	}
	function DeleteQuestion() {
		par=$(this).closest("tr");
		par.remove();
		
	}
	function SaveQuestion() {
		if (!validate_question(this)) {
			
			return;
		}
		par=$(this).closest("tr");
		if (getChild(par,'question_id', field_question)=='') {
			par.remove();
			return;
		}
		selectedToLabel(par, 'question_id', field_question);
		setHtmlText(par, 'btn', "<img src='images/delete.png' class='btn_delete_question'/>", field_question);
		bind('.btn_delete_question',"click", DeleteQuestion);
	}
	function AddQuestion() {
		var a="<tr><td>";
		a+="<select class='question_id' id='question_id'><option value=''>-Question-</option>";
		a+="<?php _p($combo_question)?>";
		a+='</select>';
		a+="</td><td><img src='images/save.png' class='btn_save_question'/> <img src='images/delete.png' class='btn_delete_question'/></td></tr>";
		$('#tbl_question tbody').append(a);
		
		bind('.question_id','change',ValidateQuestion);
		bind('.btn_save_question',"click", SaveQuestion);
		bind('.btn_delete_question',"click", DeleteQuestion);
	}
	function ValidateQuestion() {
		validate_question(this);
	}
	function validate_question(obj) {
		var par=$(obj).closest("tr");
		var f=true;
		current_idx=par.index();
		
		current_val=getChild(par, 'question_id', field_question);
		par=$('#tbl_question tbody tr');
		$.each(par, function(idx) {
			
			if (idx!=current_idx) {
				v=getChild($(this), 'question_id', field_question);
				if (v==current_val) {
					alert('Question already exists!');
					f=false;
					return false;
				}
			}
		});
		
		return f;
		
	}
	function Delete() {
		var par=$(this).closest("tr");
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:'type=delete&vacancy_id='+getChild(par, 'vacancy_id'),
			success: function(msg) {
				alert("Success");
				par.remove();
			}
		});
	}
	function Cancel() {
	}
	function Save() {
		
		data='type=save';
		data=prepareDataText(data,['vacancy_id','vacancy_code','vacancy_name','vacancy_description','vacancy_startdate','vacancy_enddate','vacancy_closedate']);
		$.each($('#tbl_question tbody tr'), function(idx) {
			v=getChild($(this), 'question_id', field_question);
			data+="&question_id[]="+v;
		});
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:data,
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				tbl='tbl_vacancy';
				if (currentRow>=0) {
					setHtmlAllText(tbl, ['vacancy_id','vacancy_code','vacancy_name','vacancy_description','vacancy_startdate', 'vacancy_enddate', 'vacancy_closedate']);
					
					
				} else {
					$('#vacancy_id').val(msg);
					adder='<tr><td>';
					adder+=msg+"</td>"; 
					adder+='<td></td><td></td><td></td><td></td><td></td>';
					adder+='<td><?php _p(getImageTags(array('edit','delete')))?></td>';
					adder+='</tr>';	
					currentRow=$('#tbl_vacancy tbody').children().length;
					
					$('#tbl_vacancy tbody').append(adder);
					setHtmlAllText(tbl, ['vacancy_id','vacancy_code','vacancy_name','vacancy_description','vacancy_startdate', 'vacancy_enddate', 'vacancy_closedate']);
					
					bindAll();
					$('#btn_save').html('Update');
					
				}
				edit_data();
			}
		});
		
	}
	function Search() {
		$.ajax({
			type:'post',
			url:'vacancyAjax.php',
			data:'type=search&date_filter='+$('#date_filter').val(),
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
<tr><td>Vacancy Code</td><td>:</td><td><?php _t("vacancy_code")?></td></tr>
<tr><td>Vacancy Name</td><td>:</td><td><?php _t("vacancy_name")?></td></tr>
<tr><td>Vacancy Description</td><td>:</td><td><textarea id="vacancy_description" cols="30" rows="3"></textarea></td></tr>
<tr><td>Vacancy Start</td><td>:</td><td><?php _t("vacancy_startdate")?></td></tr>
<tr><td>Vacancy End</td><td>:</td><td><?php _t("vacancy_enddate")?></td></tr>
<tr><td>Vacancy Close</td><td>:</td><td><?php _t("vacancy_closedate")?></td></tr>
<tr><td>Questions</td><td>:</td><td>
<button class="button_link" id="btn_add_question">Add Question</button>
<table id="tbl_question" class="tbl">
	<thead><tr><th>Question</th><th></th></tr></thead>
	<tbody></tbody>
</table>
</td></tr>
</table>
<button class="button_link" id="btn_save">Save</button>