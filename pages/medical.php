<?php
	$res=Employee::get_active_employee_simple();
	$combo_user="";
	
?>
<script>
	var fields=generate_assoc(['invoice_date','invoice_val','btn']);
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;
	$(function() {
		autoCompleteEmployee('#employee_id', EmployeeChange);
	});
	function bindAll() {
		bind('#popup_detail_btn','click', PopupDetail);
		$('#popup_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		setDatePicker();
		$('input[id="invoice_val"]').each(function(idx) {
			numeric($(this));
		});
		bind('#btn_add_claim','click',AddClaim);
		bind('.btn_save','click',Save);
		bind('.btn_edit','click',Edit);
		bind('.btn_delete','click',Delete);
		bind('.btn_cancel','click',Cancel);
		bind('#btn_save_all','click', SaveAll);
		bind('.btn_delete_claim','click',DeleteClaim);
		bind('#print_medical_data','click',Print);
		bind('.year','change',ChangeYear);
		$("#tbl_add_claim input").keydown(function(e) {
			if (e.which==13) {
				var o=this;
				
				if (!goNextInput("#tbl_add_claim input", this)) {
					AddClaim();
				}
				
				if ($(o).prop('id')=='invoice_val') {
					var par=$(o).closest("tr");
					textToLabel(par, ['invoice_date','invoice_val'], fields);
					btnChange(par, ['edit','delete'], fields);
					
				} 
			}
			
		});
	}
	function SaveAll() {
		var data={}
		var invoice_date=new Array();
		var invoice_val=new Array();
		var flag=true;
		$('#tbl_add_claim>tbody>tr').each(function(idx) {
			var v1=getChild($(this), 'invoice_date', fields);
			if (v1!='') {
				invoice_date.push(v1);
				var v2=getChild($(this), 'invoice_val', fields);
				if (v2=='') {
					alert('Please input invoice value');
					flag=false;
					return;
				}
				invoice_val.push(cNum(v2));
			}
			
		});
		if (!flag) return;
		data['type']='save_all';
		data['invoice_date']=invoice_date;
		data['invoice_val']=invoice_val;
		data['user_id']=$('#employee_id').data("id");
		data['year']=$('.year:checked').val();
		var success=function(msg) {
			$('#popup_detail').dialog("close");
			if (msg!='') alert(msg);
			EmployeeChange();
		}
		ajax("medicalAjax.php",data, success);
	}
	
	function goNextInput(tbl, o) {
		var flag=false;
		$(tbl).each(function(idx) {
			if (o==this) {
				if ($(tbl).length>idx+1) {
					$(tbl)[idx+1].focus();
					flag=true;
				} 
				return false;
			}
		});
		return flag;
	}
	
	function AddClaim() {
		$s="<tr><td><?php _t("invoice_date")?></td><td align='right'><?php _t("invoice_val")?></td><td>"+getImageTags(['save','delete'])+"</tr>";
		$('#tbl_add_claim').append($s);
		bindAll();
	}

	function Save() {
		var par=$(this).closest("tr");
		textToLabel(par, ['invoice_date','invoice_val'], fields);
		btnChange(par, ['edit','delete'], fields);
		bindAll();
	}
	function Edit() {
		var f= fields;
		var par=$(this).closest("tr");
		labelToText(par, {'invoice_date':0,'invoice_val':0}, f);
		btnChange(par, ['save','cancel'],f);
		bindAll();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['invoice_date','invoice_val'], fields);
		btnChange(par, ['edit','delete'], fields);
		bindAll();
	}
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		par.remove();
	}
	function DeleteClaim() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete_claim';
		data['invoice_date']=par.children("td:eq(0)").html();
		data['user_id']=$('#employee_id').data("id");
		var success=function(msg) {
			if (msg!='') alert(msg);
			par.remove();	
		}
		ajax('medicalAjax.php',data, success);
	}
	function PopupDetail()  {
		var data={}
		data['type']='get_add_claim';
		data['user_id']=$('#employee_id').data("id");
		data['year']=$('.year:checked').val();
		var success=function(msg) {
			$('#popup_detail').html(msg);
			$('#popup_detail').dialog("open");
			bindAll();
		}
		ajax('medicalAjax.php',data, success);
	}
	
	
	function EmployeeChange() {
		var data={}
		data['type']='search';
		data['employee_id']=$('#employee_id').data("id");
		data['year']=$('.year:checked').val();
		
		var success=function(msg) {
			$('#div_search_result').html(msg);
			bindAll();
			
		}
		ajax("medicalAjax.php",data, success);
	}
	function Print() {
		window.open("print_medical_data.php?user_id="+$('#employee_id').data("id")+"&year="+$('.year:checked').val());
	}
	function ChangeYear() {
		EmployeeChange();
	}
</script>

<div class='row'><input type='radio' name='year' class='year' checked="checked" value='this_year'/>This Year<input type='radio' name='year' class='year' value='last_year'/>Last Year</div>
Employee Name : <?php _t("employee_id")?><p>
<div id='div_search_result'>
</div>
<div id='popup_detail'>
</div>