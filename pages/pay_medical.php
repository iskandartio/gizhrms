<script>
	var f=generate_assoc(['id','employee','invoice_date','invoice_val','paid','remarks','btn']);
	var f2=generate_assoc(['id','employee','claim_type','invoice_date','invoice_val','paid','remarks','btn']);
	var ajaxPage='pay_medical_ajax';
	$(function() {
		
		loadData();
		
	});
	function bindAll() {
		bind('.btn_paid','click', Paid);
		hideColumns('tbl_result');
		hideColumns('tbl_eyeglasses');
		hideColumns('tbl_medical_checkup');
		
	}
	function loadData() {
		var data={}
		data['type']='search_pay_medical';
		var success=function(msg) {
			$('#div_result').html(msg);
			bindAll();
		}
		ajax(ajaxPage, data, success);
		
	}
	function Paid() {
		var par=$(this).closest("tr");
		var data={}
		var medical_type=$(this).attr('medical_type');
		data['type']='save_pay_medical';
		data['medical_type']=medical_type;
		if (medical_type=='employee_eyeglasses') {
			data=prepareDataHtml(data, ['id'], par, f2);
		} else {
			data=prepareDataHtml(data, ['id'], par, f);
		}
		var success=function(msg) {
			if (medical_type=='employee_eyeglasses') {
				setHtmlText(par, 'btn', '', f2);
			} else {
				setHtmlText(par, 'btn', '', f);
			}
			bindAll();
		}
		ajax(ajaxPage, data, success);
	}
</script>
<div id='div_result'></div>


