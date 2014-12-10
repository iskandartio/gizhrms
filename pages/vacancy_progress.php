<?php
	$res=db::select('vacancy_progress','*','','sort_id');
	
?>


<script>
	var fields=generate_assoc(['vacancy_progress_id','vacancy_progress_val','process_name','required','active','btn','email']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		
		bind('.btn_edit',"click", Edit);
		bind('.btn_cancel',"click", Cancel);
		bind('.btn_save',"click", Save);
		bind('.btn_up',"click",Up);
		bind('.btn_down',"click",Down);
		bind('.btn_delete',"click",Delete);
		bind('#btn_add',"click",Add);
		bind('.btn_invitation', "click", Email);
		bind('.btn_rejection', "click", Email);
		bind('.btn_interviewer', "click", Email);
		bind('.btn_reference', "click", Email);
		bind('.btn_save_email',"click", SaveEmail);
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		hideColumnsArr('tbl', ['vacancy_progress_id','required']);
	}
	function SaveEmail() {
		var data={}
		data['type']='save_email';
		data=prepareDataText(data, ['email_type','email_to','email_subject','params']);
		data=prepareDataHtml(data,['email_content']);
		var success=function(msg) {
			$('#show_detail').dialog("close");
			
		}
		ajax('vacancy_progressAjax.php', data, success);
	}
	
	function Email() {
		type=$(this).html().toLowerCase();
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_email';
		data['email_type']=type+"_"+getChild(par, 'vacancy_progress_id');
		data['vacancy_progress_val']=getChild(par, 'vacancy_progress_val');
		data['invitereject']=toggleCase(type);
		var success=function(msg) {
			$('#show_detail').html(msg);
			$('#show_detail').dialog("open");
			bindAll();
		}
		
		ajax('vacancy_progressAjax.php', data, success);
	}

	function Delete() {
		par=$(this).closest("tr");
		par.remove();
	}
	function Add() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("vacancy_progress_val")?></td>";
		a+="<td><?php _t("process_name")?></td><td>0</td>";
		a+="<td><input type='checkbox' checked id='active'/> <label for='active'>Active</label>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
	}
	
	function Up() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['vacancy_progress_id']=getChild(par, 'vacancy_progress_id');
		ajax('vacancy_progressAjax.php', data, success);
	}
	function Down() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
				var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['vacancy_progress_id']=getChild(par, 'vacancy_progress_id');
		ajax('vacancy_progressAjax.php', data, success);
	}
	function Cancel() {
		var par=$(this).closest("tr");
		var required=getChild(par, 'required');
		if (required==0) {
			textToDefaultLabel(par, ['vacancy_progress_val','process_name']);
			btnChange(par, ['edit','up','down']);
			checkboxToDefaultLabel(par, 'active', 'Active','');
		} else {
			textToDefaultLabel(par, ['process_name']);
			btnChange(par, ['edit','up','down']);
		}
		
		bindAll();
	}
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['vacancy_progress_val','process_name'])) {
			return;
		}
		var data={};
		data['type']='save';
		var required=getChild(par, 'required');
		data['vacancy_progress_id'] = getChild(par, 'vacancy_progress_id');
		if (required==0) {
			data = prepareDataText(data, ['vacancy_progress_val','process_name'], par);
			data = prepareDataCheckBox(data, ['active']);
		} else {
			data = prepareDataText(data, ['process_name']);
		}
		
		
		
		var success= function(msg) {
			
			setHtmlText(par, 'vacancy_progress_id', msg);
			if (required==0) {
				textToLabel(par,['vacancy_progress_val', 'process_name']);			
				btnChange(par, ['edit','up','down']);
			} else {
				textToLabel(par,['process_name']);			
				btnChange(par, ['edit','up','down']);
			}	
			checkboxToLabel(par, 'active', 'Active','');
			bindAll();
		}
		ajax('vacancy_progressAjax.php', data, success);
	}
	
	function Edit() {
		var par=$(this).closest("tr");
		if (getChild(par, 'required')==0) {
			labelToText(par, {'vacancy_progress_val':0, 'process_name':0});
			labelToCheckbox(par, {'active':'Active'});
		} else {
			labelToText(par, {'process_name':0});
		}
		
		btnChange(par, ['save','cancel']);
		bindAll();	
	}
	
	

</script>
<button class="button_link" id="btn_add">Add</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Process Code</th><th>Process Name</th><th>Required</th><th>Active</th><th></th><th>Email</th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['vacancy_progress_id']."</td><td>".$row['vacancy_progress_val']."</td><td>".$row['process_name']."</td><td>".$row['required']."</td>
	<td><span style='display:none'>".$row['active']."</span>".($row['active']==1 ? 'Active' : '')."</td>
	<td>".($row['required']==1 ? getImageTags(array('edit','up','down')) : getImageTags(array('edit','up','down')))."</td>
	<td><button class='btn_invitation'>Invitation</button> <button class='btn_rejection'>Rejection</button> 
	<button class='btn_interviewer'>Interviewer</button> <button class='btn_reference'>Reference</button></td>
	</tr>");
}?>

</tbody></table>
<div id='show_detail'/>