<?php

	$res=db::select('education','education_id, education_val','','sort_id');
	$combo_education=shared::select_combo($res,'education_id', 'education_val');
	$education=db::DoQuery('select a.applicants_education_id, a.education_id, b.education_val, a.major, a.place, a.year_from, a.year_to, a.country from applicants_education a left join education b on a.education_id=b.education_id where user_id=? order by year_from desc', array($_SESSION['uid']));
	
?>
<script>
	
	var fields=generate_assoc(['applicants_education_id','education_id','major','place','year_from','year_to','country','btn']);
	var table='tbl_education';

	$(function() {
		bind('#btn_add', 'click', AddNew);
		
		bindAll();
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='delete';
		data['applicants_education_id']=getChild(par,'applicants_education_id');
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("educationAjax.php", data, success);
	}
	function Save() {
		
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['education_id','place','year_from','year_to','country'],['Education Level','Institution Name','From Year','To Year','Country'])) {
			
			return;
		}
		if (getChild(par,'education_id')>1) {
			if (!validate_empty_tbl(par,['major'])) return;
		}
		var data={};
		data['type']='save';
		for (key in fields) {
			if (key!='btn') data[key]=getChild(par, key);
		}
		
		var success=function(msg) {
			setHtmlText(par, 'applicants_education_id', msg);
			selectedToLabel(par,'education_id');
			textToLabel(par,['major','place','year_from','year_to','country']);
			btnChange(par, ['edit','delete']);
			bindAll();
		}
		ajax("educationAjax.php", data, success);
		
		
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td><td>';
		a+='<select id="education_id" title="Education Level"><option value=""> - Education Level -</option>';
		a+="<?php _p($combo_education)?>";
		a+='</select>';
		a+="</td><td><?php _t("major")?></td>";
		a+="<td><?php _t("place")?></td>";
		a+="<td><?php _t("year_from","","3")?></td>";
		a+="<td><?php _t("year_to","","3")?></td>";
		a+="<td><?php _t("country")?></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_education tbody').append(a);
		bindAll();
		fixSelect();
	}

	function Edit() {
		var par=$(this).closest("tr");
		labelToSelect(par, 'education_id', ' - Education Level -', "<?php _p($combo_education)?>")
		labelToText(par, {'major':0,'place':0,'year_from':3,'year_to':3,'country':0});
		btnChange(par, ['save','cancel']);
			
		
		bindAll();
		fixSelect();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		selectedToDefaultLabel(par,'education_id');
		textToDefaultLabel(par,['major','place','year_from','year_to','country']);
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
		_p('<td><span style="display:none">'.$row['education_id'].'</span>'.$row['education_val']);
		_p("</td><td>".$row["major"]."</td>");
		_p("<td>".$row["place"]."</td>");
		_p("<td>".$row["year_from"]."</td>");
		_p("<td>".$row["year_to"]."</td>");
		_p("<td>".$row["country"]."</td>");
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>