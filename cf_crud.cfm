

     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Document</title>
      
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
     </head>
     <body>

<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">
<!--- 
<cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
    insert into Employees(emp_name,job_name,manager_id,hire_date,salary,commission,dep_id) 
values ('JESTY','ANALYST',65646,'1991-01-10',3200,null,2001);
</cfquery>
--->


<cfquery name = "getallmanagers" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
       select distinct m.emp_id as manager_id , m.emp_name as Manager,dep_name ,m.dep_id from employees e join employees m on e.manager_id=m.emp_id
       join Departments d on d.dep_id=m.dep_id; 
    </cfquery>
<!-- <cfdump var = "#getallmanagers#"> -->

<cfquery name = "getalldepartments" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
   select dep_id,dep_name from Departments;
</cfquery>
<!-- <cfdump var = "#getalldepartments#"> -->



<cfset  employeeid="">
<cfset  employeename="">
<cfset  jobname="">
<cfset  managerid="">
<cfset  hiredate="">
<cfset  salary="">
<cfset  commission="">
<cfset  departmentid="">
<cfset key = "editid">



<cfif IsDefined("url.tide") >
<cfset editid="#Decrypt(URL.tide, "#key#")#">
<cfif IsNumeric(editid)>
<cfquery name = "getemployeebyid" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
    select *  from employees where emp_id=<cfqueryparam value="#editid#"  cfsqltype="cf_sql_integer">      
</cfquery>
<!--  <cfdump var = "#getemployeebyid#"> -->
<cfset  employeeid="#getemployeebyid.emp_id#">
<cfset  employeename="#getemployeebyid.emp_name#">
<cfset  jobname="#getemployeebyid.job_name#">
<cfset  managerid="#getemployeebyid.manager_id#">
<cfset  hiredate="#getemployeebyid.hire_date#">
<cfset  salary="#getemployeebyid.salary#">
<cfset  commission="#getemployeebyid.commission#">
<cfset  departmentid="#getemployeebyid.dep_id#">
</cfif>
</cfif>




<div class="container">
<div class="row">
<div class="col-md-12">
<h1 class="text-center">REGISTER</h1>
<table align="center">

<form method="POST" action="cf_crudactionpage.cfm">

<tr><th>Employee Name</th><td><input class="form-control"   type="text" name="employeename"  value="<cfoutput> #employeename# </cfoutput>" required/></td></tr>
<tr><th>Job Name</th><td><input type="text" class="form-control"  name="jobname" value="<cfoutput> #jobname# </cfoutput>"  required/></td></tr>
<tr><th>Manager id</th><td><select class="form-select"  name="managerid"  value="<cfoutput> #managerid# </cfoutput>"  required>

<cfoutput>
<option value="">--select manager--</option>
<cfloop QUERY = "getallmanagers" >
    <option value="#getallmanagers.manager_id#"   <cfif getallmanagers.manager_id EQ managerid> selected="selected"</cfif>      >#getallmanagers.manager#(#getallmanagers.manager_id#) -
     #getallmanagers.dep_name#(#getallmanagers.dep_id#)</option>
</cfloop>
    </cfoutput>
</select>
</td></tr>
<tr><th>Hire date</th><td><input type="date" class="form-control" name="hiredate"  value="<cfoutput>#LSDateFormat(hiredate,'yyyy-mm-dd')#</cfoutput>" required/></td></tr>
<tr><th>Salary</th><td><input type="text" class="form-control" name="salary" value="<cfoutput> #salary# </cfoutput>" required/></td></tr>
<tr><th>Commission</th><td><input type="text" class="form-control"  name="commission" value="<cfoutput> #commission# </cfoutput>" required/></td></tr>
<tr><th>Department Id</th><td><select   class="form-select" name="departmentid" value="<cfoutput> #departmentid# </cfoutput>" required>
<cfoutput>
<option value="">--select department--</option>
    <cfloop QUERY="getalldepartments">
    <option value="#getalldepartments.dep_id#"  <cfif getalldepartments.dep_id EQ departmentid> selected="selected"  </cfif>    >#getalldepartments.dep_name#(#getalldepartments.dep_id#)</option>
    
    </cfloop>
</cfoutput>

</select></td></tr>



<tr><td class="pt-3" align="center" colspan="2"> <input type="submit" name="registerbtn" value="SAVE" class="btn btn-success"/></td></tr>
</form>

</table>

</div></div>

<div class="row">
<div class="col-md-12">
<cfquery name = "getemployees" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
   select * from employees order by emp_id desc;
</cfquery>




<h1 class="text-center mt-5">Employee Details</h1>
<div class="container">
<div class="row">
<div class="col-md-12">
<table align="center" class="table table-bordered">

<thead>
<tr>
    <th>Emp#ID</th>
    <th>NAME</th>
    <th>JOB</th>
    <th>MANAGERID</th>
    <th>JOIN DATE</th>
    <th>SALARY</th>
    <th>COMMISSION</th>
    <th>DEPARTMENT ID</th>
    <th colspan="3">ACTION</th>
    
</tr>
</thead>
<cfloop QUERY = "getemployees" >
    
<cfoutput>
    

<tr>
    <td>#getemployees.emp_id#</td>
    <td>#getemployees.emp_name#</td>
    <td>#getemployees.job_name#</td>
    <td>#getemployees.manager_id EQ ''? 'Top-Level Manager':getemployees.manager_id#</td>
    <td>#getemployees.hire_date#</td>
    <td>#getemployees.salary#</td>
    <td>#getemployees.commission EQ ''?'0.00':getemployees.commission#</td>
    <td>#getemployees.dep_id#</td>
    <td>
    <cfset key = "editid">
    <a class="btn btn-warning"  href="#cgi.script_name#?tide=#URLEncodedFormat(Encrypt(getemployees.emp_id, "#key#"))#"><i class="fa fa-edit"></i></a></td>
    <td>
    <cfset key = "eid">
    <a class="btn btn-danger"  style="color:white" href="cf_cruddeleteemployee.cfm?die=#URLEncodedFormat(Encrypt(getemployees.emp_id, "#key#"))#" ><i class="fa fa-trash"></i></a></td>
    <td><a class="btn btn-info" style="color:white" href=""><i class="fa fa-file-pdf" aria-hidden="true"></i></a></td>
</tr>
</cfoutput>
</cfloop>
<tbody>

</tbody>


</table>

</div></div></div>






 </body>
     </html>