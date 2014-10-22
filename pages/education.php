<?php

	$res=db::select('education','education_id, education_val','','sort_id');
	$combo_education=shared::select_combo($res,'education_id', 'education_val');
	$education=db::DoQuery('select a.applicants_education_id, a.education_id, b.education_val, a.major, a.place, a.year_from, a.year_to, a.country from applicants_education a left join education b on a.education_id=b.education_id where user_id=? order by year_from desc', array($_SESSION['uid']));
	
?>
<script>
	var fields={'applicants_education_id':1,'education_id':2, 'major':3, 'place':4, 'year_from':5, 'year_to':6, 'country':7, 'btn':8}
	var table='tbl_education';
	$(function() {
		$('#btn_add').bind("click", AddNew);
		
		bindAll();
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).parent().parent();
		data='type=delete&applicants_education_id='+getChild(par,'applicants_education_id');
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'educationAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				par.remove();
			}
		});
	}
	function Save() {
		var par=$(this).parent().parent();
		if (getChild(par, 'education_id')==0) {
			alert('failed');
			return;
		}
		data='type=save';
		for (key in fields) {
			if (key!='btn') data+="&"+key+"="+getChild(par, key);
		}
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'educationAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				setHtmlText(par, 'applicants_education_id', msg);
				selectedToLabel(par,'education_id');
				textToLabel(par,'major');
				textToLabel(par,'place');
				textToLabel(par,'year_from');
				textToLabel(par,'year_to');
				textToLabel(par,'country');
				btnChange(par, ['edit','delete']);
				bindAll();
			}
		});
		
		
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td><td>';
		a+='<select id="education_id"><option value=0> - Education Level -</option>';
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
	}

	function Edit() {
		var par=$(this).parent().parent();
		labelToSelect(par, 'education_id', ' - Education Level -', "<?php _p($combo_education)?>")
		labelToText(par, 'major');
		labelToText(par, 'place');
		labelToText(par, 'year_from',3);
		labelToText(par, 'year_to',3);
		labelToText(par, 'country');
		
		btnChange(par, ['save','cancel']);
			
		
		bindAll();
		
	}
	function Cancel() {
		var par=$(this).parent().parent();
		selectedToDefaultLabel(par,'education_id');
		textToDefaultLabel(par,'major');
		textToDefaultLabel(par,'place');
		textToDefaultLabel(par,'year_from');
		textToDefaultLabel(par,'year_to');
		textToDefaultLabel(par,'country');
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	
</script>
<button class="button_link" id="btn_add">Add New</button>
<table class='tbl' id='tbl_education'>
	<thead>
	<tr><th>ID<th>Education Level</th><th>Major</th><th>Place</th><th>From Year</th><th>To Year</th><th>Country</th><th></th></tr>
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