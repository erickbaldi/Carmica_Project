<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
  
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>::: Carmica.it - Homepage :::</title>
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="/images/ITA/favicon.ico" />
        
        <script language="javascript">
        <![CDATA[

          function isEmpty(value) {

            if (value == null || value.length == 0)
              return true;
            for (var count = 0; count < value.length; count++) {
              if (value.charAt(count) != " ") return false;
            }
            return true;

          }                
        
          function submitLogon() {

            if (isEmpty(logonForm.userCode.value)) {
              alert("Please insert an username.");
              return;
            }        

            if (isEmpty(logonForm.password.value)) {
              alert("Please insert a password.");
              return;
            }      
            
            logonForm.submit();
            
          }
      
          function view() 
                {
                 document.updateform.cmd.value="view";
                 document.updateform.submit();
                }
              
          function vediLista()
               {
		document.controllaForm.submit();
                }    
                
         function registrazioneITA() 
                {
                 document.registraForm.lingua.value="ITA";
                 document.registraForm.submit();
                } 
          function registrazioneENG() 
                {
                 document.registraForm.lingua.value="ENG";
                 document.registraForm.submit();
                } 
          function modificaENG() 
                {
                 document.modifyForm.lingua.value="ITA";
                 document.modifyForm.submit();
                } 
                 
var currentmsg = 0;
var MsgTime = 3000;
var MsgEndTime = 5000;

function initArray(n) 
{
  this.length = n;
  for (var i =1; i <= n; i++) {
    this[i] = ' ';
  }
}

msg = new initArray(6);
msg[0]="--------------------------- ::: CARMICA WEB SITE ::: ";
msg[1]="--------------------------- Web site created by Erick Baldi and Riccardo Fiocchi";
msg[2]="--------------------------- We are in Castiglione dei Pepoli (BO)";
msg[3]="--------------------------- E-mail: carmica_mail@yahoo.it";
msg[4]="--------------------------- Listen to our music!";
msg[5]="--------------------------- ENJOY SURFING!! ";

function msgrotator() 
{
 window.status = msg[currentmsg];

 if (currentmsg > msg.length - 1) 
    {
    currentmsg = 0;
    setTimeout("msgrotator()", MsgEndTime);
    }

else {
     currentmsg = currentmsg + 1;
     setTimeout("msgrotator()", MsgTime);
     }
}


]]>
</script>
</head>
<body bgcolor="#000000" text="#FFFFFF" onLoad="javascript:msgrotator()">

<form name="registraForm" action="Registration.jsp" method="post">
     <input type="hidden" name="lingua" />
</form> 
      
<form name="controllaForm" action="InviaOrdine.jsp" method="post">
     <input type="hidden" name="status" value="ordinazioni registrate"/>
</form> 

<form name="modifyForm" action="ModifyRegistration.jsp" method="post">
     <input type="hidden" name="lingua" />
</form> 

<form name="updateform"  method="POST" action="Basket.jsp">
   <input type="hidden" name="cmd"    />
</form>

<div class="T2">
     <img src="images/ENG/2HOME.GIF" />
    
     <xsl:choose>
        <xsl:when test="ROOT/VAR/LOGGEDON='N'">
            <span class="stile">
            <br/><br/>
            Insert your username and your password <br/> 
            to enter the site
            and manage your profile 
            <br/><br/><br/>
            </span>
      
            <form name="logonForm" action="home.jsp" method="post">
                <span class="fire">Username </span>
                <input type="text" name="userCode" class="stile" size= "20" maxlength="20"/>
                <span class="fire">Password</span>
                <input type="password" name="password" class="stile" size="20" maxlength="5"/>
                
                <xsl:for-each select="ROOT/FLOW/logonForm/*">
                   <input type="{@type}" name="{@name}" value="{@value}"/>
                </xsl:for-each>                            
                <br/> 
                <input type="button" class="stile" value="Enter now!" onClick="submitLogon()"/>
            </form>
            <span class="stilepiccolo">
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
           <br/><a href="mailto:carmica_mail@yahoo.it"><span class="stilepiccolo">Contatta i Carmica</span></a>
           <br/><a href="mailto:erickbaldi@yahoo.it"><span class="stilepiccolo">Contatta i webmasters</span></a>    
            </span>
        </xsl:when>
 
        <xsl:otherwise>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE ='N'">
                <br/><br/><br/><br/>
                <img src="images/ENG/chit3.gif" /> 
                <br/>
                <a href="Catalogo.jsp"><span class="stile">Discover our catalogue</span></a> 
                <br/><br/><br/>
                <img src="images/ENG/cd5.GIF" /> 
                <br/>
                <a href="CreaCD.jsp"><span class="stile">Create your CD!</span></a> 
                <br/><br/><br/>
                <img src="images/ENG/dvd_player.gif"  /> 
                <br/>
                <a href="CreaDVD.jsp"><span class="stile">Create your DVD!</span></a> 
                <br/><br/><br/>
                <img src="images/ITA/java.GIF"  width="90" height="90" /> 
                <br/>
                <a href="CreaMaglietta.jsp"><span class="stile">Create your t-shirt!</span></a> 
                <br/><br/><br/>
                <img src="images/ENG/basket.gif" /> 
                <br/>
                <a href="javascript:view()"><span class="stile">Go to the basket</span></a>
            </xsl:if>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE ='S'">
                 <br/><br/><br/><br/><br/><br/>
                <img src="images/ENG/amministratore.jpg" /> <br/><br/>
                <a href="AmministrazioneOrdini.jsp"><span class="stile">Manage the orders of your shop!</span></a> <br/><br/>
                <a href="AmministrazioneProdotti.jsp"><span class="stile">Manage the products of your shop!</span></a> 
                
           </xsl:if>
                   
       </xsl:otherwise>
 </xsl:choose>
</div>
     
<div class="T5">    
      <xsl:choose>
         <xsl:when test="ROOT/VAR/LOGGEDON='N'">
         <span class="home">
           Carmica Online  <br/><br/>
           </span>
           <br/>
           <img src="images/ENG/simbolo.jpg" />  
           <br/> <br/> <br/>
           <span class="stile">
           Welcome in the Carmica web site which allows you to know the
           informations about the band and the latest news (concerts,
           discographic issues, collaborations...)<br/>
           You can also buy online our products and create them yourself!<br/>
           Register on-line and manage your profile! ENJOY IT!! 
           </span>
           <br/><br/><br/>
           <span class="stilepiccolo">
           ( Optimized for Internet Explorer )
           </span>
         </xsl:when>
      
         <xsl:otherwise>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE='N'">
            <span class="titolo">
            Latest news<br/><br/></span>
            <span class="news">
            <script type="text/javascript" language="JavaScript">
<![CDATA[
var scroller_width='350px';
var scroller_height='520px';
var bgcolor='red';
var border_color='black';
var pause=6000;

var scrollercontent=new Array() 
scrollercontent[0]='Carmica will play on friday June the 23rd at 8.30PM in Castiglione..come here!! '
scrollercontent[1]='Visit our sections and catalogue! You can make your own CDs and DVDs and buy online!!'
scrollercontent[2]='Listen to Carmica on Radio Fujiko 93.4Mhz from Monday to Friday at 4PM'
scrollercontent[3]='Every 45/60 minutes passed in front of the pc remember to get a pause of 15 minutes...'

var ie4=document.all
var dom=document.getElementById&&navigator.userAgent.indexOf("Opera")==-1

if (ie4||dom){
document.write('<div align="left" style="position:relative;width:'+scroller_width+';height:'+scroller_height+';overflow:hidden; border: 1px '+border_color+'; border-style: solid;"><div class="tabella"  id="canvas0" style="position:absolute;background-color:'+bgcolor+';width:'+scroller_width+';height:'+scroller_height+';top:'+scroller_height+';filter:alpha(opacity=20);-moz-opacity:0.2;"></div><div class="tabella" id="canvas1" style="position:absolute;background-color:'+bgcolor+';width:'+scroller_width+';height:'+scroller_height+';top:'+scroller_height+';filter:alpha(opacity=20);-moz-opacity:0.2;"></div></div>')
} else if(document.layers){
document.write('<ilayer id=tickernsmain visibility=hide width='+scroller_width+' height='+scroller_height+' bgColor='+bgcolor+'><layer id=tickernssub width='+scroller_width+' height='+scroller_height+' left=0 top=0>'+scrollercontent[0]+'</layer></ilayer>')
}

var curpos=scroller_height*(1)
var degree=10
var curcanvas="canvas0"
var curindex=0
var nextindex=1

function moveslide(){
if (curpos>0){
curpos=Math.max(curpos-degree,0)
tempobj.style.top=curpos+"px"
}
else{
clearInterval(dropslide)
if (crossobj.filters)
crossobj.filters.alpha.opacity=100
else if (crossobj.style.MozOpacity)
crossobj.style.MozOpacity=1
nextcanvas=(curcanvas=="canvas0")? "canvas0" : "canvas1"
tempobj=ie4? eval("document.all."+nextcanvas) : document.getElementById(nextcanvas)
tempobj.innerHTML=scrollercontent[curindex]
nextindex=(nextindex<scrollercontent.length-1)? nextindex+1 : 0
setTimeout("rotateslide()",pause)
}
}

function rotateslide(){
if (ie4||dom){
resetit(curcanvas)
crossobj=tempobj=ie4? eval("document.all."+curcanvas) : document.getElementById(curcanvas)
crossobj.style.zIndex++
if (crossobj.filters)
document.all.canvas0.filters.alpha.opacity=document.all.canvas1.filters.alpha.opacity=20
else if (crossobj.style.MozOpacity)
document.getElementById("canvas0").style.MozOpacity=document.getElementById("canvas1").style.MozOpacity=0.2
var temp='setInterval("moveslide()",50)'
dropslide=eval(temp)
curcanvas=(curcanvas=="canvas0")? "canvas1" : "canvas0"
}
else if (document.layers){
crossobj.document.write(scrollercontent[curindex])
crossobj.document.close()
}
curindex=(curindex<scrollercontent.length-1)? curindex+1 : 0
}

function resetit(what){
curpos=parseInt(scroller_height)*(1)
var crossobj=ie4? eval("document.all."+what) : document.getElementById(what)
crossobj.style.top=curpos+"px"
}

function startit(){
crossobj=ie4? eval("document.all."+curcanvas) : dom? document.getElementById(curcanvas) : document.tickernsmain.document.tickernssub
if (ie4||dom){
crossobj.innerHTML=scrollercontent[curindex]
rotateslide()
}
else{
document.tickernsmain.visibility='show'
curindex++
setInterval("rotateslide()",pause)
}
}

if (ie4||dom||document.layers)
window.onload=startit

//]]>
</script>
</span>
<br/><br/>
            <span class="stile"> Welcome back</span>
            <br/>
            <span class="fire2">
             <xsl:value-of select="ROOT/USER/FIRSTNAME"/>&#160;
             <xsl:value-of select="ROOT/USER/SURNAME"/>
            </span>
            <BR/>
            <span class="stile">Enjoy the website!</span>
            </xsl:if>
            
            <xsl:if test="ROOT/VAR/AMMINISTRATORE='S'">
            <br/> <br/> <br/> <br/>     
            <script type="text/javascript">
            <![CDATA[
var ph=600;// posizione orizzontale di partenza
var ph2=200;// posizione orizzontale massima
var pv=20;// posizione verticale di partenza
var pv2=100;// posizione verticale massima

var dh=2;// spiazzamento orizzontale
var dv=1;// spiazzamento verticale
var delai=10;// ritardo di tempo

function bouge() {
var ex=document.getElementById('cobaye');

if (ph < ph2){ex.style.left=(ph+=dh)+"px"}
else if (ph2 > 100){ex.style.left=(ph2-=dh)+"px";}
else{ph=100;ph2=600};

if (pv < pv2){ex.style.top=(pv+=dv)+"px"}
else if (pv2 > 20){ex.style.top=(pv2-=dv)+"px";}
else{pv=20;pv2=100};

setTimeout (bouge,delai)
}
window.onload = bouge;
//]]>
</script>
            <img src="images/ITA/music.gif" height="150" width="180"/>
            <BR/><BR/><BR/><BR/>
            <span class="stile"> Welcome</span>
            <BR/>
            <span class="fire2">
             <xsl:value-of select="ROOT/USER/FIRSTNAME"/>&#160;
             <xsl:value-of select="ROOT/USER/SURNAME"/>
            </span>
            </xsl:if>
        </xsl:otherwise> 
    </xsl:choose>      							        
</div> 

<div class="T2">          
    
        <xsl:choose>
            <xsl:when test="ROOT/VAR/LOGGEDON='N'">
                  <BR/> 
                  <span class="lista">
                  <script type="text/javascript" language="JavaScript">
                  <![CDATA[
                  today = new Date()
                  document.write("The current time is ",today.getHours()," and ",today.getMinutes()," minutes<br/>")
                  document.write(" of the day ",today.getYear(),"/",today.getMonth()+1,"/",today.getDate())
                  //]]>
                  </script><br/>
                  <script type="text/javascript" language="JavaScript">
                  <![CDATA[
                  document.write("Last modified: ", document.lastModified)
                  //]]>
                  </script>
                  </span>
                  <BR/> <BR/> 
                  <a href="javascript:registrazioneITA()"><img src="images/ITA/ita_small.gif" height="20" width="25"/></a><span class="elementiTabella">sp</span>
                  <a href="javascript:registrazioneENG()"><img src="images/ITA/eng_small.jpg" height="20" width="25"/></a>
                  <BR/> <BR/>
                      <span class="stile">
                      Click here to <a href="javascript:registrazioneENG()"><span class="fire"> register!</span></a><BR/>
                      <BR/>        
                      <a href="javascript:registrazioneITA()"> <span class="stilepiccolo">Registrati qui in <big><tt>italiano!</tt></big></span></a>
                      </span>
                      <br/> <br/> <br/> <br/>
                      <img src="images/ITA/eletric.gif" width="300" heigth="300"/> 
                      <br/> <br/> <br/> <br/> 
                      <span class="stilepiccolo">
                       <a href="javascript:window.external.AddFavorite('http://www.carmica.it','Carmica web site')"> 
                       Add our web site to Favourites! </a>
                       </span>
                       <br/> <br/> 
                       <span class="stilepiccolo">
                       <a href="javascript:homepage()"> Set  <big><tt>carmica.it</tt></big>  as homepage!! </a>
                       </span>
                       <br/> <br/> <br/> <br/> <br/>
                       <br/><br/><br/><br/>
                      <span class="stile">
                      Web-site created with: <br/>
                      <a href="http://www.netbeans.org" >
                      <img src="images/ENG/nblogo.jpg" /> </a>
                      </span>
            </xsl:when>
          
           <xsl:otherwise>
             <xsl:if test="ROOT/VAR/AMMINISTRATORE ='S'"> 
                 <br/>
                 <span class="stile"> "Hi Admin! Don't work so much!!"</span>
                 <br/>
             </xsl:if>
        
                 
         <BR/>
         <span class="stile">
                 <form name="logoutForm" action="home.jsp" method="post">
                    <input type="hidden" name="status" value="logout"/>
                 </form>
                Do you want to enter as another user?!<br/>Click and logout!
                <BR/>
                 <a href="javascript:logoutForm.submit()"><img src="images/ENG/logout.gif"  width="35" height="35" /></a> 
                <BR/><BR/>
                 
             
           <xsl:if test="ROOT/VAR/AMMINISTRATORE ='N'">
                <br/><br/>
                 Click here to <a href="javascript:modificaENG()"><span class="fire2">modify your data.</span></a>
                <br/> <br/><br/><br/>
                <img src="images/ENG/queue.gif" /> 
                <br/>
                <a href="javascript:vediLista()"><span class="stile">Check for the list</span></a>
                <BR/><BR/><BR/>
                <img src="images/ITA/simbolo.jpg" height="80" width="80" />           
                <br/><a href="Credits.jsp"><span class="stile">Credits and thanks</span></a> 
                <BR/><BR/><BR/><BR/> 
                <img src="images/ITA/comunecastiglione.gif" height="80" width="100"/>
                <br/><a href="DoveSiamo.jsp"><span class="stile">Discover where we are</span></a>
                <br/><br/><br/><br/>
                <img src="images/ITA/carmica1_small.JPG" height="80" width="100"/>
                <br/><a href="PhotoGallery.jsp"><span class="stile">Photogallery and other</span></a>
           </xsl:if>
        </span>
              
     </xsl:otherwise>
 </xsl:choose>      	
            
</div>

 <xsl:if test="ROOT/VAR/ALERTMSG='S'">
   <script>
  <xsl:text>alert("Wrong username and password!");</xsl:text> 
  </script>
  </xsl:if>       
        
</body>
</html>         
</xsl:template>
</xsl:stylesheet>