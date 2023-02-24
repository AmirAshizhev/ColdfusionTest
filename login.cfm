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
        <button class="login__btn">Войти</button>
        <p class="login__text">Еще не зарегестрированы? <a class="login__link" href="register.cfm">Зарегистрироваться</a></p>
      </cfform>
    </section>
  </main>
</body>
</html>