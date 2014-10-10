<?php
	
?>
<script>
function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 

function validatePassword(fld) {
    var error = "";
    
    if (fld.val() == "") {
        fld.css('background','Yellow');
        error = "You didn't enter a password.\n";
    } else if ((fld.val().length < 7) || (fld.val().length > 15)) {
        error = "The password is the wrong length. \n";
        fld.css('background','Yellow');
    } else if (!(/[0-9]+/.test(fld.val()) && /[a-z]+/.test(fld.val()) && /[A-Z]+/.test(fld.val()))) {
        error = "The password must contain at least one upper case, one lower case and one number .\n";
        fld.css('background','Yellow');
    } else {
        fld.css('background','White');
    }
   return error;
} 
function testPassword() {
	alert(validatePassword($('#password')));
}
</script>
<table>
<tr><td>Email</td><td>:</td><td><input type="text" id="email"/></td></tr>
<tr><td>Password</td><td>:</td><td><input type="password" id="password"/></td></tr>
<tr><td colspan="3"><input type="button" value="Check" onclick="testPassword()"/></td></tr>
</table>
