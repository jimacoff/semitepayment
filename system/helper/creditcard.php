<?php

/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * @package     Semite LLC
 * @version     $Id: creditcard.php Jun 28, 2014 ahmet
 * @copyright   Copyright (c) 2014 Semite LLC .
 * @license     http://www.semitepayment.com/license/
 */
/**
 * Description of creditcard.php
 *
 * @author ahmet
 */
function generateVirtualCard($digits = 11,$perfix = '5963') {

    $min = pow(10, $digits);
    $max = pow(10, $digits + 1) - 1;
    $value = rand($min, $max);
    
    return $perfix.$value;
}

function MaskCreditCard($cc) {
    // Get the cc Length
    $cc_length = strlen($cc);
    // Replace all characters of credit card except the last four and dashes
    for ($i = 0; $i < $cc_length - 4; $i++) {
        if ($cc[$i] == '-') {
            continue;
        }
        $cc[$i] = 'X';
    }
    // Return the masked Credit Card #
    return $cc;
}

/**
 * Add dashes to a credit card number.
 * @param int|string $cc The credit card number to format with dashes.
 * @return string The credit card with dashes.
 */
function FormatCreditCard($cc) {
    // Clean out extra data that might be in the cc
    $cc = str_replace(array('-', ' '), '', $cc);
    // Get the CC Length
    $cc_length = strlen($cc);
    // Initialize the new credit card to contian the last four digits
    $newCreditCard = substr($cc, -4);
    // Walk backwards through the credit card number and add a dash after every fourth digit
    for ($i = $cc_length - 5; $i >= 0; $i--) {
        // If on the fourth character add a dash
        if ((($i + 1) - $cc_length) % 4 == 0) {
            $newCreditCard = '-' . $newCreditCard;
        }
        // Add the current character to the new credit card
        $newCreditCard = $cc[$i] . $newCreditCard;
    }
    // Return the formatted credit card number
    return $newCreditCard;
}

