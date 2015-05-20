<?php
	
?>
<script>
	var f=generate_assoc(['id','invoice_date','invoice_val','remarks','claim','paid','remainder', 'btn']);
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;
	var adder;
	var ajaxPage="<?php _p($ajaxPage)?>";
	$(function() {
		autoCompleteEmployee('#employee_id', EmployeeChange);
		bind('.year','change',ChangeYear);
	});
	function bindAll() {
		setDatePicker();
		$('input[id="invoice_val"]').each(function(idx) {
			numeric($(this));
		});
		bind('#btn_add','click', Add);
		bind('.btn_save','click',Save);
		bind('.btn_delete','click',Delete);
		bind('.btn_edit','click',Edit);
		
		bind('.btn_cancel','click',Cancel);
		bind('#print_medical_data','click',Print);
		hideColumns('tbl_claim');
		
	}
	function Add() {
		$('#tbl_claim tbody').append(adder);
		bindAll();
	}
	function Save() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save';
		data['year']=$('.year').val();
		data['user_id']=$('#employee_id').data("id");
		data=prepareDataText(data, ['invoice_date','remarks'], par, f);
		data=prepareDataDecimal(data, ['invoice_val'], par, f);
		data=prepareDataHtml(data, ['id'], par, f);
		var success=function(msg) {
			if (msg=='Failed') {
				alert(msg);
				return;
			}
			var d=jQuery.parseJSON(msg);
			setHtmlText(par, 'id', d['id'], f);
			setHtmlText(par, 'claim', d['claim'], f);
			setHtmlText(par, 'paid', d['paid'], f);
			setHtmlText(par, 'remainder', d['remainder'], f);
			textToLabel(par, ['invoice_date','invoice_val','remarks'], f);
			btnChange(par, ['edit','delete'], f);
			bindAll();
		}
		ajax(ajaxPage, data, success);
	}
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data=prepareDataHtml(data, ['id'], par, f);
		var success=function(msg) {
			par.remove();
			
		}
		ajax(ajaxPage,data, success);
	}
	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'invoice_date':5,'invoice_val':8, 'remarks':12}, f);
		btnChange(par, ['save','cancel'], f);
		bindAll();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par, ['invoice_date','invoice_val','remarks'], f);
		btnChange(par, ['edit','delete'], f);
		bindAll();
	}
	function EmployeeChange() {
		var data={}
		data['type']='search';
		data['employee_id']=$('#employee_id').data("id");
		data['year']=$('.year:checked').val();
		
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			adder = d['adder'];
			$('#div_search_result').html(d['result']);
			bindAll();
			
		}
		ajax(ajaxPage,data, success);
	}
	function Print() {
		window.open("<?php _p($printPage)?>?user_id="+$('#employee_id').data("id")+"&year="+$('.year:checked').val());
	}
	function ChangeYear() {
		var data={}
		data['type']='change_employee_choice';
		data['year']=$(this).val();
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#div_search_result').html('');
			$('#employee_id').autocomplete('option','source', d);
			for (i in d) {
				if (d[i]['label']==$('#employee_id').val()) {
					EmployeeChange();
					return;
				}
			}
			$('#employee_id').val('');
			
		}
		ajax(ajaxPage, data, success);
	}
</script>

<div class='row'><input type='radio' name='year' class='year' checked="checked" value='this_year'/>This Year<input type='radio' name='year' class='year' value='last_year'/>Last Year</div>
Employee Name : <?php _t("employee_id")?><p>
<div id='div_search_result'>
</div>
