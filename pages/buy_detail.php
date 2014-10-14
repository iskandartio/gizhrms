<?php
	
	if (isset($_POST['buy_id'])) {
		$res=Buy::buyById($_POST['buy_id']);
		$buy_date=$res['buy_date'];
		$buy_id=$res['buy_id'];
		$supplier_name=$res['supplier_name'];
		$resDetail=Buy::buyDetailById($_POST['buy_id']);
	} else {
		$buy_date=date('Y-m-d',time());
		$buy_id='';
		$supplier_name='';
		$resDetail=array();
	}
?>

<script>
var supplier_id='';
$(function() {
	
	$('#buy_date').bind("change", ajaxLastNumber);
	$('#supplier_name').bind("change", ajaxChangeSupplierName);
	autoCompleteSupplier();
	setDatePicker();
	
	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
	$(".btnAdd").bind("click", Add);
	$(".btnDuplicate").bind("click", Duplicate);
	$("#back").bind("click", ajaxBack);
	$('[id^="tbl_"]').addClass("tbl");
	KeyEnter();
	

		
});
function autoCompleteSupplier() {
	$('#supplier_name').autocomplete({
		source : "buyAjax.php?search=supplier",
		focus: function( event, ui ) {
			$(this).val(ui.item.label);
			
			return false;
		},
		select: function( event, ui ) {
			
			supplier_id=ui.item.value;
			return false;
		}
	});
}
function autoCompleteStockName() {
	$('.stock_name').autocomplete({
		source: "buyAjax.php?search=stock",
		focus: function( event, ui ) {
			
			par=$(this).parent().parent();
			setHtmlText(par, 'stock_id', ui.item.value);
			$(this).val(ui.item.label);
			return false;
		},
		delay:500
	});
}

var tblName="tbl_Stock";
var fields={ "buy_detail_id":1, "stock_id":2, "stock_name":3,"qty":4,"price":5,"total":6 };
var types=new Array("label", "label", "longtext","text","text","label");
function KeyEnter() {
	$('#buy_date').bind("keydown", KeyDown);
	$('.stock_name').bind("keydown", stockNameKeyDown);
	$('.qty').bind("keydown", qtyKeyDown);
	$('.price').bind("keydown", priceKeyDown);
	$(".stock_name").bind("focus",focus);
	$(".stock_name:first").focus();
	autoCompleteStockName();
}
function focus() {
    $(this).select().mouseup(function (e) {
        e.preventDefault();
        $(this).unbind("mouseup");
    });
	
}
function Add() {
	s="<tr>";
	for (key in fields) {
		i=fields[key];
		if (types[i-1]=='text') {
			s+="<td align='right'><input type='text' size='3' class='"+key+"'/></td>";
		} else if (types[i-1]=='longtext') {
			s+="<td><input type='text' size='42' class='"+key+"'/></td>";
		} else if (types[i-1]=='label') {
			s+="<td>&nbsp;</td>";
		}
	}
	s+="<td><img src='images/save.png' class='btnSave'><img src='images/delete.png' class='btnDelete'/></td></tr>";
	$("#"+tblName+" tbody:first").prepend(s);
	$(".btnSave").bind("click", Save);	
	$(".btnDelete").bind("click", Delete);
	
	KeyEnter();
} 
function Duplicate() {
	var par=$(this).parent().parent();
	s="<tr><td>&nbsp;</td><td>"+getChildHtmlVal(par,'stock_id')+"</td>";
	s+="<td><input type='text' class='stock_name' value='"+getChildHtmlVal(par,'stock_name')+"'/></td>";
	s+="<td align='right'><input type='text' class='qty' value='"+getChildHtmlVal(par,'qty')+"'/></td>";
	s+="<td align='right'><input type='text' class='price' value='"+getChildHtmlVal(par,'price')+"'/></td>";
	s+="<td align='right'>"+getChildHtmlVal(par,'total')+"</td>";
	s+="<td><img src='images/save.png' class='btnSave'><img src='images/delete.png' class='btnDelete'/></td><img src='images/duplicate.png' class='btnDuplicate'/></td></tr>";
	$("#"+tblName+" tbody:first").prepend(s);
	$(".btnSave").bind("click", Save);	
	$(".btnDelete").bind("click", Delete);
	
	KeyEnter();
	
} 
function priceKeyDown(e) {
	if (e.which == 13) {
		countTotal($(this).parent().parent());
		saveData(this);
	}
}
function qtyKeyDown(e) {
	if (e.which == 13) {
		
		countTotal($(this).parent().parent());
		goNextInput(this);
	}
}
function stockNameKeyDown(e) {
	par=$(this).parent().parent();
	
	if (e.which==13) {
		ajaxGetLastPrice($(this).parent().parent());
		goNextInput(this);
	} else  {
		setHtmlText(par,'stock_id','');
	}
}
function countTotal(par) {
	total= getChild(par,'qty')*getChild(par,'price');
	par.children("td:nth-child("+fields['total']+")").html(formatNumber(total));
	
	$('#'+tblName+" tbody").children().each(function(idx) {
		if (par.index()!=idx) {
			total+=	cDec(getChildHtmlVal($(this),'total'));
		}
	});
	$('#grand_total').html(formatNumber(total));
}
function cDec(s) {
	s=s.replace(',','');
	return s*1;
}
function formatNumber(s) {
	s= Math.round(s*10000)/10000;
	s=s+'';
	
	if (s=='') return '';
	
	
	s=s.replace(',','');
	
	z=s.split('.');
	
	j=z[0].length%3;
	if (j==0) j=3;
	r=z[0].substr(0, j);
	while (j<z[0].length) {
		
		r+=","+z[0].substr(j,j+3);
		
		j+=3;
	}
	if (z.length>1) {
		r+="."+z[1];
	}
	return r;
}
function KeyDown(e) {
	if (e.which == 13) {
		goNextInput(this);
		return false;
	}
}
function goNextInput(o) {
	var inputs = $(o).parents("form").eq(0).find(":input");
	var idx = inputs.index(o);
	if (idx == inputs.length - 1) {
		inputs[0].select()
	} else {
		inputs[idx + 1].focus();
		inputs[idx + 1].select();
	}
		
}
function Save() {
	saveData(this);
}
function saveData(o){ 
	
	if ($('#supplier_name').val()=='') {
		alert("Please Input Supplier Name");
		return;
	}
	var par = $(o).parent().parent();
	ajaxSave(par);
	
	for (key in fields) {
		textToLabel(par, key);
	}
	
	var tdButtons = par.children("td:last-child");
	tdButtons.html("<img src='images/delete.png' class='btnDelete'/><img src='images/edit.png' class='btnEdit'/><img src='images/duplicate.png' class='btnDuplicate'/>"); 
	$(".btnEdit").bind("click", Edit); 
	$(".btnDelete").bind("click", Delete); 
	$(".btnDuplicate").bind("click", Duplicate);
} 
function getChild(par, name) {
	
	return par.children("td:nth-child("+fields[name]+")").children("input[type=text]").val();
}
function getChildHtmlVal(par, name) {
	
	return par.children("td:nth-child("+fields[name]+")").html();
}
function textToLabel(par, name) {
	var td=par.children("td:nth-child("+fields[name]+")");
	td.html(td.children("input[type=text]").val());
}
function setHtmlText(par, name, val) {
	var td=par.children("td:nth-child("+fields[name]+")");
	td.html(val);
}
function setText(par, name, val) {
	var td=par.children("td:nth-child("+fields[name]+")").children("input[type=text]").val(val);
}

function Edit(){ 
	var par = $(this).parent().parent();
	for (key in fields) {
		i=fields[key];
		
		var td=par.children("td:nth-child("+(i)+")");
		if (types[i-1]=='text') {
			td.html("<input type='text' size='3' class='"+key+"' value='"+td.html()+"'/>");
		} else if (types[i-1]=='longtext') {
			td.html("<input type='text' size='42' class='"+key+"' value='"+td.html()+"'/>");
		}
	}
	
	var tdButtons = par.children("td:last-child"); 
	tdButtons.html("<img src='images/save.png' class='btnSave'/>"); 
	$(".btnSave").bind("click", Save); 
	$(".btnEdit").bind("click", Edit); 
	$(".btnDelete").bind("click", Delete);
	KeyEnter();
}
function Delete(){ 
	var par = $(this).parent().parent(); 
	ajaxDelete(par);
	par.remove(); 
}
function ajaxSave(par) {
	var params='type=save';
	params+="&buy_date="+convertDate($('#buy_date').val());
	params+="&buy_id="+$('#buy_id').val();
	params+="&supplier_name="+$('#supplier_name').val();
	params+="&buy_detail_id="+getChildHtmlVal(par,'buy_detail_id');
	params+="&stock_name="+getChild(par,'stock_name');
	params+="&qty="+getChild(par,'qty');
	params+="&price="+getChild(par,'price');
	
	$.ajax({
		type : "POST",
		url : "buyAjax.php",
		data : params, 
		success : function(msg) {
			z=msg.split("#");
			$('#buy_id').val(z[0]);
			setHtmlText(par, 'buy_detail_id', z[1]);
			setHtmlText(par, 'stock_id', z[2]);
			
		}		
	});
	
}
function ajaxChangeSupplierName() {
	$.ajax({
		type : "POST",
		url : "buyAjax.php",
		data : "type=changeSupplierName&supplier_id="+supplier_id+"&supplier_name="+$('#supplier_name').val()+"&buy_id="+$('#buy_id').val(),
		success : function(msg) {
			
		}
	});
}
function ajaxLastNumber() {

	$.ajax({
		type : "POST",
		url : "buyAjax.php",
		data : "type=getLastNumber&buy_date="+convertDate($('#buy_date').val())+"&buy_id="+$('#buy_id').val(),
		success : function(msg) {
			$('#buy_id').val(msg);
		}
	});
	
}
function ajaxDelete(par) {
	$.ajax({
		type : "POST",
		url : "buyAjax.php",
		data : "type=delete_detail&buy_detail_id="+getChildHtmlVal(par,'buy_detail_id'),
		success: function(msg) {
			
		}
	});
}
function ajaxGetLastPrice(par) {

	$.ajax({
		type:"POST",
		url:"buyAjax.php",
		data:"type=get_last_price&stock_id="+getChildHtmlVal(par, 'stock_id'),
		success: function(msg) {
			
			setText(par, 'price', msg);
		}
	});
}
function ajaxBack() {
	$.ajax({
		type : "POST",
		url : "buyAjax.php",
		data : "type=back",
		success : function(msg) {
			$('#content').html(msg);
		}
	});
}
</script>
<h1>Buy</h1>
<input type="button" value="Back" id='back'/>
<form id='f'>
<table>
<tr><td>Buy Date</td><td>:</td><td><input type='text' class='date' id='buy_date' value="<?php _p(formatDate($buy_date))?>"/></td></tr>
<tr><td>Buy ID</td><td>:</td><td><?php _t("buy_id",$buy_id)?></td></tr>
<tr><td>Supplier</td><td>:</td><td><?php _t("supplier_name", $supplier_name)?></td></tr>
</table>
<input type='button' class="btnAdd" value='New'/>
<table id='tbl_Stock'>
<thead>
<tr><th>ID</th><th>Stock ID</th><th>Stock Name</th><th>QTY</th><th>Price</th><th>Total</th></tr>
</thead>
<tbody>
<?php
	$total=0;
	foreach ($resDetail as $res) {
		_p("<tr><td>".$res['buy_detail_id']."</td>");
		_p("<td>".$res['stock_id']."</td>");
		_p("<td width='300px'>".$res['stock_name']."</td>");
		_p("<td align='right' width='55px'>".formatNumber($res['qty'])."</td>");
		_p("<td align='right' width='55px'>".formatNumber($res['price'])."</td>");
		_p("<td align='right'>".formatNumber($res['total'])."</td>");
		_p("<td><img src='images/delete.png' class='btnDelete'/><img src='images/edit.png' class='btnEdit'/><img src='images/duplicate.png' class='btnDuplicate'/></td></tr>");
		$total+=$res['total'];
	}
?>
</tbody>
</table>
Total : <span id='grand_total'><?php _p(formatNumber($total)) ?></span>
</form>