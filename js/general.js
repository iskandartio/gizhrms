
function setDatePicker() {
	$("input[class^='date']").each(function(idx) {		
		setDatePickerPrivate(this);
	});
	$("input[class$='date']").each(function(idx) {
		setDatePickerPrivate(this);
	});
	
}

function setDOB(dob) {
	if (!dob) dob='.date_of_birth';
	setDatePickerPrivate($(dob));
	$(dob).datepicker("option","yearRange", '-65:-0');
	$(dob).datepicker("option","defaultDate", "-0y-m-d");
	
}
function setDatePickerPrivate(o) {
	if (!$(o).hasClass('hasDatepicker')) {
		$(o).datepicker({ dateFormat: "dd-mm-yy", changeMonth:true, changeYear:true });
		$(o).css('width','80px');
	}
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
	$(obj).unbind(event);
	$(obj).bind(event, func);
}
function bindDiv(obj, div, event, func) {
	$(obj, div).unbind(event);
	$(obj, div).bind(event, func);
}
function hideColumns(t) {
	$.each($('#'+t+'>tbody>tr'), function(index) {
		$(this).children('td:eq(0)').hide();
	});
	$.each($('#'+t+'>thead>tr'), function(index) {
		$(this).children('th:eq(0)').hide();
	});
}
function hideColumnsArr(t, colArr,f) {
	if (!f) f=fields;
	for (key in colArr) {
		name=colArr[key];
		$.each($('#'+t+'>tbody>tr'), function(index) {
			$(this).children('td:eq('+f[name]+')').hide();
		});
		$.each($('#'+t+'>thead>tr'), function(index) {
			$(this).children('th:eq('+f[name]+')').hide();
		});
	}
}
function hideColumnsArrDiv(t, colArr, div, f) {
	if (!f) f=fields;
	for (key in colArr) {
		name=colArr[key];
		$.each($('#'+t+'>tbody>tr', div), function(index) {
			$(this).children('td:eq('+f[name]+')').hide();
		});
		$.each($('#'+t+'>thead>tr', div), function(index) {
			$(this).children('th:eq('+f[name]+')').hide();
		});
	}
}
function ajax(url, data, Func, type) {
	if (!data) data="";
	$('#freeze').show();
	$.ajax({
		type: (type ? type : 'post'),
		url: url,
		data:$.param(data),
		success: function(msg) {
			$('#freeze').hide();
			if (Func) Func(msg);
		}
	});
}
function send_email() {
	$.ajax({
		type : "post",
		url : "send_email_ajax"						
	});
}
function getChildObj(par, name, f) {
	return $(par).children("td:eq("+f[name]+")");
}
function getChild(par, name, f) {
	var obj=getChildObj(par, name, f);
	if (obj.children().length==1) {
		return htmlDecode(obj.children().val());
	} else if (obj.children("input").length==1) {
		return htmlDecode(obj.children("input").val());
	} else if (obj.children().length==0) {
		return htmlDecode(obj.html());
	}
}
function getChildHtml(par, name, f) {
	var obj=getChildObj(par, name, f);
	return htmlDecode(obj.html());
}
function getChildSelect(par, name, f) {
	var obj=getChildObj(par, name, f);
	return htmlDecode(obj.children("span").html());
}

/*
function getChild(par, name, f, name2) {
	if (!f) {
		f=fields;
	}
	if (!name2) {
		name2=name;
	}
	var idx=0;
	if (f) {
		if (f.hasOwnProperty(name2)) {
			idx=f[name2];
		}
	}
	if (par.children("td:eq("+idx+")").children("span").length>0) {
		return htmlDecode(par.children("td:eq("+idx+")").children("span").html());
	}
	if (par.children("td:eq("+idx+")").children().length==0) {
		return htmlDecode(par.children("td:eq("+idx+")").html());
	}
	if (par.children("td:eq("+idx+")").children().length==1) {
		return par.children("td:eq("+idx+")").children().val();
	}
	return par.children("td:eq("+idx+")").children("input[id^='"+name+"']").val();
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

*/
function htmlDecode(value) {
	if (value) {
		return $('<div />').html(value).text();
	} else {
		return '';
	}
}

function clearText(arr) {
		for (var i=0;i<arr.length;i++) {
			$('#'+arr[i]).val('');
		}
	}
function clearTextDiv(arr,div) {
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i],div).val('');
	}
}
function clearDiv(arr) {
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).html('');
	}
}

function inputFromTableToText(obj, arr, f, p) {
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('.'+arr[i], p).val(getChildHtml(par, arr[i], f));
	}
}
function inputText(obj, arr, f) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(par.children('td:eq('+f[arr[i]]+')').html());
	}
}
function inputDiv(obj, arr, f) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).html(par.children('td:eq('+f[arr[i]]+')').html());
	}
}
function inputFromTableToSelect(obj, arr, f, p) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {	
		var obj=getChildObj(par, arr[i], f);
		$('.'+arr[i], p).val(obj.children("span").html());
	}
}
function inputSelect(obj, arr, f) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {		
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, arr[i], f));
	}
}
function inputFromTableToOther(obj, f1, arr, f,p) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('.'+arr[i],p).val(getChildHtmlSpanVal(par, f1, f, '#_'+arr[i]));
	}
	
}

function inputFromOther(obj, f1, arr, f) {
	if (!f) f=fields;
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, f1, f, '#_'+arr[i]));
	}
	
}

function getChildHtmlSpanVal(par, name, f, span_name) {
	if (!f) f=fields;
	if (!span_name) span_name='';
	return par.children("td:eq("+f[name]+")").children('span'+span_name).html();
}
function textToLabel(par, nameArr, f) {
	if (!f) f=fields;
	for (key in nameArr) {
		name=nameArr[key];
		var td=par.find("td:eq("+f[name]+")");
		td.html(td.find("."+name).val());
	}
	
}
function textToLabelArr(par, name, arr, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var a='';
	for (var i=0;i<arr.length;i++) {
		if (i>0) a+="<br>";
		a+=td.children('#'+arr[i]).val();
	}
	td.html(a);
}
function selectedToLabel(par, nameArr, f) {
	if (!f) f=fields;
	for (key in nameArr) {
		var name=nameArr[key];
		var td=par.children("td:eq("+f[name]+")");
		if (td.children("select").val()=='') {
			td.html("<span style='display:none'></span>");
		} else {
			td.html("<span style='display:none'>"+td.children("."+name).val()+"</span> "+td.children("select").children("option:selected").text());
		}
	}
}

function textToDefaultLabel(par, nameArr, f) {
	if (!f) f=fields;

	if (nameArr.constructor===Array) {
		for (var key in nameArr) {
			var a='';
			var name=nameArr[key];
			var td=par.children("td:eq("+f[name]+")");
			td.html(td.children("#"+name).prop("defaultValue"));
		}
	}

	
}	

function textToDefaultLabelArr(par, name, arr, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var a='';
	for (var i=0;i<arr.length;i++) {
		if (i>0) a+="<br>";
		a+=td.children('#'+arr[i]).prop("defaultValue");
	}
	td.html(a);
}
function selectedToDefaultLabel(par, nameArr, f) {
	if (!f) f=fields;
	for (key in nameArr) {
		var name=nameArr[key];
		var td=par.children("td:eq("+f[name]+")");
		var originalValue=td.children("#"+name).data("originalValue");
		if (originalValue=="") {
			td.html("<span style='display:none'>"+originalValue+"</span> ");
		} else {
			td.children("select").val(originalValue);
			td.html("<span style='display:none'>"+originalValue+"</span> "+td.children("select").children("option:selected").text());
		}
	}
}
function checkboxToDefaultLabel(par, name, trueLabel, falseLabel, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var val=td.children("#"+name).prop("defaultChecked");

	checkboxToLabelSub(par, name, trueLabel, falseLabel, f, val);
	
}
function checkboxToLabel(par, name, trueLabel, falseLabel, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var val= td.children("#"+name).prop("checked") ? "1" : "0";
	checkboxToLabelSub(par, name, trueLabel, falseLabel, f, val);
	
	
}
function checkboxToLabelSub(par, name, trueLabel, falseLabel, f, val) {
	var td=par.children("td:eq("+f[name]+")");
	if (val=="0") {
		td.html("<span style='display:none'>"+val+"</span> "+falseLabel);
	} else {
		td.html("<span style='display:none'>"+val+"</span> "+trueLabel);
	}
}
function labelToSelect(td, combo) {
	var selected='';
	if (td.children().is("span")) {
		selected=td.children().html();	
	} else {
		selected=td.html();
	}
	td.html(combo);
	td.children("select").val(selected);
	td.children("select").data("originalValue", selected);
}
function labelToCheckbox(par, nameArr, f) {
	if (!f) f=fields;
	if (nameArr.constructor===Object) {
		for (var key in nameArr) {
			var a='';
			var name=key;
			var def=getChildHtml(par, key, f);
			var selected= (def==0 ? '' : ' checked ');
			a+="<input type='checkbox'"+selected+" id='"+name+"'/><label for='"+name+"'>"+nameArr[key]+"</label>";
			
			var td=par.children('td:eq('+f[name]+')');
			td.html(a);	
			td.children("input").data("originalValue", def);

		}
	}

}
function labelToText(par, nameArr, f) {
	if (!f) f=fields;
	if (nameArr.constructor===Object) {
		for (var key in nameArr) {
			var a='';
			var name=key;
			var def=getChildHtml(par, key, f);
			a+='<input type="text" placeholder="'+toggleCase(name)+'" class="'+name+'" id="'+name+'" value="'+def+'"';
			var size=nameArr[key];
			if (size!=0) a+=' size="'+size+'"';
			a+='/>';
			
			var td=par.children('td:eq('+f[name]+')');
			td.html(a);	
		}
	}

	
}
function labelToTextArr(par, name, arr, f) {
	var a='';
	if (!f) f=fields;
	
	var def=getChildObj(par, name, f).html();
	var z=def.split("<br>");
	if (z.length==1) z[1]="";
	z[0]=htmlDecode(z[0]);
	z[1]=htmlDecode(z[1]);
	
	for (var i=0;i<arr.length;i++) {
		if (i>0) a+="<br/>";
		a+='<input type="text" class="'+arr[i]+'" id="'+arr[i]+'" value="'+z[i]+'" placeholder="'+toggleCase(arr[i])+'"';
		a+='/>';
	}
	
	var td=par.children('td:eq('+f[name]+')');
	td.html(a);
	
}
function btnChange(par, types, f, adder) {
	if (!adder)  adder='';
	if (!f) f=fields;
	var td=par.children("td:eq("+f['btn']+")");
	var s=getImageTags(types, adder);
	
	td.html(s);
	
}
function getImageTags(types, adder) {
	if (!adder)  adder='';
	var s='';
	for (var i=0;i<types.length;i++) {
		s+='<img src="images/'+types[i]+'.png" class="btn_'+types[i]+adder+'"/> ';
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


function setHtmlAllSelect(tbl, arr) {
	for (var i=0;i<arr.length;i++) {
		if ($('#'+arr[i]).val()!='') {
			setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], '<span style="display:none">'+$('#'+arr[i]).val()+'</span> '+$('#'+arr[i]+' option:selected').html());
		} else {
			setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], '');
		}
	}
}
function setHtmlAllText(tbl, arr) {
	for (var i=0;i<arr.length;i++) {
		setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], $('#'+arr[i]).val());
	}
}

function setHtmlAllDiv(tbl, arr) {
	for (var i=0;i<arr.length;i++) {
		setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), arr[i], $('#'+arr[i]).html());
	}
}

function setHtmlAllOther(tbl, f1 , arr) {
	
	v='';
	if ($('#'+f1).prop('checked')) {
		for (var i=0;i<arr.length;i++) {
			v+='<span id="_'+arr[i]+'">'+$('#'+arr[i]).val()+'</span> '
		}
	} else {
		v='None';
	}
	
	setHtmlText($('#'+tbl+' tbody tr:eq('+(currentRow)+')'), f1, v);
}
function clear_checkbox(id) {
	$("input[id^='"+id+"_']").each(function(idx) {
		$(this).prop('checked',false);
	});
}
function toggleCaseArr(arr) {
	r=new Array(arr.length-1);
	for (var i=0;i<arr.length;i++) {
		r[i]=toggleCase(arr[i]);
	}
	
	return r;
}
function toggleCase(s) {
	z=s.split("_");
	for (var j=0;j<z.length;j++) {
		z[j]=z[j][0].toUpperCase()+z[j].substr(1);
	}
	return z.join(" ");
}
function validate_empty(arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	
	v=true;
	for (var i=0;i<arr.length;i++) {
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
	for (var i=0;i<arr.length;i++) {
		
		if ($('#'+arr[i]).val()!='' && $('#'+arr[i]).val()!=0) v=true;
		
	}
	if (!v) {
		if (header[i]=='') header[i]= toggleCase(arr[i]);
		err='';
		for (var i=0;i<header.length;i++) {
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
function validate_empty_tbl(par, arr, header, f) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	if (!f) {
		f=fields;
	}
	v=true;
	for (var i=0;i<arr.length;i++) {
		if (getChild(par, arr[i], f)=='') {
			alert(header[i]+" is required");
			getChildObj(par, arr[i], f).focus();
			return false;
		}
	}
	return true;
}
function validate_empty_col(col, arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	for (var i=0;i<arr.length;i++) {
		var obj=$(col).find('.'+arr[i]);
		if ($(obj).val()=='') {
			alert(header[i]+" is required");
			$(obj).focus();
			return false;
		}
	}
	return true;
}

function validate_one_required_tbl(par, arr, header, f, name) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	if (!f) {
		f=fields;
	}
	
	for (var i=0;i<arr.length;i++) {
		var val=getChildObj(par, name, f).children('.'+arr[i]).val();
		if (val!='' && val!=0) return true;
		
	}
	if (header[i]=='') header[i]= toggleCase(arr[i]);
	err='';
	for (var i=0;i<header.length;i++) {
		if (i>0) err+=" or ";
		err+=header[i];
	}
	err+=" is required";
	alert(err);
	getChildObj(par, arr[0], f).focus();
	return false;
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
function numeric(o) {
	$.fn.numeric(o, 'decimal',true);
	$(o).css("text-align","right");
	$(o).css("width","75px");
	$(o).data("type","numeric");
}

function prepareDataMultiInput(data, arr, par) {
	for (var i=0;i<arr.length;i++) {
		if ($(par).find('.'+arr[i]).data("type")=='numeric') {
			data[arr[i]]=cNum($(par).find('.'+arr[i]).val());
		} else {
			var obj=$(par).find('.'+arr[i]);
			if ($(obj).is('span')) {
				data[arr[i]]=$(obj).html();
			} else {
				data[arr[i]]=$(obj).val();
			}
		}
	}
	return data;
}


function prepareDataText(data, arr, par, f) {
	if (!par) {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=$('#'+arr[i]).val();
		}
	} else {
		if (!f) f=fields;
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=getChild(par, arr[i], f);
		}
	}
	return data;
}
function prepareDataHtml(data, arr, par, f) {
	if (!par) {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=$('#'+arr[i]).html();
		}
	} else {
		if (!f) f=fields;
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=getChildHtml(par, arr[i], f);
		}
	}
	return data;
}
function prepareDataCheckBox(data, arr, par, f) {
	if (!par) {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=$('#'+arr[i]).prop('checked') ? 1 : 0;
		}
	} else {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=getChildObj(par, arr[i], f).children().prop('checked') ? 1 : 0;
		}
	}
	return data;
}
function prepareDataDecimal(data, arr, par, f) {
	if (!par) {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=cNum($('#'+arr[i]).val());
		}
	} else {
		for (var i=0;i<arr.length;i++) {
			data[arr[i]]=cNum(getChild(par, arr[i], f));
		}
	}
	return data;
}

function generate_assoc(arr) {
	var res=new Array();
	for (var i=0;i<arr.length;i++) {
		res[arr[i]]=i;
	}
	return res;
}
function cNum(str) {
	if (str.length==0) return null;
	return str.replace(/,/g,'');
	
}
function sanitize(tag) {
	tag= tag.replace(/<input/,"&lt;input");
	
	tag=tag.replace(/<\/span/, "&lt;/span");
	tag=tag.replace(/<textarea/,"&lt;textarea");
	
	return tag;
}
function setTextArr(obj, arr) {
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(obj[arr[i]]);
	}
}
function repeat(pattern, count) {
    if (count < 1) return '';
    var result = '';
    while (count > 1) {
        if (count & 1) result += pattern;
        count >>= 1, pattern += pattern;
    }
    return result + pattern;
}
function setCookie(cname, cvalue, hours) {
    var d = new Date();
    d.setTime(d.getTime() + (hours*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}
function autoCompleteEmployee(obj, func) {
	
	$(obj).autocomplete({
		matchContains: true,
		minLength: 0,
		source : employee_choice,
		focus: function( event, ui ) {
			$(this).val(ui.item.label);
			
			return false;
		},
		select: function( event, ui ) {
			$(this).data("id", ui.item.value);
			if (func) func(this);
			return false;
		}
	}).focus(function() {
		$(this).autocomplete('search', $(this).val())
	});
	
}

function autoCompleteToDefaultLabel(par, arr, f) {
	for (var i=0;i<arr.length;i++) {
		var name=arr[i];
		var td=getChildObj(par, name, f);
		var id=$(td).children("."+name).data("default_id");
		var val=$(td).children("."+name).prop("defaultValue");
		td.html("<span class='"+name+" hidden'>"+id+"</span><span class='"+name+"_name'>"+val+"</span>");
	}
}
function autoCompleteToLabel(par, arr, f) {
	for (var i=0;i<arr.length;i++) {
		var name=arr[i];
		var td=getChildObj(par, name, f);
		var id=$(td).children("."+name).data("id");
		var val=$(td).children("."+name).val();
		td.html("<span class='"+name+" hidden'>"+id+"</span><span class='"+name+"_name'>"+val+"</span>");
	}
}
function labelToAutoComplete(par, arr, f) {
	for (var i=0;i<arr.length;i++) {
		var name=arr[i];
		var td=getChildObj(par, name, f);
		var id=$(td).children("."+name).html();
		var span=$(td).children("."+name+"_name");
		td.html("<input type='text' class='"+name+"' value='"+span.html()+"'/>");
		$('.'+name, td).data("id", id);
		$('.'+name, td).data("default_id", id);
	}
}
function prepareDataAutoComplete(data, arr, par,f) {
	if (!f) f=fields;
	for (var i=0;i<arr.length;i++) {
		name=arr[i];
		data[name]=getChildObj(par, name, f).children("."+name).data("id");
	}
	return data;
}
function prepareTabs(name) {
	activeTab=getCookie(name+'_tabs');
	
	$( "#tabs" ).tabs({
		
		create: function( event, ui ) {
			if (activeTab==0) load(0);
		},
		activate: function( event, ui ) {
			setCookie(name+'_tabs', $("#tabs").tabs("option","active"), 1);
			load($('#tabs').tabs("option","active"));
		},
	});
	$( "#tabs" ).tabs( "option", "active", activeTab);
}
function decryptData(text){
    var hash = CryptoJS.MD5('secret');
    var key = CryptoJS.enc.Utf8.parse(hash);
    var iv = CryptoJS.enc.Utf8.parse('1234567812345678');
    var dec = CryptoJS.AES.decrypt(
            text, 
            key, 
            {
                iv: iv, 
                mode: CryptoJS.mode.CBC, 
                padding: CryptoJS.pad.ZeroPadding 
            });
    return CryptoJS.enc.Utf8.stringify(dec);
}
function encryptData(text){
    var hash = CryptoJS.MD5('secret');
    var key = CryptoJS.enc.Utf8.parse(hash);
    var iv = CryptoJS.enc.Utf8.parse('1234567812345678');
    var dec = CryptoJS.AES.decrypt(
            text, 
            key, 
            {
                iv: iv, 
                mode: CryptoJS.mode.CBC, 
                padding: CryptoJS.pad.ZeroPadding 
            });
    return CryptoJS.enc.Utf8.stringify(dec);
}