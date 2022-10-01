<?php

require_once( 'functions.inc.php' );
/* get_header(
*	string $title,
*	string/array $css=NULL,
*	bool $bootstrap=false,
*	string $header=NULL,
*	array $nav=NULL,
*	bool $fluid=false
* )
*/
$is_logged_in = false;
if( isset( $_SESSION['autor_email'] ) and ( $_SESSION['is_logged_in'] === true ) ) $is_logged_in = true;

if($is_logged_in == false){
$args = array(
    'Blog - '. $header,
    'css/styles.css',
    true,
    $header,
    array(
        'BLOG',
        array(
        'Startseite' => '01-startseite.php',
        'Login' => '03-login.php',
        'Registrieren' => '05-register.php'
        )
    )
   


);
}else{

    $args = array(
        'Blog - '. $header,
        '../css/styles.css',
        true,
        $header,
        array(
            'BLOG',
            array(
            'Startseite' => '01-startseite.php',
            'Logout' => '04-logout.php',
            'Eintragsseite' => '02-Eintragsseite.php'
            )
        )
       
    
    
    );
    

}
get_header( ...$args );
?>
    
