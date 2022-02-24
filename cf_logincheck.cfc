<cfcomponent>
         <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
<cffunction name="processLogin" access="remote" returnType="string" returnformat="plain" output="false">
     <cfargument name="username" required="true">
    <cfargument name="password" required="true">
    <cfset var returnStg = "">
    
        <cfquery  name="validateUser"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="tmpResult">
            SELECT emp_id,emp_name FROM employees WHERE emp_id=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_integer" maxlength="255"> 
            AND emp_name=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" maxlength="4000">
        </cfquery>
          <cfdump var="#tmpResult.SQL#">
        <cfdump var="#tmpResult.SQLParameters#">
        <cfif validateUser.RecordCount EQ 1>
            <cfset session.loggedin = true>

<cfif not structkeyexists(session, "user")>
    <cfset session.user = {
        authorized = false
        , admin = false
        , username = ''
        , accountid = ''
       
    } />
</cfif>




            <cfset returnStg = true>
        <cfelse>
            <cfset returnStg = false>
        </cfif>
        
    <cfreturn returnStg>    
</cffunction>
    
</cfcomponent>


		