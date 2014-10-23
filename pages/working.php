<?php
	$res=db::select('business','business_id, business_val','','sort_id');
	$combo_business=shared::select_combo($res,'business_id', 'business_val');
	$working=db::DoQuery('select a.applicants_working_id, a.user_id, a.month_from, a.year_from, a.month_to, a.year_to, a.employer, a.job_title, a.business_id, b.business_val
		, a.may_contact, a.leave_reason from applicants_working a
		left join business b on a.business_id=b.business_id where a.user_id=?', array($_SESSION['uid']));
	$month_options=month_options();

?>
<script>
	var fields={'applicants_working_id':1,'month_from':2,'year_from':3, 'month_to':4, 'year_to':5, 'employer':6
	, 'job_title':7, 'business_id':8, 'may_contact':9, 'leave_reason':10, 'btn':11}
	var table='tbl_working';
	var currentRow=-1;
	$(function() {
		$('#btn_add').bind("click", AddNew);
		$('#btn_save').bind("click", Save);
		bindAll();
		
	});

	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).parent().parent();
		data='type=delete&applicants_working_id='+getChild(par,'applicants_working_id');
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'workingAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				par.remove();
			}
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
	function Save() {
		
		data='type=save';
		data=prepareDataText(data,['applicants_working_id','month_from','year_from','month_to','year_to','employer','job_title','business_id','leave_reason']);
		data=prepareDataCheckBox(data, ['may_contact']);
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'workingAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				tbl='tbl_working';
				if (currentRow>=0) {
					setHtmlAllText(tbl, ['year_from','year_to','employer','job_title','leave_reason']);
					setHtmlAllSelect(tbl, ['month_from','month_to','business_id']);
					setHtmlAllCheckbox(tbl, ['may_contact']);
				} else {
					$('#applicants_working_id').val(msg);
					adder='<tr><td>';
					adder+=msg+"</td>"; 
					adder+='<td><span style="display:none">'+$('#month_from').val()+'</span> '+$('#month_from option:selected').html()+'</td>';
					adder+='<td>'+$('#year_from').val()+'</td>';
					adder+='<td><span style="display:none">'+$('#month_to').val()+'</span> '+$('#month_to option:selected').html()+'</td>';
					adder+='<td>'+$('#year_to').val()+'</td>';
					adder+='<td>'+$('#employer').val()+'</td>';
					adder+='<td>'+$('#job_title').val()+'</td>';
					adder+='<td><span style="display:none">'+$('#business_id').val()+'</span> '+$('#business_id option:selected').html()+'</td>';
					adder+='<td>'+($('#may_contact').prop('check') ? 'Yes' : 'No')+'</td>';
					adder+='<td>'+$('#leave_reason').val()+'</td>';
					adder+='<td><?php _p(getImageTags(array('edit','delete')))?></td>';
					adder+='</tr>';	
					currentRow=$('#tbl_working tbody').children().length;
					
					$('#tbl_working tbody').append(adder);
					bindAll();
					$('#btn_save').html('Update');
					
				}
			}
		});
	
		
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
	function setHtmlAllCheckbox(tbl, arr) {
		for (i=0;i<arr.length;i++) {
			
			setHtmlText($('#'+tbl+' tr:eq('+(currentRow+1)+')'), arr[i], ($('#'+arr[i]).prop('checked') ? 'Yes' : 'No'));
		}
	}
	function Cancel() {
	}
	function AddNew() {
		currentRow=-1;
		clearText(['applicants_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id']);
		$('#may_contact').prop("checked", false);
		$('#btn_save').html('Save as New');
	}

	function Edit() {
		inputText(this, ['applicants_working_id','year_from','year_to','employer','job_title','leave_reason']);
		inputSelect(this, ['month_from','month_to','business_id']);
		if (getChildHtmlVal($(this).parent().parent(), 'may_contact')=='Yes') {
			$('#may_contact').prop("checked",true);
		}
		$('#btn_save').html('Update');
		currentRow=$(this).parent().parent().index();
		
	}
	
	
	
</script>

<table class='tbl' id='tbl_working'>
	<thead>
	<tr><th>ID<th colspan="2">From</th><th colspan="2">To</th><th>Employer</th><th>Job Title</th><th>Nature of Business</th><th>May Contact</th><th>Leave Reason</th><th></th></tr>
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
		_p('<td>'.($row['may_contact']==0 ? 'No' : 'Yes').'</td>');
		_p('<td>'.$row['leave_reason'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>

<button class="button_link" id="btn_add">Add New</button>
<table>
<tr style="display:none"><td>Applicants Working ID</td><td>:</td><td><?php _t("applicants_working_id")?></td></tr>
<tr><td>From</td><td>:</td><td><select id="month_from"><option value=0>-Month-</option><?php _p($month_options)?></select> <?php _t("year_from","",3)?></td></tr>
<tr><td>To</td><td>:</td><td><select id="month_to"><option value=0>-Month-</option><?php _p($month_options)?></select> <?php _t("year_to","",3)?></td></tr>
<tr><td>Employer</td><td>:</td><td><?php _t("employer","",50)?></td></tr>
<tr><td>Job Title</td><td>:</td><td><?php _t("job_title","",50)?></td></tr>
<tr><td>Nature of Business</td><td>:</td><td><select id="business_id"><option value=0>-Business-</option><?php _p($combo_business)?></select></td></tr>
<tr><td>May Contact</td><td>:</td><td><input type="checkbox" id="may_contact"><label for="may_contact">May we contact your employer?</label></td></tr>
<tr><td>Leave Reason</td><td>:</td><td><textarea id="leave_reason" cols="50"></textarea></td></tr>


</table>
<button class="button_link" id="btn_save">Save as New</button>
