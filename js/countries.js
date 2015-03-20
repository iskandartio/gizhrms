function countries(div) {
	var f=generate_assoc(['countries_id','countries_val','btn']);
	var self=this;
	
	this.start= function() {
		self.bindAll();
	}
	this.bindAll = function() {
		
		bindDiv('#btn_add', div,'click',this.Add);
		bindDiv('.btn_edit', div,"click", this.Edit);
		bindDiv('.btn_delete', div,"click", this.Delete);
		bindDiv('.btn_save', div,"click", this.Save);
		bindDiv('.btn_cancel', div,"click", this.Cancel);
		hideColumnsArrDiv('tbl_countries', ['countries_id'], div, f);
	}
	this.Delete = function() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['countries_id']=getChildHtml(par, 'countries_id', f);
		var success=function(msg) {
		}
		ajax('countries_ajax', data, success);
	}
	this.Add =function() {
		
		var a='';
		a+="<tr><td></td><td><input type='text' id='countries_val' placeholder='Countries'/></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_countries tbody').prepend(a);
		self.bindAll();
	}
	this.Edit =function() {
		var par=$(this).closest("tr");
		labelToText(par, {'countries_val':0}, f);
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	this.Cancel = function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['countries_val'], f);
		btnChange(par, ['edit','delete'],f);
		self.bindAll();
	}
	this.Save = function() {
		
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['countries_val'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['countries_id']=getChildHtml(par,'countries_id', f);
		data['countries_val']=getChild(par,'countries_val', f);
		var success= function(msg) {
			setHtmlText(par, 'countries_id', msg, f);
			textToLabel(par, ['countries_val'], f);
			btnChange(par, ['edit','delete'], f);
			self.bindAll();
		}
		ajax('countries_ajax', data, success);
	},
	this.start();
}