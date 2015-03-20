function city(div) {
	var f=generate_assoc(['city_id','city_val','province_id','btn']);
	var self=this;
	
	this.start=function() {
		
		self.bindAll();
	
	}
	
	this.bindAll=function() {
		bindDiv('#btn_add',div,'click',this.Add);
		bindDiv('.btn_edit',div,"click", this.Edit);
		bindDiv('.btn_delete',div,"click", this.Delete);
		bindDiv('.btn_save',div,"click", this.Save);
		bindDiv('.btn_cancel',div,"click", this.Cancel);
		hideColumnsArrDiv('tbl_city', ['city_id'],div, f);
		fixSelect();
	}
	
	this.Delete=function() {
		par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['city_id']=getChildHtml(par, 'city_id', f);
		var success=function(msg) {
			
			par.remove();
		}
		ajax('city_ajax', data, success);
	}
	
	this.Add=function() {
		var a='';
		a+="<tr><td></td><td><input type='text' class='city_val' id='city_val' placeholder='City'/></td><td>"+self.province_choice;
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_city tbody').prepend(a);
		self.bindAll();
	}
	this.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'city_val':0}, f);
		labelToSelect(getChildObj(par, 'province_id', f), self.province_choice);
		btnChange(par, ['save','cancel'],f);
		self.bindAll();
	}
	this.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['city_val'],f);
		selectedToDefaultLabel(par,['province_id'],f);
		btnChange(par, ['edit','delete'],f);
		self.bindAll();
	}
	this.Save=function() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['city_val'],null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['city_id']=getChildHtml(par,'city_id', f);
		data['city_val']=getChild(par,'city_val', f);
		data['province_id']=getChild(par,'province_id',f);
		var success= function(msg) {
			setHtmlText(par, 'city_id', msg, f);
			textToLabel(par, ['city_val'],f);
			selectedToLabel(par, ['province_id'],f);
			btnChange(par, ['edit','delete'],f);
			self.bindAll();
		}
		ajax('city_ajax', data, success);
	}
	this.start();
}