<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='testing.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='header.css'>
  <script src='main.js'></script>
</head>
<body>
  <header class="header">
    <nav class="header__box">
      <ul class="header__list">
        <li class="header__item">
          <a class="header__link " href="errorList.cfm">Назад</a>
        </li>
      </ul>
    </nav>
  </header>
  <main>
    <h1>История действий над ошибкой id: </h1>
    <table>
      <thead>
        <tr>
          <th>Дата</th>
          <th>Действие</th>
          <th>Комментарий</th>
          <th>Пользователь</th>
        </tr>
      </thead>
      <tbody>
        <cfoutput  query="">
          <tr>
            <td>#error.id_error#</td>
            <td>#error.note#</td>
            <td>#error.discription#</td>
            <td>#error.date#</td>
            <td>#error.id_user#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
  </main>
</body>
</html>