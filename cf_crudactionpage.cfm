<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">
<cfscript>
    variables.validMimeTypes =  {
        'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
        ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
        ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
        ,'image/jpeg': {extension: 'jpg'}
        ,'image/png': {extension: 'png'}
    };
</cfscript>
<Cfset thisPath = expandPath('.') & '/myUploads/'>
   <cfset f_dir = GetDirectoryFromPath(thisPath)>



<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "registerbtn"))> 

<cfif IsDefined("form.updatedata")>


<cftry>

    <cffile action="upload" filefield="FiletoUpload"
            destination="#f_dir#" mode="600"
            accept="#StructKeyList(variables.validMimeTypes)#"
            strict="true"
            result="uploadResult"
            nameconflict="makeunique">

    <cfcatch type="any">
        <!--- file is not written to disk if error is thrown  --->
        <!--- prevent zero length files --->
        <cfif FindNoCase( "No data was received in the uploaded", cfcatch.message )>
            <cfabort showerror="Zero length file">

        <!--- prevent invalid file types --->
        <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
            <cfabort showerror="Invalid file type">

        <!--- prevent empty form field --->
        <cfelseif FindNoCase( "did not contain a file.", cfcatch.message )>
            <cfabort showerror="Empty form field">

        <!---all other errors --->
        <cfelse>
            <cfabort showerror="Unhandled File Upload Error">

        </cfif>
    </cfcatch>
</cftry>





  <cfquery name = "updateemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myupdateResult">
   update Employees
  set  emp_name= <cfqueryparam value = "#form.employeename#" cfsqltype = "cf_sql_varchar"/>,
  job_name=    <cfqueryparam value = "#form.jobname#" cfsqltype = "cf_sql_varchar"/>,
  manager_id= <cfqueryparam value = "#form.managerid#" cfsqltype = "cf_sql_integer"/>,
  hire_date=<cfqueryparam value = "#form.hiredate#" cfsqltype = "cf_sql_date"/>,
  salary= <cfqueryparam value = "#form.salary#" cfsqltype = "cf_sql_decimal"/>,
  commission=<cfqueryparam value ="#form.commission#" cfsqltype = "cf_sql_decimal"/>,
  dep_id=<cfqueryparam value = "#form.departmentid#" cfsqltype = "cf_sql_integer"/>,
  profilepic=<cfqueryparam value = "#uploadResult.serverFile#" cfsqltype = "cf_sql_varchar"/>

   where emp_id= <cfqueryparam value = "#form.updatedata#" cfsqltype = "cf_sql_integer" >

   
</cfquery>

  
  <cfset getNumberOfRecords = listLen(#myupdateResult.RecordCount#)> 
<cfif getNumberOfRecords GT 0>
    
  <cflocation url="cf_crud.cfm">
</cfif>

<cfelse>
 




<cftry>

    <cffile action="upload" filefield="FiletoUpload"
            destination="#f_dir#" mode="600"
            accept="#StructKeyList(variables.validMimeTypes)#"
            strict="true"
            result="uploadResult"
            nameconflict="makeunique">

    <cfcatch type="any">
        <!--- file is not written to disk if error is thrown  --->
        <!--- prevent zero length files --->
        <cfif FindNoCase( "No data was received in the uploaded", cfcatch.message )>
            <cfabort showerror="Zero length file">

        <!--- prevent invalid file types --->
        <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
            <cfabort showerror="Invalid file type">

        <!--- prevent empty form field --->
        <cfelseif FindNoCase( "did not contain a file.", cfcatch.message )>
            <cfabort showerror="Empty form field">

        <!---all other errors --->
        <cfelse>
            <cfabort showerror="Unhandled File Upload Error">

        </cfif>
    </cfcatch>
</cftry>




  <cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myaddResult">
    insert into Employees(emp_name,job_name,manager_id,hire_date,salary,commission,dep_id,profilepic) 
values (
    
    <cfqueryparam value = "#form.employeename#" cfsqltype = "cf_sql_varchar"/>,
     <cfqueryparam value = "#form.jobname#" cfsqltype = "cf_sql_varchar"/>,
      <cfqueryparam value = "#form.managerid#" cfsqltype = "cf_sql_integer"/>,
       <cfqueryparam value = "#form.hiredate#" cfsqltype = "cf_sql_date"/>,
        <cfqueryparam value = "#form.salary#" cfsqltype = "cf_sql_decimal"/>,
        <cfqueryparam value = "#form.commission#" cfsqltype = "cf_sql_decimal"/>,
        <cfqueryparam value = "#form.departmentid#" cfsqltype = "cf_sql_integer"/>,
          <cfqueryparam value = "#uploadResult.serverFile#" cfsqltype = "cf_sql_varchar"/>
)
   
</cfquery>



  <cfset getNumberOfRecords = listLen(#myaddResult.generated_key#)>
<cfif getNumberOfRecords GT 0>
    
  <cflocation url="cf_crud.cfm">
</cfif>

</cfif>



</cfif>