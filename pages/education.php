<?php

	$res=db::select('education','education_id, education_val','','sort_id');
	$combo_education_def=shared::select_combo_complete($res,'education_id', '-Education-', 'education_val');
	$combo_countries_def=shared::select_combo_complete(db::select('countries','*','','countries_val'), 'countries_id','-Country-','countries_val','','150px');
	$education=db::DoQuery('select a.applicants_education_id, a.education_id, a.major, a.place, a.year_from, a.year_to, a.countries_id from applicants_education a where user_id=? order by year_from desc', array($_SESSION['uid']));
	
?>
<script>
	
	var fields=generate_assoc(['applicants_education_id','education_id','major','place','year_from','year_to','countries_id','btn']);
	var table='tbl_education';
	var education_choice="<?php _p($combo_education_def)?>";
	var countries_choice="<?php _p($combo_countries_def)?>";
	$(function() {
		bind('#btn_add', 'click', AddNew);
		
		bindAll();
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='delete';
		data['applicants_education_id']=getChildHtml(par,'applicants_education_id', fields);
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("education_ajax", data, success);
	}
	function Save() {
		
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['education_id','place','year_from','year_to','countries_id'], ['Education Level','Name of Institution','From Year','To Year','Country'], fields)) {
			
			return;
		}
		if (getChildHtml(par,'education_id', fields)>1) {
			if (!validate_empty_tbl(par,['major'], ['Major'])) return;
		}
		var data={};
		data['type']='save';

		data=prepareDataHtml(data, ['applicants_education_id'], par, fields);
		data=prepareDataText(data, ['education_id','major','place','year_from','year_to','countries_id'], par, fields);
		
		var success=function(msg) {
			setHtmlText(par, 'applicants_education_id', msg, fields);
			selectedToLabel(par,['education_id','countries_id'], fields);
			textToLabel(par,['major','place','year_from','year_to'], fields);
			btnChange(par, ['edit','delete'], fields);
			bindAll();
		}
		ajax("education_ajax", data, success);
		
		
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td><td>';
		a+=education_choice;
		a+="</td><td><?php _t("major")?></td>";
		a+="<td><?php _t("place")?></td>";
		a+="<td><?php _t("year_from","","3")?></td>";
		a+="<td><?php _t("year_to","","3")?></td>";
		a+="<td>"+countries_choice+"</td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_education tbody').append(a);
		bindAll();
		fixSelect();
	}

	function Edit() {
		var par=$(this).closest("tr");
		labelToSelect(getChildObj(par, 'education_id', fields), education_choice);
		labelToSelect(getChildObj(par, 'countries_id', fields), countries_choice);
		
		labelToText(par, {'major':0,'place':0,'year_from':3,'year_to':3});
		btnChange(par, ['save','cancel']);
			
		
		bindAll();
		fixSelect();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		selectedToDefaultLabel(par,['education_id','countries_id'], fields);
		
		textToDefaultLabel(par,['major','place','year_from','year_to']);
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	
</script>
<button class="button_link" id="btn_add">Add New</button>
<table class='tbl' id='tbl_education'>
	<thead>
	<tr><th>ID<th>Education Level *</th><th>Major</th><th>Name of Education Institution *</th><th>From Year *</th><th>To Year *</th><th>Country *</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($education as $row) {
		_p('<tr><td>'.$row['applicants_education_id'].'</td>');
		_p('<td><span style="display:none">'.$row['education_id'].'</span>'.shared::get_table_data('education', $row['education_id'])."</td>");
		_p("<td>".$row["major"]."</td>");
		_p("<td>".$row["place"]."</td>");
		_p("<td>".$row["year_from"]."</td>");
		_p("<td>".$row["year_to"]."</td>");
		_p("<td><span style='display:none'>".$row['countries_id']."</span>".shared::get_table_data('countries', $row['countries_id'])."</td>");
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>