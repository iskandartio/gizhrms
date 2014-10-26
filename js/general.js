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
function getChildObj(par, name, f) {
	if (!f) {
		f=fields;
		
	}
	if (par.children("td:nth-child("+f[name]+")").children().length==0) {
		return par.children("td:nth-child("+f[name]+")");
	}
	return par.children("td:nth-child("+f[name]+")").children("#"+name);
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
		
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, arr[i], fields));
	}
}
function inputFromOther(obj, f1, arr) {
	var par=$(obj).parent().parent();
	for (i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, f1, fields, '#_'+arr[i]));
	}
	
}
function getChildHtmlValById(par, id) {	
	return par.children("td:nth-child("+id+")").html();
}
function getChildHtmlSpanVal(par, name, f, span_name) {
	if (!f) f=fields;
	if (!span_name) span_name='';
	return par.children("td:nth-child("+f[name]+")").children('span'+span_name).html();
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
	a+='<select id="'+name+'"><option value="" disabled> '+def+'</option>';
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
	a+='<input type="text" placehoder="'+toggleCase(name)+'" class="'+name+'" id="'+name+'" value="'+def+'"';
	if (size) a+=' size="3"';
	a+='/>';
	alert(a);
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
function validateRequired(arr) {
	for (i=0;i<arr.length;i++) {
		if ($('#'+arr[i]).val()=='') {
			alert('Please input the required data');
			$('#'+arr[i]).focus();
		}
	}
}

function setHtmlAllSelect(tbl, arr) {
	for (i=0;i<arr.length;i++) {
		if ($('#'+arr[i]).val()>0) {
			setHtmlText($('#'+tbl+' tr:eq('+(currentRow+1)+')'), arr[i], '<span style="display:none">'+$('#'+arr[i]).val()+'</span> '+$('#'+arr[i]+' option:selected').html());
		} else {
			setHtmlText($('#'+tbl+' tr:eq('+(currentRow+1)+')'), arr[i], '');
		}
	}
}
function setHtmlAllText(tbl, arr) {
	for (i=0;i<arr.length;i++) {
		setHtmlText($('#'+tbl+' tr:eq('+(currentRow+1)+')'), arr[i], $('#'+arr[i]).val());
	}
}

function setHtmlAllOther(tbl, f1 , arr) {
	
	v='';
	if ($('#'+f1).prop('checked')) {
		for (i=0;i<arr.length;i++) {
			v+='<span id="_'+arr[i]+'">'+$('#'+arr[i]).val()+'</span> '
		}
	} else {
		v='None';
	}
	setHtmlText($('#'+tbl+' tr:eq('+(currentRow+1)+')'), f1, v);
}

function toggleCaseArr(arr) {
	r=new Array(arr.length-1);
	for (i=0;i<arr.length;i++) {
		r[i]=toggleCase(arr[i]);
	}
	
	return r;
}
function toggleCase(s) {
	z=s.split("_");
	for (j=0;j<z.length;j++) {
		z[j]=z[j][0].toUpperCase()+z[j].substr(1);
	}
	return z.join(" ");
}
function validate_empty(arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	
	v=true;
	for (i=0;i<arr.length;i++) {
		if ($('#'+arr[i]).val()=='') v=false;
		
		if (!v) {
			if (header[i]=='') header[i]= toggleCase(arr[i]);
			alert(header[i]+" is required");
			$('#'+arr[i]).focus();
			return false;
		}
	}
	return true;
}
function validate_one_required(arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	
	v=false;
	for (i=0;i<arr.length;i++) {
		
		if ($('#'+arr[i]).val()!='' && $('#'+arr[i]).val()!=0) v=true;
		
	}
	if (!v) {
		if (header[i]=='') header[i]= toggleCase(arr[i]);
		err='';
		for (i=0;i<header.length;i++) {
			if (i>0) err+=" or ";
			err+=header[i];
		}
		err+=" is required";
		alert(err);
		$('#'+arr[0]).focus();
		return false;
	}
	return true;
}
function validate_empty_tbl(par, arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	v=true;
	for (i=0;i<arr.length;i++) {
		if (getChild(par, arr[i])=='') {
			v=false;
		}
		if (!v) {
			alert(header[i]+" is required");
			getChildObj(par, arr[i]).focus();
			return false;
		}
	}
	return true;
}
function validate_one_required_tbl(par, arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	
	v=false;
	for (i=0;i<arr.length;i++) {
		
		if (getChild(par, arr[i])!='' && getChild(par, arr[i])!=0) v=true;
		
	}
	if (!v) {
		if (header[i]=='') header[i]= toggleCase(arr[i]);
		err='';
		for (i=0;i<header.length;i++) {
			if (i>0) err+=" or ";
			err+=header[i];
		}
		err+=" is required";
		alert(err);
		getChildObj(par, arr[0]).focus();
		
		return false;
	}
	return true;
}
function fixSelect() {
	$('select').each(function(idx) {
		if ($(this).val()==null || $(this).val()=='') {
			$(this).css('color','#ddd');
		}
		$(this).change(function() {
			if ($(this).val()=='') {
				$(this).css('color','#ddd');
			} else { 
				$(this).css('color','black');
			}
		});
	});
}