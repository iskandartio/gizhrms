<?php
	$reference=db::select('applicants_reference','applicants_reference_id, job_title, reference_name, company_name, email, phone, description','user_id=?','', array($_SESSION['uid']));
	$other_reference=db::select('applicants_other_reference','applicants_other_reference_id, job_title, reference_name, company_name, email, phone, description','user_id=?','', array($_SESSION['uid']));
	
?>
<script>
	var fields={'applicants_reference_id':1,'job_title':2, 'reference_name':3, 'company_name':4, 'email':5, 'phone':6, 'description':7, 'btn':8}
	var other_fields={'applicants_other_reference_id':1,'job_title':2, 'reference_name':3, 'company_name':4, 'email':5, 'phone':6, 'description':7, 'btn':8}
	var table='tbl_reference';
	var other_table='tbl_other_reference';
	$(function() {
		$('#btn_add').bind("click", AddNew);
		bindAll();
		bindAll(other_table);
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).parent().parent();
		var v=par.parent().parent().attr('id')=='tbl_other_reference';
		if (v) {
			data='type=delete_other&applicants_other_reference_id='+getChild(par,'applicants_other_reference_id',other_fields);
		} else {
			data='type=delete&applicants_reference_id='+getChild(par,'applicants_reference_id');
		}
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'referenceAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				par.remove();
			}
		});
	}

	function Save() {
		var par=$(this).parent().parent();
		if (!validate_empty_tbl(par, ['job_title','reference_name','company_name'])) {
			return;
		}
		if (!validate_one_required_tbl(par, ['email','phone'])) return;
		
		var v=par.parent().parent().attr('id')=='tbl_other_reference';
		if (v) {
			f=other_fields;
			data='type=save_other';
		} else {
			f=fields;
			data='type=save';
		}
		
		for (key in f) {
			
			if (key!='btn') data+="&"+key+"="+getChild(par, key, f);
		}
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'referenceAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				if (v) {
					
					setHtmlText(par, 'applicants_other_reference_id', msg, f);
				} else {
					setHtmlText(par, 'applicants_reference_id', msg, f);
						
				}
				textToLabel(par,'job_title', f);
				textToLabel(par,'reference_name', f);
				textToLabel(par,'company_name', f);
				textToLabel(par,'email', f);
				textToLabel(par,'phone', f);
				textToLabel(par,'description', f);
				btnChange(par, ['edit','delete']);
				
				bindAll();
			}
		});
		
		
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("job_title")?></td>";
		a+="<td><?php _t("reference_name")?></td>";
		a+="<td><?php _t("company_name")?></td>";
		a+="<td><?php _t("email")?></td>";
		a+="<td><?php _t("phone")?></td>";
		a+="<td><?php _t("description")?></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_other_reference tbody').append(a);
		bindAll(other_table);
	}

	function Edit() {
		var par=$(this).parent().parent();
		labelToText(par, 'job_title');
		labelToText(par, 'reference_name');
		labelToText(par, 'company_name');
		labelToText(par, 'email');
		labelToText(par, 'phone');
		labelToText(par, 'description');
		btnChange(par, ['save','cancel']);
		bindAll();
		
	}
	function Cancel() {
		var par=$(this).parent().parent();
		textToDefaultLabel(par,'job_title');
		textToDefaultLabel(par,'reference_name');
		textToDefaultLabel(par,'company_name');
		textToDefaultLabel(par,'email');
		textToDefaultLabel(par,'phone');
		textToDefaultLabel(par,'description');
		var v=par.parent().parent().attr('id')=='tbl_other_reference';
		if (v) {
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
	<tr><th>ID<th>Job Title *</th><th>Reference Name *</th><th>Company Name *</th><th>Email</th><th>Phone</th><th>Description</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($reference as $row) {
		_p('<tr><td>'.$row['applicants_reference_id'].'</td>');
		_p('<td>'.$row['job_title'].'</td>');
		_p('<td>'.$row['reference_name'].'</td>');
		_p('<td>'.$row['company_name'].'</td>');
		_p('<td>'.$row['email'].'</td>');
		_p('<td>'.$row['phone'].'</td>');
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
	<tr><th>ID<th>Job Title *</th><th>Reference Name *</th><th>Company Name *</th><th>Email</th><th>Phone</th><th>Description</th></tr>
	</thead>
	<tbody>
	<?php foreach($other_reference as $row) {
		_p('<tr><td>'.$row['applicants_other_reference_id'].'</td>');
		_p('<td>'.$row['job_title'].'</td>');
		_p('<td>'.$row['reference_name'].'</td>');
		_p('<td>'.$row['company_name'].'</td>');
		_p('<td>'.$row['email'].'</td>');
		_p('<td>'.$row['phone'].'</td>');
		_p('<td>'.$row['description'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>
