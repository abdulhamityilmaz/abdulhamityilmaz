<?php
session_start();
$header = 'Mein Blog';
require_once( 'includes/header.inc.php' );


$database = 'miniblog';


require_once( 'includes/db-connect.inc.php' );
?>

<?php 

$sql = "SELECT `autor_vorname`, `autor_nachname`, `autor_email` FROM `tbl_autoren` WHERE `autor_id` = 3;";
 
 if( $result=mysqli_query($db,$sql) ){
    
   
    
    $erg=mysqli_fetch_array($result,MYSQLI_ASSOC);

    echo '<table class ="table"><thead>
    <tr>
      <th scope="col" class="text-center">ÜBER AUTOR</th>
    </tr>
  </thead></table>';
    
    foreach($erg as $name => $name1):?>

<table class="table">
  <thead>
    <tr>
      <th scope="col"><?php echo $name?></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><?php echo $name1?></th>
    </tr>
  </tbody>
</table>
    

   <?php  endforeach;
    
    
}else{
    /*Abfrage war nicht korekt*/
    echo '<p class="text-danger">fehlerhafte Abfrage!</p>';
    
    //Fehlernummer und -meldung vom DB-Server
  

    $errnum=mysqli_errno($db);
    $errmsg=mysqli_error($db);
    mysqli_error($db);
    echo "<p class='text-danger'>Fehlernummer: <b> $errnum </b> <br>
        Fehler-Meldung:$errmsg </p>";

    
}
$posts_id=4;
$sql1 = 'SELECT `posts_titel`,`posts_inhalt`,`posts_bild`, `posts_autor_id_ref`, `posts_kateg_id_ref`
 FROM `tbl_posts` WHERE `posts_id`= 3;';

$stmt = mysqli_prepare( $db, $sql1 );

if( false === $stmt ) {
    echo get_db_error( $db, $sql1 );
} else {
    /* mysqli_stmt_bind_param( $stmt, 'i', $posts_id ); */
    mysqli_stmt_execute( $stmt );
    mysqli_stmt_bind_result( $stmt, $posts_titel, $posts_inhalt, $posts_bild, $posts_autor_id_ref, $posts_kateg_id_ref );
    mysqli_stmt_fetch( $stmt );
    mysqli_stmt_close( $stmt );
}


mysqli_close($db);

if( isset( $posts_id ) ):?>


<div class="card">
  <div class="card-body">
    <h5 class="card-title"><?php echo $posts_titel; ?></h5>
    <p class="card-text"><?php echo $posts_inhalt; ?></p>
  </div>
  <img src="<?php echo $posts_bild; ?>" class="card-img-bottom" alt="...">
  <?php echo '<p><br>Kategorie: '.$posts_kateg_id_ref.'</p>'; ?>
    <?php echo '<p>Autor-id: '.$posts_autor_id_ref.'</p>'; ?>   
</div>


<?php   
endif;


?>
    
<?php get_footer(); ?>