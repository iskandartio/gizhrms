function filter_applicant_closing(div, ajaxPage) {
	var self=this;
	self.start=function() {
		self.projectView=new projectView(div,false, false, ajaxPage);
	}
	
	self.start();
}