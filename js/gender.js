function gender(div) {
	var self=this;
	var f=generate_assoc(['gender_id','gender','btn']);
	self.start=function() {
		self.bindAll();
		
	}
	self.bindAll=function() {
		bindDiv('#btn_add',div, 'click',self.Add);
		bindDiv('.btn_delete',div,"click", self.Delete);
		bindDiv('.btn_save',div,"click", self.Save);
		bindDiv('.btn_up',div,"click", self.Up);
		bindDiv('.btn_down',div,"click", self.Down);
		hideColumns('tbl_gender');
	}

	self.Delete=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete_gender';
		data['gender_id']=getChildHtml($(this).closest("tr"), 'gender_id', f);
		var success=function(msg) {
			par.remove();
		
		}
		ajax('others_ajax', data, success);
	}
	
	self.Add=function() {
		$('#tbl_gender').append(self.adder);
		self.bindAll();
	}
	self.Up=function() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up_gender";
		data['gender_id']=getChildHtml(par, 'gender_id', f);
		ajax('others_ajax', data, success);
	}
	self.Down=function() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
			var success=function(msg) {
		}
		var data={}
		data['type']="down_gender";
		data['gender_id']=getChildHtml(par, 'gender_id', f);
		ajax('others_ajax', data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['gender'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save_gender';
		data['gender_id']=getChildHtml(par,'gender_id', f);
		data['gender']=getChild(par,'gender', f);
		
		
		var success= function(msg) {
			setHtmlText(par, 'gender_id', msg);
			self.bindAll();
		}
		ajax('others_ajax', data, success);
	}
	self.start();
}

	
