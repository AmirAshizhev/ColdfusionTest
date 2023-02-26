<!---Запрет перехода на страницу через url, если пользователь не залогинился--->
<cfif NOT isUserLoggedIn()>
  <cflocation url="login.cfm?noaccess" >
</cfif>

<cfquery name="currentUser">
  SELECT * FROM user
  WHERE user.id_user = <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="cf_sql_integer" >
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
  <link rel='stylesheet' type='text/css' media='screen' href='register.css'>
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
          <a class="header__link" href="errorList.cfm">список ошибок</a>
        </li>
        <li class="header__item">
          <a  class="header__link"href="userList.cfm">список пользоваетелей</a>
        </li>
        <li class="header__item">
          <a  class="header__link header__link_active"href="profile.cfm">ред. профиля</a>
        </li>
        <li class="header__item">
          <a class="header__link" href="login.cfm?logout">выход из системы</a>
        </li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <h1>Редактирование профиля</h1>
    <cfif structKeyExists(url,'success')>
      <p style="color: green;">Данные пользователя успешо обновлены!</p>
    </cfif>

    <cfform class="register__form" action="submit.cfm">
      <fieldset class="register__fieldset">
        <label>
          <cfinput 
            type="text"
            placeholder="имя"
            required="true"
            name="name"
            query="name"
            value="#currentUser.name#"
          />
        </label>
        <label>
          <cfinput 
            type="text"
            placeholder="фамилия"
            required="true"
            name="surname"
            query="surname"
            value="#currentUser.surname#"
          />
        </label>
        <label>
          <cfinput 
            type="password"
            placeholder="пароль"
            required="true"
            name="password"
            query="password"
            value="#currentUser.password#"
          />
        </label>
      </fieldset>
      <button class="register__btn" type="submit" name="updateUserSubmit">Сохранить изменения</button>
    </cfform>
  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>