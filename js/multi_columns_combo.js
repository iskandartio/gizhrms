document.onkeydown = function(e){
  var n = (window.Event) ? e.which : e.keyCode;
  if(n==38 || n==40) {
	  return false;
  }
}

function getClassName(o) {
	//return o.className=='' ? o.getAttribute("class") : o.className;
	
	if (o.className=='') {
		return o.getAttribute("class");
	} else {
		return o.className;
	}
	
}
function setClassName(o, val) {
	if (o.className=='') {
		
		o.setAttribute("class",val);
		return;
		
	} else {
		o.className=val;
	}
}
function getKeyCode(e) {
	if (e.keyCode) {
		return e.keyCode;
	} else {
		return e.which;
	}
}
function showCombo(combo_type, o, ev) {
	var obj_val=document.getElementById(o.id+"_value");
	var sel = document.getElementById("selected_row");     
	var combo=document.getElementById(o.id+"_combo");
	var table = document.getElementById("combo");     
	var rows = table.rows;
	
	className=getClassName(combo);
	e=getKeyCode(ev);
	
	if (e==27) {
		hideCombo(o);
		return;
	}
	if (e==13) {
		hideCombo(o);
		o.value=table.rows[sel.value].cells[0].innerHTML;
		obj_val.value=table.rows[sel.value].cells[1].innerHTML;
		return;
	}
	
	if (className!='combobox') {
		make_visible(o);
		obj_val.value='';
	} else {
		if (e==40) {
			if (sel.value==rows.length-1) return;
			if (sel.value >-1) {
				setClassName(rows[sel.value],"not_selected");
			}
			sel.value=sel.value - -1;
			setClassName(rows[sel.value],"selected");
			o.value=table.rows[sel.value].cells[0].innerHTML;
			obj_val.value=table.rows[sel.value].cells[1].innerHTML;
			return;
		}
		if (e==38) {
			setClassName(rows[sel.value],"not_selected");
			if (sel.value>0) {
				sel.value=sel.value-1;
				setClassName(rows[sel.value],"selected");
				o.value=table.rows[sel.value].cells[0].innerHTML;
				obj_val.value=table.rows[sel.value].cells[1].innerHTML;
			} else {
				sel.value=-1;
				o.value='';
				obj_val.value='';
			}
			return;
		}	
	}

	
	if (sel.value!=-1) {
		setClassName(rows[sel.value],"not_selected");
	}
	if (o.value=='') {
		return;
	}
	if (combo_type=='search') {
		for (i=0;i<rows.length;i++) {
			if (table.rows[i].cells[0].innerHTML.indexOf(o.value)!=-1) {
				sel.value=i;
				setClassName(rows[sel.value],"selected");
				return;
			}
		}	
	}	
	if (combo_type=='filter') {
		searchAjax(o);
	}

}

function make_visible(o) {
	
	var combo=document.getElementById(o.id+"_combo");
	o2=o;
	rel_top=o2.offsetTop+o2.offsetHeight;
	rel_left=o2.offsetLeft;
	while (o2!=null) {
		o2=o2.offsetParent;
		if (o2!=null) {
			rel_top=rel_top+ o2.offsetTop;
			rel_left=rel_left+ o2.offsetLeft;
		}
	}
	setClassName(combo, "combobox");
	combo.style.left=rel_left+'px';
	combo.style.top=rel_top+'px';		
	
	
}
function mouse_over(o) {
	var table = document.getElementById("combo");     
	var rows = table.rows;
	var sel=document.getElementById("selected_row");
	setClassName(rows[sel.value], "not_selected");
	setClassName(o, "selected");
}
function mouse_out(o) {
	setClassName(o, "not_selected");
}
function mouse_down(o, main) {
	document.getElementById(main).value=o.cells[0].innerHTML;
	document.getElementById(main+'_value').value=o.cells[1].innerHTML;
	
}

function hideCombo(o) {
	var sel = document.getElementById("selected_row");
	
	var obj_val=document.getElementById(o.id+"_value");
	//obj_val.value='';
	var combo=document.getElementById(o.id+"_combo");
	setClassName(combo, "combobox_invisible");
}
