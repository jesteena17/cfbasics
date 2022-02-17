<cfcomponent>
    <cffunction  name="getSum" >
        <cfargument name="a" required="true" >
   <cfargument name="b" required="true" >
   <cfreturn a+b>
    </cffunction>

   <cffunction  name="anotherMethodForSum" >
       
<cfscript>
    public function addNumbers(c,d)
    {
        r=c+d;
        return r;
    }
</cfscript>
       <cfoutput>
       <cfset newsum = addNumbers(25,23)>
           #newsum#
       </cfoutput>
    </cffunction>


</cfcomponent>