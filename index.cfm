<!---Запрет перехода на страницу через url, если пользователь не залогинился--->
<cfif NOT isUserLoggedIn()>
  <cflocation url="login.cfm?noaccess" >
</cfif>

<!---данные для выпадающих списков--->
<cfquery name="criticality">
  SELECT id_criticality, criticality
  FROM criticality
  ORDER BY criticality ASC
</cfquery>

<cfquery name="urgency">
  SELECT id_urgency, urgency
  FROM urgency
  ORDER BY urgency ASC
</cfquery>

<cfquery name="status">
  SELECT id_status, status
  FROM status
  ORDER BY status ASC
</cfquery>


<!---Данные о текущем пользователе--->

<cfquery name="user">
  SELECT id_user
  FROM user
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
          <a class="header__link header__link_active" href="index.cfm">ввести ошибку</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="errorList.cfm">список ошибок</a>
        </li>
        <li class="header__item">
          <a  class="header__link"href="userList.cfm">список пользоваетелей</a>
        </li>
        <li class="header__item">
          <a  class="header__link"href="profile.cfm">ред. профиля</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="login.cfm?logout">выход из системы</a>
        </li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <h1>
      <cfif structKeyExists(session,'stLoggedInUser')>
        <cfoutput >#session.stLoggedInUser.userName# #session.stLoggedInUser.userSurname#</cfoutput>
      </cfif>
      , пора вносить ошибки!</h1>
    <cfform id="errorForm" action="submit.cfm">
      <fieldset class="main__fieldset">
        <label>
          <cfinput type="text" required="true" name="note"  placeholder="название ошибки">
        </label>
        <label>
          <cftextarea required="true" name="discription"  placeholder="описание ошибки"></cftextarea>
        </label>

        <cfselect
          name="status" 
          query="status"
          value="id_status" 
          display="status" 
          queryposition="below"
        >
          <option value="0">Выберите статус ошибки</option>
        </cfselect>

        <cfselect 
          name="urgency" 
          query="urgency"
          value="id_urgency" 
          display="urgency" 
          queryposition="below"
        >
          <option value="0">Выберите срочность</option>
        </cfselect>

        <cfselect 
          name="criticality"  
          query="criticality"
          value="id_criticality" 
          display="criticality" 
          queryposition="below"
        >
          <option value="0">Выберите критичность</option>
        </cfselect>

      </fieldset>
      <button type="submit" name="newErrorSubmit">Записать ошибку</button>
    </cfform>

    <cfquery name="user">
      SELECT * FROM user;
    </cfquery>

  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>