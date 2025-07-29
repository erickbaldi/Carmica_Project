<?xml version="1.0" ?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:output method="html" indent="no"/>

<html>
<head>
<title>Catalogue</title>      
<meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
<link href="stile.css" rel="stylesheet" type="text/css"/>

<script language="javascript">
<![CDATA[	

function add(nome)
  {
  formx.nomeprodotto.value=nome;
  formx.submit();
  }
  
function view() 
  {
  document.updateform.cmd.value="view";
  document.updateform.submit();
  } 

]]>  
</script>
<script language="javascript">
<![CDATA[
  
var message = new Array();
message[0]=" Welcome to our catalogue! ";
message[1]=" Choose among CDs, DVDs or T-Shirts ";
message[2]=" Create your own items!! ";
message[3]=" Thanx for choosing Carmica! ";
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

<body bgcolor="#FFFFFF" text="#000000" >

<form name="updateform"  method="POST" action="Basket.jsp">
     <input type="hidden" name="cmd"    />
</form>

<form name="formx" action="Basket.jsp" method="POST">
   <input type="hidden" name="nomeprodotto" value="0" />
</form>  


<div class="T2">
     <a href="home.jsp"><img src="images/ENG/home.gif" /></a>
     <br/>
     <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
     <br/><br/><br/>
     <img src="images/ENG/chit1.gif" />
     <br/> <br/>    
        
     <form name="formy" action="Catalogo.jsp" method="POST">
     <span class="stile">
       <input type="radio" name="tipo_attivo" value="C">
            <xsl:if test="//tipo_attivo='C'">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>  
       </input> CDs <br/>
   
       <input type="radio" name="tipo_attivo" value="M">
            <xsl:if test="//tipo_attivo='M'">
		<xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>
       </input> Shirts <br/>
       
       <input type="radio" name="tipo_attivo" value="D">
            <xsl:if test="//tipo_attivo='D'">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>  
       </input> DVDs <br/>
  
       <input type="submit" name="s" class="stile" value="LOOK!"/>
            <xsl:if test="//tipo_attivo='C'"><br/><br/><br/>
            </xsl:if>     
    </span>
</form> 
    
 
<br/><br/>
<img src="images/ENG/cd5.GIF" /> 
<br/>
<a href="CreaCD.jsp"><span class="stile">Create your CD!</span></a> 
<br/><br/><br/>
<img src="images/ENG/dvd_player.gif" /> 
<br/>
<a href="CreaDVD.jsp"><span class="stile">Create your DVD!</span></a> 
<br/><br/><br/>
<img src="images/ENG/java.GIF" />
<br/>
<a href="CreaMaglietta.jsp"><span class="stile">Create your t-shirt!</span></a>  
<br/><br/><br/>
<img src="images/ENG/carrello.jpg" width="120" height="110" /> 
<br/>
<a href="javascript:view()"><span class="stile">Go to the basket</span></a>
                 
</div>
 
 
<div class= "T8"> 
<span class="fire2">DISCOVER OUR CATALOGUE</span>
<BR/><BR/><BR/>
<span class="stile">
This is the Carmica productions catalogue! <br/>Choose among CDs, DVDs and t-shirts
and order on-line your items!<br/>Click on the images below and see the items artworks<BR/>
For any information <span class="dati"><a href="mailto:carmica_mail@yahoo.it">send us an email</a></span> 
</span>  <br/><br/>      
 <table border="1">
    <tr bgcolor="red">
        <td></td>
        <td> Name</td>
        <xsl:choose>
        <xsl:when test="//tipo_attivo='M'"></xsl:when>
        <xsl:otherwise>
        <td> Description </td>
        </xsl:otherwise>
        </xsl:choose>
        <td> Price</td> 
    </tr>
    <xsl:apply-templates select="//prod" />
 </table>
 <br/><br/><br/><hr width="800"/><br/><br/>
 
  <span class="stile">
<br/>
Click over an image and watch it in its original size<br/>

<br/><br/>
<table>
<tr><span class="stileblu">CDs and DVDs</span><td>
<a href="javascript:window.open('images/ENG/okinawa.JPG', target='_self')"><img border="1" src="images/ENG/okinawa_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/senza suono.JPG',target='_self')"><img border="1" src="images/ENG/senza suono_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/vergine.jpg',target='_self')" ><img border="1" src="images/ENG/vergine_small.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/simbolo.jpg',target='_self')" ><img border="1" src="images/ENG/simbolo_small.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/anello.jpg',target='_self')" ><img border="1" src="images/ENG/anello_small.jpg" width="125" height="90"/></a></td>
<td></td></tr>
</table>
<br/><br/>
<table>
<tr><span class="stileblu">T-shirts</span><td>
<a href="javascript:window.open('images/ENG/okinawa.JPG', target='_self')"><img border="1" src="images/ENG/okinawa_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/senza suono.JPG',target='_self')"><img border="1" src="images/ENG/senza suono_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/vergine.jpg',target='_self')" ><img border="1" src="images/ENG/vergine_small.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/simbolo.jpg',target='_self')" ><img border="1" src="images/ENG/simbolo_small.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/carmica1.JPG',target='_self')" ><img border="1" src="images/ENG/carmica1_small.JPG" width="125" height="90"/></a></td>
<td></td></tr>
<tr><td>
<a href="javascript:window.open('images/ENG/carmica2.JPG', target='_self')"><img border="1" src="images/ENG/carmica2_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/alberi.jpg',target='_self')"><img border="1" src="images/ENG/alberi_small.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/ENG/fiori.jpg',target='_self')" ><img border="1" src="images/ENG/fiori_small.jpg" width="125" height="90"/></a></td>
</tr></table>
</span>
</div>



</body>
</html>
</xsl:template>

<xsl:template match="prod" >
    <xsl:if test="@tipo=//tipo_attivo">
      
        <tr>
            <td> 
            <a href="javascript:add('{@nome}+{@prezzo}+{@descrizione}+x')"> 
            <img src="images/ENG/carrello.jpg"  width="60" height="60" /> 
            </a>
            </td>
      
            <td><span class="stilerosso"><xsl:value-of select="@nome" /></span> </td>
            <xsl:choose>
            <xsl:when test="//tipo_attivo='M'"></xsl:when>
            <xsl:otherwise>
                <td><span class="lista"> <xsl:value-of select="@descrizione" /></span></td>
            </xsl:otherwise>
            </xsl:choose>
                <td> <span class="lista"><xsl:value-of select="@prezzo" /></span></td>     
       </tr>
         
    </xsl:if>
</xsl:template>
</xsl:stylesheet> 
