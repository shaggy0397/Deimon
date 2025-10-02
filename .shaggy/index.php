<!DOCTYPE html>
<html>
<head><title>SHAGGY Guardar</title></head>
<body>
  <h1>💾 Guardar Nota</h1>
  <form method="post">
    <input type="text" name="nota" placeholder="Escribe tu nota">
    <input type="submit" value="Guardar">
  </form>
  <?php
    if ($_POST['nota']) {
      $nota = date("Y-m-d H:i:s") . " - " . $_POST['nota'] . "\n";
      file_put_contents("notas_guardadas.txt", $nota, FILE_APPEND);
      echo "<p>✅ Nota guardada.</p>";
    }
  ?>
</body>
</html>
