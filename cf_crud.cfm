

     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Document</title>
         <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
       select distinct m.emp_id as managerid , m.emp_name as Manager,dep_name ,m.dep_id from employees e join employees m on e.manager_id=m.emp_id
       join Departments d on d.dep_id=m.dep_id; 
    </cfquery>
<!-- <cfdump var = "#getallmanagers#"> -->

<cfquery name = "getalldepartments" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
   select dep_id,dep_name from Departments;
</cfquery>
<!-- <cfdump var = "#getalldepartments#"> -->



<table align="center">
<caption>REGISTER</caption>
<form method="POST" action="cf_crudactionpage.cfm">
<tr><th>Employee Name</th><td><input type="text" name="employeename" required/></td></tr>
<tr><th>Job Name</th><td><input type="text" name="jobname" required/></td></tr>
<tr><th>Manager id</th><td><select  name="managerid" required>
<option value="">--select manager--</option>
<cfoutput>
<cfloop QUERY = "getallmanagers" >
    <option value="#getallmanagers.managerid#">#getallmanagers.manager#(#getallmanagers.managerid#) -
     #getallmanagers.dep_name#(#getallmanagers.dep_id#)</option>
</cfloop>
    </cfoutput>
</select>
</td></tr>
<tr><th>Hire date</th><td><input type="date" name="hiredate" required/></td></tr>
<tr><th>Salary</th><td><input type="number" name="salary" required/></td></tr>
<tr><th>Commission</th><td><input type="text" name="commission" required/></td></tr>
<tr><th>Department Id</th><td><select  name="departmentid" required>
<cfoutput>
<option value="">--select department--</option>
    <cfloop QUERY="getalldepartments">
    <option value="#getalldepartments.dep_id#">#getalldepartments.dep_name#(#getalldepartments.dep_id#)</option>
    
    </cfloop>
</cfoutput>

</select></td></tr>



<tr><td colspan="2"> <input type="submit" name="registerbtn" value="Sign Up"/></td></tr>
</form>

</table>

<br><br>

<cfquery name = "getemployees" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
   select * from employees;
</cfquery>
<table border="1" align="center">
<caption><h1>Employee Details</h1></caption>
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
    <button  onClick="callModal();">Edit</button></td>
    <td>
    <cfset key = "eid">
    <a href="cf_cruddeleteemployee.cfm?die=#URLEncodedFormat(Encrypt(getemployees.emp_id, "#key#"))#" >Delete</a></td>
    <td><a href="">Generate PDF</a></td>
</tr>
</cfoutput>
</cfloop>
<tbody>

</tbody>


</table>





<script>

/*

  $.ajax({
      type: "POST",
      url: "bin/process.php",
      data: dataString,
      success: function () {
        $("#contact_form").html("<div id='message'></div>");
        $("#message")
          .html("<h2>Contact Form Submitted!</h2>")
          .append("<p>We will be in touch soon.</p>")
          .hide()
          .fadeIn(1500, function () {
            $("#message").append(
              "<img id='checkmark' src='images/check.png' />"
            );
          });
      }
    });

    */
</script>



<!-- Modal -->
<div class="modal" style="background-color:black;"  id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Update Data</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <table align="center">

<form method="POST" action="cf_crudactionpage.cfm">
<tr><th>Employee Name</th><td><input type="text" name="employeename" required/></td></tr>
<tr><th>Job Name</th><td><input type="text" name="jobname" required/></td></tr>
<tr><th>Manager id</th><td><select  name="managerid" required>
<option value="">--select manager--</option>
<cfoutput>
<cfloop QUERY = "getallmanagers" >
    <option value="#getallmanagers.managerid#">#getallmanagers.manager#(#getallmanagers.managerid#) -
     #getallmanagers.dep_name#(#getallmanagers.dep_id#)</option>
</cfloop>
    </cfoutput>
</select>
</td></tr>
<tr><th>Hire date</th><td><input type="date" name="hiredate" required/></td></tr>
<tr><th>Salary</th><td><input type="number" name="salary" required/></td></tr>
<tr><th>Commission</th><td><input type="text" name="commission" required/></td></tr>
<tr><th>Department Id</th><td><select  name="departmentid" required>
<cfoutput>
<option value="">--select department--</option>
    <cfloop QUERY="getalldepartments">
    <option value="#getalldepartments.dep_id#">#getalldepartments.dep_name#(#getalldepartments.dep_id#)</option>
    
    </cfloop>
</cfoutput>

</select></td></tr>



<tr><td colspan="2"> <input type="submit" name="registerbtn" value="Sign Up"/></td></tr>
</form>

</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript Bundle with Popper -->

<script>
    function callModal(){
       

        $("#exampleModal").show(); // How can I call it from another file?
    }
</script>
 <script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

 </body>
     </html>