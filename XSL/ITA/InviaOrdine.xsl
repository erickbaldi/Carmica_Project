<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>        
        <title>Invio Ordine</title>      
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>     				

        <script language="javascript">
          <![CDATA[
         
          function aggiorna()
               {
		document.controllaForm.submit();
                }
           
              function view() 
                {
                 document.updateform.cmd.value="view";
                 document.updateform.submit();
                }								
             ]]>
        </script>
      </head>

       <body bgcolor="#000000" text="#FFFFFF">

<form name="controllaForm" action="InviaOrdine.jsp" method="post">
     <input type="hidden" name="status" value="ordinazioni registrate"/>
</form> 

<form name="updateform"  method="POST" action="Basket.jsp">
     <input type="hidden" name="cmd"    />
</form>


<div class="T2">
   <a href="home.jsp"><img src="images/ITA/home.gif" /></a>  
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ITA/chit3.gif" /> 
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Scopri il nostro catalogo</span></a> 
   <br/><br/><br/>
    <img src="images/ITA/cd5.GIF" /> 
    <br/>
   <a href="CreaCD.jsp"><span class="stile">Crea il tuo CD!</span></a> 
   <br/><br/><br/>
    <img src="images/ITA/dvd_player.gif" /> 
    <br/>
   <a href="CreaDVD.jsp"><span class="stile">Crea il tuo DVD!</span></a> 
   <br/><br/><br/>
   <img src="images/ENG/java.GIF" />
   <br/>
   <a href="CreaMaglietta.jsp"><span class="stile">Crea la tua maglietta!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/basket.gif"  /> 
   <br/>
   <a href="javascript:view()"><span class="stile">Vai al carrello</span></a>                   
</div>



<div class="T7">     
        <br/>          
        <span class="fire2">CONTROLLA LE COMPILATION IN LISTA</span> <br/><BR/><br/>
        <a href="javascript:aggiorna()"> <img src="images/ITA/reload.gif" width="50" height="50"/></a>
        <br/><br/>
        <form name="Ordine">
        <table>
        <tr>
        <td>
        <xsl:apply-templates select="carrello/basket/ORDINI/ORDINE"/>
        </td>
        </tr>
        </table>
        </form>
        
        <xsl:apply-templates select="carrello/basket"/>
       
         <!-- =====[[ FLOW ]]===== -->
        <xsl:for-each select="carrello/basket/form">
          <form name="{@name}" method="{@method}" action="{@action}">
            <xsl:for-each select="input">
              <input type="{@type}" name="{@name}" value="{@value}"/>
            </xsl:for-each>
          </form>
        </xsl:for-each>
      
        <!-- =====[[ FLOW ]]===== -->   		    
</div>
  
      
<div class="T1">  
    <br/><br/><br/><br/>
    <img src="images/ITA/send_cd.GIF" />
    <br/><br/>    
    <span class="stilepiccolo">
    In questa pagina puoi vedere la lista delle compilation che ancora attendono di essere preparate.<br/><br/><br/><br/>
    Le tue creazioni sono state evidenziate per permetterti di tenerle sott'occhio con maggior facilita'.<br/><br/><br/><br/>
    Ogni volta che vorrai esser tenuto aggiornato sull'attuale stato della lista in attesa, non ti rimane che premere il bottone che compare in alto alla lista.<br/>
    </span>
</div>


</body>
</html>
</xsl:template>

  

 

  <!-- =====[[ ORDINI  ]]===== -->
  <xsl:template match="ORDINE">
    
<tr> 
   
   <td>
    <span class="stile">
    <xsl:value-of select="NUMERO"/>)&#160;&#160;
    </span>
    </td>  
     
     <td>
     <xsl:if test="UTENTE ='N'">
      <span class="stile">
         [<xsl:value-of select="NOMEUTENTE"/>] 
     </span>
      </xsl:if>   
      <xsl:if test="UTENTE ='S'">
      <span class="stilerosso">
        [<xsl:value-of select="NOMEUTENTE"/>]
      </span>
       </xsl:if>
      </td>
      
      <td>
      <img src="images/ITA/cd.gif" width="50" height="50"/>&#160;&#160;
      </td>
      
      <td>
      <span class="stile">
      <xsl:value-of select="NOME"/> (x <xsl:value-of select="QUANTITA"/> )
     
      </span>
      </td>
      
      <td>
        ---- ( <xsl:value-of select="TIMESTAMP"/>)
      </td>
 </tr>
 
</xsl:template>
    <!-- =====[[ /ORDINI  ]]===== -->
    
<xsl:template match="basket">
  <br/><br/><br/>
  <span class="elementiTabella"> Mancano approssimativamente  <xsl:value-of select="TEMPO"/> minuti per preparare l'ultimo ordine.
  </span>
</xsl:template>
  

  
 		
</xsl:stylesheet>