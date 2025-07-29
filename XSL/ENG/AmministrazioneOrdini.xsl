<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>        
        <title>Order Amministration</title>      
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>     				

        <script language="javascript">
          <![CDATA[										

         function deleteOrdine(code) {
            document.ordini.status.value="delete";
            document.ordini.contatore.value=code;
            document.ordini.submit();
            return;
          }          			

           function vecchiOrdini() 
           {
            document.ordini.status.value="vecchiOrdini";
            document.ordini.submit();
            return;
           }      
          
           function nuoviOrdini() 
           {
            document.ordini.status.value="nuoviOrdini";
            document.ordini.submit();
            return;
            }       
          
            function amministratoreHome() 
                {
                document.amministratoreView.submit();
                }   	
           
           function vediUtente(userName) 
                {
                document.ordini.status.value="infoUtente";
                document.ordini.nome.value=userName;
                document.ordini.submit();
                }   	      
          ]]>
        </script>
      </head>

<body bgcolor="#FFFFFF" text="#000000">

<a href="javascript:amministratoreHome()"><img src="images/ENG/home2.gif" /></a>
   
  
<center>
<br/><br/><br/>
<img src="images/ITA/register.gif" />
   <img src="images/ENG/red.gif"/><a href="javascript:vecchiOrdini()"><span class="stile">Check the old Orders </span></a><br/>
   <img src="images/ENG/green.gif"/><a href="javascript:nuoviOrdini()"><span class="stile">Check the new Orders</span></a>
</center>
   
<br/><br/>
   

<center>
 <table border="1">      
   <xsl:apply-templates select="ROOT/ORDINI/ORDINE"/>
   <xsl:apply-templates select="ROOT/UTENTE"/>
 </table>
</center>                 		

        <!-- =====[[ FLOW ]]===== -->
        <xsl:for-each select="ROOT/FLOW/form">
          <form name="{@name}" method="{@method}" action="{@action}">
            <xsl:for-each select="input">
              <input type="{@type}" name="{@name}" value="{@value}"/>
            </xsl:for-each>
          </form>
        </xsl:for-each>
        <!-- =====[[ FLOW ]]===== -->
       
</body>
</html>
</xsl:template>

  

  
  
  
 

  <!-- =====[[ ORDINE ]]===== -->
  <xsl:template match="ORDINE">

  <!-- Visualizzo il pallino con il colore giusto -->
    <tr>
      <xsl:if test="PAGINA ='vecchi'">      
          <td width="25" valign="top" align="center"><img src="images/ENG/red.gif"/></td>
      </xsl:if> 
      
      <xsl:if test="PAGINA ='nuovi'">      
          <td width="25" valign="top" align="center"><img src="images/ENG/green.gif"/></td>
      </xsl:if> 
     
    
  <!-- UserName con Link attivo alle INFO UTENTE -->   
       <td>  
           <a>
             <xsl:attribute name="href">
             <xsl:text>javascript:vediUtente('</xsl:text>
             <xsl:value-of select="NOMEUTENTE"/>
             <xsl:text>')</xsl:text>
             </xsl:attribute>
             <span class="stileblu">&#160; <xsl:value-of select="NOMEUTENTE"/>&#160; </span>
           </a>         
      </td>
    
    <!-- Quantita' -->
    <td>
     <span class="stile">
        (x <xsl:value-of select="QUANTITA"/> )
     </span>
    </td>
    
    <!-- Nome della compilation -->
    <td> 
     <span class="stile">
         <xsl:value-of select="NOMECD"/>
     </span>
    </td>
    
    <!-- Descrizione -->
    <td>
     <span class="stilepiccolo">
         <xsl:value-of select="DESCRIZIONE"/>
     </span>
    </td>
    
    <!-- Prezzo -->
    <td>
     <span class="stile">
         <xsl:value-of select="PREZZO"/> euro
     </span>
    </td>
    
    <!-- Se e' un ordine in sospeso devo dare la possibilita' di cancellarlo dalla lista -->
     <xsl:if test="PAGINA ='nuovi'">      
       <td width="25" align="center"><a href="javascript:deleteOrdine({@CODE})"><img src="images/ENG/no.gif" border="0"/></a></td>
     </xsl:if>

     
</tr>
</xsl:template> 
 <!-- =====[[ /ORDINE  ]]===== -->
  

 
 <!-- =====[[ UTENTE ]]===== -->

 <xsl:template match="UTENTE">

<tr>
  <td><span class="stilerosso">USERNAME</span></td>
  <td><span class="stilerosso">PASSWORD</span></td>
  <td><span class="stilerosso">NAME</span></td>
  <td><span class="stilerosso">SURNAME</span></td>
  <td><span class="stilerosso">ADDRESS</span></td>
  <td><span class="stilerosso">PHONE</span></td>
  <td><span class="stilerosso">BIRTHDAY</span></td>
  <td><span class="stilerosso">LANGUAGE</span></td>
</tr>
  
<tr>
   <td> 
     <span class="stile">
       <xsl:value-of select="USERCODE"/>   
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="PASSWORD"/>   
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="NOME"/>  
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="COGNOME"/>   
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="VIA"/>  
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="TELEFONO"/>  
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="DATANASCITA"/>   
     </span>
    </td>
    <td> 
     <span class="stile">
       <xsl:value-of select="LINGUA"/>  
     </span>
    </td>
</tr>
 
</xsl:template> 
 
  <!-- =====[[ /UTENTE  ]]===== -->
		
</xsl:stylesheet>


