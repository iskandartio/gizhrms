<?php
	$res=db::select('business','business_id, business_val','','sort_id');
	$combo_business=shared::select_combo($res,'business_id', 'business_val');
	$working=db::DoQuery('select a.applicants_working_id, a.user_id, a.month_from, a.year_from, a.month_to, a.year_to, a.employer, a.job_title, a.business_id, b.business_val
		, a.may_contact, a.leave_reason, a.email, a.phone from applicants_working a
		left join business b on a.business_id=b.business_id where a.user_id=?', array($_SESSION['uid']));
	$month_options=month_options();

?>
<script>
	var fields=generate_assoc(['applicants_working_id','month_from','year_from', 'month_to', 'year_to', 'employer', 'job_title', 'business_id', 'may_contact', 'leave_reason', 'btn']);
	
	var table='tbl_working';
	var currentRow=-1;
	$(function() {
		bind('#btn_add',"click", AddNew);
		bind('#btn_save',"click", Save);
		bind('#may_contact',"change", MayContactChange);
		fixSelect();
		bindAll();
		
	});
	function MayContactChange() {
		if ($('#may_contact').prop('checked')) {
			$('#email').show();
			$('#phone').show();
		} else {
			$('#email').hide();
			$('#phone').hide();
		}
	}
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete';
		data['applicants_working_id']=getChild(par,'applicants_working_id');
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("workingAjax.php", data, success);
	}

	function Save() {
		if (!validate_empty(['month_from','year_from', 'month_to','year_to','employer','job_title','business_id'],['','','','','','','Nature Of Business'])) return;
		if ($('#may_contact').prop('checked')) {
			if (!validate_one_required(['email','phone'])) return;
		}
		var data={};
		data['type']='save';
		data=prepareDataText(data,['applicants_working_id','month_from','year_from','month_to','year_to','employer','job_title','business_id','leave_reason','email','phone']);
		data=prepareDataCheckBox(data, ['may_contact']);
		
		var success=function(msg) {
			$('#freeze').hide();
			alert('Success');
			tbl='tbl_working';
			if (currentRow>=0) {
				setHtmlAllText(tbl, ['year_from','year_to','employer','job_title','leave_reason']);
				setHtmlAllSelect(tbl, ['month_from','month_to','business_id']);

				setHtmlAllOther(tbl, 'may_contact' , ['email','phone']);
				
			} else {
				$('#applicants_working_id').val(msg);
				adder='<tr><td>';
				adder+=msg+"</td>"; 
				adder+='<td style="border-right:0 !important"></td><td style="border-left:0 !important"></td>';
				adder+='<td style="border-right:0 !important"></td><td style="border-left:0 !important"></td>';
				adder+='<td></td><td></td><td></td><td></td><td></td>';
				adder+='<td><?php _p(getImageTags(array('edit','delete')))?></td>';
				adder+='</tr>';	
				currentRow=$('#tbl_working tbody').children().length;
				
				$('#tbl_working tbody').append(adder);
				setHtmlAllText(tbl, ['year_from','year_to','employer','job_title','leave_reason']);
				setHtmlAllSelect(tbl, ['month_from','month_to','business_id']);

				setHtmlAllOther(tbl, 'may_contact' , ['email','phone']);
				
				bindAll();
				$('#btn_save').html('Update');
				
			}
		}
		ajax("workingAjax.php", data, success);
		
	}

	
	function Cancel() {
	}
	function AddNew() {
		currentRow=-1;
		clearText(['applicants_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id']);
		$('#may_contact').prop("checked", false);
		$('#btn_save').html('Save as New');
		fixSelect();
	}

	function Edit() {
		inputText(this, ['applicants_working_id','year_from','year_to','employer','job_title','leave_reason']);
		inputSelect(this, ['month_from','month_to','business_id']);
		
		if (getChild($(this).closest("tr"), 'may_contact')!='None') {
			$('#may_contact').prop("checked",true);
			inputFromOther(this, 'may_contact', ['email','phone']);
			$('#email').show();
			$('#phone').show();
		} else {
			$('#email').hide();
			$('#phone').hide();
			
		}
		$('#btn_save').html('Update');
		currentRow=$(this).closest("tr").index();
		fixSelect();
		
	}
	
	
	
</script>

<table class='tbl' id='tbl_working'>
	<thead>
	<tr><th>ID<th colspan="2">From</th><th colspan="2">To</th><th>Employer</th><th>Job Title</th><th>Nature of Business</th><th>Contact</th><th>Leave Reason</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($working as $row) {
		_p('<tr><td>'.$row['applicants_working_id'].'</td>');
		_p('<td style="border-right:0 !important"><span style="display:none">'.$row['month_from'].'</span>'.get_month_name($row['month_from']).'</td>');
		_p('<td style="border-left:0 !important">'.$row['year_from'].'</td>');
		_p('<td style="border-right:0 !important"><span style="display:none">'.$row['month_to'].'</span>'.get_month_name($row['month_to']).'</td>');
		_p('<td style="border-left:0 !important">'.$row['year_to'].'</td>');
		_p('<td>'.$row['employer'].'</td>');
		_p('<td>'.$row['job_title'].'</td>');
		_p('<td><span style="display:none">'.$row['business_id'].'</span>'.$row['business_val']);
		_p('<td>'.($row['may_contact']==0 ? 'None' : '<span id="_email">'.$row['email'].'</span> <span id="_phone">'.$row['phone']).'</span></td>');
		_p('<td>'.$row['leave_reason'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>

<button class="button_link" id="btn_add">Add New</button>
<table>
<tr style="display:none"><td>Applicants Working ID</td><td>:</td><td><?php _t("applicants_working_id")?></td></tr>
<tr><td>From *</td><td>:</td><td><select id="month_from"><option value='' selected disabled>-Month-</option><?php _p($month_options)?></select> <?php _t("year_from","",3)?></td></tr>
<tr><td>To *</td><td>:</td><td><select id="month_to"><option value='' selected disabled>-Month-</option><?php _p($month_options)?></select> <?php _t("year_to","",3)?></td></tr>
<tr><td>Employer *</td><td>:</td><td><?php _t("employer","",50)?></td></tr>
<tr><td>Job Title *</td><td>:</td><td><?php _t("job_title","",50)?></td></tr>
<tr><td>Nature of Business *</td><td>:</td><td><select id="business_id" title='Nature of Business'><option value='' selected disabled>-Nature of Business-</option><?php _p($combo_business)?></select></td></tr>
<tr><td>May Contact</td><td>:</td><td><input type="checkbox" id="may_contact"><label for="may_contact">May we contact your employer?</label>
<?php _t("email")?> <?php _t("phone")?></td></tr>
<tr><td>Leave Reason</td><td>:</td><td><textarea id="leave_reason" cols="50"></textarea></td></tr>


</table>
<button class="button_link" id="btn_save">Save as New</button>
