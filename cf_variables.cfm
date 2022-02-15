<cfset myName = "jesteena"/>
<cfscript>
    myAge=20;
    a=20;
    b=30;
    c=a+b;
    d=37/2;
    
</cfscript>
<html>
<body>
<b>my name is :  <cfoutput>
    #myName#
</cfoutput> 
<br>
my age is : <cfoutput>
    #myAge#
</cfoutput>

<br>
sum: <cfoutput>
    #c#
</cfoutput>

<br>
sum/2 : <cfoutput>
    #d#
</cfoutput>

<br>
rounded val is : <cfoutput>
    #round(d)#
</cfoutput>
<br>
my age is case insensitive : <cfoutput>
    #myage#
</cfoutput>

















 </b>

</body>
</html>