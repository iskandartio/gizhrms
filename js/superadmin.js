function superadmin(div, tbl) {
	var self=this;
	var f;
	var ajaxPage='superadmin_ajax';
	self.start=function() {
		if (tbl=='user') {
			f=generate_assoc(['user_id','user_name','status_id']);
			bindDiv('.status_id',div,'click', self.ChangeStatus);
			hideColumns('tbl_result');
		} else if (tbl=='role') {
			f=generate_assoc(['role_id','role_name','role_description','status_id','btn']);
			self.bindAll();
		} else if (tbl=='module') {
			f=generate_assoc(['module_id','module_name','module_description','sub_module','category_id','status_id','btn']);
			fixSelect();
			self.bindAll();
		} else if (tbl=='category') {
			f=generate_assoc(['category_id','category_name','btn']);
			self.bindAll();
		} else if (tbl=='user_role') {
			f=generate_assoc(['user_id','employee','btn']);
			bindDiv('.role_id', div, 'change', self.RoleChange);
			fixSelect();
		} else if (tbl=='role_module') {
			bindDiv('.role_id', div, 'change', self.RoleModuleChange);
			bindDiv('.module_id', div, 'change', self.ModuleRoleChange);
			fixSelect();
		}
	}
	self.RoleChange=function() {
		var data={}
		data['type']='load_role_user';
		data['role_id']=$('.role_id', div).val();
		var success=function(msg) {
			$(div).find('#div_role_user').html(msg);
			self.bindAll();
		}
		ajax(ajaxPage, data, success);
	}
	self.ModuleRoleChange=function() {
		var data={}
		data['type']='load_module_role';
		data['module_id']=$(this).val();
		var success=function(msg) {
			$(div).find('#div_module_role').html(msg);
			bindDiv('#btn_save', $('#div_module_role',div), 'click', self.SaveModuleRole);
		}
		ajax(ajaxPage, data, success);
	}
	self.RoleModuleChange=function() {
		var data={}
		data['type']='load_role_module';
		data['role_id']=$(this).val();
		var success=function(msg) {
			$(div).find('#div_role_module').html(msg);
			bindDiv('#btn_save', $('#div_role_module',div), 'click', self.SaveRoleModule);
		}
		ajax(ajaxPage, data, success);
	}
	self.EmployeeChange=function() {
		var data={}
		data['type']='load_user_role';
		data['user_id']=$('#user_name', div).data('id');
		var success=function(msg) {
			$(div).find('#div_user_role').html(msg);
			bindDiv('#btn_save', div, 'click', self.SaveUserRole);
		}
		ajax(ajaxPage, data, success);
	}
	self.bindAll=function() {
		bindDiv('#btn_add',div,'click', self.Add);
		bindDiv('.btn_edit',div,'click', self.Edit);
		bindDiv('.btn_delete',div,'click', self.Delete);
		bindDiv('.btn_save',div,'click', self.Save);
		bindDiv('.btn_cancel',div,'click', self.Cancel);
		bindDiv('.btn_up',div,'click', self.Up);
		bindDiv('.btn_down',div,'click', self.Down);
		hideColumns('tbl_result');
	}
	
	self.Up=function() {
		var par=$(this).closest("tr");
		var par2=$(par).prev();
		var success=function(msg) {
			$(par).prev().before($(par));
		}
		var data={}
		data['type']="up";
		data['tbl']=tbl;
		data['id']=getChildHtml(par, tbl+'_id', f);
		data['id2']=getChildHtml(par2, tbl+'_id', f);
		ajax(ajaxPage, data, success);
	}
	self.Down=function() {
		var par=$(this).closest("tr");
		var par2=$(par).next();
		$(par).next().after($(par));
			var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['tbl']=tbl;
		data['id']=getChildHtml(par, tbl+'_id', f);
		data['id2']=getChildHtml(par2, tbl+'_id', f);
		ajax(ajaxPage, data, success);
	}
	self.ChangeStatus=function() {
		var data={}
		var par=$(this).closest("tr");
		data['type']='save_user_active';
		data['status_id']=0;
		if (getChildObj(par, 'status_id', f).find('input').prop('checked')) {
			data['status_id']=1;
		}
		data['user_id']=getChildHtml(par, 'user_id', f);
		var success=function(msg) {
			
		}
		ajax(ajaxPage, data, success);
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		if (tbl=='role') {
			labelToText(par, {'role_name':10, 'role_description':30}, f);
			labelToCheckbox(par, {'status_id':"Active"}, f);
		} else if (tbl=='module') {
			labelToText(par, {'module_name':20, 'module_description':25, 'sub_module':30}, f);
			labelToSelect(getChildObj(par, 'category_id',f), self.category_choice);
			labelToCheckbox(par, {'status_id':"Active"}, f);
			fixSelect();
		} else if (tbl=='category') {
			labelToText(par, {'category_name':20}, f);
		} else if (tbl=='user_role') {
			labelToAutoComplete(par, ['employee'], f);
			autoCompleteEmployee('.employee');
		}
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	self.Cancel=function () {
		var par=$(this).closest("tr");
		if (tbl=='role') {
			textToDefaultLabel(par, [tbl+'_name', tbl+'_description'], f);
			checkboxToDefaultLabel(par, 'status_id', 'Active', 'Not Active', f);
		} else if (tbl=='module') {
			textToDefaultLabel(par, [tbl+'_name', tbl+'_description','sub_module'], f);
			checkboxToDefaultLabel(par, 'status_id', 'Active', 'Not Active', f);
		} else if (tbl=='user_role') {
			autoCompleteToDefaultLabel(par, ['employee'], f);
		} else if (tbl=='category') {
			textToDefaultLabel(par, ['category_name'], f);
		}
		btnChange(par, ['edit','delete'], f);
		self.bindAll();
	
	}
	self.Delete=function() {
	
		var data={}
		var par=$(this).closest("tr");
		data['type']='delete';
		data['tbl']=tbl;
		if (tbl=='role' || tbl=='module' || tbl=='category') {
			data=prepareDataHtml(data, [tbl+'_id'], par, f);
		} else if (tbl=='user_role') {
			data=prepareDataHtml(data, ['user_id'], par, f);
			data['role_id']=$('.role_id', div).val();			
		}
		var success=function(msg) {
			par.remove();
		}
		ajax(ajaxPage,data, success);
	}
	self.Save=function() {
		var data={}
		var par=$(this).closest("tr");
		data['type']='save';
		data['tbl']=tbl;
		if (tbl=='role') {
			data=prepareDataHtml(data, [tbl+'_id'], par, f);
			data=prepareDataText(data, [tbl+'_name',tbl+'_description'], par, f);
			data=prepareDataCheckBox(data, ['status_id'], par, f);
			var success=function(msg) {
				setHtmlText(par, tbl+'_id', msg, f);
				textToLabel(par, [tbl+'_name', tbl+'_description'], f);
				checkboxToLabel(par, 'status_id', 'Active', 'Not Active', f);
				btnChange(par, ['edit','delete'], f);
				self.bindAll();
			}	
		} else if (tbl=='module') {
			data=prepareDataHtml(data, [tbl+'_id'], par, f);
			data=prepareDataText(data, [tbl+'_name',tbl+'_description','sub_module','category_id'], par, f);
			data=prepareDataCheckBox(data, ['status_id'], par, f);
			var success=function(msg) {
				setHtmlText(par, 'module_id', msg, f);
				textToLabel(par, ['module_name', 'module_description','sub_module'], f);
				selectedToLabel(par, ['category_id'], f);
				checkboxToLabel(par, 'status_id', 'Active', 'Not Active', f);
				btnChange(par, ['edit','delete','up','down'], f);
				self.bindAll();
			}	
		} else if (tbl=='user_role') {
			data=prepareDataHtml(data, ['user_id'], par, f);
			data=prepareDataAutoComplete(data, ['employee'], par,f);
			data['role_id']=$('.role_id', div).val();
			var success=function(msg) {
				autoCompleteToLabel(par, ['employee'], f);
				btnChange(par, ['edit','delete'], f);
				self.bindAll();
			}
		} else if (tbl=='category') {
			data=prepareDataHtml(data, [tbl+'_id'], par, f);
			data=prepareDataText(data, [tbl+'_name'], par, f);
			var success=function(msg) {
				setHtmlText(par, tbl+'_id', msg, f);
				textToLabel(par, [tbl+'_name'], f);
				btnChange(par, ['edit','delete','up','down'], f);
				self.bindAll();
			}
		}
		ajax(ajaxPage,data, success);
	}
	self.Add=function() {
		$('#tbl_result tbody', div).prepend(self.adder);
		if (tbl=='user_role') {
			autoCompleteEmployee('.employee');
			
		}
		fixSelect();
		self.bindAll();
	}
	self.SaveUserRole=function(){
		var data={}
		data['type']='save_user_role';
		data['user_id']=$('#user_name', div).data('id');
		var role_id= new Array();
		$('.role_id', div).each(function(idx) {
			if ($(this).prop('checked')) {
				role_id.push($(this).attr('value'));		
			}
		});
		data['role_id']=role_id;
		var success=function(msg) {
			
		}
		ajax(ajaxPage,data, success);
	}
	self.SaveModuleRole=function(){
		var data={}
		data['type']='save_module_role';
		data['module_id']=$('#module_id', $('#div_module_role_all',div)).val();
		var role_id= new Array();
		$('.role_id', div).each(function(idx) {
			if ($(this).prop('checked')) {
				role_id.push($(this).attr('value'));		
			}
		});
		data['role_id']=role_id;
		var success=function(msg) {
			
		}
		ajax(ajaxPage,data, success);
	}
	self.SaveRoleModule=function(){
		var data={}
		data['type']='save_role_module';
		data['role_id']=$('#role_id', $('#div_role_module_all',div)).val();
		var module_id= new Array();
		$('.module_id', div).each(function(idx) {
			if ($(this).prop('checked')) {
				module_id.push($(this).attr('value'));		
			}
		});
		data['module_id']=module_id;
		var success=function(msg) {
			
		}
		ajax(ajaxPage,data, success);
	}
	self.start();
}