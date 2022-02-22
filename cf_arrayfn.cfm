<cfscript>
    writeOutput("<h1>Arrays</h1><br>");
    writeOutput("<b>An array is simply an ordered stack of data items with the same data type. Using an array, you can store multiple values under a single name.</b><br><br>")

// Creating 1D  Array in ColdFusion

flowers=ArrayNew(1);
//seperate assignment
flowers[1]="rose";
flowers[2]="lotus";
flowers[1]="lilly";
flowers[1]="jasmin";

writeOutput("<br>array original : " & serializeJSON(flowers) &"<br>");
//implicit assignment
flowers=["redlilly","redrose","redvelvet"];

writeOutput("<br>array  implicit : " & serializeJSON(flowers) &"<br>");

ArrayAppend(flowers,"redleaf",true);
writeoutput("<br> array append : "& serializeJSON(flowers) &"<br>");


//direct array
Avengers=["Phase1","Phase2","Phase3","Phase4"];
Phase_one=[["Iron man",2008,"https://media.comicbook.com/2017/10/iron-man-movie-poster-marvel-cinematic-universe-1038878.jpg"], ["The Incredible Hulk",2008,"https://m.media-amazon.com/images/I/61ikONHVOAL._AC_SY679_.jpg"],["Iron man 2",2010],["Thor",2011,"https://movieposters2.com/images/1105748-b.jpg"],["Captain America: The First Avenger",2011,"https://movieposters2.com/images/714271-b.jpg"],["The Avengers",2012,"https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/268821/4556789/apiihy1mm__31528.1625622408.jpg?c=2"]];
// Phase_one_year=[2008,2008,2010,2011,2011,2012];

Phase_two=[["Iron man 3",2013], ["Thor: The Dark World",2013],["Captain America: The Winter Soldier",2014],["Guardians of the Galaxy",2014],
["Avengers: Age of Ultron",2015],["Ant-Man",2015]];
// Phase_two_year=[2013,2013,2014,2014,2015,2015];


Phase_three=[["Captain America: Civil War",2016], ["Doctor Strange",2016],["Guardians of the Galaxy 2",2016],["Spider-Man: Homecoming",2017],
["Thor: Ragnarok",2017],["Black Panther",2017],["Avengers: Infinity War",2018],["Ant-Man and the Wasp",2018],["Captain Marvel",2019,"https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_.jpg"],["Avengers: Endgame",2019],
["Spider-Man: Far From Home",2019]];
// Phase_three_year=[2016,2016,2017,2017,2017,2017,2018,2018,2019,2019,2019];


Phase_four=[["WandaVision(Disney Plus series)",2020], ["Falcon and the Winter Soldier(Disney Plus series)",2020],["Loki season 1(Disney Plus series)",2021],["Black Widow ",2021],
["What If(Disney Plus series)",2021],["Shang-Chi and the Legend of the Ten Rings",2021],["Eternals ",2021],["Hawkeye(Disney Plus series) ",2021],["Spider-Man: No Way Home",2021]];
// Phase_four_year=[2020,2020,2021,2021,2021,2021,2021,2021,2021];


</cfscript>
<!---  if not array we will use normal variable like below --->

<!---  <cfset faqQuestion1 = "What is an array?"> 
 <cfset faqQuestion2 = "How to create a ColdFusion array?">
 <cfset faqQuestion3 = "What are two dimensional arrays?">

 This will work fine. But one problem with this approach is that you have to write out each variable name whenever you need 
 to work with it. Also, you can't do stuff like loop through all your variables. That's where arrays come into play.
 You could put all your questions into one array.
--->

<!---  Creating Arrays in ColdFusion --->
<cfset faq = ArrayNew(1)>

<cfset ArrayAppend(faq, "appendWhat are ColdFusion arrays")>
<cfset ArrayAppend(faq, "appendHow to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "appendWhat are two dimensional arrays?")>

<cfset ArrayPrepend(faq, "prependHow to modify an array?")>

<cfset ArrayInsertAt(faq, 3, "newHow to insert at a particular position in an array?")>
<cfoutput>
 <br><br>  my array is  #faq[1]# <br>
</cfoutput>

<cfoutput>
   <b> all items using loop</b><br>
</cfoutput>
<cfloop array=#faq# item="item">
    <cfoutput>
       #item# <br>
    </cfoutput>
</cfloop>
<br><br>


<cfoutput>

<table>
<thead>
<tr>
    <th>Sl.NO</th> <th>Move Name</th> <th>Year Of Release</th><th>View More</th>
</tr>

</thead>
    <tbody>
       
        
        <cfloop array=#Avengers# item="item">
            <cfoutput>
            
                <cfif  item EQ "Phase1">
                 <tr><td> <b> #item# </b></td></tr>
                    
                    <cfloop array=#Phase_one#  item="foo" index="index">
                       
                     <tr>
                        <td>#index#</td> <td>#foo[1]#</td>   <td>#foo[2]#</td> <td><a href="moviedetails.cfm?mov=#index#">View More</td> 
                     </tr>
                 
                 </cfloop>
                 </cfif>
                 <cfif item EQ "Phase2">
                    <tr><td> <b> #item# </b></td></tr>
                    
                    
                    <cfloop array=#Phase_two# item="foo" index="index">
                       
                     <tr>
                        <td>#index#</td> <td>#foo[1]#</td>   <td>#foo[2]#</td> <td><a href="moviedetails.cfm?mov=#index#">View More</td> 
                     </tr>
                 
                 </cfloop>
                 </cfif>
                 <cfif item EQ "Phase3">
                    <tr><td> <b> #item# </b></td></tr>
                    
                    
                    <cfloop array=#Phase_three# item="foo" index="index">
                       
                     <tr>
                        <td>#index#</td> <td>#foo[1]#</td>   <td>#foo[2]#</td> <td><a href="moviedetails.cfm?mov=#index#">View More</td> 
                     </tr>
                 
                 </cfloop>
                 </cfif>
                 <cfif item EQ "Phase4">
                   <tr><td> <b> #item# </b></td></tr>
                    
                    
                    <cfloop array=#Phase_four# item="foo" index="index">
                       
                     <tr>
                        <td>#index#</td> <td>#foo[1]#</td>   <td>#foo[2]#</td> <td><a href="moviedetails.cfm?mov=#index#">View More</td> 
                     </tr>
                 
                 </cfloop>
                 </cfif>



            </cfoutput>
        </cfloop>
     

 

    </tbody>
    
</table>


</cfoutput>