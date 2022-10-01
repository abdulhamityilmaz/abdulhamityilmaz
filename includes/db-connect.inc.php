<?php 
mysqli_report(MYSQLI_REPORT_ERROR );
error_reporting(0);
define('DB_HOST','localhost');
define('DB_USER','php_user');
define('DB_PW','!TNYK*CZQXtN4POh');
define('DB_DATABASE',$database);

$db=mysqli_connect(DB_HOST,DB_USER,DB_PW,DB_DATABASE) or 
    die('<p class="aler alert-danger"> Die Verbindung konnte nicht hergestellt werden'.mysqli_connect_error().' .</p>');

/* Character set explizit einstellen */
mysqli_set_charset($db,'utf8mb4');

/*Datenbank auswählen*/
mysqli_select_db($db,DB_DATABASE) or 
die('<p class="aler alert-danger"> Die Datenbank <b>'.DB_DATABASE.' konnte nicht ausgewählt werden.</p>');