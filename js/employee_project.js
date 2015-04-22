function employee_project(div, ajaxPage) {
	var self=this;
	self.start=function() {
		self.projectView=new projectView(div,false, false, ajaxPage);
		bind("#btn_save_project", "click", self.projectView.SaveProject);
	}
	self.insertParams=function(type) {
		self.projectView.type=type;
	}
	self.start();
}