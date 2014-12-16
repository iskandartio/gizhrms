<?php
	
?>

<script>
	var fields=generate_assoc(['question_id','question_val','btn']);
	var field_choice=generate_assoc(['choice_id','choice_val','btn']);
	var table='tbl_question';
	var currentRow=-1;
	$(function() {
		bind('#btn_add',"click", Add);
		bind('#btn_save',"click", Save);
		bind('#btn_search',"click", Search);
		bind('#btn_add_choice',"click", AddChoice);
		
		setDatePicker();
		$('#question_filter').change(function()  {
			Search();
		});
		Search();
		$('#input_question tr:eq(0)').hide();
		hideColumns('tbl_choice');
	});
	
	function Add() {
		currentRow=-1;
		clearText(['question_id','question']);
		$('#tbl_choice tbody').empty();
	}
	function edit_data() {
		var obj=$('#tbl_question tbody tr:eq('+currentRow+') td:eq(1)');
		inputText(obj, ['question_id','question_val']);
		$('#btn_save').html('Update');
		var data={};
		data['type']='get_choices';
		data['question_id']=$('#question_id').val();
		var success=function(msg) {
			$('#tbl_choice tbody').empty();
			$('#tbl_choice tbody').append(msg);
			bind('.btn_edit_choice',"click", EditChoice);
			bind('.btn_delete_choice',"click", DeleteChoice);
			hideColumns('tbl_choice');
		}
		ajax("questionAjax.php", data, success);
	}
	function Edit() {
		currentRow=$(this).closest("tr").index();
		edit_data();
	}
	function EditChoice() {
		var par=$(this).closest("tr");
		labelToText(par, {'choice_val':0}, field_choice);
		setHtmlText(par, 'btn', '<img src="images/save.png" class="btn_save_choice"/> <img src="images/cancel.png" class="btn_cancel_choice"/>', field_choice);
		bind('.btn_save_choice',"click", SaveChoice);
		bind('.btn_cancel_choice',"click", CancelChoice);
	}
	function CancelChoice() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['choice_val'], field_choice);
		setHtmlText(par, 'btn', '<img src="images/edit.png" class="btn_edit_choice"/> <img src="images/delete.png" class="btn_delete_choice"/>', field_choice);
		bind('.btn_edit_choice',"click", EditChoice);
		bind('.btn_delete_choice',"click", DeleteChoice);
	}
	function DeleteChoice() {
		par=$(this).closest("tr");
		par.remove();
		
	}
	function SaveChoice() {
		if (!validate_choice(this)) {
			
			return;
		}
		par=$(this).closest("tr");
		if (getChild(par,'choice_val', field_choice)=='') {
			par.remove();
			return;
		}
		textToLabel(par, 'choice_val', field_choice);
		setHtmlText(par, 'btn', "<img src='images/edit.png' class='btn_edit_choice'/> <img src='images/delete.png' class='btn_delete_choice'/>", field_choice);
		bind('.btn_edit_choice',"click", EditChoice);
		bind('.btn_delete_choice',"click", DeleteChoice);
	}
	function AddChoice() {
		var a="<tr><td></td><td>";
		a+="<?php _t("choice_val")?>";
		a+="</td><td><img src='images/save.png' class='btn_save_choice'/> <img src='images/delete.png' class='btn_delete_choice'/></td></tr>";
		$('#tbl_choice tbody').append(a);
		
		bind('.choice','change',ValidateChoice);
		bind('.btn_save_choice',"click", SaveChoice);
		bind('.btn_delete_choice',"click", DeleteChoice);
		hideColumns('tbl_choice');
	}
	function ValidateChoice() {
		validate_choice(this);
		
		
	}
	function validate_choice(obj) {
		var par=$(obj).closest("tr");
		var f=true;
		current_idx=par.index();
		
		current_val=getChild(par, 'choice_val', field_choice);
		par=$('#tbl_choice tbody tr');
		$.each(par, function(idx) {
			
			if (idx!=current_idx) {
				v=getChild($(this), 'choice_val', field_choice);
				if (v) {
					if (v==current_val) {
						alert('Choice already exists!');
						f=false;
						return false;
					}
				} else {
					v=getChild($(this), 'choice_val', field_choice);
					if (v==current_val) {
						alert('Choice already exists!');
						f=false;
						return false;
					}
				}
			}
		});
		
		return f;
		
	}
	function Delete() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['question_id']=getChild(par, 'question_id');
		var success=function(msg) {
			alert("Success");
			par.remove();
		}
		ajax("questionAjax.php", data, success);
	}
	function Cancel() {
	}
	function Save() {
		data={};
		data['type']='save';
		data=prepareDataText(data,['question_id','question_val']);
		var choice_val=new Array();
		var choice_id=new Array();
		$.each($('#tbl_choice tbody tr'), function(idx) {
			v=getChild($(this), 'choice_val', field_choice);
			choice_val.push(v);
			v=getChild($(this), 'choice_id', field_choice);
			choice_id.push(v);
		});
		data['choice_val']=choice_val;
		data['choice_id']=choice_id;
		
		var success=function(msg) {
			alert('Success');
			
			tbl='tbl_question';
			if (currentRow>=0) {
				setHtmlAllText(tbl, ['question_id','question_val']);
				
				
			} else {
				$('#question_id').val(msg);
				adder='<tr><td>';
				adder+=msg+"</td>"; 
				adder+='<td></td>';
				adder+='<td><?php _p(getImageTags(array('edit','delete')))?></td>';
				adder+='</tr>';	
				currentRow=$('#tbl_question tbody').children().length;
				
				$('#tbl_question tbody').append(adder);
				setHtmlAllText(tbl, ['question']);
				
				bindAll();
				$('#btn_save').html('Update');
				
			}
			edit_data();
		}
		ajax("questionAjax.php", data, success);
		
	}
	function Search() {
		var data={};
		data['type']='search';
		data['question_filter']=$('#question_filter').val();
		var success=function(msg) {
			$('#search_result').html(msg);
			bindAll();
			
		}
		ajax("questionAjax.php", data, success);
	}
</script>
<?php _t("question_filter") ?>

<button class="button_link" id="btn_search">Search</button>
<div id="search_result"></div>
<button class="button_link" id="btn_add">Add New</button>
<table id='input_question'>
<tr><td>Question ID</td><td>:</td><td><?php _t("question_id")?></td></tr>
<tr><td>Question</td><td>:</td><td><?php _t("question_val","","30")?></td></tr>
<tr><td>Choices</td><td>:</td><td>
<button class="button_link" id="btn_add_choice">Add Choice</button>
<table id="tbl_choice" class="tbl">
	<thead><tr><th>Choice ID</th><th>Choice</th><th></th></tr></thead>
	<tbody></tbody>
</table>
</td></tr>
</table>
<button class="button_link" id="btn_save">Save</button>