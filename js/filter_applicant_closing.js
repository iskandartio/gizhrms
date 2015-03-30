function filter_applicant_closing(div) {
	var self=this;
	self.start=function() {
		self.projectView=new projectView(div);
	}
	
	self.start();
}