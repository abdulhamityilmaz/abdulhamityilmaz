<?php
session_start();
$header = 'Benutzer-Registrierung';
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );
include_once 'includes/header.inc.php';

// Prüfe ob das Formular gesendet wurde
if( !empty( $_POST ) ) {
    // Variablen anlegen
    $autor_vorname = $_POST['autor_vorname'];
    $autor_nachname = $_POST['autor_nachname'];
    $autor_email = $_POST['autor_email'];
    $autor_passwort = $_POST['autor_passwort'];

    $sql = "INSERT INTO `tbl_autoren`
        ( `autor_vorname`,`autor_nachname`, `autor_email`,`autor_passwort` )
    VALUES
        ( ?, ?, ?, ? )";

    $stmt = mysqli_prepare( $db, $sql );

    if( false === $stmt ) {
        echo get_db_error( $db, $sql );
    } else {
        mysqli_stmt_bind_param( $stmt, 'ssss', $autor_vorname, $autor_nachname, $autor_email, $autor_passwort );
        mysqli_stmt_execute( $stmt );

        $number = mysqli_affected_rows( $db );

        if( $number === -1 ) {
            echo '<p class="alert alert-danger">Der gewünschte Benutzername existiert bereits in der Datenbank. Bitte gib einen anderen Benutzernamen an!</p>';
        } else {
            echo '<p class="alert alert-success">Ihre Registrierung war erfolgreich.<br>Sie können sich nun mit Ihren Zugangsdaten einloggen.</p>';
        }

        mysqli_stmt_close( $stmt );
    }
    mysqli_close( $db );
}
?>

<p>Bitte geben Sie die Registerdaten und ein Passwort an!</p>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <p>
        Vorname:
        <input type="text" name="autor_vorname">
    </p>
    <p>
        Nachname:
        <input type="text" name="autor_nachname">
    </p>
        <p>
        E-Mail:
    <input type="email" name="autor_email" >
    </p>
    <p>

        Passwort:
        <input type="text" name="autor_passwort">
    </p>

    <p>
        <button type="submit">Registrieren</button>
    </p>
</form>

<?php get_footer(); ?>