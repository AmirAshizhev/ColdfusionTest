<cfcomponent output="false">

  <!---Валидация логина--->
  <cffunction name="validateUser"  access="public" output="false"  returntype="array" >
    <cfargument name="userName" type="string"  required="true" />
    <cfargument name="userPassword" type="string"  required="true" />

    <cfset var aErrorMessages = arrayNew(1) />

    <cfif arguments.userName EQ ''>
      <cfset arrayAppend(aErrorMessages, 'Введите имя пользователя')/>  
    </cfif>

    <cfif arguments.userPassword EQ ''>
      <cfset arrayAppend(aErrorMessages, 'Введите введите пароль')/>  
    </cfif>
      
    <cfreturn aErrorMessages />
  </cffunction>

  <!---вход--->
  <cffunction name="doLogin"  access="public" output="false"  returntype="boolean" >
    <cfargument name="userName" type="string"  required="true" />
    <cfargument name="userPassword" type="string"  required="true" />

    <cfset var isUserLoggedIn = false />

    <!---данные пользователя из бд--->
    <cfquery  name="loginUser">
      SELECT * FROM user
      WHERE name = '#arguments.userName#' AND password = '#arguments.userPassword#'
    </cfquery>

    <!---Если пользователь один в бд--->
    <cfif loginUser.RecordCount EQ 1>
      <!---обернуть в cflogin нужно, чтобы cf знал, что пользователь в системе--->
      <cflogin >
        <cfloginuser name="#loginUser.name#" password="#loginUser.password#" roles="1" >
      </cflogin>

      <cfset session.stLoggedInUser = {'userName' = loginUser.name, 'userSurname' = loginUser.surname, 'userID' = loginUser.id_user, 'userPassword' = loginUser.password}/>
      <cfset var isUserLoggedIn = true />
      <cflocation url="index.cfm" >
    </cfif>

    <cfreturn isUserLoggedIn />
    
  </cffunction>

    <!---выход--->
  <cffunction name="doLogout"  access="public" output="false"  returntype="void" >
    <cfset structDelete(session,'stLoggedInUser') />
    <cflogout />
    
  </cffunction>
  
</cfcomponent>