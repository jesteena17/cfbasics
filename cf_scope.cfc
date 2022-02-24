<cfcomponent output="false">   
 <cffunction name="testMe" access="public" output="false" returntype="any">  
       <cfargument name="arg1" required="true" />    
       <cfset var i = 0>
           <!--- Loop to consume some time. --->   
                <cfloop from="1" to="#arguments.arg1#" index="i">      
                  </cfloop>  
                        <cfreturn i>  
  </cffunction>
  
</cfcomponent>
