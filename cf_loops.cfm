<cfscript>
    writeOutput("<br>--------while----------<br>");
    i=1;
while(i<=10)
{
    writeOutput(i & "<br>");
    i++;
}

writeOutput("<br>--------dowhile----------<br>");

j=20;
do{
    writeOutput(j & "<br>");
    j--;
}while(j>=10);



writeOutput("<br>--------for----------<br>");
for(k=50;k<=60;k++)
{
    writeOutput(k*2 & "<br>");
}



writeOutput("<br>--------nested for----------<br>");
for(m=1;m<5;m++){
    for(k=5;k>m;k--){
        writeOutput("" & "&nbsp;");
    }
    for(n=1;n<=m;n++){
        writeOutput("*");
    }
    writeOutput("<br>");
}
</cfscript>