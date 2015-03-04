<?php
	$res=employee::get_active_employee_simple();
	$combo_user="";
	$arr=array();
	foreach ($res as $row) {
		if ($combo_user!="") $combo_user.=",";
		$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
		array_push($arr,array('label'=>$row['first_name']." ".$row['last_name'], 'value'=>$row['user_id']));
	}
	
	$combo_user=json_encode($arr);
	
?>
<script>
	var fields=generate_assoc(['invoice_date','invoice_val','btn']);
	$(function() {
		autoCompleteEmployee();
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
		bind('.btn_edit_claim','click',EditClaim);
		bind('.btn_delete_claim','click',DeleteClaim);
		$("#tbl_add_claim input").keydown(function(e) {
			if (e.which==13) {
				var o=this;
				
				if (!goNextInput("#tbl_add_claim input", this)) {
					AddClaim();
					goNextInput("#tbl_add_claim input", this);
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
		
		var success=function(msg) {
			$('#popup_detail').dialog("close");
			if (msg!='') alert(msg);
			EmployeeChange();
		}
		ajax("outpatientAjax.php",data, success);
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
		data['employee_outpatient_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			if (msg!='') alert(msg);
			while (par.next().length>0) {
				par.next().remove();
			}
			par.remove();	
		}
		ajax('outpatientAjax.php',data, success);
	}
	function PopupDetail()  {
		var data={}
		data['type']='get_add_claim';
		data['user_id']=$('#employee_id').data("id");
		data['employee_outpatient_id']=0;
		var success=function(msg) {
			$('#popup_detail').html(msg);
			$('#popup_detail').dialog("open");
			bindAll();
		}
		ajax('outpatientAjax.php',data, success);
	}
	function EditClaim() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='get_add_claim';
		data['user_id']=$('#employee_id').data("id");
		data['employee_outpatient_id']=par.children("td:eq(0)").html();
		
		var success=function(msg) {
			$('#popup_detail').html(msg);
			$('#popup_detail').dialog("open");
			bindAll();
		}
		ajax('outpatientAjax.php',data, success);	
	}	
	function EmployeeChange() {
		var data={}
		data['type']='search';
		data['employee_id']=$('#employee_id').data("id");
		var success=function(msg) {
			$('#div_search_result').html(msg);
			bindAll();
			hideColumns('tbl_claim');
		}
		ajax("outpatientAjax.php",data, success);
	}
	function autoCompleteEmployee() {
		$('.employee_id').autocomplete({
			matchContains: true,
			minLength: 0,
			source : <?php _p($combo_user)?>,
			focus: function( event, ui ) {
				$(this).val(ui.item.label);
				
				return false;
			},
			select: function( event, ui ) {
				$(this).data("id", ui.item.value);
				EmployeeChange();
				return false;
			}
		}).focus(function() {
			$(this).autocomplete('search', $(this).val())
		});
		
	}
</script>
Employee Name : <?php _t("employee_id")?><p>

<div id='div_search_result'>
</div>
<div id='popup_detail'>
</div>