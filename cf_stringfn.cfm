<cfscript>
    name="Jes";
   asciival= Asc(name);
   writeOutput("ascii- " & asciival &"<br>");
charval=Chr(74);
writeOutput("chr- "& charval &"<br>");

comapareval=Compare("Jes", "Jes")
writeOutput("compare- " & comapareval &"<br>");

comapareval=CompareNoCase("Jes", "jes")
writeOutput("CompareNoCase- " & comapareval &"<br>");





comapareval=Find("teena", "jesteena" ,3);
writeOutput("find- " & comapareval &"<br>");//A number; the position of substring in string; or 0, if substring is not in string.


comapareval=FindNoCase("Teena", "jesteena")
writeOutput("FindNoCase- " & comapareval &"<br>");


comapareval=FindOneOf("aeiou", "jesteena",1)//e,a
writeOutput("FindOneOf- " & comapareval &"<br>");



//regular expressions
comapareval=REFind("[[:upper:]]", "jEsteenA")
writeOutput("REFind- " & comapareval &"<br>");

comapareval=REFind("[[:lower:]]", "jEsteenA")
writeOutput("REFind- " & comapareval &"<br>");

comapareval=REFind("a+c+", "abcdaaccdd")//morethan one occurnce
writeOutput("REFind- " & comapareval &"<br>");



comapareval=len("Jesteena")
writeOutput("len- " & comapareval &"<br>");


comapareval=lCase("JES")
writeOutput("lCase- " & comapareval &"<br>");


comapareval=dayOfWeekAsString(1)
writeOutput("dayOfWeekAsString- " & comapareval &"<br>");


comapareval=trim(" Jestena ")
writeOutput("trim- " & comapareval &"<br>");


comapareval=uCase("jestina")
writeOutput("uCase- " & comapareval &"<br>");


comapareval=reverse("Jestom")
writeOutput("reverse- " & comapareval &"<br>");


comapareval=stringSort("Jesteena")
writeOutput("stringSort- " & comapareval &"<br>");

letters="Jesteena";
writeOutput("stringSort- " & letters.sort() &"<br>")

sentence = "This is a standard sentence.";
wrappedSentence = wrap(sentence, 7);
writeOutput("stringwrap- " & wrappedSentence  &"<br>");


letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining



letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining

letters=removeChars('Hello CFML World',6,5);
writeOutput("removeChars- " & letters &"<br>")//number from begining

letters="Jesteena";
callback=function(inp){return inp=="e";}
onlyZs = StringFilter(letters,callback);

writeOutput("StringFilter- " & onlyZs &"<br>")//number from begining

letters=serializeJSON( reMatch("[0-9]+", "1 way to extract any number like 45, 38") );
writeOutput("vreMatchal- " & letters &"<br>")//number from begining

letters=repeatString("ColdFusion ", 3);
writeOutput("repeatString- " & letters &"<br>")//number from begining

letters=replace("ColdFUsion", "U", "u"); 
writeOutput("replace- " & letters &"<br>")//number from begining

letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining

letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining

letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining

letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining


letters=val("12Jesteena");
writeOutput("val- " & letters &"<br>")//number from begining


myStr="Contact us for ColdFusion software engineering solutions";

outStr = replace( myStr, "so", function (transform, position, original){

return UCase(transform);

}, "all");

writeoutput(outStr);



result = [ ["First Name", "Last Name", "Address"]   
, ["jes", "teena", "pk house"]    
, ["tom", "mathew", "pkeril house"]  
, ["abin", "bab", "ckrt house"]   
];

xlsx = SpreadSheetNew("saveme", true);
SpreadSheetAddRows( xlsx, result ); 
SpreadSheetWrite( xlsx, "/Applications/ColdFusion2021/cfusion/wwwroot/cfbasics/demosheet.xlsx", true ); 
</cfscript>