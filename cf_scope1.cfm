
<cfset m = 0>
<cfset application.mycfc = createObject("component","cf_scope")>
<cfset m = application.mycfc.testMe(1000000)>
<cfoutput>#m#</cfoutput>