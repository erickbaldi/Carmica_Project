<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Where we are</title>
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>
        <script language="javascript">
<![CDATA[
  
var message = new Array();
message[0]=" Discover Castiglione dei Pepoli (BO)!! ";
message[1]=" Watch the images about the landscape ";
message[2]=" Read how to reach us..and visit us ";
message[3]=" Thanx for choosing Carmica!";
message[4]="";

var reps=1;
var speed=120; //large number=lower action
var hold=10;
var p=message.length;
var q=0; var r=0; var C=0; var mC=0; var s=0; var sT=null;

if(reps<1){reps=1;}

function setMessage(){
    typing = message[mC];
    q=typing.length;
    r=q+hold;
    typeMessage();
}

function typeMessage(){
    if(s>r){s=0;}
    if(s>q){
        document.title = '|- ' +typing+ '- - -';
    } else {
        document.title = '|- ' +typing.substr(0,s)+ '- - -';
    }
    if(C<(r*reps)){
        sT=setTimeout("typeMessage()",speed);
        C++;
        s++;
    } else{
        C=0;
        s=0;
        mC++;
        if(mC > (p-1)){mC=0;}
        sT=null;
        setMessage();
}
}

setMessage();

]]>
</script>
        
      </head>
<body bgcolor="#FFFFFF" text="#000000">       
                 
   <div class="T2">
        <a href="home.jsp"><img src="images/ITA/home3.gif" /></a>
        <br/>
        <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
        <br/><br/><br/>
        <span class="stile" >
        Click one of the images in the presentation <br/>
        and discover the town of<br/>
        Castiglione dei Pepoli (BO) following the links!
        <br/><br/><br/><br/>
        Remember to visit the other sections<br/>
        of the site and don't forget the latest news!!
        <br/><br/><br/><br/>
        <img src="images/ENG/nota1.gif" />
        </span>
        <br/>
        
        <br/><br/>
    </div>    
 
   <div class="T6">
      <span class="fire" align="center">WHERE WE ARE</span> <br/><br/><br/><br/>
      <img src="images/ENG/comunecastiglione.gif" />
      <br/><br/><br/>
          <script type="text/javascript" language="JavaScript">
<![CDATA[
var slideshow_width='314px'
var slideshow_height='214px'
var pause=4000 
var slidebgcolor="#ffffff"

var dropimages=new Array()
dropimages[0]="images/ENG/castiglion_dei_pepoli_small.jpg"
dropimages[1]="images/ENG/castiglione_small.jpg"
dropimages[2]="images/ENG/castiglione2_small.jpg"
dropimages[3]="images/ENG/castiglione_dei_pepoli_small.jpg"
dropimages[4]="images/ENG/comune_small.jpg"
dropimages[5]="images/ENG/cartina_small.gif"
dropimages[6]="images/ENG/piazza_m1.gif"

var droplinks=new Array()
droplinks[0]="http://www.comune.castiglionedeipepoli.bo.it"
droplinks[1]="http://www.maratona.net"
droplinks[2]="http://www.comuni-italiani.it/037/022/"
droplinks[3]="http://www.appennino.unibo.it/CastiglionePepoli/Castiglione_dei_Pepoli/Index.htm"
droplinks[4]="http://www.ctcastiglione.it"
droplinks[5]="http://www.hotelgabana.it"
droplinks[6]="http://www.gruppom1.it"

var preloadedimages=new Array()
for (p=0;p<dropimages.length;p++){
preloadedimages[p]=new Image()
preloadedimages[p].src=dropimages[p]
}

var ie4=document.all
var dom=document.getElementById

if (ie4||dom)
document.write('<div style="position:relative;width:'+slideshow_width+';height:'+slideshow_height+';overflow:hidden"><div id="canvas0" style="position:absolute;width:'+slideshow_width+';height:'+slideshow_height+';background-color:'+slidebgcolor+';left:-'+slideshow_width+'"></div><div id="canvas1" style="position:absolute;width:'+slideshow_width+';height:'+slideshow_height+';background-color:'+slidebgcolor+';left:-'+slideshow_width+'"></div></div>')
else
document.write('<a href="javascript:rotatelink()"><img name="defaultslide" src="'+dropimages[0]+'" border=0></a>')

var curpos=parseInt(slideshow_width)*(-1)
var degree=10
var curcanvas="canvas0"
var curimageindex=linkindex=0
var nextimageindex=1

function movepic(){
if (curpos<0){
curpos=Math.min(curpos+degree,0)
tempobj.style.left=curpos+"px"
}
else{

clearInterval(dropslide)
nextcanvas=(curcanvas=="canvas0")? "canvas0" : "canvas1"
tempobj=ie4? eval("document.all."+nextcanvas) : document.getElementById(nextcanvas)
var slideimage='<img src="'+dropimages[curimageindex]+'" border=0>'
tempobj.innerHTML=(droplinks[curimageindex]!="")? '<a href="'+droplinks[curimageindex]+'">'+slideimage+'</a>' : slideimage
nextimageindex=(nextimageindex<dropimages.length-1)? nextimageindex+1 : 0
setTimeout("rotateimage()",pause)
}
}

function rotateimage(){
if (ie4||dom){
resetit(curcanvas)
var crossobj=tempobj=ie4? eval("document.all."+curcanvas) : document.getElementById(curcanvas)
crossobj.style.zIndex++
var temp='setInterval("movepic()",50)'
dropslide=eval(temp)
curcanvas=(curcanvas=="canvas0")? "canvas1" : "canvas0"
}
else
document.images.defaultslide.src=dropimages[curimageindex]
linkindex=curimageindex
curimageindex=(curimageindex<dropimages.length-1)? curimageindex+1 : 0
}

function rotatelink(){
if (droplinks[linkindex]!="")
window.location=droplinks[linkindex]
}

function resetit(what){
curpos=parseInt(slideshow_width)*(-1)
var crossobj=ie4? eval("document.all."+what) : document.getElementById(what)
crossobj.style.left=curpos+"px"
}

function startit(){
var crossobj=ie4? eval("document.all."+curcanvas) : document.getElementById(curcanvas)
crossobj.innerHTML='<a href="'+droplinks[curimageindex]+'"><img src="'+dropimages[curimageindex]+'" border=0></a>'
rotateimage()
}

if (ie4||dom)
window.onload=startit
else
setInterval("rotateimage()",pause)

//]]>
</script>
<br/><br/><br/>
<table border="1">
<tr><th><td><span class="stilerosso">
Distance from Bologna: 56 Km<br/>
Distance from Florence: 60 Km<br/>
Whole coverage: 65,81 Kmq<br/>
Whole population: 6000 inhabitants
</span>
</td></th>
<th><td><span class="stilerosso">
Minimum altitude: mts 275 <br/>
Maximum altitude: mts 1215 <br/>
Phone prefix: 0534<br/>
C.A.P.: 40035
</span>
</td></th>
<th><td><span class="stilerosso">
Public Relations Office: 0534800638<br/>
Turistic Office - Pro Loco: 053491599<br/>
Town-hall phone number: 0534801611<br/>
Municipal police: 0534801666
</span>
</td></th></tr>
</table>

<br/><hr/><br/><br/>
<span class="stileblu"> Find other informations about Castiglione: 
<script language="javascript">
<![CDATA[
function search(){
if (formx.q.value <= 0) alert("Insert at least a word!!");
if (formx.q.value <= 0) reload();
}
</script>
<script type=text/javascript>
function reload()
{
location.reload()
}
]]>
</script>
<form name="formx" method="GET" action="http://www.google.it/search">
<input type="text" name="q" value="" size="40" maxlength="38" onSubmit="search()"/><br/>
<input type="submit" name="btnG" onClick="search()" value="Google search"/>
</form></span>
         </div>
 
   <div class="T2"> 
   <span class="stile" >
   Castiglione dei Pepoli is sited in the Appennino Tosco-emiliano and is 
   exactly at the half way between Florence and Bologna.
   It is reachable by the Strada Statale 325 named "Valli del Setta e del Bisenzio" 
   or by the highway "Autosole A1" at the gates of Roncobilaccio or Pian del Voglio.
   From the cities of Florence and Bologna the medium time of travelling is about 30-40 minutes.
   <br/><br/>
   <img src="images/ENG/bofi.jpg" />
   <br/><br/>
   By train, along the railway of Direttissima Bologna-Firenze, you have to descend in
   the San Benedetto Val di Sambro station. The station is 16 Km far from Castiglione.
   So tou can take the ATC bus which reaches Castiglione in a few minutes through the towns
   of Lagaro and Creda.  
   </span>            
   </div>   
          
  
      
</body>
</html>

</xsl:template>
</xsl:stylesheet>