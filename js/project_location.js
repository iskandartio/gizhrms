function project_location(div) {
	
	var f=generate_assoc(['project_location_id','project_location','office_manager','project_name','btn']);
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
		var data={}
		data['type']='getProjectNameChoice';
		var success=function(msg) {
			project_name_choice=msg;
		}
		ajax('project_ajax',data, success);
		autoCompleteEmployee('.office_manager');
		hideColumns('tbl_project_location');
		fixSelect();
	}
	self.Add=function() {
		var adder="<tr><td></td><td><input type='text' class='project_location'/></td>";
		adder+="<td><input type='text' class='office_manager'/></td><td>"+project_name_choice+"</td>";
		
		adder+="<td>"+getImageTags(['save','delete'])+"</td></tr>";
		div.find('table tbody').prepend(adder);
		self.bind();
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'project_location':0}, f);
		labelToAutoComplete(par, ['office_manager'], f);
		labelToSelect(getChildObj(par, ['project_name'],f), project_name_choice);
		btnChange(par, ['save','cancel'], f);
		self.bind();
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['project_location'],f);
		selectedToDefaultLabel(par,['project_name'], f);
		autoCompleteToDefaultLabel(par, ['office_manager'], f);
		btnChange(par, ['edit','delete'],f);
		self.bind();
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete?")) return;	
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete_project_location';
		data['project_location_id']=getChildHtml(par,'project_location_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax("project_ajax", data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_project_location';
		data=prepareDataHtml(data,['project_location_id'], par,f);
		data=prepareDataText(data, ['project_location','project_name'],  par,f);
		data=prepareDataAutoComplete(data, [ 'office_manager'], par, f);
		var success=function(msg) {
			setHtmlText(par, 'project_location_id', msg,f);
			textToLabel(par,['project_location','project_name'],f);
			autoCompleteToLabel(par, ['office_manager'], f);
			btnChange(par, ['edit','delete'],f);
			self.bind();
		}
		ajax('project_ajax',data,success);
	}
	self.start();
}