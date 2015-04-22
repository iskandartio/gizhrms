function pictures(div, ajaxPage) {
	var self=this;
	self.start=function() {
		bindDiv('.btn_delete', div, 'click', self.Delete);
		bindDiv('#btn_upload', div, 'click', self.Upload);
	}
	self.Delete=function() {
		if (!confirm("Are you sure to delete this picture?")) return;
		var data={}
		var obj=$(this).closest("span");
		data['type']='delete_file';
		data['a']=$(obj).children('.key').html();
		var success=function() {
			$(obj).remove();
		}
		ajax(ajaxPage, data, success);
	}
	self.Upload=function() {
		$('.div_pic_collection').html('');
	}
	self.start();
	
}