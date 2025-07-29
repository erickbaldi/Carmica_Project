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
              alert("Inserire lo username.");
              return;
            }        

            if (isEmpty(logonForm.password.value)) {
              alert("Inserire la password.");
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
                 document.modifyForm.lingua.value="ENG";
                 document.modifyForm.submit();
                }
           function homepage()
                {
                 if(document.all)
                    document.body.style.behavior='url(#default#homepage)';
                    document.body.setHomePage('http://www.carmica.it');
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
msg[1]="--------------------------- Sito creato da Erick Baldi e Riccardo Fiocchi";
msg[2]="--------------------------- Ci trovate a Castiglione dei Pepoli (BO)";
msg[3]="--------------------------- Email: carmica_mail@yahoo.it";
msg[4]="--------------------------- Ascolta la nostra musica!";
msg[5]="--------------------------- Buona navigazione!!";

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

<form name="lingua" action="home.jsp" method="post">
     <input type="hidden" name="lingua" value="ENG"/>
</form>     

<form name="registraForm" action="Registration.jsp" method="post">
     <input type="hidden" name="lingua" />
</form>

<form name="modifyForm" action="ModifyRegistration.jsp" method="post">
     <input type="hidden" name="lingua" />
</form>  
      
<form name="controllaForm" action="InviaOrdine.jsp" method="post">
     <input type="hidden" name="status" value="ordinazioni registrate"/>
</form> 

<form name="updateform"  method="POST" action="Basket.jsp">
   <input type="hidden" name="cmd"    />
</form>

<div class="T2">
     <img src="images/ITA/2HOME.GIF"  />
    
     <xsl:choose>
        <xsl:when test="ROOT/VAR/LOGGEDON='N'">
            <span class="stile">
            <br/><br/>
            Per poter accedere al sito e gestire il tuo profilo<br/>
            devi inserire il nome utente e la password
            <br/> <br/> <br/>
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
                <input type="button" class="stile" value="Entra ora!" onClick="submitLogon()"/>
            </form><br/><br/><br/>
            <span class="lista" >
            <script type="text/javascript" language="JavaScript">
                  <![CDATA[
                  document.write("Ultima modifica:<br/> ", document.lastModified)
                  //]]>
             </script>
             </span>
            
            <span class="stilepiccolo">
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
           <br/><a href="mailto:carmica_mail@yahoo.it"><span class="stilepiccolo">Contatta i Carmica</span></a>
           <br/><a href="mailto:erickbaldi@yahoo.it"><span class="stilepiccolo">Contatta i webmasters</span></a>    
            </span>
        </xsl:when>
 
        <xsl:otherwise>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE ='N'">
                <br/><br/><br/>
                <img src="images/ITA/chit3.gif" /> 
                <br/>
                <a href="Catalogo.jsp"><span class="stile">Scopri il nostro catalogo</span></a> 
                <br/><br/><br/>
                <img src="images/ITA/cd5.GIF" /> 
                <br/>
                <a href="CreaCD.jsp"><span class="stile">Crea il tuo CD!</span></a> 
                <br/><br/><br/>
                <img src="images/ITA/dvd_player.gif"  width="90" height="90" /> 
                <br/>
                <a href="CreaDVD.jsp"><span class="stile">Crea il tuo DVD!</span></a> 
                <br/><br/><br/>
                <img src="images/ITA/java.GIF"  width="90" height="90" /> 
                <br/>
                <a href="CreaMaglietta.jsp"><span class="stile">Crea la tua maglietta!</span></a> 
                <br/><br/><br/>
                <img src="images/ITA/basket.gif" /> 
                <br/>
                <a href="javascript:view()"><span class="stile">Vai al carrello</span></a>
            </xsl:if>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE ='S'">
                 <br/><br/><br/><br/><br/><br/>
                <img src="images/ITA/webmaster.gif" height="200" width="200"/> <br/><br/><br/><br/>
                <a href="AmministrazioneOrdini.jsp"><span class="stile">Gestisci gli ordini del tuo negozio!</span></a> <br/><br/>
                <a href="AmministrazioneProdotti.jsp"><span class="stile">Gestisci i prodotti del tuo negozio!</span></a> 
                
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
           <br/><br/>
           <img src="images/ITA/simbolo.jpg" />  
           <br/> <br/> <br/>
           <span class="stile">
           Benvenuto nel sito web dei Carmica che ti permette 
           di conoscere le informazioni sul gruppo e tutte le news
           (concerti, uscite discografiche, collaborazioni....)<br/>
           Potrai anche comprare online i nostri prodotti e crearteli da solo!<br/>
           Registrati on-line e gestisci il tuo profilo!
           BUONA NAVIGAZIONE!!
           </span>
           <br/><br/><br/>
           <span class="stilepiccolo">
           ( Browser consigliato: Internet Explorer )
           </span>
         </xsl:when>
      
         <xsl:otherwise>
            <xsl:if test="ROOT/VAR/AMMINISTRATORE='N'">
           <span class="titolo">
           Ultime novità <br/><br/> </span>
           <span class="news">
           <script type="text/javascript" language="JavaScript">
<![CDATA[
var scroller_width='350px';
var scroller_height='520px';
var bgcolor='red';
var border_color='black';
var pause=6000;

var scrollercontent=new Array() 
scrollercontent[0]='Da venerdi 6 luglio partira<br/>il "Fiori Meccanici Tour"<br/>il primo tour ufficiale dei Carmica '
+'nel quale presenteranno tutti i pezzi composti e che li terra occupati per un mese intero fino al 9 agosto'
scrollercontent[1]='Le date del tour sono:<br/><br/>15 luglio - BLACK DOG ROCK FESTIVAL-Castiglione<br/><br/>29 luglio - Festa de l Unita - Pian di Setta'
+'<br/><br/>03 agosto - Centro sociale anziani - Castiglione<br/><br/>9 agosto - Charlys Pub - Castiglione'
scrollercontent[2]='Il Black Dog Rock Festival si terra il 14-15-16 luglio a Castiglione dei Pepoli:<br/> due giorni saranno dedicati alla musica e uno alla visione del cortometraggio'
+' realizzato dai ragazzi del "Centro Giovani" del paese'
scrollercontent[3]='I gruppi che parteciperanno al Black Dog saranno:<br/><br/>il 14 luglio:<br/>Stufa<br/>Ohm<br/>BarbaraGobbi feat.Desdemona<br/>Groovecafe'
+'<br/><br/>15 luglio:<br/>esibizione dei ragazzi del corso di percussioni africane di Castiglione<br/>Gruppovado<br/>Old Children<br/>Solo in casa<br/>Carmica'
scrollercontent[4]='I concerti del Black Dog Rock Festival inizieranno alle ore 21.30 e tutti i gruppi presenti suoneranno gratuitamente...e li ringraziamo per questo e per tutta la disponibilita concessa!'

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
</script></span>
            <br/><br/>
            <span class="stile"> Bentornato</span>
            <BR/>
            <span class="fire2">
             <xsl:value-of select="ROOT/USER/FIRSTNAME"/>&#160;
             <xsl:value-of select="ROOT/USER/SURNAME"/>
            </span>
            <BR/>
            <span class="stile">Buona navigazione!</span>
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
            <img src="images/ITA/music.gif" height="150" width="180" />
            <BR/><BR/><BR/><BR/>
            <span class="stile"> Bentornato</span>
            <BR/>
            <span class="fire2">
             <xsl:value-of select="ROOT/USER/FIRSTNAME"/>&#160;
             <xsl:value-of select="ROOT/USER/SURNAME"/>
            </span>
            <div id="cobaye" style="top:20px;color:lime;text-align:center;position:relative;width:600px">
            <img src="images/ITA/simbolo_small.jpg" width="150" heigth="150"/>
            </div>
            </xsl:if>
        </xsl:otherwise> 
    </xsl:choose>      							        
</div> 

<div class="T2">          
    
        <xsl:choose>
            <xsl:when test="ROOT/VAR/LOGGEDON='N'"> 
                  <span class="lista">
                  <script type="text/javascript" language="JavaScript">
                  <![CDATA[
                  today = new Date()
                  document.write("Adesso sono le ",today.getHours()," e ",today.getMinutes()," minuti<br/>")
                  document.write(" del giorno ",today.getDate(),"/",today.getMonth()+1,"/",today.getYear())
                  //]]>
                  </script><br/>          
                  </span>
                  <BR/> <BR/> 
                  <a href="javascript:registrazioneITA()"><img src="images/ITA/ita_small.gif" height="20" width="25"/></a><span class="elementiTabella">sp</span> 
                  <a href="javascript:registrazioneENG()"><img src="images/ITA/eng_small.jpg" height="20" width="25"/></a>
                  <BR/> <BR/>
                      <span class="stile">
                      Clicca qui per <a href="javascript:registrazioneITA()"><span class="fire"> registrarti!</span></a><BR/>
                      <BR/>        
                      <a href="javascript:registrazioneENG()"> <span class="stilepiccolo">Register your data in <br/><big><tt>English language</tt></big></span></a>
                      </span>
                      <br/> <br/> <br/> <br/>
                      <img src="images/ITA/eletric.gif" width="300" heigth="300"/> 
                      <br/> <br/> <br/> <br/> 
                       
                       <a href="javascript:window.external.AddFavorite('http://www.carmica.it','Carmica web site')"> 
                       <span class="stilepiccolo">Aggiungi il nostro sito ai Preferiti! </span></a>
                       
                       <br/> <br/> 
                       
                       <a href="javascript:homepage()"> <span class="stilepiccolo">
                       Imposta <big><tt> carmica.it </tt></big> come homepage!! </span></a>
                    
                       <br/> <br/> <br/> <br/> <br/>
                       <br/><br/><br/><br/>
                      <span class="stile">
                      Sito web realizzato con: <br/>
                      <a href="http://www.netbeans.org" >
                      <img src="images/ITA/nblogo.jpg" /> </a>
                      </span>
            </xsl:when>
          
           <xsl:otherwise>
             <xsl:if test="ROOT/VAR/AMMINISTRATORE ='S'"> 
                 <br/>
                 <span class="stile"> "Ciao Admin!Non lavorare troppo!!!"</span>
                 <br/><br/>
                 <img src="images/ITA/admin2.GIF" />
                 <br/><br/>
             </xsl:if>
        
                 
         <BR/>
         <span class="stile">
                 <form name="logoutForm" action="home.jsp" method="post">
                    <input type="hidden" name="status" value="logout"/>
                 </form>
                Vuoi entrare come altro utente? Clicca sul simbolo di Logout.
                <BR/>
                 <a href="javascript:logoutForm.submit()"><img src="images/ITA/logout.gif"  width="35" height="35" /></a> 
                <BR/><BR/>
                 
             
           <xsl:if test="ROOT/VAR/AMMINISTRATORE ='N'">
                <br/><br/>
                 Clicca qui per <a href="javascript:modificaENG()"><span class="fire2">modificare i tuoi dati.</span></a>
                <br/> <br/><br/><br/>
                <img src="images/ITA/queue.gif" /> 
                <br/>
                <a href="javascript:vediLista()"><span class="stile">Controlla la lista di tutti gli ordini</span></a>
                <BR/><BR/><BR/>
                <img src="images/ITA/simbolo.jpg" height="80" width="80" />           
                <br/><a href="Credits.jsp"><span class="stile">Credits e ringraziamenti</span></a>
                <BR/><BR/><BR/><BR/> 
                <img src="images/ITA/comunecastiglione.gif" height="80" width="100"/>
                <br/><a href="DoveSiamo.jsp"><span class="stile">Scopri dove siamo</span></a> 
                <BR/><BR/><BR/><BR/>
                <img src="images/ITA/carmica1_small.JPG" height="80" width="100"/>
                <br/><a href="PhotoGallery.jsp"><span class="stile">Guarda la photogallery</span></a>
                 </xsl:if>
        </span>
              
     </xsl:otherwise>
 </xsl:choose>      	
            
</div>

 <xsl:if test="ROOT/VAR/ALERTMSG='S'">
   <script>
  <xsl:text>alert("Username e password errati!");</xsl:text> 
  </script>
  </xsl:if>       
        
</body>
</html>         
</xsl:template>
</xsl:stylesheet>