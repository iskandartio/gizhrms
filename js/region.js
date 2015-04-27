function region(div, tbl) {
	var self=this;
	var f;
	var ajaxPage="region_ajax";
	self.start=function() {
		if (tbl=='region') {
			f=generate_assoc(['region_id','region_val','btn']);
			self.bindAll();
		} else if (tbl=='province') {
			f=generate_assoc(['province_id','province_val','region_id','btn']);
			self.bindAll();
		} else if (tbl=='city') {
			f=generate_assoc(['city_id','city_val','province_id','btn']);
			self.bindAll();
		} else if (tbl=='countries') {
			f=generate_assoc(['countries_id','countries_val','btn']);
			self.bindAll();
		} else if (tbl=='nationality') {
			f=generate_assoc(['nationality_id','nationality_val','btn']);
			self.bindAll();
		}
	}
	self.bindAll=function() {
		bindDiv('#btn_add',div,'click', self.Add);
		bindDiv('.btn_edit',div,'click', self.Edit);
		bindDiv('.btn_delete',div,'click', self.Delete);
		bindDiv('.btn_save',div,'click', self.Save);
		bindDiv('.btn_cancel',div,'click', self.Cancel);
		bindDiv('.btn_up',div,'click', self.Up);
		bindDiv('.btn_down',div,'click', self.Down);
		hideColumns('tbl_'+tbl);
		fixSelect();			
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

	self.Edit=function() {
		var par=$(this).closest("tr");
		if (tbl=='region') {
			labelToText(par, {'region_val':0}, f);
		} else if (tbl=='province') {
			labelToText(par, {'province_val':0}, f);
			labelToSelect(getChildObj(par, 'region_id',f), self.region_choice);
		} else if (tbl=='city') {
			labelToText(par, {'city_val':0}, f);
			labelToSelect(getChildObj(par, 'province_id',f), self.province_choice);
		} else if (tbl=='countries') {
			labelToText(par, {'countries_val':0}, f);
		} else if (tbl=='nationality') {
			labelToText(par, {'nationality_val':0}, f);
		}
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	self.Cancel=function () {
		var par=$(this).closest("tr");
		if (tbl=='region') {
			textToDefaultLabel(par, ['region_val'], f);
		} else if (tbl=='province') {
			textToDefaultLabel(par, ['province_val'], f);
			selectedToDefaultLabel(par, ['region_id'], f);
		} else if (tbl=='city') {
			textToDefaultLabel(par, ['city_val'], f);
			selectedToDefaultLabel(par, ['province_id'], f);
		} else if (tbl=='countries') {
			textToDefaultLabel(par, ['countries_val'], f);
		} else if (tbl=='nationality') {
			textToDefaultLabel(par, ['nationality_val'], f);
		}
		if (tbl=='region'||tbl=='province') {
			btnChange(par, ['edit','delete','up','down'], f);
		} else {
			btnChange(par, ['edit','delete'], f);
		}
		
		self.bindAll();
	
	}
	self.Delete=function() {
	
		var data={}
		var par=$(this).closest("tr");
		data['type']='delete';
		data['tbl']=tbl;
		data=prepareDataHtml(data, [tbl+'_id'], par, f);
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
		data=prepareDataHtml(data, [tbl+'_id'], par, f);
		data=prepareDataText(data , [tbl+'_val'], par, f);
		if (tbl=='province') data=prepareDataText(data, ['region_id'], par, f);
		if (tbl=='city') data=prepareDataText(data, ['province_id'], par, f);
		var success=function(msg) {
			setHtmlText(par, tbl+'_id', msg, f);
			textToLabel(par, [tbl+'_id', tbl+'_val'], f);
			if (tbl=='province') selectedToLabel(par, ['region_id'], f);
			if (tbl=='city') selectedToLabel(par, ['province_id'], f);
			if (tbl=='region'||tbl=='province') {
				btnChange(par, ['edit','delete','up','down'],f);
			} else {
				btnChange(par, ['edit','delete'],f);
			}
			self.bindAll();
		}
		
		ajax(ajaxPage,data, success);
	}
	self.Add=function() {
		$('#tbl_'+tbl+' tbody', div).prepend(self.adder);
		self.bindAll();
	}
	self.start();
}