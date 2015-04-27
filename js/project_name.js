function project_name(div) {
	
	var f=generate_assoc(['project_name_id','project_name','principal_advisor','financial_controller','btn']);
	var self=this;
	self.start=function() {
		self.bind();
	}
	self.bind=function() {
		bindDiv('.btn_add',div,'click',self.Add);
		bindDiv('.btn_edit',div,'click',self.Edit);
		bindDiv('.btn_save',div,'click',self.Save);
		bindDiv('.btn_cancel',div,'click',self.Cancel);
		bindDiv('.btn_delete',div,'click',self.Delete);
		autoCompleteEmployee('.principal_advisor');
		autoCompleteEmployee('.financial_controller');
		hideColumns('tbl_project_name');
		
	}
	self.Add=function() {
		var adder="<tr><td></td><td><input type='text' class='project_name'/></td>";
		adder+="<td><input type='text' class='principal_advisor'/></td><td><input type='text' class='financial_controller'/></td>";
		adder+="<td>"+getImageTags(['save','delete'])+"</td></tr>";
		div.find('table tbody').prepend(adder);
		self.bind();
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'project_name':0}, f);
		labelToAutoComplete(par, ['principal_advisor','financial_controller'], f);
		btnChange(par, ['save','cancel'], f);
		self.bind();
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['project_name'],f);
		autoCompleteToDefaultLabel(par, ['principal_advisor','financial_controller'], f);
		btnChange(par, ['edit','delete'],f);
		self.bind();
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete?")) return;	
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete_project_name';
		data['project_name_id']=getChildHtml(par,'project_name_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax("project_ajax", data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_project_name';
		data=prepareDataHtml(data,['project_name_id'], par,f);
		data=prepareDataText(data, ['project_name'],  par,f);
		data=prepareDataAutoComplete(data, [ 'principal_advisor','financial_controller'], par, f);
		var success=function(msg) {
			setHtmlText(par, 'project_name_id', msg,f);
			textToLabel(par,['project_name'],f);
			autoCompleteToLabel(par, ['principal_advisor','financial_controller'], f);
			btnChange(par, ['edit','delete'],f);
			self.bind();
		}
		ajax('project_ajax',data,success);
	}
	self.start();
}