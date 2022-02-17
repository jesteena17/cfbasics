<cfscript>
    function sum(a,b){
        return a+b;
    }
    WriteOutput(sum(5,7))
</cfscript>


<cfoutput>
  <br>  #sum(3,4)#
</cfoutput>

<cfinvoke component="cfcs.Doaddition"
	method="addition"
 
	returnvariable="s">
   
    <cfinvokeargument name="a" value="55987"/> 
    <cfinvokeargument name="b" value="55987"/> 
    </cfinvoke>

<cfoutput>
  <!--  #addition(1,2)# -->


    <br>

    #s#
</cfoutput>