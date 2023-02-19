<cfquery  datasource="test" name="error">
  SELECT * FROM error;
</cfquery>



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
          <a class="header__link" href="index.cfm">ввести ошибку</a>
        </li>
        <li class="header__item">
          <a class="header__link header__link_active" href="errorList.cfm">список ошибок</a>
        </li>
        <li class="header__item">
          <a  class="header__link"href="userList.cfm">список пользоваетелей</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="login.cfm">выход из системы</a>
        </li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <h1>А вот и ошибки</h1>
    <table>
      <thead>
        <tr>
          <th>id</th>
          <th>Заметка</th>
          <th>Подробное описание</th>
          <th>Дата ввода</th>
          <th>Пользователь</th>
          <th>Статус</th>
          <th>Срочноность</th>
          <th>Критичность</th>
        </tr>
      </thead>
      <tbody>
        <cfoutput  query="error">
          <tr>
            <td>#error.id_error#</td>
            <td>#error.note#</td>
            <td>#error.discription#</td>
            <td>#error.date#</td>
            <td>#error.id_user#</td>
            <td>#error.id_status#</td>
            <td>#error.id_urgency#</td>
            <td>#error.id_criticality#</td>
            <td>
              <a href="index.cfm">Редактировать</a>
              <button>Удалить</button>
              <a href="history.cfm">История</a>
            </td>
          </tr>
        </cfoutput>
      </tbody>
    </table>

  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>