<?php


	function combo_position_applied($selected='') {
		$res=db::DoQuery('select a.vacation_id, concat(a.vacation_name,"(",a.vacation_code,")") vacation from vacation a
where now() between vacation_start and vacation_end
order by vacation_code',array($_SESSION['uid']));
		
		$combo_position_applied=shared::select_combo($res,'vacation_id','vacation');
		return $combo_position_applied;
	}
	$pos=db::DoQuery('select a.vacation_id, b.vacation_name from job_applied a
left join vacation b on a.vacation_id=b.vacation_id where user_id=?',array($_SESSION['uid']));
	
?>
<script>
	var fields={'question_id':1};
	$(function() {
		$('#position_applied').bind("change", ChangeQuestion);
		Hide();
		$('#btn_apply').css('display','none');
		$('.btn_edit').bind("click", Edit);
		$('#btn_apply').bind('click',Apply);
	});
	function Apply() {
		var data='type=apply&vacation_id='+$('#position_applied').val();
		$('#tbl_question .question_id').each(function() {
			data+='&question[]='+$(this).html();
		});	
		$('#tbl_question .cls_choice').each(function() {
			data+='&answer[]='+$(this).val();
		});	
		
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data:data,
			success: function(msg) {
				alert('Success');
				if (msg) {
					$('#tbl_position_applied').append(msg);
				}
				$('.btn_edit').bind("click", Edit);
				Hide();
			}
		});
		
	}
	function Edit() {
		var par=$(this).parent().parent();
		var id=getChildHtmlVal(par, 'question_id');
		$('#position_applied').val(id);
		ajaxChangeQuestion(id);
		
	}
	function ChangeQuestion() {
		ajaxChangeQuestion($(this).val());
		
	}
	function ajaxChangeQuestion(val) {
		$.ajax({
			type : 'post',
			url : 'applicantAjax.php',
			data : 'type=change_question&vacation_id='+val, 
			success : function(msg) {
				$('#questions').html(msg);
				Hide();
				After();
			}
		});
	}
	function Hide() {
		$('.tbl td:nth-child(1)').hide();
		$('.tbl th:nth-child(1)').hide();
		
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
<?php if (count($pos)>0) {?>
<table class='tbl' id='tbl_position_applied'>
	<tr><th></th><th colspan="2">Position Applied</th></tr>
	<?php foreach ($pos as $row) {
		_p("<tr><td>".$row['vacation_id']."</td><td>".$row['vacation_name']."</td><td><img src='images/edit.png' class='btn_edit'/></td></tr>");
	} ?>
</table>
<?php }?>
<table>
<tr><td>Apply for</td><td>:</td><td><select id='position_applied'><option value=0> - Position Applied - </option><?php _p(combo_position_applied())?></select></td></tr>
</table>
<span id='questions'></span>
<button class='button_link' id='btn_apply'>Apply</button>