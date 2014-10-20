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
function getChild(par, name) {
	if (par.children("td:nth-child("+fields[name]+")").children().length==0) {
		return par.children("td:nth-child("+fields[name]+")").html();
	}
	return par.children("td:nth-child("+fields[name]+")").children("#"+name).val();
}
function getChildHtmlVal(par, name) {
	
	return par.children("td:nth-child("+fields[name]+")").html();
}
function getChildHtmlValById(par, id) {	
	return par.children("td:nth-child("+id+")").html();
}
function getChildHtmlSpanVal(par, name) {	
	return par.children("td:nth-child("+fields[name]+")").children('span').html();
}
function textToLabel(par, name) {
	var td=par.children("td:nth-child("+fields[name]+")");
	td.html(td.children("#"+name).val());
}
function selectedToLabel(par, name) {
	var td=par.children("td:nth-child("+fields[name]+")");
	
	td.html("<span style='display:none'>"+td.children("#"+name).val()+"</span> "+td.children("select").children("option:selected").text());
}
function labelToSelect(par, name, def, options) {
	var a='';
	a+='<select id="'+name+'"><option value=0> '+def+'</option>';
	i=getChildHtmlSpanVal(par, name);
	a+=options;
	a+='</select>';
	var td=par.children('td:nth-child('+fields[name]+')');
	td.html(a);
	td.children("select").val(i);
}
function labelToText(par, name) {
	var a='';
	def=getChildHtmlVal(par, name);
	a+='<input type="text" class="'+name+'" id="'+name+'" value="'+def+'"/>';
	
	var td=par.children('td:nth-child('+fields[name]+')');
	td.html(a);
	
}
function btnChange(par, types) {
	var td=par.children("td:nth-child("+fields['btn']+")");
	var s='';
	for (i=0;i<types.length;i++) {
		s+='<img src="images/'+types[i]+'.png" class="btn_'+types[i]+'"/> ';
	}	
	td.html(s);
}
function allTextToLabel(par) {
	var td=par.children("td");
	$.each(td, function(idx) {
		alert($(this).html()+' '+$(this).children('#education').val());
	});
}
function setHtmlText(par, name, val) {
	var td=par.children("td:nth-child("+fields[name]+")");
	td.html(val);
}
function setText(par, name, val) {
	var td=par.children("td:nth-child("+fields[name]+")").children("input[type=text]").val(val);
}
