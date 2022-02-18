<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "registerbtn"))> 



<cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myResult">
    insert into Employees(emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values (
    
    <cfqueryparam value = "#form.employeename#" cfsqltype = "cf_sql_varchar"/>,
     <cfqueryparam value = "#form.jobname#" cfsqltype = "cf_sql_varchar"/>,
      <cfqueryparam value = "#form.managerid#" cfsqltype = "cf_sql_integer"/>,
       <cfqueryparam value = "#form.hiredate#" cfsqltype = "cf_sql_date"/>,
        <cfqueryparam value = "#form.salary#" cfsqltype = "cf_sql_decimal"/>,
        <cfqueryparam value = "#form.commission#" cfsqltype = "cf_sql_decimal"/>,
        <cfqueryparam value = "#form.departmentid#" cfsqltype = "cf_sql_integer"/>
)
   
</cfquery>

 <cfset getNumberOfRecords = listLen(#myResult.generated_key#)>
<cfdump var="#getNumberOfRecords#">
<cfif getNumberOfRecords GT 0>
    
  <cflocation url="cf_crud.cfm">
</cfif>



</cfif>