<cfscript>


WriteOutput("<h1>List</h1> <br><b> A Coldfusion list (or any list for that matter) is simply a string. The thing that makes this string different (to any other string) is that it contains delimiters. Delimiters (sometimes referred to as separators) are used to separate each item in the list.</b><br>");
    param name="url.passedbrand" default=4 ;
    param name="url.passedbrandforloop" default="acer" type="any";
    
brands="acer,lenovo,hp,dell";
brandorigin="america,europe,asia,africa";
WriteOutput("<br><b>in cf indexing starts from 1</b>" & "<br>");

WriteOutput("<br>length of the list is : " & listLen(brands) & "<br>");

brandappend=listAppend(brands, "avitanew");
WriteOutput("append fn : " & brandappend & "<br>");

brandprepend=listPrepend(brands, "asusnew");
WriteOutput("prepend fn : " & brandprepend & "<br>");

brandinsertat=listInsertAt(brands, "2", "applenew");
WriteOutput("add item at particular position : " & brandinsertat & "<br>");

findmecase=listContains(brandinsertat, "applenew");
WriteOutput("i am here casesensitive : " & findmecase & "<br>");

findmenocase=listContainsNoCase(brandinsertat, "AppleNew");
WriteOutput("i am here case insensitive : " & findmenocase & "<br>");

listtoarray=ListToArray(brandinsertat);
WriteOutput("i am an array now access me by index : " & listtoarray[1] & "<br>");


arrytolist=ArrayToList(listtoarray);
WriteOutput("i am back as list : " & arrytolist & "<br>");





fromUrl1=ListGetAt(brands, url.passedbrand);
fromUrl2=listContains(brands, url.passedbrandforloop);
</cfscript>
<cftry>
<cfoutput>
<ul>
<li><a href="?passedbrand=1">Acer</a></li>
<li><a href="?passedbrand=2">Lenovo</a></li>
<li><a href="?passedbrand=3">Hp</a></li>
<li><a href="?passedbrand=4">Dell</a></li>
</ul>

<b>the user clicked on :#fromUrl1#</b>

</cfoutput>

<!-- using loop to iterate over the list -->



    <cfloop list="#brands#" item="item">
    
    <cfoutput>
        <li><a href="?passedbrandforloop=#item#">#item#</a></li>
    </cfoutput>
    
    </cfloop>
    <cfoutput>
<!---         the user clicked on :#fromUrl2#  ---> <!--- outputs index  of the item --->
<b> the user clicked on the brand :#listGetAt(brands, fromUrl2)#<br>
the origin of this brand is :#listGetAt(brandorigin, fromUrl2)#
</b>
    </cfoutput>
   
  
<cfcatch type="exception">
    <cfdump  var=#cfcatch#>
  </cfcatch>
  </cftry>















<!--

Phase_one=[
    {"Iron man",2008},
     {"The Incredible Hulk",2008},
{"Iron man 2",2010},{"Thor",2011},
{"Captain America: The First Avenger",2011},
{"The Avengers",2012}];
// Phase_one_year=[2008,2008,2010,2011,2011,2012];

Phase_two=[["Iron man 3",2013], ["Thor: The Dark World",2013],["Captain America: The Winter Soldier",2014],["Guardians of the Galaxy",2014],
["Avengers: Age of Ultron",2015],["Ant-Man",2015]];
// Phase_two_year=[2013,2013,2014,2014,2015,2015];


Phase_three=[{"Captain America: Civil War",2016}, {"Doctor Strange",2016},{"Guardians of the Galaxy 2",2016},{"Spider-Man: Homecoming",2017},
{"Thor: Ragnarok",2017},{"Black Panther",2017},{"Avengers: Infinity War",2018},{"Ant-Man and the Wasp",2018},{"Captain Marvel",2019},{"Avengers: Endgame",2019},
{"Spider-Man: Far From Home",2019}];
// Phase_three_year=[2016,2016,2017,2017,2017,2017,2018,2018,2019,2019,2019];


Phase_four=[{"WandaVision(Disney Plus series)",2020}, {"Falcon and the Winter Soldier(Disney Plus series)",2020},{"Loki season 1(Disney Plus series)",2021},{"Black Widow ",2021},
{"What If(Disney Plus series)",2021},{"Shang-Chi and the Legend of the Ten Rings",2021},{"Eternals ",2021},{"Hawkeye(Disney Plus series) ",2021},{"Spider-Man: No Way Home",2021}];
// Phase_four_year=[2020,2020,2021,2021,2021,2021,2021,2021,2021];


-->