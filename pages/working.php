<?php
?>
<script>
	$(function() {
		loadWorking();
	});
	function loadWorking() {
		if ($('#div_working').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#div_working').html(d['result']);
			var a=new working($("#div_working"));
			
		}
		ajax("working_ajax", data, success);
	}
function working(div) {
	var self=this;
	var f=generate_assoc(['applicants_working_id','month_from','year_from', 'month_to', 'year_to', 'employer', 'countries_id', 'job_title', 'business_id', 'may_contact', 'leave_reason', 'btn']);
	var currentRow=-1;

	self.bindWorking=function () {
		bindDiv('#btn_add_working',div,'click',self.AddWorking);
		bindDiv('#btn_save',div,'click',self.SaveWorking);
		bindDiv('.btn_edit',div,'click',self.EditWorking);
		bindDiv('.btn_cancel',div,'click',self.CancelWorking);
		bindDiv('.btn_delete',div,'click',self.DeleteWorking);
		bindDiv('#may_contact',div,'change',self.ChangeMayContact);
		hideColumns('tbl_working');
		setDatePicker();
		fixSelect();
	}
	self.ChangeMayContact=function () {
		if ($(this).prop('checked')) {
			$('#reference_contact',div).show();
		} else {
			$('#reference_contact',div).hide();
		}
	}
	self.AddWorking=function()  {
		currentRow=-1;
		clearTextDiv(['applicants_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id','email','phone'],div);
		$('#may_contact',div).prop("checked", false);
		$('#email',div).hide();
		$('#phone',div).hide();
		$('#btn_save',div).html('Save as New');
		fixSelect();
	}
	self.EditWorking=function() {
		clearTextDiv(['applicants_working_id','year_from','year_to','employer','countries_id','job_title','leave_reason','month_from','month_to','business_id','email','phone'],div);
		
		inputFromTableToText(this, ['applicants_working_id','year_from','year_to','employer','job_title','leave_reason'], f, div);
		inputFromTableToSelect(this, ['month_from','month_to','business_id','countries_id'], f, div);
		if (getChild($(this).closest("tr"), 'may_contact', f)!='None') {
			$('#may_contact',div).prop("checked",true);
			inputFromTableToOther(this, 'may_contact', ['email','phone'], f, div);
			$('#reference_contact',div).show();
		} else {
			$('#may_contact',div).prop("checked",false);
			$('#reference_contact',div).hide();
			
		}
		$('#btn_save',div).html('Update');
		currentRow=$(this).closest("tr").index();
		self.bindWorking();
		fixSelect();

	}
	
	self.CancelWorking=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['relation','name','dob'], f);
		btnChange(par, ['edit','delete'], f);
		self.bindWorking();
	}
	self.DeleteWorking=function() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_working';
		data['employee_working_id']=getChildHtml(par,'employee_working_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax("employee_ajax", data, success);
	}
	self.SaveWorking=function()  {
		if (!validate_empty_col(div, ['month_from','year_from','month_to','year_to','employer','job_title','business_id'])) return;
		var data={};
		data['type']='save_working';
		data=prepareDataMultiInput(data, ['applicants_working_id','month_from','year_from','month_to','year_to','employer','countries_id','job_title','business_id','email','phone','leave_reason'], div);
		data=prepareDataCheckBox(data, ['may_contact']);
		var success= function(msg) {
			div.html('');
			loadWorking();
		}
		ajax('employee_ajax', data, success);
	}
	self.bindWorking();
}
</script>
<div id='div_working'></div>