<?php
	$reference=db::select('applicants_reference','applicants_reference_id, job_title, title, reference_name, company_name, email, phone, description','user_id=?','', array($_SESSION['uid']));
	$other_reference=db::select('applicants_other_reference','applicants_other_reference_id, job_title, title, reference_name, company_name, email, phone, description','user_id=?','', array($_SESSION['uid']));
	$combo_title_def=shared::select_combo_complete(db::select('title','*','','sort_id'), 'title','-Title-');
?>
<script>
	var fields=generate_assoc(['applicants_reference_id','job_title', 'title','reference_name', 'company_name', 'emailphone', 'description', 'btn']);
	var other_fields=generate_assoc(['applicants_other_reference_id','job_title', 'title', 'reference_name', 'company_name', 'emailphone', 'description', 'btn']);
	var table='tbl_reference';
	var other_table='tbl_other_reference';
	var title_choice="<?php _p($combo_title_def)?>";
	$(function() {
		bind('#btn_add',"click", AddNew);
		bindAll();
		bindAll(other_table);
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var data={};
		data['type']='delete_other';
		data['applicants_other_reference_id']=getChildHtml(par,'applicants_other_reference_id',other_fields);
		var success=function(msg) {
			par.remove();
		}
		ajax("references_ajax", data, success);
	}

	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['job_title','title','reference_name','company_name'])) {
			return;
		}
		var v=par.closest("table").attr('id')=='tbl_other_reference';
		var data={};
		if (v) {
			f=other_fields;
			data['type']='save_other';
			data=prepareDataHtml(data, ['applicants_other_reference_id'], par, f);
		} else {
			f=fields;
			data['type']='save';
			data=prepareDataHtml(data, ['applicants_reference_id'], par, f);
		}
		if (!validate_one_required_tbl(par, ['email','phone'], null, f, 'emailphone')) return;
		data=prepareDataText(data, ['job_title', 'title','reference_name', 'company_name', 'description'], par, f);
		
		var emailphone=getChildObj(par, 'emailphone', f);
		data['email']=$(emailphone).children(".email").val();
		data['phone']=$(emailphone).children(".phone").val();
		
		
		var success=function(msg) {
			if (v) {
				
				setHtmlText(par, 'applicants_other_reference_id', msg, f);
				btnChange(par, ['edit','delete']);
			} else {
				setHtmlText(par, 'applicants_reference_id', msg, f);
				btnChange(par, ['edit']);
			}
			textToLabel(par,['job_title','reference_name','company_name','description'], f);
			selectedToLabel(par, ['title'], f);
			textToLabelArr(par,'emailphone', ['email','phone'], f);
			
			
			bindAll();
		}
		ajax("references_ajax", data, success);
		
		
		
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("job_title")?></td>";
		a+="<td>"+title_choice+"</td>";
		a+="<td><?php _t("reference_name")?></td>";
		a+="<td><?php _t("company_name")?></td>";
		a+="<td><?php _t("email")?><br><?php _t("phone")?></td>";
		a+="<td><?php _t("description")?></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_other_reference tbody').append(a);
		bindAll(other_table);
		fixSelect();
	}

	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'job_title':0, 'reference_name':0, 'company_name':0, 'description':0});
		labelToSelect(getChildObj(par, 'title', fields), title_choice);
		labelToTextArr(par, 'emailphone',['email','phone']);
		btnChange(par, ['save','cancel']);
		bindAll();
		fixSelect();
		
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['job_title','reference_name','company_name','description'], fields);
		selectedToDefaultLabel(par, ['title'], fields);
		textToDefaultLabelArr(par,'emailphone',['email','phone'], fields);
		
		
		var v=par.closest("table").attr('id')=='tbl_other_reference';
		if (!v) {
			btnChange(par, ['edit']);
		} else {
			btnChange(par, ['edit','delete']);
		}
		bindAll();
	}
	
</script>
Please  list 3 references we may contact as your referees
<table class='tbl' id='tbl_reference'>
	<thead>
	<tr><th>ID<th>Job Title *</th><th>Title</th><th>Reference Name *</th><th>Company Name *</th><th>Email/Phone *</th><th>Description</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($reference as $row) {
		_p('<tr><td>'.$row['applicants_reference_id'].'</td>');
		_p('<td>'.$row['job_title'].'</td>');
		_p('<td>'.$row['title'].'</td>');
		_p('<td>'.$row['reference_name'].'</td>');
		_p('<td>'.$row['company_name'].'</td>');
		_p('<td>'.$row['email'].'<br/>');
		_p($row['phone'].'</td>');
		_p('<td>'.$row['description'].'</td>');
		_p("<td>".getImageTags(array('edit'))."</td>");
		_p("</tr>");
		
	}
	for ($i=count($reference);$i<3;$i++) {
		_p("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>");
		_p("<td>".getImageTags(array('edit'))."</td>");
		_p("</tr>");
	}
	?>
	</tbody>
</table>

<button class="button_link" id="btn_add">Add Other reference</button>
<table class='tbl' id='tbl_other_reference'>
	<thead>
	<tr><th>ID<th>Job Title *</th><th>Title</th><th>Reference Name *</th><th>Company Name *</th><th>Email/Phone *</th><th>Description</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($other_reference as $row) {
		_p('<tr><td>'.$row['applicants_other_reference_id'].'</td>');
		_p('<td>'.$row['job_title'].'</td>');
		_p('<td>'.$row['title'].'</td>');
		_p('<td>'.$row['reference_name'].'</td>');
		_p('<td>'.$row['company_name'].'</td>');
		_p('<td>'.$row['email'].'<br/>');
		_p($row['phone'].'</td>');
		_p('<td>'.$row['description'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>
