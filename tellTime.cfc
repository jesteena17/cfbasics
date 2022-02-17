<cfcomponent>
  <cffunction name="getLocalTime">
     <cfscript>
      serverTime=now();
      localStruct=structNew();
      localStruct.Hour=DatePart("h", serverTime);
      localStruct.Minute=DatePart("n", serverTime);
    </cfscript>
    <cfoutput>#localStruct.Hour#:#localStruct.Minute#</cfoutput>  
  </cffunction>
  <cffunction name="getUTCTime">
    <cfscript>
      serverTime=now();
      utcTime=GetTimeZoneInfo();
      utcStruct=structNew();
      utcStruct.Hour=DatePart("h", serverTime);
      utcStruct.Minute=DatePart("n", serverTime);
      utcStruct.Hour=utcStruct.Hour + utcTime.utcHourOffSet;
      utcStruct.Minute=utcStruct.Minute + utcTime.utcMinuteOffSet;
    </cfscript>
    <cfoutput>#utcStruct.Hour#:#utcStruct.Minute#</cfoutput>  
  </cffunction>
</cfcomponent>