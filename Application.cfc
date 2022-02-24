<cfcomponent output="false">
    
    <cfset this.name = "jqlogin">
    <cfset this.sessionManagement = true>
        
    <!--- Run before the request is processed --->
    <cffunction name="onRequestStart" returnType="boolean" output="false">
        <cfargument name="thePage" type="string" required="true">
        <cfset var page = listLast(arguments.thePage,"/")>
    
        <cfif not listFindNoCase("cf_login.cfm,cf_logincheck.cfc",page)>        
            <cfif not structKeyExists(session, "loggedin") or session.loggedin is false>
                <cflocation url="cf_login.cfm" addToken="false">
            </cfif>
        </cfif>
        <cfreturn true>
    </cffunction>
    
    <!--- Runs when your session starts --->
    <cffunction name="onSessionStart" returnType="void" output="false">
        <cfset session.loggedin = false>
    </cffunction>

</cfcomponent>