<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>        
        <title>Send Orders</title>      
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
   <a href="home.jsp"><img src="images/ENG/home.gif" /></a>  
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ENG/chit3.gif" />
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Discover our catalogue</span></a> 
   <br/><br/><br/>
    <img src="images/ENG/cd5.GIF"  /> 
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
   <img src="images/ENG/basket.gif"  /> 
   <br/>
   <a href="javascript:view()"><span class="stile">Go to the Basket</span></a>                   
</div>



<div class="T7">     
        <br/>         
        <span class="fire2">CHECK FOR THE COMPILATIONS TO BE SENT</span> <br/><BR/><br/>
        <a href="javascript:aggiorna()"> <img src="images/ENG/reload.gif" width="50" height="50"/></a>
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
    <img src="images/ENG/send_cd.GIF"/>
    <br/><br/>    
    <span class="stilepiccolo">
    In this page you can see the list of the orders that are waiting to be preparated.<br/><br/><br/><br/>
    Your CDs are highlighted so you can look them easily.<br/><br/><br/><br/>
    Every time you want know the status of the waiting CDs, you can push the refresh button that appear on the top of the page.<br/>
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
      <img src="images/ENG/cd.gif" width="50" height="50"/>&#160;&#160;
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
  <span class="elementiTabella">For the last order it is necessary to wait about <xsl:value-of select="TEMPO"/> minutes. 
  </span>
</xsl:template>		
</xsl:stylesheet>