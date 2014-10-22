<?php


	function combo_position_applied($selected='') {
		$res=db::DoQuery('select a.vacation_id, concat(a.vacation_name,"(",a.vacation_code,")") vacation from vacation a
where now() between vacation_start and vacation_end
order by vacation_code',array($_SESSION['uid']));
		
		$combo_position_applied=shared::select_combo($res,'vacation_id','vacation');
		return $combo_position_applied;
	}
	$pos=db::DoQuery('select a.job_applied_id, a.vacation_id, b.vacation_name from job_applied a
left join vacation b on a.vacation_id=b.vacation_id where user_id=?',array($_SESSION['uid']));
	
?>
<script>
	var fields={'question_id':1};
	var main_fields={'job_applied_id':1, 'vacation_id':2, 'btn':3};
	var table='tbl_job_applied';
	$(function() {
		$('#position_applied').bind("change", ChangeQuestion);
		$('#btn_apply').css('display','none');
		$('#btn_apply').bind('click',Apply);
		<?php if (count($pos)==0) {
			_p("$('#tbl_job_applied').hide()");
		}?>
		
		bindAll();
	});
	function Save() {};
	function Cancel() {};
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		var par=$(this).parent().parent();
		data='type=delete&job_applied_id='+getChild(par,'job_applied_id', main_fields);
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data:data,
			success:function(msg) {
				$('#freeze').hide();
				$('#questions').html('');
				$('#btn_apply').css('display','none');
				$('#position_applied').val(0);
				
				par.remove();
				if ($('#tbl_job_applied tbody tr').length==0) {
					$('#tbl_job_applied').hide();
				}
			}
		});
	};
	function Apply() {
		var data='type=apply&vacation_id='+$('#position_applied').val();
		$('#tbl_question .question_id').each(function() {
			data+='&question[]='+$(this).html();
		});	
		$('#tbl_question .cls_choice').each(function() {
			data+='&answer[]='+$(this).val();
		});	
		$('#freeze').show();		
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data:data,
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				
				if (msg) {
					$('#tbl_job_applied').append(msg);
				}
				bindAll();
				$('#tbl_job_applied').show();
			}
		});
		
	}
	function Edit() {
		var par=$(this).parent().parent();
		var id=getChildHtmlSpanVal(par, 'vacation_id', main_fields);
		
		$('#position_applied').val(id);
		ajaxChangeQuestion(id);
		
	}
	function ChangeQuestion() {
		ajaxChangeQuestion($(this).val());
		
	}
	function ajaxChangeQuestion(val) {
		$('#freeze').show();
		$.ajax({
			type : 'post',
			url : 'applicantAjax.php',
			data : 'type=change_question&vacation_id='+val, 
			success : function(msg) {
				$('#freeze').hide();
				$('#questions').html(msg);
				hideColumns('tbl_question');
				After();
			}
		});
	}
	
	function After() {
		$('.cls_choice').bind("change", ToggleApplyButton);
		
		ToggleApplyButton();
	}
	
	function ToggleApplyButton() {
		
		flag=false;
		$('#btn_apply').css('display','none');
		$( "select[id^='choice']" ).each(function(index) {
		
			
			if ($(this).val()==0) {
				flag=false;
				return;
			} else {
				flag=true;
			}
			
		});
		
		if (flag) $('#btn_apply').css('display','');
	}
	
</script>

<table class='tbl' id='tbl_job_applied'>
	<thead>
	<tr><th></th><th>Position Applied</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach ($pos as $row) {
		_p("<tr><td>".$row['job_applied_id']."</td><td><span style='display:none'>".$row['vacation_id']."</span>".$row['vacation_name']."</td>");
		_p("<td>".getImageTags(array('edit','delete'))."</td></tr>");
	} ?>
	</tbody>
</table>

<table>
<tr><td>Apply for</td><td>:</td><td><select id='position_applied'><option value=0> - Position Applied - </option><?php _p(combo_position_applied())?></select></td></tr>
</table>
<span id='questions'></span>
<button class='button_link' id='btn_apply'>Apply</button>