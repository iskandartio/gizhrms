function working(div, ajaxPage, afterSave) {
	var self=this;
	var f=generate_assoc(['_working_id','month_from','year_from', 'month_to', 'year_to', 'employer', 'countries_id', 'job_title', 'business_id', 'may_contact', 'leave_reason', 'btn']);
	
	self.bindWorking=function () {
		bindDiv('#btn_add',div,'click',self.AddWorking);
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
		clearTextDiv(['_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id','email','phone'],div);
		$('#may_contact',div).prop("checked", false);
		$('#email',div).hide();
		$('#phone',div).hide();
		$('#btn_save',div).html('Save as New');
		fixSelect();
	}
	self.EditWorking=function() {
		clearTextDiv(['_working_id','year_from','year_to','employer','countries_id','job_title','leave_reason','month_from','month_to','business_id','email','phone'],div);
		
		$('.'+self.tbl+'_working_id', div).val(getChildHtml(this.closest("tr"), '_working_id', f));
		inputFromTableToText(this, ['year_from','year_to','employer','job_title','leave_reason'], f, div);
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
		self.bindWorking();
		fixSelect();

	}
	
	self.DeleteWorking=function() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_working';
		data['tbl']=self.tbl;
		data[self.tbl+'_working_id']=getChildHtml(par,'_working_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax(ajaxPage, data, success);
	}
	self.SaveWorking=function()  {
		if (!validate_empty_col(div, ['month_from','year_from','month_to','year_to','employer','job_title','countries_id','business_id'], ['From Month','From Year','To Month','To Year','Employer','Job Title','Country','Nature of Business'])) return;
		var data={};
		data['type']='save_working';
		data['tbl']=self.tbl;
		data[self.tbl+'_working_id']= $('.'+self.tbl+'_working_id', div).val();
		data=prepareDataMultiInput(data, ['month_from','year_from','month_to','year_to','employer','countries_id','job_title','business_id','email','phone','leave_reason'], div);
		data=prepareDataCheckBox(data, ['may_contact']);
		var success= function(msg) {
			div.html('');
			if (afterSave) {
				afterSave(msg);
			} else {
				load($('#tabs').tabs("option","active"));
			}
		}
		ajax(ajaxPage, data, success);
	}
	self.bindWorking();
}