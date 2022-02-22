

<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfset mydatasource = "csvdata">
<cfquery name="daily"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" >
   SELECT *
   FROM employees;
   
   </cfquery>
   <Cfset thisPath = ExpandPath("*.*")>
   <cfset f_dir = GetDirectoryFromPath(thisPath)>

   <cfset f_name = "#dateformat(now(), 'mmddyy')##timeformat(now(), 'hhmm')#.doc">
   <cffile action="WRITE" file="#f_dir##f_name#"
   output="emp_id,emp_name, job_name,  hire_date, salary, commission" addnewline="Yes">
 
   <cfloop query="daily">
  
<cffile action="APPEND" file="#f_dir##f_name#"  output="#REPLACE(emp_id, ",", "","AlL")#, #emp_name# #job_name#, #hire_date#, #salary#,#commission#"
   addnewline="Yes"/>
   </cfloop>
   <br>

