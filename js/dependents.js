function dependents(div, ajaxPage) {
	var self=this;
	var f=generate_assoc(['employee_dependent_id','relation','name','dob','entitled','btn']);
	self.start=function() {
		bindDiv('#btn_add_dependent',div,'click',self.Add);
		bindDiv('.btn_save',div,'click',self.Save);
		bindDiv('.btn_edit',div,'click',self.Edit);
		bindDiv('.btn_cancel',div,'click',self.Cancel);
		bindDiv('.btn_delete',div,'click',self.Delete);
		bindDiv('#save_spouse',div,'click',self.SaveSpouse);
		hideColumns('tbl_dependent');
		
		setDatePicker();
		setDOB('#dob');
		var data={}
		data['type']='getRelationChoice';
		var success=function(msg) {
			relation_choice=msg;
			fixSelect();
		}
		ajax(ajaxPage,data, success);
	
	}
	
	self.Add=function()  {
		s="<tr><td></td><td>"+relation_choice+"</td>";
		s+="<td><input type='text' class='name' id='name' placeholder='name'/></td>";
		s+="<td><input type='text' class='dob' id='dob' placeholder='dob'/></td>";
		s+="<td><label><input type='checkbox' checked class='entitled'/>Entitled</label></td>"
		s+="<td>"+getImageTags(['save','delete'], f)+"</tr>";
		$('#tbl_dependent').prepend(s);
		self.start();
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'name':20,'dob':10}, f);
		labelToSelect(getChildObj(par, ['relation'],  f), relation_choice);
		var td_entitled=getChildObj(par, ['entitled'], f);
		var employee_dependent_id=getChildHtml(par, ['employee_dependent_id'], f);
		td_entitled.html("<label><input type='checkbox' "+(td_entitled.html()=='Yes' ? "checked" : "")+" class='entitled'/>Entitled</label>");
		btnChange(par, ['save','cancel'],f);
		self.start();
		
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['name','dob'], f);
		selectedToDefaultLabel(par, ['relation'], f);
		var employee_dependent_id=getChildHtml(par, ['employee_dependent_id'], f);
		td_entitled=getChildObj(par, 'entitled', f);
		td_entitled.html(td_entitled.children().prop('defaultChecked') ? 'Yes' : 'No');
		btnChange(par, ['edit','delete'], f);
		self.start();
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_dependent';
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax(ajaxPage, data, success);
	}
	self.Save=function()  {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['relation','name','dob'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save_dependent';
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		data=prepareDataText(data, ['relation','name','dob'], par, f);
		data=prepareDataCheckBox(data, ['entitled'], par, f);
		var success= function(msg) {
			setHtmlText(par, 'employee_dependent_id', msg, f);
			textToLabel(par, ['relation','name','dob'],f);
			var td_entitled=getChildObj(par, 'entitled', f);
			td_entitled.html(td_entitled.children().prop('checked') ? "Yes" : "No");
			btnChange(par, ['edit','delete'], f);
			self.start();
		}
		ajax(ajaxPage, data, success);
	}
	self.SaveSpouse=function() {
		var data={};
		data['type']='save_spouse';
		data=prepareDataMultiInput(data, ['spouse_name','marry_date'], div);
		data=prepareDataCheckBox(data, ['spouse_entitled']);
		var success=function(msg) {
		}
		ajax(ajaxPage,data, success);
	}
	this.start();
}