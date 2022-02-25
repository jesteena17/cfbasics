<!-- The VARIABLES scope is the default scope in ColdFusion.
 i.e. if a variable is declared in .cfm and .cfc file without explicitly prefixing a scope, 
or without 'var' to a variable inside a function, ColdFusion assigns VARIABLES scope to that variable. 

A query result is a type of variable, so it overwrites a local variable with the same name.

ColdFusion variables are not case sensitive. However, consistent capitalization makes the code easier to read.

When creating a form with fields that are used in a query, match form field names 
with the corresponding database field names.

PERIOD  means a . operator
-->

<!-- Variables Scope -->

<cfset  myname="jesteena"/> 
<cfset variables.myname = "jesteena" />
<cfscript>

myname = "jesteena";

variables.myname = "manu";
writeOutput(myname);
 writeOutput(variables.myname);
</cfscript>

<!-- variable declared in VARIABLES scope can be referenced without explicitly prefixing the VARIABLES scope. -->



<cfoutput>#myname#</cfoutput> 

<cfoutput>#variables.myname#</cfoutput>


<!--- period --->


<cfset "myVar.a.b" = "This is a test">
<cfoutput>
    #myVar.a.b#
</cfoutput>


<cfset Variables["myVar.a.b"] = "This is a test">

<cfoutput>myVar.a.b is: #Variables["myVar.a.b"]#<br></cfoutput>


<!--- For example, to scope a session variable, you would do something like this: --->

<cfset Session.BodyType = "Perfect">
<cfoutput>
  Body Type: #Session.BodyType#
</cfoutput>

<!--- 
If you do use a variable name without a scope prefix, ColdFusion checks the scopes in the following order to find the variable:

Local (function-local, UDFs and CFCs only)
Arguments
Thread local (inside threads only)
Query (not a true scope; variables in query loops)
Thread
Variables
CGI
Cffile
URL
Form
Cookie
Client
--->
<!--- 

Variable Persistence
ColdFusion provides four variable scopes that let you maintain data that must be available to multiple applications or users or must last beyond the scope of the current request.

These are:

Client
Session
Application
Server

--->



<cfset m = 0>
<cfset application.mycfc = createObject("component","cf_scope")>
<cfset m = application.mycfc.testMe(100000000)>
<cfoutput>#m#</cfoutput>


<!---  
Template Scopes (CFM)
variables - The default or implicit scope where all variables are assigned to.
--->

<!--- Component Scopes (CFC)
variables - Private scope, visible internally to the CFC only
this - Public scope, visible from the outside world
static - No need for a CFC instance, available as a CFC representation (Lucee only) --->


<!--- Function Scopes
variables - Has access to private variables within a Component or Page
this - Has access to public variables within a Component or Page
local - Function scoped variables, only exist within the function execution. Referred to as var scoping
arguments - Incoming variables to a function --->


<!--- Tag Scopes
attributes - Incoming tag attributes
variables - The default scope for variable assignments
caller - Used within a custom tag to set or read variables within the template that called it. --->


<!--- Thread Scopes
attributes - Passed variables via a thread
thread - A thread specific scope that can be used for storage and retrieval
local - Variables local to the thread context --->

<!--- Persistence Scopes
Can be used in any context, used for persisting variables for a period of time.
session - stored in server RAM or external storages tracked by unique web visitor
client - stored in cookies, databases, or external storages (simple values only)
application - stored in server RAM or external storage tracked by the running ColdFusion application
cookie - stored in a visitor's browser
server - stored in server RAM for ANY application for that CFML instance
request - stored in RAM for a specific user request ONLY
cgi - read only scope provided by the servlet container and CFML
form - Variables submitted via HTTP posts
URL - Variables incoming via HTTP GET operations or the incoming URL --->