function region(div, saveFunc) {
	var f=generate_assoc(['region_id','region_val','btn']);
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
		bindDiv('.btn_up', div,"click", this.Up);
		bindDiv('.btn_down', div,"click", this.Down);
		hideColumnsArrDiv('tbl_region', ['region_id'], div, f);
	}
	this.Delete = function() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['region_id']=getChildHtml(par, 'region_id', f);
		var success=function(msg) {
		}
		ajax('region_ajax', data, success);
	}
	this.Add =function() {
		
		var a='';
		a+="<tr><td></td><td><input type='text' id='region_val' placeholder='Region'/></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_region tbody').prepend(a);
		self.bindAll();
	}
	this.Edit =function() {
		var par=$(this).closest("tr");
		labelToText(par, {'region_val':0}, f);
		btnChange(par, ['save','cancel'], f);
		self.bindAll();
	}
	this.Cancel = function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['region_val'], f);
		btnChange(par, ['edit','delete','up','down'],f);
		self.bindAll();
	}
	this.Save = function() {
		
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['region_val'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['region_id']=getChildHtml(par,'region_id', f);
		data['region_val']=getChild(par,'region_val', f);
		var success= function(msg) {
			setHtmlText(par, 'region_id', msg, f);
			textToLabel(par, ['region_val'], f);
			btnChange(par, ['edit','delete', 'up','down'], f);
			self.bindAll();
			if (saveFunc) saveFunc(msg);
		}
		ajax('region_ajax', data, success);
	},
	this.Up = function() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['region_id']=getChildHtml(par, 'region_id', f);
		ajax('region_ajax', data, success);
	},
	this.Down = function() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['region_id']=getChildHtml(par, 'region_id', f);
		ajax('region_ajax', data, success);
	}
	this.start();
}