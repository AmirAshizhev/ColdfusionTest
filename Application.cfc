<cfcomponent output="false">
  <cfset this.name = 'testTask' />
  <cfset this.applicationTimeout = createTimespan(0,2,0,0) />
  <!---Чтобы в каждом запросе не писать datasource = 'test'--->
  <cfset this.datasource = 'test'/>
  
</cfcomponent>