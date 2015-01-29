<?php

    // Representation hexadecimal
    $var = '#FFFFFF';

    function getRgbFromGd($color_hex) {

        return array_map('hexdec', explode('|', wordwrap(substr($color_hex, 1), 2, '|', 1)));

    }
    
    print_r(getRgbFromGd($var));

    // Output: Array ( [0] => 255 [1] => 255 [2] => 255 )

?>