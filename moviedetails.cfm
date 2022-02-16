
<cfscript>
getmov=url.mov;
    foo=[["Iron man",2008,"https://media.comicbook.com/2017/10/iron-man-movie-poster-marvel-cinematic-universe-1038878.jpg"], ["The Incredible Hulk",2008,"https://m.media-amazon.com/images/I/61ikONHVOAL._AC_SY679_.jpg"],["Iron man 2",2010],["Thor",2011,"https://movieposters2.com/images/1105748-b.jpg"],["Captain America: The First Avenger",2011,"https://movieposters2.com/images/714271-b.jpg"],["The Avengers",2012,"https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/268821/4556789/apiihy1mm__31528.1625622408.jpg?c=2"]];
</cfscript>

<html>
<head>

<style>
#d1{
    display:grid;
    align-items:center;
    justify-content:center;
}
</style>
</head>
<body>
        <cfoutput >
        <div id="d1">
            <h1>#foo[getmov][1]#</h1>        
              <p>Released in #foo[getmov][2]#</p>      
 <p><img src=#foo[getmov][3]# width="300" height="300"/></p>
           </div>          
        </cfoutput>   
              
              </body>   
        </html>         