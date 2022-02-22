

<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">


<cfquery 
       name="iae1"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#"> 
       select * from employees;
</cfquery> 
<cfscript> 
    //Use an absolute path for the files. ---> 
       theDir=GetDirectoryFromPath(GetCurrentTemplatePath()); 
       theFile=theDir & "dumy.xls"; 
    //Create two empty ColdFusion spreadsheet objects. ---> 
		theSheet = SpreadsheetNew("DATOS REGIONAL"); 
    //Populate each object with a query. ---> 
    SpreadsheetAddRows(theSheet,iae1); 
</cfscript> 
<cfspreadsheet action="write" filename="#theFile#" name="theSheet"  
    sheetname="iae1" overwrite=true > 
<cfspreadsheet action="read" src="#theFile#" sheet=1 format="csv" name="csvData"> 

<cfspreadsheet action="write" filename="#theFile#" name="CSVData"  
    format="csv" sheetname="iae1" overwrite=true>
<a href="exportData.xls">Descargar</a>