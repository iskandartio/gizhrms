
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
function hideColumnsArr(t, colArr,f) {
	if (!f) f=fields;
	for (key in colArr) {
		name=colArr[key];
		$.each($('#'+t+' tbody tr'), function(index) {
			$(this).children('td:eq('+f[name]+')').hide();
		});
		$.each($('#'+t+' thead tr'), function(index) {
			$(this).children('th:eq('+f[name]+')').hide();
		});
	}
}
function ajax(url, data, Func, type) {
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
function htmlDecode(value) {
	if (value) {
		return $('<div />').html(value).text();
	} else {
		return '';
	}
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
		for (var i=0;i<arr.length;i++) {
			$('#'+arr[i]).val('');
		}
	}
function clearDiv(arr) {
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).html('');
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
function inputSelect(obj, arr) {
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {		
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, arr[i], fields));
	}
}
function inputFromOther(obj, f1, arr) {
	var par=$(obj).closest("tr");
	for (var i=0;i<arr.length;i++) {
		$('#'+arr[i]).val(getChildHtmlSpanVal(par, f1, fields, '#_'+arr[i]));
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
		var td=par.children("td:eq("+f[name]+")");
		td.html(td.children("#"+name).val());
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
function selectedToLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	if (td.children("select").val()=='') {
		td.html("<span style='display:none'></span>");
	} else {
		td.html("<span style='display:none'>"+td.children("#"+name).val()+"</span> "+td.children("select").children("option:selected").text());
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
function selectedToDefaultLabel(par, name, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var originalValue=td.children("#"+name).data("originalValue");
	if (originalValue=="") {
		td.html("<span style='display:none'>"+originalValue+"</span> ");
	} else {
		td.children("select").val(originalValue);
		td.html("<span style='display:none'>"+originalValue+"</span> "+td.children("select").children("option:selected").text());
	}
}
function checkboxToDefaultLabel(par, name, trueLabel, falseLabel, f) {
	if (!f) f=fields;
	var td=par.children("td:eq("+f[name]+")");
	var val=td.children("#"+name).data("originalValue");

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
function labelToSelect(par, name, def, options) {
	var a='';
	a+='<select id="'+name+'" title="'+toggleCase(name)+'"><option value="" disabled> '+def+'</option>';
	i=getChildHtmlSpanVal(par, name);
	a+=options;
	a+='</select>';
	var td=par.children('td:eq('+fields[name]+')');
	td.html(a);
	td.children("select").val(i);
	td.children("select").data("originalValue", i);
}
function labelToCheckbox(par, nameArr, f) {
	if (!f) f=fields;
	if (nameArr.constructor===Object) {
		for (var key in nameArr) {
			var a='';
			var name=key;
			var def=getChild(par, key, f);
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
			var def=getChild(par, key, f);
			a+='<input type="text" placehoder="'+toggleCase(name)+'" class="'+name+'" id="'+name+'" value="'+def+'"';
			var size=nameArr[key];
			if (size!=0) a+=' size="'+size+'"';
			a+='/>';
			
			var td=par.children('td:eq('+f[name]+')');
			td.html(a);	
		}
	}

	
}
function labelToTextArr(par, name, arr, size, f) {
	var a='';
	if (!f) f=fields;
	
	var def=getChildObj(par, name, f, true).html();
	var z=def.split("<br>");
	if (z.length==1) z[1]="";
	for (var i=0;i<arr.length;i++) {
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
	for (var i=0;i<types.length;i++) {
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
	for (var i=0;i<arr.length;i++) {
		if ($('#'+arr[i]).val()=='') {
			alert('Please input the required data');
			$('#'+arr[i]).focus();
		}
	}
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
function validate_empty_tbl(par, arr, header) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	v=true;
	for (var i=0;i<arr.length;i++) {
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
function validate_one_required_tbl(par, arr, header, f, name2) {
	if (!header) {
		header=toggleCaseArr(arr);
	}
	if (!f) {
		f=fields;
	}
	v=false;
	for (var i=0;i<arr.length;i++) {
		
		if (getChild(par, arr[i], f, name2)!='' && getChild(par, arr[i], f,name2)!=0) v=true;
		
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
		getChildObj(par, arr[0], f).focus();
		
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
function numeric(o) {
	$.fn.numeric(o, 'decimal',true);
	$(o).css("text-align","right");
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
function prepareDataHtml(data, arr) {
	for (var i=0;i<arr.length;i++) {
		data[arr[i]]=$('#'+arr[i]).html();
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
			data[arr[i]]=getChildObj(par, arr[i]).prop('checked') ? 1 : 0;
		}
	}
	return data;
}
function prepareDataDecimal(data, arr) {
	for (var i=0;i<arr.length;i++) {
		data[arr[i]]=$('#'+arr[i]).val().replace(/,/g,'');
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
	if (str.length==0) return 0;
	return str.replace(/,/g,'');
	
}
function sanitize(tag) {
	tag= tag.replace(/<input/,"&lt;input");
	
	tag=tag.replace(/<\/span/, "&lt;/span");
	tag=tag.replace(/<textarea/,"&lt;textarea");
	
	return tag;
/*
	var allowedTag=['b','i','u','ul','li','h1','h2','h3'];
	var tagArr=new Array();
	var tagHash={}
	var r="";

	var start=-1;
	var idx=0;
	var flag=false;
	for (var i=0;i<tag.length;i++) {
		if (tag[i]=='<') {
			start=i;
			r+=tag.substr(idx, i-idx);
		}
		if (start>-1 && tag[i]=='>') {
			tag_validate=tag.substr(start+1,i-start-1);
			if (tag_validate[0]=='/') {
				tag_validate=tag_validate.substr(1);
				var index = tagArr.indexOf(tag_validate);
				if (index == tagArr.length-1) {
					tagArr.splice(index, 1);
					delete tagHash[tag_validate];
					flag=true;
				} else {
					flag=false;
					for (var j=tagArr.length-1;j>=0;j--) {
						if (tagArr[j]==tag_validate) {
							flag=true;
							delete tagHash[tagArr[j]];
							tagArr.splice(j,1);
							break;
						} else {
							i1=tagHash[tagArr[j]];
							r=r.substr(0,i1)+r.substr(i1).replace("<", "&lt;");
							delete tagHash[tagArr[j]];0
							tagArr.splice(j,1);
						}
					}
				}
			} else {
				if (allowedTag.indexOf(tag_validate)==-1) {
					flag=false;
					
				} else {
					flag=true;
					tagArr.push(tag_validate);
					tagHash[tag_validate]=start;
				}
				

			}
			if (!flag) {
				r+=tag.substr(start, i-start+1).replace("<","&lt;");
			} else {
				r+=tag.substr(start, i-start+1);
				
			}
			idx=i+1;
			start=-1;
			
		}
		
	}
	for (key in tagHash) {
		i1=tagHash[key];
		r=r.substr(0,i1-1)+r.substr(i1).replace("<", "&lt;");
	}
	if (r=='') r=tag;
	return r;
*/
}
