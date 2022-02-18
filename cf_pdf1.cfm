<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">

<cfquery datasource="mysqldsn" name="empSalary"> 
SELECT * 
FROM employees e, Departments d 
WHERE e.dep_id = d.dep_id 
ORDER BY d.dep_name 
</cfquery> 
 
<cfdocument format="PDF" SAVEASNAME="abc.pdf"> 
    <cfoutput query="empSalary" group="dep_id"> 
        <cfdocumentsection> 
            <cfdocumentitem type="header"> 
                <font size="-3"><i>Salary Report</i></font> 
            </cfdocumentitem> 
            <cfdocumentitem type="footer"> 
            <font size="-3">Page #cfdocument.currentpagenumber#</font> 
            </cfdocumentitem>         
            <h2>#dep_name#</h2> 
            <table width="95%" border="2" cellspacing="2" cellpadding="2" > 
            <tr> 
                <th>Employee</th> 
                <th>Salary</th> 
            </tr> 
        <cfset deptTotal = 0 > 
        <!--- inner cfoutput ---> 
        <cfoutput> 
            <tr> 
                <td><font size="-1"> 
                #empSalary.emp_name#</font> 
                </td> 
                <td align="right"><font size="-1"> 
                #DollarFormat(empSalary.salary)#</font> 
                </td> 
            </tr> 
        <cfset deptTotal = deptTotal + empSalary.salary>             
        </cfoutput> 
            <tr> 
                <td align="right"><font size="-1">Total</font></td> 
                <td align="right"><font size="-1">#DollarFormat(deptTotal)#</font></td> 
            </tr> 
            <cfset deptTotal = 0> 
            </table> 
        </cfdocumentsection> 
    </cfoutput> 
</cfdocument> 