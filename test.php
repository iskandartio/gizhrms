<?php
class Test 
{ 
	function __construct() {
		echo 'construct';
	}
    public function init($params) 
    { 
        print_r($params);
    } 
} 

class Test2 extends Test 
{ 
    
	function __construct($p) {
		parent::init($p);
		
	}
} 

$params[0]='1';
$params[1]='2';
$t = new Test2($params); 
?>