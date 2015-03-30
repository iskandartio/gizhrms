function project_number(div) {
	var project_name_choice="";
	var f=generate_assoc(['project_number_id','project_number','team_leader','project_name','btn']);
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
		autoCompleteEmployee('.team_leader');
		var data={}
		data['type']='getProjectNameChoice';
		var success=function(msg) {
			project_name_choice=msg;
		}
		ajax('project_ajax',data, success);
		hideColumns('tbl_project_number');
	}
	self.Add=function() {
		var adder="<tr><td></td><td><input type='text' class='project_number'/></td>";
		adder+="<td><input type='text' class='team_leader'/></td><td>"+project_name_choice+"</td>";
		adder+="<td>"+getImageTags(['save','delete'])+"</td></tr>";
		div.find('table tbody').prepend(adder);
		self.bind();
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'project_number':0}, f);
		labelToAutoComplete(par, ['team_leader'], f);
		labelToSelect(getChildObj(par, ['project_name'],f), project_name_choice);
		btnChange(par, ['save','cancel'], f);
		self.bind();
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['project_number'],f);
		selectedToDefaultLabel(par,['project_name'], f);
		autoCompleteToDefaultLabel(par, ['team_leader'], f);
		btnChange(par, ['edit','delete'],f);
		self.bind();
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete?")) return;	
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete_project_number';
		data['project_number_id']=getChildHtml(par,'project_number_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax("project_ajax", data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_project_number';
		data=prepareDataHtml(data,['project_number_id'], par,f);
		data=prepareDataText(data, ['project_number','project_name'],  par,f);
		data=prepareDataAutoComplete(data, [ 'team_leader'], par, f);
		var success=function(msg) {
			setHtmlText(par, 'project_number_id', msg,f);
			textToLabel(par,['project_number','project_name'],f);
			autoCompleteToLabel(par, ['team_leader'], f);
			btnChange(par, ['edit','delete'],f);
			self.bind();
		}
		ajax('project_ajax',data,success);
	}
	self.start();
}