function job_title(div) {
	
	var f=generate_assoc(['job_title_id','job_title','btn']);
	var self=this;
	self.start=function() {
		self.bind();
	}
	self.bind=function() {
		bindDiv('.btn_add',div,'click',self.Add);
		bindDiv('.btn_edit',div,'click',self.Edit);
		bindDiv('.btn_save',div,'click',self.Save);
		bindDiv('.btn_cancel',div,'click',self.Cancel);
		bindDiv('.btn_delete',div,'click',self.Delete);
		hideColumns('tbl_job_title');
	}
	self.Add=function() {
		var adder="<tr><td></td><td><input type='text' class='job_title'/></td>";
		adder+="<td>"+getImageTags(['save','delete'])+"</td></tr>";
		div.find('table tbody').prepend(adder);
		self.bind();
	}
	self.Edit=function() {
		var par=$(this).closest("tr");
		labelToText(par, {'job_title':0}, f);
		btnChange(par, ['save','cancel'], f);
		self.bind();
	}
	self.Cancel=function() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['job_title'],f);
		btnChange(par, ['edit','delete'],f);
		self.bind();
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete?")) return;	
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete_job_title';
		data['job_title_id']=getChildHtml(par,'job_title_id', f);
		var success=function(msg) {
			par.remove();
		}
		ajax("project_ajax", data, success);
	}
	self.Save=function() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_job_title';
		data=prepareDataHtml(data,['job_title_id'], par,f);
		data=prepareDataText(data, ['job_title'],  par,f);
		var success=function(msg) {
			setHtmlText(par, 'job_title_id', msg,f);
			textToLabel(par,['job_title'],f);
			btnChange(par, ['edit','delete'],f);
			self.bind();
		}
		ajax('project_ajax',data,success);
	}
	self.start();
}