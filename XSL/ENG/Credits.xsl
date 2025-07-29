<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Credits</title>
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>
        <script language="javascript">
<![CDATA[
  
var message = new Array();
message[0]=" This is the credits page ";
message[1]=" where you can give us your opinion ";
message[2]=" about this web site! ";
message[3]=" We hope you find it well!";
message[4]=" Thanx for choosing Carmica!";
message[5]="";

var reps=1;
var speed=90; //large number=lower action
var hold=15;
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
<body background="/images/ENG/image1.jpg" text="#000000">       
                 
   <div class="T2">
        <a href="home.jsp"><img src="images/ENG/tastierachitarra.gif" /></a>
        <br/>
        <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
        <br/><br/><br/>
        <span class="stile">
        We hope you enjoy this website!<br/>
        Please send us mail if you find errors and prolems
        or if you want to know more about Carmica!<br/>
        Although send an email to webmasters if you 
        found technical problems.
        </span>
        <br/><br/><br/><br/>
        <img src="images/ENG/email.gif" /><br/>
        <a href="mailto:carmica_mail@yahoo.it"><span class="stile"> Send us an e-mail! </span></a>
        <br/><br/>
        <a href="mailto:erickbaldi@yahoo.it"><span class="stile"> Send mail to webmaster! </span></a><br/>
        <a href="mailto:flakes83@gmail.com"><span class="stile"> Send mail to webmaster! </span></a>
        <br/><br/><br/>
    </div>    
 
   <div class="T6">
      <span class="fire2" align="center">CREDITS &amp; THANKS PAGE</span> <br/><br/><br/>
      <img src="images/ENG/carmica1.JPG" height="450" width="600"/>
      <br/>
      <big><b>Carmica</b></big> are (from the left):<br/>
      <a href="mailto:sbrentalox@libero.it"><span class="elementiTabella">Marco Brentazzoli: guitars</span></a><br/>
      <a href="mailto:carmica_mail@yahoo.it"><span class="elementiTabella">Christian Giannerini: drums</span></a><br/>
      <a href="mailto:kojiro-@libero.it"><span class="elementiTabella">Milo Giovanelli: voice, piano</span></a><br/>
      <a href="mailto:beppe99@libero.it"><span class="elementiTabella">Mattia Beccaglia: bass</span></a><br/>
      <a href="mailto:m.betz@hotmail.com"><span class="elementiTabella">Marco Bettazzi: guitars</span></a><br/><br/><hr/>
      
      <br/>
          <script type="text/javascript" language="JavaScript">
<![CDATA[
var emailAddress="";
function destin() {
	var link = "http://www.carmica.it"; // sito da suggerire
	var messaggio_iniziale = "" // messaggio iniziale dell'email facoltativo
	var mittente = document.forms[0].elements[0].value;
	var destinatario=document.forms[0].elements[1].value; 
	document.forms[0].elements[2].name = messaggio_iniziale; 
	funz_destinatario = "mailto:" + destinatario + "?subject=Visit this website"; // soggetto dell'email
	document.forms[0].action = funz_destinatario; 
        document.forms[0].elements[2].value = "Hi, I think this site could interest you! " + link + "\n" + mittente; // testo che segue il messaggio iniziale
} 

// funzione submit che segue al controllo della funzione nome ed email
function submitForm() { 
	if ( (nome() ) && (email()) ) 
	if (confirm("\nThis form will sent to :\n\n"+emailAddress+"\n\n Do you confirm?")) 
return true; 
	else 
alert("\nYou have broke off the submission"); 
return false; 
}

 
// funzione di controllo sul campo nome
function nome() { 
	var controlla = document.forms[0].elements[0].value; 
	if (controlla == "") { 
alert("\nYou didn't insert your name.\n\nPlease do it!") 
	document.forms[0].elements[0].focus(); 
return false; 
	} 
return true; 
} 

// funzione di controllo sul campo email
function email() { 
emailAddress=document.forms[0].elements[1].value; 
	if (document.forms[0].elements[1].value == ""){ 
alert("\nTou didn't insert the destination address.") 
	document.forms[0].elements[1].focus(); 
return false; 
} 

	if (document.forms[0].elements[1].value.indexOf ('@',0) == -1 || document.forms[0].elements[1].value.indexOf ('.',0) == -1) { 
	alert("\nThe mail address must be typed in a correct way!") 

document.forms[0].elements[1].select(); 
document.forms[0].elements[1].focus(); 
return false; 
} 
	else 
{ 
destin(); 
return true; 
} 
} 
//]]>
</script>

<form ENCTYPE="text/plain" NAME="form" METHOD='post' ACTION='' onSubmit="return submitForm()"> 
<span class="fire2">Note the site to a friend</span>
<table cellspacing="0" cellpadding="0" width="450">
<tr>
       <td><font face="verdana" size="2">Your name:</font></td>
	   <td><INPUT TYPE="text" SIZE="26" MAXLENGTH="40" /></td>
</tr>
<br/>
<tr>
       <td><font face="verdana" size="2">Destination mail:</font></td>
	    <td><INPUT TYPE="text" SIZE="26" MAXLENGTH="40" /></td>

</tr>
<tr>
       <td></td>
	    <td><INPUT TYPE="hidden"/></td>
</tr>
<br/>
<tr>
       <td><font face="verdana" size="2">Comments and advices:</font></td>
	   <td><TEXTAREA NAME="" ROWS="6" COLS="30" wrap="virtual"></TEXTAREA></td>
</tr>
<tr>
<td></td>

<td><input type="submit" value="Send"/> 
<input type="reset" value="Reset"/> </td>
</tr>
</table>
</form>
<br/><hr/><br/>
<span class="fire2" align="center">The Carmica special thanx to..<br/>
(in italian and not in order..)</span>
<br/><br/>
FRED, I SOLO IN CASA, MURIEL, DILATAZIONE, PAOLO BENVEGNU', MR.BANANA E 
TUTTI I BLOBBERS, CLAUDIO BORGANTI E TUTTO IL CONTROSENSO, VIVA MUSIC, 
PART OF ME, I MALAFEDE E I GROOVE CAFE', GLI OLD CHILDREN, BARBARA 
GOBBI E I DESDEMONA,MIRKO E I PERSONAL JESUS, FERDINANDO, ROBBY RUBINETTI, 
GAP, INO ALLY BAND,TSUNAMI,KILL THE NICE GUY, TUTTI COLORO CHE HANNO 
SUONATO, SPILLATO BIRRA, FILMATO, O ANCHE SOLO GUARDATO IL BLACK DOG ROCK 
FESTIVAL.LEONARDO ROMAGNOLI E TUTTA RADIO MUGELLO, GLI AFTERHOURS, 
EMIDIO CLEMENTI,L'ESISTENZA DI WILLIAM BURROGHS, JAMES DOUGLAS MORRISON E 
MIYAMOTO MUSASHI. ATTILIO E TUTTO IL BAR FOLLIA,IL SOCCIO,SANDRO E IL 
GABANA CLUB, IL GIOSTRA', VILLA SERENA, IL CENCIO'S, IL RIVA SUD, ALDO E 
IL RENDEZ VOUS IL CENTRO GIOVANI E IL COMUNE DI CASTIGLIONE DEI PEPOLI, 
ERICK BALDI E RICCARDO FIOCCHI CHE HANNO FATTO QUESTO SITO, TUTTI COLORO CHE CI HANNO SEMPRE 
APPLAUDITO E INCORAGGIATO (TANTI PER METTERVI TUTTI), TUTTI COLORO A 
CUI STIAMO SULLE PALLE PERCHE' CI INVOGLIANO A FARE SEMPRE IL MASSIMO 
ALLA FACCIA LORO, TUTTI QUELLI E QUELLE CHE CI SOPPORTANO(AMICI, AMICHE E 
RAGAZZE).
E TE CHE STAI DEDICANDO TEMPO A VISITARE QUESTO SITO.
<strong>GRAZIE!!</strong>

</div>
   
 
   <div class="T2"> 
   <span class="stile" >
   <div id="ejs_box2_box" style="background:#79A2A2;color:#010101;font-family:Arial;font-size:14;border-style:solid;border-width:1px;border-color:#006699;width:200px;height:100px;padding:10px"></div>
   <script languge="JavaScript">
   <![CDATA[
 ejs_box2_message = new Array;
 ejs_box2_message[0] = 'Remember to visit the other sections of the site and to advise us about your opinion listening our music!';
 ejs_box2_message[1] = 'Come and visit us in Castiglione dei Pepoli. Discover how to get there in the "Where we are" page...';
 ejs_box2_message[2] = 'For every information send us a mail by clicking in the left side link in this page!';
 ejs_box2_message[3] = 'Thank you for choosing Carmica! Enjoy it! :-) ';

 ejs_box2_actual = 0;
 ejs_box2_html_flag = 0;
 
 function ejs_box2_go()
     {
     if(document.getElementById)
         {
         ejs_box2_char = 1;
         ejs_box2_affich(ejs_box2_actual)
         ejs_box2_actual++;
         if(ejs_box2_actual >= ejs_box2_message.length)
             ejs_box2_actual = 0;
         }        
     }
 
 function ejs_box2_affich(lactual)
     {
     var pix = ejs_box2_message[lactual].charAt(ejs_box2_char);
     if(pix == "<")
         ejs_box2_html_flag = 1;
     if(pix == ">")
         ejs_box2_html_flag = 0;
     var texte = ejs_box2_message[lactual].substring(0,ejs_box2_char);
     document.getElementById("ejs_box2_box").innerHTML = texte;
     if(ejs_box2_char < ejs_box2_message[lactual].length)
         {
         ejs_box2_char++;
         if(ejs_box2_html_flag == 1)    
             ejs_box2_affich(lactual);
         else
             setTimeout("ejs_box2_affich("+lactual+")",90)
         }
     else
         setTimeout("ejs_box2_go()",3000)
     }
 
 window.onload = ejs_box2_go;
 ]]>
 </script>
   
   
   <br/><br/>
   <img src="images/ITA/bofi.jpg" />
   </span>              
   </div>   
          
  
      
</body>
</html>

</xsl:template>
</xsl:stylesheet>