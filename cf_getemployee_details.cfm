<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfquery datasource="mysqldsn" name="empSalary"> 
select distinct m.emp_id as manager_id ,e.emp_id as emp_id, m.emp_name as Manager,dep_name ,m.dep_id,
e.salary,e.hire_date,e.commission,e.job_name,e.emp_name,d.dep_name
 from employees e join employees m on e.manager_id=m.emp_id
       join Departments d on d.dep_id=m.dep_id
       where e.emp_id=<cfqueryparam value = "#url.empids#" cfsqltype = "cf_sql_integer" >; 

</cfquery> 
 
<cfdocument format="PDF" saveasname="#empSalary.emp_id#"> 
    <cfoutput query="empSalary" group="dep_id"> 
        <cfdocumentsection> 
            <cfdocumentitem type="header"> 
                <font size="-3"><i>Employee Detailsbyjes</i></font> 
            </cfdocumentitem> 
            <cfdocumentitem type="footer"> 
            <font size="-3">Page #cfdocument.currentpagenumber#</font> 
            </cfdocumentitem>         
          
            <table width="95%" border="2" cellspacing="2" cellpadding="2" > 
            <tr> 
                <th colspan="2">Employee Details</th> 
                 
            </tr> 
       
        <cfoutput> 
            <tr > 
            <td style="color:crimson"><font size="-1">Employee Name</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.emp_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Job</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.job_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Joining Date</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.hire_date#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Managed By</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.Manager#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Department</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #empSalary.dep_name#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Salary</font></td> <td style="color:crimson;font-weight:900"><font size="-1">   #DollarFormat(empSalary.salary)#</font>  </td> </tr> 
 <td style="color:crimson"><font size="-1"> Commission</font></td> <td style="color:crimson;font-weight:900"><font size="-1">  #DollarFormat(empSalary.commission)#</font>  </td> </tr> 
 </cfoutput> 
           
           
            </table> 
        </cfdocumentsection> 
    </cfoutput> 
</cfdocument> 