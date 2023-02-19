<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='register.css'>
  <script src='testing.js'></script>
</head>
<body>
  <main>
    <section>
      <cfform class="register__form" action="test.cfm">
        <h2>Регистрация</h2>
        <fieldset class="register__fieldset">
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
              type="text"
              placeholder="фамилия"
              required="true"
              name="surname"
              query="surname"
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
        <button class="register__btn" type="submit" name="newUserSubmit">Зарегистрироваться</button>
        <p class="register__text">Уже зарегестрированы? 
          <a class="register__link" href="login.cfm">Войти</a>
        </p>
      </cfform>
    </section>
  </main>
</body>
</html>