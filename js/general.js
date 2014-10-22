function setDatePicker(objects) {
	
	for (i=0;i<objects.length;i++) {
		$('#'+objects[i]).datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
	}
	
}
function setDatePicker() {
	$("input[class^='date']").datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
}
function convertDate(d) {
	
	return d.substring(6,10)+'-'+d.substring(3,5)+'-'+d.substring(0,2);
}
function bindAll(t)  {
	$('.btn_edit').unbind();
	$('.btn_save').unbind();
	$('.btn_delete').unbind();
	$('.btn_cancel').unbind();
	$('.btn_edit').bind("click", Edit);
	$('.btn_save').bind("click", Save);
	$('.btn_delete').bind("click", Delete);
	$('.btn_cancel').bind("click", Cancel);
	if (!t) t=table;
	hideColumns(t);
}
function hideColumns(t) {
	$.each($('#'+t+' tbody tr'), function(index) {
		$(this).children('td:nth-child(1)').hide();
	});
	$.each($('#'+t+' thead tr'), function(index) {
		$(this).children('th:nth-child(1)').hide();
	});
}
function getChild(par, name, f) {
	if (!f) {
		f=fields;
		
	}
	if (par.children("td:nth-child("+f[name]+")").children().length==0) {
		return par.children("td:nth-child("+f[name]+")").html();
	}
	return par.children("td:nth-child("+f[name]+")").children("#"+name).val();
}
function getChildHtmlVal(par, name, f) {
	if (!f) f=fields;
	return par.children("td:nth-child("+f[name]+")").html();
}
function clearText(arr) {
		for (i=0;i<arr.length;i++) {
			$('#'+arr[i]).val('');
		}
	}

function inputText(obj, arr) {
	var par=$(obj).parent().parent();
	for (i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(par.children('td:nth-child('+fields[arr[i]]+')').html());
	}
}
function inputSelect(obj, arr) {
	var par=$(obj).parent().parent();
	for (i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(par.children('td:nth-child('+fields[arr[i]]+')').children('span').html());
	}
}
function getChildHtmlValById(par, id) {	
	return par.children("td:nth-child("+id+")").html();
}
function getChildHtmlSpanVal(par, name, f) {
	if (!f) f=fields;
	return par.children("td:nth-child("+f[name]+")").children('span').html();
}
function textToLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:nth-child("+f[name]+")");
	td.html(td.children("#"+name).val());
}
function selectedToLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:nth-child("+f[name]+")");
	td.html("<span style='display:none'>"+td.children("#"+name).val()+"</span> "+td.children("select").children("option:selected").text());
}
function textToDefaultLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:nth-child("+f[name]+")");
	td.html(td.children("#"+name).prop("defaultValue"));
}
function selectedToDefaultLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:nth-child("+f[name]+")");
	var originalValue=td.children("#"+name).data("originalValue");
	td.children("select").val(originalValue);
	td.html("<span style='display:none'>"+originalValue+"</span> "+td.children("select").children("option:selected").text());
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
	td.children("select").data("originalValue", i);
}
function labelToText(par, name, size, f) {
	var a='';
	if (!f) f=fields;
	
	def=getChildHtmlVal(par, name, f);
	a+='<input type="text" class="'+name+'" id="'+name+'" value="'+def+'"';
	if (size) a+=' size="3"';
	a+='/>';
	
	var td=par.children('td:nth-child('+f[name]+')');
	td.html(a);
	
}
function btnChange(par, types) {
	var td=par.children("td:nth-child("+fields['btn']+")");
	var s=getImageTags(types);
	td.html(s);
}
function getImageTags(types) {
	var s='';
	for (i=0;i<types.length;i++) {
		s+='<img src="images/'+types[i]+'.png" class="btn_'+types[i]+'"/> ';
	}
	return s;
}
function setHtmlText(par, name, val, f) {
	if (!f) f=fields; 
	var td=par.children("td:nth-child("+f[name]+")");
	td.html(val);
}
function setText(par, name, val) {
	var td=par.children("td:nth-child("+fields[name]+")").children("input[type=text]").val(val);
}
