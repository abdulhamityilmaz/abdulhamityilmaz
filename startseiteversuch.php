<?php
/* Diese Seite ist nicht komplett fertig  */
session_start();
$header = "Startseite";
require_once( 'includes/header.inc.php' );
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );



$sql =  "SELECT `posts_titel`, `posts_bild`
FROM `tbl_posts`; "; ;
$result=mysqli_query($db,$sql);
/* $erg=mysqli_fetch_array($result,MYSQLI_ASSOC); */
?>
 



  <?php 
 while ($erg=mysqli_fetch_array($result,MYSQLI_ASSOC)):?>


<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="<?php echo $erg['posts_bild']; ?>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><?php echo $erg['posts_titel']; ?></h5>
        <p class="card-text"></p>
        <a href="10.detailsseite.php" class="btn btn-primary">Geh zum Blog</a>
      </div>
    </div>
  </div>
</div>

  

  <?php  endwhile;