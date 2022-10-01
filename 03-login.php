<?php
session_start();
$header = "Login";
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );

if( !empty( $_POST ) ) {
    // Variablen anlegen
    $autor_email = $_POST['autor_email'];
    $autor_passwort = $_POST['autor_passwort'];
    
    $sql = 'SELECT
        `autor_email`,
        `autor_passwort`,
        `autor_id`
    FROM
        `tbl_autoren`
    WHERE
        `autor_email` = ?';

    
    $stmt = mysqli_prepare( $db, $sql );



    if( false === $stmt ) {
        include_once 'includes/header.inc.php';
        echo get_db_error( $db, $sql );
    } else {
        mysqli_stmt_bind_param( $stmt, 's', $autor_email );
        mysqli_stmt_execute( $stmt );
        mysqli_stmt_bind_result( $stmt, $db_email, $db_passwort,$db_id );
        mysqli_stmt_fetch( $stmt );
        mysqli_stmt_close( $stmt );

        // Prüfe ob das Passwort übereinstimmt
        if(  $autor_passwort == $db_passwort ) {
            $_SESSION['autor_id'] = $db_id;
            $_SESSION['autor_email'] = $db_email;
            $_SESSION['is_logged_in'] = true; 
            /* echo '<pre>login<br>', var_dump( $_SESSION['is_logged_in'] ), '</pre>';
            echo '<pre>login<br>', var_dump( $_SESSION['autor_id'] ), '</pre>';
            echo '<pre>login<br>', var_dump( $_SESSION['autor_email'] ), '</pre>'; */
            include_once 'includes/header.inc.php';
            echo '<p class="alert alert-success">Login erfolgreich!</p>';
        } else {
            include_once 'includes/header.inc.php';
            echo '<p class="alert alert-danger">Du kommst nicht vorbei!</p>';
        }
    }
    mysqli_close( $db );
} else {
    include_once 'includes/header.inc.php';
}

?>

<p>Bitte geben Sie Ihre E-Mail Adresse und Ihr Passwort an!</p>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <p>
        E-Mail:
        <input type="text" name="autor_email">
    </p>

    <p>
        Passwort:
        <input type="text" name="autor_passwort">
    </p>

    <p>
        <button type="submit">Login</button>
    </p>
</form>

<?php get_footer(); ?>