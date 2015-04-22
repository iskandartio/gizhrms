function education(div, ajaxPage) {
	var self=this;
	var f=generate_assoc(['employee_education_id','education_id','major','place','year_from','year_to','countries_id','btn']);
	self.start=function() {
		bindDiv('.btn_add',div, 'click',self.Add);
		bindDiv('.btn_save',div, 'click',self.Save);
		bindDiv('.btn_cancel',div, 'click',self.Cancel);
		bindDiv('.btn_edit',div, 'click',self.Edit);
		bindDiv('.btn_delete',div, 'click',self.Delete);
		hideColumns('tbl_education');
	}
	self.Add=function() {
		$('#tbl_education tbody').append(self.adder);
		self.start();
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_education';
		data=prepareDataText(data, ['education_id','major','place','year_from','year_to','countries_id'], par, f);
		data=prepareDataHtml(data, ['employee_education_id'], par, f);
		var success=function(msg) {
			setHtmlText(par, 'employee_education_id', msg, f);
			textToLabel(par, ['major','place','year_from','year_to'], f);
			selectedToLabel(par, ['education_id','countries_id'], f);
			btnChange(par, ['edit','delete'], f);
			self.start();
		}
		ajax(ajaxPage, data, success);
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {"major":0, "place":0, "year_from":3, "year_to":3}, f);
		labelToSelect(getChildObj(par, 'education_id', f), self.education_choice);
		labelToSelect(getChildObj(par, 'countries_id', f), self.countries_choice);
		btnChange(par, ['save','cancel'], f);
		self.start();
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par, ['major','place','year_from','year_to'], f);
		selectedToDefaultLabel(par, ['education_id','countries_id'], f);
		btnChange(par, ['edit','delete'], f);
		self.start();
	}
	self.Delete=function() {
		if (!confirm('Are you sure to delete?')) return;
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete_education';
		data=prepareDataHtml(data, ['employee_education_id'], par, f);
		var success=function(msg) {
			par.remove();
		}
		ajax(ajaxPage, data, success);
	}
	self.start();
}