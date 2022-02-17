<cfscript>
    function sum(a,b){
        return a+b;
    }
    WriteOutput("result from cfscrpit : "&sum(5,7))
</cfscript>


<cfoutput>
  <br> sum using normal function call:  #sum(3,4)#
  <br>
</cfoutput>



<cffunction name="getFullName" output="false" access="public" returnType="string">
    <cfargument name="firstName" type="string" required="false" default="" />
    <cfargument name="lastName" type="string" required="false" default="" />
    <cfset var fullName = arguments.firstName & " " & arguments.lastname />
    <cfreturn fullName />
</cffunction>



<cfset fullName = getFullName(firstName="John", lastName="Adams") />
<cfoutput>
  function using tag without component :  Good morning, #fullName#!
</cfoutput>




<cfinvoke component="tellSum" method="getSum" returnvariable="result">
   
    <cfinvokeargument name="a" value="10"/> 
    <cfinvokeargument name="b" value="20"/> 
</cfinvoke>


<cfoutput>
    <br>

  finding sum using tags and components :  #result#
    <br>
</cfoutput>
<cfoutput>
  finding sum in procedural way and using components : 
  <cfinvoke component="tellSum" method="anotherMethodForSum" >
</cfoutput>

