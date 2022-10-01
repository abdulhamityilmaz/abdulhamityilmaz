<?php
session_start();
$header = 'Logout';
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );

// Session leeren
$_SESSION = array();
// Session zerstören
if( session_destroy() ) {
    include_once 'includes/header.inc.php';
    echo '<p class="alert alert-success">Sie wurden erfolgreich ausgeloggt</p>';
} else {
    include_once 'includes/header.inc.php';
    echo '<p class="alert alert-danger">Ausloggen hat nicht funktioniert.</p>';
}
?>

<?php get_footer(); ?>