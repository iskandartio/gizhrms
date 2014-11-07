
function setDatePicker() {
	$("input[class^='date']").datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
	$("input[class$='date']").datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
}
function convertDate(d) {
	
	return d.substring(6,10)+'-'+d.substring(3,5)+'-'+d.substring(0,2);
}
function bindAll(t)  {
	bind('.btn_edit','click', Edit);
	bind('.btn_save','click', Save);
	bind('.btn_delete','click', Delete);
	bind('.btn_cancel','click', Cancel);
	if (!t) t=table;
	hideColumns(t);
}
function bind(obj, event, func) {
	$(obj).unbind();
	$(obj).bind(event, func);
}
function hideColumns(t) {
	$.each($('#'+t+' tbody tr'), function(index) {
		$(this).children('td:eq(0)').hide();
	});
	$.each($('#'+t+' thead tr'), function(index) {
		$(this).children('th:eq(0)').hide();
	});
}
function getChild(par, name, f) {
	if (!f) {
		f=fields;
	}

	if (par.children("td:eq("+f[name]+")").children("span").length>0) {
		return par.children("td:eq("+f[name]+")").children("span").html();
	}
	if (par.children("td:eq("+f[name]+")").children().length==0) {
		return par.children("td:eq("+f[name]+")").html();
	}
	
	return par.children("td:eq("+f[name]+")").children("#"+name).val();
}
function getChildObj(par, name, f, force) {
	if (!f) {
		f=fields;
		
	}
	if (par.children("td:eq("+f[name]+")").children().length==0||force) {
		return par.children("td:eq("+f[name]+")");
	}
	return par.children("td:eq("+f[name]+")").children("#"+name);
}

function clearText(arr) {
		for (i=0;i<arr.length;i++) {
			$('#'+arr[i]).val('');
		}
	}

function inputText(obj, arr, f) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(par.children('td:eq('+f[arr[i]]+')').html());
	}
}
function inputSelect(obj, arr) {
	var par=$(obj).closest("tr");
	for (i=0;i<arr.length;i++) {
		
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, arr[i], fields));
	}
}
function inputFromOther(obj, f1, arr) {
	var par=$(obj).closest("tr");
	for (i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, f1, fields, '#_'+arr[i]));
	}
	
}

function getChildHtmlSpanVal(par, name, f, span_name) {
	if (!f) f=fields;
	if (!span_name) span_name='';
	return par.children("td:eq("+f[name]+")").children('span'+span_name).html();
}
function textToLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	td.html(td.children("#"+name).val());
}
function textToLabelArr(par, name, arr, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var a='';
	for (i=0;i<arr.length;i++) {
		if (i>0) a+="<br>";
		a+=td.children('#'+arr[i]).val();
	}
	td.html(a);
}
function selectedToLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	if (td.children("select").val()=='') {
		td.html("<span style='display:none'></span>");
	} else {
		td.html("<span style='display:none'>"+td.children("#"+name).val()+"</span> "+td.children("select").children("option:selected").text());
	}
	
}
function textToDefaultLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	td.html(td.children("#"+name).prop("defaultValue"));
}

function textToDefaultLabelArr(par, name, arr, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var a='';
	for (i=0;i<arr.length;i++) {
		if (i>0) a+="<br>";
		a+=td.children('#'+arr[i]).prop("defaultValue");
	}
	td.html(a);
}
function selectedToDefaultLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
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
	var td=par.children('td:eq('+fields[name]+')');
	td.html(a);
	td.children("select").val(i);
	td.children("select").data("originalValue", i);
}
function labelToText(par, name, size, f) {
	var a='';
	if (!f) f=fields;
	
	def=getChild(par, name, f);
	a+='<input type="text" placehoder="'+toggleCase(name)+'" class="'+name+'" id="'+name+'" value="'+def+'"';
	if (size) a+=' size="'+size+'"';
	a+='/>';
	
	var td=par.children('td:eq('+f[name]+')');
	td.html(a);
	
}
function labelToTextArr(par, name, arr, size, f) {
	var a='';
	if (!f) f=fields;
	
	var def=getChildObj(par, name, f, true).html();
	var z=def.split("<br>");
	for (i=0;i<arr.length;i++) {
		if (i>0) a+="<br/>";
		a+='<input type="text" class="'+arr[i]+'" id="'+arr[i]+'" value="'+z[i]+'" placeholder="'+toggleCase(arr[i])+'"';
		if (size) a+=' size="'+size+'"';
		a+='/>';
	}
	
	var td=par.children('td:eq('+f[name]+')');
	td.html(a);
	
}
function btnChange(par, types, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f['btn']+")");
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
	var td=par.children("td:eq("+f[name]+")");
	td.html(val);
}
function setText(par, name, val) {
	var td=par.children("td:eq("+fields[name]+")").children("input[type=text]").val(val);
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
			setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], '<span style="display:none">'+$('#'+arr[i]).val()+'</span> '+$('#'+arr[i]+' option:selected').html());
		} else {
			setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], '');
		}
	}
}
function setHtmlAllText(tbl, arr) {
	for (i=0;i<arr.length;i++) {
		setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], $('#'+arr[i]).val());
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
	setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), f1, v);
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
			
		} else {
			$(this).css('color','black');
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

function prepareDataText(data, arr) {
	for (i=0;i<arr.length;i++) {
		data+="&"+arr[i]+"="+$('#'+arr[i]).val();
	}
	return data;
}
function prepareDataCheckBox(data, arr) {
	for (i=0;i<arr.length;i++) {
		data+="&"+arr[i]+"="+($('#'+arr[i]).prop('checked') ? 1 : 0);
	}
	return data;
}
function generate_assoc(arr) {
	var res=new Array();
	for (i=0;i<arr.length;i++) {
		res[arr[i]]=i;
	}
	return res;
}
