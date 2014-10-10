function setDatePicker(objects) {
	
	for (i=0;i<objects.length;i++) {
		$('#'+objects[i]).datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
	}
	
}
function setDatePicker() {
	$('.date').datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
}
function convertDate(d) {
	
	return d.substring(6,10)+'-'+d.substring(3,5)+'-'+d.substring(0,2);
}
