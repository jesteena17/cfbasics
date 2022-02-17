<cfquery name="MySQLQuery" dataSource="mysqldsn">
SELECT * FROM employees 
</cfquery>
<cfdump var="#MySQLQuery#">



<cfscript>
result = queryExecute(
  "SELECT * FROM departments WHERE dep_name = ?", 
  [
    { value=#dname#, cfsqltype="cf_sql_varchar" }
  ],
  { datasource="mysqldsn" }
);

writeDump( var= result );
</cfscript>
<!--- call it like --->
<!--- http://localhost:8500/cfbasics/cf_db.cfm?dname=marketing --->

<cfquery name="MySQLQuery" dataSource="mysqldsn">
SELECT * FROM employees WHERE dep_id = <cfqueryparam value="#depid#"  cfsqltype="cf_sql_numeric">
</cfquery>
<cfdump var="#MySQLQuery#">
<!--- call it like --->

<!--- http://localhost:8500/cfbasics/cf_db.cfm?depid=1001 --->