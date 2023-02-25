<cfif structKeyExists(form, 'loginSubmit')>
  <cfset authentication = createObject("component", 'testTask.components.authentication')/>

  <cfset aErrorMessages = authentication.validateUser(form.name, form.password) />
  <cfif arrayIsEmpty(aErrorMessages)>
    <cfset isUserLoggedIn = authentication.doLogin(form.name, form.password)/>
  </cfif>
</cfif>

<!---Выход из системы--->
<cfif structKeyExists(url,'logout')>
  <cfset createObject("component", 'testTask.components.authentication').doLogout()/>
</cfif>

<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='login.css'>
  <script src='testing.js'></script>
</head>
<body>
  <main>
    <section>
      <cfform class="login__form">
        <h2>Вход</h2>

        <cfif structKeyExists(url,'noaccess')>
          <p style="color: red;">Нет доступа к этой странице, пожалуйста войдите в систему</p>
        </cfif>

        <cfif structKeyExists(variables,'aErrorMessage') AND NOT arrayIsEmpty(aErrorMessages)>
          <cfoutput>
            <cfloop array="#aErrorMessages#" item="message">
              <p style="color: red;">#message#</p>
            </cfloop>
          </cfoutput>
        </cfif>
        <!---Если пользователь не найден--->
        <cfif structKeyExists(variables,'isUserLoggedIn') AND isUserLoggedIn EQ false>
          <p style="color: red;">Пользователь не найден</p>
        </cfif>
        <fieldset class="login__fieldset">
          <label>
            <cfinput 
              type="text"
              placeholder="имя"
              required="true"
              name="name"
              query="name"
            />
          </label>
          <label>
            <cfinput 
              type="password"
              placeholder="пароль"
              required="true"
              name="password"
              query="password"
            />
          </label>
        </fieldset>
        <button class="login__btn" name="loginSubmit" type="submit">Войти</button>
        <p class="login__text">Еще не зарегестрированы? <a class="login__link" href="register.cfm">Зарегистрироваться</a></p>
      </cfform>
    </section>
  </main>
</body>
</html>