function language(div, ajaxPage) {
	var self=this;
	var f=generate_assoc(['employee_language_id','language_id','language_skill_id','btn']);
	self.AddLanguage=function() {
		var data={}
		data['type']='add_language';
		var success=function(msg) {
			$('#tbl_language tbody',div).prepend(msg);
			$('.language_val').hide();
			self.bindLanguage();
			
		}
		ajax(ajaxPage,data, success);
	}
	self.bindLanguage=function() {
		bindDiv('.language_id',div,'change', self.LanguageChange);
		bindDiv('.btn_save',div, 'click', self.SaveLanguage);
		bindDiv('.btn_delete',div, 'click', self.DeleteLanguage);
		bindDiv('.btn_edit',div, 'click', self.EditLanguage);
		bindDiv('.btn_cancel',div, 'click', self.CancelLanguage);
		bindDiv('#btn_add_language',div, 'click', self.AddLanguage);
		fixSelect();
		hideColumns('tbl_language');
	}
	self.LanguageChange=function () {
		if ($(this).val()==-1) {
			$(this).closest("td").children(".language_val").show();
		} else {
			$(this).closest("td").children(".language_val").hide();
		}
	}
	
	self.SaveLanguage=function() {
		var par=$(this).closest("tr");
		var data={}
		
		data['type']='save_language';
		data=prepareDataText(data, ['employee_language_id','language_skill_id'], par, f);
		data=prepareDataMultiInput(data, ['language_id','language_val'], getChildObj(par,'language_id',f));
		var success=function(msg) {
			setHtmlText(par, 'employee_language_id', msg, f);
			var obj=getChildObj(par, 'language_id', f);
			var language_id=obj.children("select").val();
			if (language_id==-1) {
				obj.html("<span style='display:none'>"+language_id+"</span>"+obj.children("input").val());
			} else {
				selectedToLabel(par,['language_id'],  f);
			}
			
			selectedToLabel(par,['language_skill_id'],  f);
			btnChange(par, ['edit','delete'], f);
			self.bindLanguage();
		}
		ajax(ajaxPage, data, success);
	}
	self.DeleteLanguage=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete_language';
		data['employee_language_id']=getChildHtml(par, 'employee_language_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax(ajaxPage, data, success);
	}
	self.EditLanguage=function() {
		var par=$(this).closest("tr");
		
		var obj=getChildObj(par,'language_id',f);
		if (obj.children("span").html()==-1) {
			var html=obj.html();
			html=html.substr(html.indexOf('</span>')+7);
			labelToSelect(getChildObj(par, 'language_id', f), self.language_choice);
			obj.append(" <input type='text' class='language_val' value='"+html+"'/>");
		} else {
			labelToSelect(getChildObj(par, 'language_id', f), self.language_choice);
			obj.append(" <input style='display:none' type='text' class='language_val'/>");
		}
		
		
		labelToSelect(getChildObj(par, 'language_skill_id', f), self.language_skill_choice);
		btnChange(par, ['save','cancel'], f);
			
		
		self.bindLanguage();
		
	}
	self.CancelLanguage=function () {
		var par=$(this).closest("tr");
		var td=getChildObj(par, 'language_id', f);
		var originalValue=td.children("select").data("originalValue");
		td.children("select").val(originalValue);
		if (td.children("select").data("originalValue")!=-1) {
			td.html("<span style='display:none'>"+originalValue+"</span>"+td.children("select").children("option:selected").html());
			
		} else {
			td.html("<span style='display:none'>"+originalValue+"</span>"+td.children("input").prop("defaultValue"));
		}
		selectedToDefaultLabel(par, ['language_skill_id'], f);
		btnChange(par, ['edit','delete'], f);
		self.bindLanguage();
	
	}
	self.bindLanguage();
}