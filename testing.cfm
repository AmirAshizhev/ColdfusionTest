
<!---данные для выпадающих списков--->
<cfquery datasource="test"  name="criticality">
  SELECT id_criticality, criticality
  FROM criticality
  ORDER BY criticality ASC
</cfquery>

<cfquery datasource="test"  name="urgency">
  SELECT id_urgency, urgency
  FROM urgency
  ORDER BY urgency ASC
</cfquery>

<cfquery datasource="test"  name="status">
  SELECT id_status, status
  FROM status
  ORDER BY status ASC
</cfquery>

<!---Данные о текущем пользователе--->

<cfquery datasource="test"  name="user">
  SELECT id_user
  FROM user
</cfquery>

<!---<cfset errorForm.id_user = 1>
<cfset errorForm.id_user = 1>--->

<!---<cfif structKeyExists(form, 'newErrorSubmit')>

  <!----валидация полей формы--->
  <cfset aErrorMessages = arrayNew(1) />
  <cfif form.note EQ ''>
    <cfset arrayAppend(aErrorMessages,'Введите название ошибки')/>
  </cfif>

  <cfif form.discription EQ ''>
    <cfset arrayAppend(aErrorMessages,'Введите описание ошибки')/>
  </cfif>

  <!----отправка данных формы--->
  <cfset form.id_user = 1>
  <cfquery  datasource="test">
    INSERT INTO `error` (`date`, `note`, `discription`, `id_user`, `id_status`, `id_urgency`, `id_criticality`) VALUES (CURRENT_TIMESTAMP(), '#form.note#', '#form.discription#', #form.id_user#, #form.status#, #form.urgency#, #form.criticality#);
  </cfquery>
</cfif>--->

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
      <ul>
        <li class="header__item">
          <a href="testing.cfm">ввести ошибку</a>
        </li>
        <li class="header__item">
          <a href="errorList.cfm">список ошибок</a>
        </li>
        <li class="header__item">
          <a href="userList.cfm">список пользоваетелей</a>
        </li>
        <li class="header__item">
          <a href="">выход из системы</a>
        </li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <h1>Пора вносить ошибки</h1>

    <!---<cfif isDefined('aErrorMessages') AND NOT ArrayIsEmpty(aErrorMessages)>
      <cfoutput >
        <cfloop  array="aErrorMessages" index="message">
          <p>#message#</p>
 
        </cfloop>
      </cfoutput>
    </cfif>
--->
    <cfform id="errorForm" action="test.cfm">
      <fieldset class="main__fieldset">
        <label>
          <cfinput type="text" required="true" name="note"  message="название ошибки">
        </label>
        <label>
          <cftextarea required="true" name="discription"  message="описание ошибки"></cftextarea>
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

    <cfquery  datasource="test" name="user">
      SELECT * FROM user;
    </cfquery>
    <!--<cfoutput  query="user">
      #user.ColumnList#<br />
      #user.CurrentRow#<br />
    </cfoutput>-->
    <cfoutput  query="user">
      #user.id_user#
      #user.name#
      #user.surname#<br />
    </cfoutput>

    <cfquery  datasource="test" name="error">
      SELECT * FROM error;
    </cfquery>

    <cfoutput  query="error">
      #error.id_error#
      #error.date#
      #error.note#
      #error.discription#
      #error.id_user#
      #error.id_status#
      #error.id_urgency#
      #error.id_criticality#
      <br />
    </cfoutput>

    
  </main>
  <footer class="footer">
    <p class="header__text">Какой-то футер</p>
  </footer>
</body>
</html>