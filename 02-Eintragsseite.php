<?php
session_start();
$header = "Eintragsseite";
require_once( 'includes/header.inc.php' );
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );

if (!empty($_POST)){
    $posts_titel = $_POST['posts_titel'];
    $posts_inhalt = $_POST['posts_inhalt'];
    $posts_bild = $_POST['posts_bild'];
    $posts_kateg_id_ref = $_POST['posts_kateg_id_ref'];
    $posts_autor_id_ref = $_SESSION['autor_id'];

    $sql = 'INSERT INTO `tbl_posts`
    (posts_titel,
    posts_inhalt,
    posts_bild,
    posts_kateg_id_ref,
    posts_autor_id_ref
    )
    VALUES
    (
        ?,
        ?,
        ?,
        ?,
        ?
    )';

    $stmt = mysqli_prepare($db, $sql);

    if(false === $stmt){
        echo get_db_error($db, $sql);

    }else{
        mysqli_stmt_bind_param($stmt,'sssii',$posts_titel,
    $posts_inhalt,$posts_bild,$posts_kateg_id_ref,$posts_autor_id_ref);
    mysqli_stmt_execute($stmt);
    $id = mysqli_stmt_insert_id( $stmt );

    echo '<p class="alert alert-success">';
        echo mysqli_affected_rows( $db );
        echo ' Datensatz wurde hinzugefügt<br>';
        echo 'Hinzugefügte ID: ' . $id . '</p>';

        mysqli_stmt_close($stmt);

    }
}
?>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

<p>Titel: <input type="text" name="posts_titel" > </p>
<p> Inhalt: <textarea name="posts_inhalt"  cols="100" rows="20"></textarea></p>
<p>Bildpfad: <input type="text" name = "posts_bild"></p>
<p>

            Kategorien: <select name="posts_kateg_id_ref">
                <option value="1">Leben</option>
                <option value="2">Philosophie</option>
            </select>

</p>
<p>
    <button type="submit" class="btn btn-primary">Speichern</button>
</p>

</form>


<?php get_footer(); ?>