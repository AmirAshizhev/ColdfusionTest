<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='testing.css'>
  <script src='testing.js'></script>
</head>
<body>
  <header class="header">
    <p class="header__text">Какой-то хедер</p>
  </header>
  <main class="main">
    <h1>А вот и ошибки</h1>
    <cfquery  datasource="test" name="error">
      SELECT * FROM error;
    </cfquery>

    <cfoutput  query="error">
      #error.id_error#
      #error.date#
      #error.note#
      #error.discription#
      #error.id_user#
      #error.id_status#
      #error.id_urgency#
      #error.id_criticality#
      <br />
    </cfoutput>
  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>