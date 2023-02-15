<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='testing.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='header.css'>
  <script src='testing.js'></script>
</head>
<body>
  <header class="header">
    <nav class="header__box">
      <ul class="header__list">
        <li class="header__item">
          <a class="header__link" href="testing.cfm">ввести ошибку</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="errorList.cfm">список ошибок</a>
        </li>
        <li class="header__item">
          <a  class="header__link header__link_active" href="userList.cfm">список пользоваетелей</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="login.cfm">выход из системы</a>
        </li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <h1>А вот и пользователи</h1>
    <cfquery  datasource="test" name="user">
      SELECT * FROM user;
    </cfquery>

    <cfoutput  query="user">
      #user.id_user#
      #user.name#
      #user.surname#
      <br />
    </cfoutput>
  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>