function province(div, saveFunc) {
	var f=generate_assoc(['province_id','province_val','region_id','btn']);
	var self=this;
	
	this.start=function() {
		this.bindAll();	
	}
	this.bindAll= function() {
	
		bindDiv('#btn_add',div,'click',this.Add);
		bindDiv('.btn_edit',div,"click", this.Edit);
		bindDiv('.btn_delete',div,"click", this.Delete);
		bindDiv('.btn_save',div,"click", this.Save);
		bindDiv('.btn_cancel',div,"click", this.Cancel);
		
		hideColumnsArrDiv('tbl_province', ['province_id'],div,f);
		fixSelect();
	}
	this.Delete=function() {
		par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['province_id']=getChildHtml(par, 'province_id', f);
		var success=function(msg) {
			
			par.remove();
		}
		ajax('province_ajax', data, success);
	}
	
	this.Add=function() {
		var a='';
		a+="<tr><td></td><td><input type='text' class='province_val' id='province_val' placeholder='Province'/></td><td>"+self.region_choice;
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_province tbody').prepend(a);
		self.bindAll();
	}
	this.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'province_val':0}, f);
		labelToSelect(getChildObj(par, 'region_id', f), self.region_choice, f);
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	this.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['province_val'], f);
		selectedToDefaultLabel(par,['region_id'], f);
		btnChange(par, ['edit','delete'], f);
		self.bindAll();
	}
	this.Save=function() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['province_val'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['province_id']=getChildHtml(par,'province_id', f);
		data['province_val']=getChild(par,'province_val', f);
		data['region_id']=getChild(par,'region_id',f);
		var success= function(msg) {
			setHtmlText(par, 'province_id', msg, f);
			textToLabel(par, ['province_val'], f);
			selectedToLabel(par, ['region_id'], f);
			btnChange(par, ['edit','delete'], f);
			self.bindAll();
			if (saveFunc) saveFunc(msg);
		}
		ajax('province_ajax', data, success);
	}

	this.start();
}
