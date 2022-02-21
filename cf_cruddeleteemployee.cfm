
<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfset key = "eid">
 
<cfquery name = "dltEmployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="deleteresults">
    delete from  employees where emp_id=<cfqueryparam value="#Decrypt(URL.die, "#key#")#"  cfsqltype="cf_sql_integer">
    
    </cfquery>
     <cfset getNumberOfRecords = listLen(#deleteresults.RecordCount#)>
 <cfif getNumberOfRecords GT 0>
    
  <cflocation url="cf_crud.cfm">
</cfif>



