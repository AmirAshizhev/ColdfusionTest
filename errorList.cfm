<cfquery  name="errorsInfo">
  SELECT * FROM error, criticality, urgency, status, user 
  WHERE error.id_criticality = criticality.id_criticality 
    AND error.id_urgency = urgency.id_urgency
    AND error.id_status = status.id_status
    AND error.id_user = user.id_user
    ORDER BY error.id_error ASC
</cfquery>

<!---проверка вошел ли пользователь--->
<cfif NOT isUserLoggedIn()>
  <cflocation url="login.cfm?noaccess" >
</cfif>


<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='testing.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='header.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='errorList.css'>
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
          <a class="header__link" href="login.cfm?logout">выход из системы</a>
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
        <cfoutput  query="errorsInfo">
          <tr>
            <td>#errorsInfo.id_error#</td>
            <td>#errorsInfo.note#</td>
            <td>#errorsInfo.discription#</td>
            <td>#errorsInfo.date#</td>
            <td>#errorsInfo.name#</td>
            <td>#errorsInfo.status#</td>
            <td>#errorsInfo.urgency#</td>
            <td>#errorsInfo.criticality#</td>
            <td>
              <a class="error-list__bth error-list__bth_edit" href="index.cfm">Изменение статуса ошибки</a>
              <a class="error-list__bth error-list__bth_history"href="history.cfm">История</a>
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