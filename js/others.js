function others(div, tbl) {
	var self=this;
	var f=generate_assoc(['id','val','btn']);
	self.start=function() {
		self.bindAll();
		
	}
	self.bindAll=function() {
		bindDiv('#btn_add',div, 'click',self.Add);
		bindDiv('.btn_delete',div,"click", self.Delete);
		bindDiv('.btn_save',div,"click", self.Save);
		bindDiv('.btn_up',div,"click", self.Up);
		bindDiv('.btn_down',div,"click", self.Down);
		hideColumns('tbl_'+tbl);
	}

	self.Delete=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['tbl']=tbl;
		data['id']=getChildHtml($(this).closest("tr"), 'id', f);
		var success=function(msg) {
			par.remove();
		
		}
		ajax('others_ajax', data, success);
	}
	
	self.Add=function() {
		$('#tbl_'+tbl).append(self.adder);
		self.bindAll();
	}
	self.Up=function() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['tbl']=tbl;
		data['id']=getChildHtml(par, 'id', f);
		ajax('others_ajax', data, success);
	}
	self.Down=function() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
			var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['tbl']=tbl;
		data['id']=getChildHtml(par, 'id', f);
		ajax('others_ajax', data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['val'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['tbl']=tbl;
		data['id']=getChildHtml(par,'id', f);
		data['val']=getChild(par,'val', f);
		
		
		var success= function(msg) {
			setHtmlText(par, 'id', msg, f);
			self.bindAll();
		}
		ajax('others_ajax', data, success);
	}
	self.start();
}

	
