function nationality(div) {
	var f=generate_assoc(['nationality_id','nationality_val','btn']);
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
		hideColumnsArrDiv('tbl_nationality', ['nationality_id'], div, f);
	}
	this.Delete = function() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['nationality_id']=getChildHtml(par, 'nationality_id', f);
		var success=function(msg) {
		}
		ajax('nationality_ajax', data, success);
	}
	this.Add =function() {
		
		var a='';
		a+="<tr><td></td><td><input type='text' id='nationality_val' placeholder='Nationality'/></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_nationality tbody').prepend(a);
		self.bindAll();
	}
	this.Edit =function() {
		var par=$(this).closest("tr");
		labelToText(par, {'nationality_val':0}, f);
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	this.Cancel = function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['nationality_val'], f);
		btnChange(par, ['edit','delete'],f);
		self.bindAll();
	}
	this.Save = function() {
		
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['nationality_val'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['nationality_id']=getChildHtml(par,'nationality_id', f);
		data['nationality_val']=getChild(par,'nationality_val', f);
		var success= function(msg) {
			setHtmlText(par, 'nationality_id', msg, f);
			textToLabel(par, ['nationality_val'], f);
			btnChange(par, ['edit','delete'], f);
			self.bindAll();
		}
		ajax('nationality_ajax', data, success);
	},
	this.start();
}