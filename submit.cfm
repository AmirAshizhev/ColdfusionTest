<cfif structKeyExists(form, 'newErrorSubmit')>

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
    INSERT INTO `error` (`date`, `note`, `discription`, `id_user`, `id_status`, `id_urgency`, `id_criticality`) VALUES (CURRENT_TIMESTAMP(), '#form.note#', '#form.discription#', #session.stLoggedInUser.userID#, #form.status#, #form.urgency#, #form.criticality#);
  </cfquery>

  <cflocation url="index.cfm" >
</cfif>



  <!---Новый пользователь--->
<cfif structKeyExists(form, 'newUserSubmit')>


  <!----отправка данных формы--->
  <cfquery  datasource="test">
    INSERT INTO `get_test_db`.`user` (`name`, `surname`, `password`) VALUES ('#form.name#', '#form.surname#', '#form.password#');
  </cfquery>

  <cflocation url="login.cfm?success" >
</cfif>


 <!--- <!----Изменения ошибки--->
<cfif structKeyExists(form, 'newErrorAction')>
  <!----отправка данных формы--->
  <cfquery  datasource="test">
    INSERT INTO `get_test_db`.`error_history` (`id_action`, `id_user`, `id_error`, `date`, `comment`) VALUES ('#form.action#', #session.stLoggedInUser.userID#, '#URL.id#', CURRENT_TIMESTAMP(), '#form.comment#');
  </cfquery>

  <cfquery  datasource="test">
    INSERT INTO `get_test_db`.`error` (`id_status`) VALUES (#form.status#);
  </cfquery>

  <cflocation url="errorList.cfm?success" >
</cfif>--->