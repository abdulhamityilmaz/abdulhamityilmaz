<?php
session_start();
$header = "Startseite";
require_once( 'includes/header.inc.php' );
$database = 'miniblog';
require_once( 'includes/db-connect.inc.php' );


?>

<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
      <img src="bilder/geheimnisse.jpg" class="card-img-top" alt="geheimnisse">
      <div class="card-body">
        <h5 class="card-title">Geheimnisse</h5>
        <p class="card-text"><!-- Baybars Vincent --></p>
        <a href="06-baybars.php" class="btn btn-primary">Geh zum Blog</a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src= "bilder/leben.jpg" class="card-img-top" alt="leben">
      <div class="card-body">
        <h5 class="card-title">Nur Laufen am Tag?</h5>
        <p class="card-text"><!-- Hamit Yilmaz --></p>
        <a href="07-hamit.php" class="btn btn-primary">Geh zum Blog</a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="bilder/traum.jpg" class="card-img-top" alt="traum">
      <div class="card-body">
        <h5 class="card-title">Ich habe einen Traum</h5>
        <p class="card-text"><!-- Martin Luther King --></p>
        <a href="08-martin.php" class="btn btn-primary">Geh zum Blog</a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
    <img src="bilder/cogito.jpg" class="card-img-top" alt="cogito">
  <div class="card-body">
    <h5 class="card-title">Cogito ergo Sum</h5>
    <p class="card-text"><!-- Rene Descartes --></p>
    <a href="09-rene.php" class="btn btn-primary">Geh zum Blog</a>
  </div>
    </div>
  </div>
</div>


    
<?php get_footer(); ?>