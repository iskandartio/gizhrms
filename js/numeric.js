	var nc=true;
	$.fn.numeric = function(o, type, n) {			
		
		$(o).focus(function() { 
			numeric_focus(o[0]);
		});
		
		$(o).keydown(function(event) {
			
			numeric_keydown(event, type);
		});
		$(o).keyup(function(event) { 
			numeric_keyup(o[0], event);
		});
		nc=n;
		$(o).mouseup(function() { numeric_mouseup(event);});
		$(o).blur(function() { numeric_blur(o[0], nc);});
		
	}
	function numeric_keydown(e, input_type) {
		var key = e.which || e.keyCode;
		if (input_type=='decimal') {
			if (!e.shiftKey && !e.altKey &&
				// numbers   
					key >= 48 && key <= 57 ||
				// Numeric keypad
					key >= 96 && key <= 105 ||
				// comma, period and minus, . on keypad
					key == 189 || key == 190 || key == 188 || key == 109 || key == 110 ||
				// Backspace and Tab and Enter
				   key == 8 || key == 9 || key == 13 ||
				// Home and End
				   key == 35 || key == 36 ||
				// left and right arrows
				   key == 37 || key == 39 ||
				// Del and Ins
				   key == 46 || key == 45)
					return;	
		}
		if (input_type=='integer') {
			if (!e.shiftKey && !e.altKey &&
					// numbers   
						key >= 48 && key <= 57 ||
					// Numeric keypad
						key >= 96 && key <= 105 ||
					// comma, period and minus, . on keypad
						key == 189 || key == 109 ||
					// Backspace and Tab and Enter
					   key == 8 || key == 9 || key == 13 ||
					// Home and End
					   key == 35 || key == 36 ||
					// left and right arrows
					   key == 37 || key == 39 ||
					// Del and Ins
					   key == 46 || key == 45)
						return;
		}

		if (e.ctrlKey) return;
		e.preventDefault ? e.preventDefault() : e.returnValue=false;
		
	}
	function numeric_keyup(o, e){
		if (e.keyCode==86|| e.keyCode==8 || e.keyCode==46||(e.keyCode>=48 && e.keyCode<=57)||(e.keyCode>=96 && e.keyCode<=105)||e.keyCode==110||e.keyCode==190) {
			numeric_blur(o, nc);
		}
	}
	
	function numeric_blur(o, not_count) {
		if (o.value=='') return;
		if (o.value=='0') return;
		var selStart=o.selectionStart;
		sellength=o.value.length;
		str = o.value.replace(/,/g,'');
		min=false;
		if (str.substring(0,1)=='-') min=true;
		if (min) {
			str=str.substring(1);
		}
		str = str.replace(/[^0-9\.]/g,'');
		if (str=='') str='0';
		s = str.split('.');
		var r='';
		if (s[0]) {
			while (s[0].substring(0,1)=='0') {
				s[0]=s[0].substring(1);
			}
			r=(s[0].substring(0, s[0].length % 3));
			r2=s[0].substring(s[0].length % 3);
			j=r2.length;
			if (j>0) {
				if (r!='') r+=',';
				r+=r2.substring(0,3);
				for (i=3;i<j;i=i+3) {
					r+=','+r2.substring(i,i+3);
				}
			}
		}
		if (min) r='-'+r;
		o.value=r;
		o.selectionStart=selStart;
		o.selectionEnd=selStart;
		sellength2=o.value.length;
		if (!not_count) {
			count_total();
		}
	}


	var numeric_focus_flag=false;
	function numeric_focus(o) {
		s = o.value.replace(/,/g,'');
		o.value=s;
		o.select();
		numeric_focus_flag=true;
	}

	function numeric_mouseup(event) {
		if (numeric_focus_flag) {
			event.preventDefault();	
			numeric_focus_flag=false;
		}
	}
