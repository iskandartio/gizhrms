<?php
if (isset($_POST['a'])) {
	echo $_POST['a'];
	die;
}	

?>
<form action="test" method="post">
	<input type='text' name='a'>
	<input type='text' name='b'>
	<input type='submit'/>
</form>