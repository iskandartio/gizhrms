<?php

	$res=db::select('language','language_id, language_val','','sort_id');
	$combo_language=shared::select_combo($res,'language_id', 'language_val');
	$res=db::select('language_skill','language_skill_id, language_skill_val','','sort_id');
	$combo_language_skill=shared::select_combo($res,'language_skill_id','language_skill_val');
	$language=db::DoQuery('select b.applicants_language_id, a.language_id, a.language_val, b.language_skill_id, c.language_skill_val from language a
left join applicants_language b on a.language_id=b.language_id and b.user_id=?
left join language_skill c on b.language_skill_id=c.language_skill_id', array($_SESSION['uid']));
	$other_language=db::DoQuery('select a.applicants_other_language_id, a.language_val, a.language_skill_id, b.language_skill_val from applicants_other_language a
	left join language_skill b on b.language_skill_id=a.language_skill_id
	where a.user_id=?', array($_SESSION['uid']));
	
?>
<script>
	var fields=generate_assoc(['applicants_language_id','language_id', 'language_skill_id', 'btn']);
	var other_fields=generate_assoc(['applicants_other_language_id','language_val', 'language_skill_id', 'btn']);
	var table='tbl_language';
	var other_table='tbl_other_language';
	$(function() {
		bind('#btn_add',"click", AddNew);
		bindAll();
		bindAll(other_table);
		
	});
	
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).closest("tr");
		var v=par.closest("table").attr('id')=='tbl_other_language';
		data={};
		if (v) {
			data['type']='delete_other';
			data['applicants_other_language_id']=getChild(par,'applicants_other_language_id',other_fields);
		} else {
			data['type']='delete';
			data['applicants_language_id']=getChild(par,'applicants_language_id');
		}
		var success=function(msg) {
			par.remove();
		}
		ajax("languageAjax.php", data, success);
	}

	function Save() {
		var par=$(this).closest("tr");
		if (getChild(par, 'language_id')==0) {
			alert('failed');
			return;
		}
		var v=par.closest("table").attr('id')=='tbl_other_language';
		var data={};
		if (v) {
			f=other_fields;
			data['type']='save_other';
		} else {
			f=fields;
			data['type']='save';
		}
		
		for (key in f) {
			
			if (key!='btn') data[key]=getChild(par, key, f);
		}
		var success=function(msg) {
			if (v) {
				
				setHtmlText(par, 'applicants_other_language_id', msg, f);
				textToLabel(par,['language_val'], f);
				selectedToLabel(par,'language_skill_id', f);
				btnChange(par, ['edit','delete']);
			} else {
				setHtmlText(par, 'applicants_language_id', msg, f);
				
				setHtmlText(par,'language_id');
				selectedToLabel(par,'language_skill_id', f);
				btnChange(par, ['edit']);
			
			}
			
			bindAll();
		}
		ajax("languageAjax.php", data, success);
	}
	function AddNew() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("language_val")?></td>";
		a+='<td><select id="language_skill_id"><option value=> - Language Skill -</option>';
		a+="<?php _p($combo_language_skill)?>";
		a+='</select></td>';
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_other_language tbody').append(a);
		bindAll(other_table);
		fixSelect();
	}

	function Edit() {
		var par=$(this).closest("tr");
		var v=par.closest("table").attr('id')=='tbl_other_language';
		if (v) {
			labelToText(par, {'language_val':0}, other_fields);
		} 
		labelToSelect(par, 'language_skill_id', ' - Language Skill Level -', "<?php _p($combo_language_skill)?>")
		btnChange(par, ['save','cancel']);
			
		
		bindAll();
		
	}
	function Cancel() {
		var par=$(this).closest("tr");
		var v=par.closest("table").attr('id')=='tbl_other_language';
		f=fields;
		if (v) {
			f=other_fields;
			
			textToDefaultLabel(par,['language_val'],  f);
			btnChange(par, ['edit','delete']);
		} else {
			textToDefaultLabel(par,['language_id'],  f);
			btnChange(par, ['edit']);
		}
		selectedToDefaultLabel(par,'language_skill_id',f);
		
		
		bindAll();
	}
	
</script>

<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($language as $row) {
		_p('<tr><td>'.$row['applicants_language_id'].'</td>');
		_p('<td><span style="display:none">'.$row['language_id'].'</span>'.$row['language_val'].'</td>');
		_p('<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>');
		_p("<td>".getImageTags(array('edit'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>
<button class="button_link" id="btn_add">Add Other Language</button>

<table class='tbl' id='tbl_other_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($other_language as $row) {
		_p('<tr><td>'.$row['applicants_other_language_id'].'</td>');
		_p('<td>'.$row['language_val'].'</td>');
		_p('<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
</table>
