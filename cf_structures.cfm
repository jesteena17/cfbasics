<cfscript>



//cgi -builtin structure
    serverName=cgi.server_name;
    serverPort=cgi.server_port;
severSecure=cgi.server_port_secure;

// to handle error if no params found by setting a default value
// set this before the variable declaration
param name='url.passedname' default='who r u?';
param name='url.passedage' default=0;


//url -built in structure holding url info 
myNameFromUrl=url.passedname;
myAgeFromUrl=url.passedage;


// creating our own structure
family=StructNew();

family.father="xxxx";
family.mother="yyyy";


//list

brands="acer,lenovo,hp,dell";

</cfscript>

<b>
<cfoutput>
   CGI -  I am running #serverName# using a port #serverPort# which is #severSecure?'secured':'not secured'#
     <!-- output - I am running localhost using a port 8500 which is not secured -->
     <br>
STRUCTURE -father is #family.father# mother is #family.mother#


</cfoutput>
<br/>

<!-- handle error using try catch-->

<cftry>
 

<cfoutput>
<!-- if my url is     http://localhost:8500/cfbasics/cf_structures.cfm?passedname=jes&passedage=20      -->
   URL - my name from url param is #myNameFromUrl# and age is #myAgeFromUrl#
    <!-- output - my name from url param is jes and age is 20  -->
    <!-- if there is no param in url then error -->
</cfoutput>

<cfcatch>
    <cfdump var = #cfcatch# >
</cfcatch>

</cftry>

<br>
<cfoutput>
    i am using #ListGetAt(brands,3) #
</cfoutput>



 
</b>