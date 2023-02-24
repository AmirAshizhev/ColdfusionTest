<cfcomponent output="false">

  <!---Валидация логина--->
  <cffunction name="validateUser"  access="public" output="false"  returntype="array" >
    <cfargument name="userName" type="string"  required="true" />
    <cfargument name="userPassword" type="string"  required="true" />

    <cfset var aErrorMessages = arrayNew(1) />

    <cfif arguments.userName EQ ''>
      <cfset arrayAppend(aErrorMessages, 'Введите email')/>  
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
    </cfquery>

    <!---Если пользователь один из бд--->
    <cfif arguments.userPassword EQ ''>
      <cfset arrayAppend(aErrorMessages, 'Введите введите пароль')/>  
    </cfif>




    <cfreturn isUserLoggedIn />
  </cffunction>

    <!---выход--->
  <cffunction name="doLogout"  access="public" output="false"  returntype="void" >
      
  </cffunction>
  
</cfcomponent>