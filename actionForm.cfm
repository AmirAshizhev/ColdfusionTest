<cfquery name="status">
  SELECT id_status, status
  FROM status
  ORDER BY status ASC
</cfquery>

<cfquery name="action">
  SELECT id_action, action
  FROM action
  ORDER BY action ASC
</cfquery>

<cfquery  name="errorsInfo">
  SELECT * FROM error, criticality, urgency, status, user 
  WHERE error.id_criticality = criticality.id_criticality 
    AND error.id_urgency = urgency.id_urgency
    AND error.id_status = status.id_status
    AND error.id_user = user.id_user 
    AND error.id_error = #URL.id#

    ORDER BY error.id_error ASC
</cfquery>


<!----Изменения ошибки--->
<cfif structKeyExists(form, 'newErrorActionSubmit')>
  <!----отправка данных формы--->
  <cfquery  datasource="test">
    INSERT INTO `get_test_db`.`error_history` (`id_user`, `id_action`, `id_error`, `date`, `comment`) VALUES ('#session.stLoggedInUser.userID#', '#form.action#', '#URL.id#', CURRENT_TIMESTAMP(), '#form.comment#');
  </cfquery>

  <cfquery  datasource="test">
    UPDATE `get_test_db`.`error` SET `id_status` = #form.status# WHERE (`id_error` = '#URL.id#') and (`id_user` = '#errorsInfo.id_user#') and (`id_status` = '#errorsInfo.id_status#') and (`id_urgency` = '#errorsInfo.id_urgency#') and (`id_criticality` = '#errorsInfo.id_criticality#');
  </cfquery>

  <cflocation url="errorList.cfm" >
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
    <h1>Изменить ошибку</h1>
    <cfform id="newErrorAction">
      <fieldset class="main__fieldset">
        <label>
          <cftextarea required="true" name="comment"  placeholder="Комментарий"></cftextarea>
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
          name="action" 
          query="action"
          value="id_action" 
          display="action" 
          queryposition="below"
        >
          <option value="0">Выберите Действие</option>
        </cfselect>
      </fieldset>
      <button type="submit" name="newErrorActionSubmit">Сохранить изменения ошибки</button>
    </cfform>
  </main>
</body>
</html>