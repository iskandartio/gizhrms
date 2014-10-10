<?php
	unset($_SESSION);
	_p("logout");
	file_put_contents("log.txt", "");
?>