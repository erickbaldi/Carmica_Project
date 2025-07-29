<?xml version="1.0" ?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:output method="html" indent="no"/>

<html>
<head>
    <title>Carrello</title>      
    <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
    <link href="stile.css" rel="stylesheet" type="text/css"/>

    <script language="javascript">
          <![CDATA[	
 
    function add(nome)
               {
		document.updateform.nomeprodotto.value=nome;
	        document.updateform.cmd.value="add";
                document.updateform.submit();
                 }

    function sub(nome) 
               {
		document.updateform.nomeprodotto.value=nome;
	        document.updateform.cmd.value="sub";
   	        document.updateform.submit();
                }
         
    function del(nome) 
                {
                 document.updateform.nomeprodotto.value=nome;
                 document.updateform.cmd.value="del";
                 document.updateform.submit();
                }
                
      function vediLista()
               {
                document.inviaForm.status.value="ordinazioni registrate";
		document.inviaForm.submit();
                }   
                
          
                        
      ]]>  
    </script>

</head>

<body bgcolor="#000000" text="#FFFFFF">

<form name="inviaForm" action="InviaOrdine.jsp" method="post">
     <input type="hidden" name="status"/>
</form> 

<form name="updateform"  method="POST">
        <input type="hidden" name="cmd"    />
        <input type="hidden" name="nomeprodotto" />
</form>   
  

<div class="T2">
    <a href="home.jsp"><img src="images/ITA/home3.gif" /></a>        
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
    <img src="images/ITA/chit3.gif"  /> 
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
   <br/><br/><br/><br/>
    <img src="images/ITA/queue.gif"  /> 
   <br/>
    <a href="javascript:vediLista()"><span class="stile">Vedi la lista...</span></a>       
</div>


<div class="T8">
    <form name="basket">
    	<table>
             <tr bgcolor="white">
             
			<td></td>
                        <td><center><span class="stile"> Nome </span></center></td>
                        <td><center> <span class="stile"> Descrizione </span></center></td>
                        <td><center><span class="stile"> Prezzo </span></center></td>
                        <td><center><span class="stile"> Qnt</span></center></td>
                        <td><center> <span class="stile"> Modifica</span></center> </td>
                        <td><center><span class="stile"> Prezzo Parziale </span></center></td>
                        <td></td>                        
	     </tr>
             <xsl:apply-templates select="/carrello/basket/prodotto" />
        </table>
    </form>
    
    <form name="totale">
   <table>
		<tr bgcolor="#FdC879">
		<td></td>   
                <td> <span class="stile">Prezzo Totale </span></td>
		<td></td>
                <td></td>
                <td></td>
                </tr>
		
                <xsl:apply-templates select="/carrello/totale/prezzototale" />
	</table>
    </form>
    
</div>


</body>
</html>
</xsl:template>

<xsl:template match="prodotto" >
    <tr>
        <td><a href="javascript:del('{@nome}+{@prezzo}+{@descrizione}+{@tipo}')">
        <img src="images/ITA/no.gif"  width="30" height="30" /> 
        </a></td>
        <td><center> <span class="stilerosso"><xsl:value-of select="@nome" /></span></center></td>
        <td> <center><span class="lista"> <xsl:value-of select="@descrizione" /></span></center></td>
        <td> <center><span class="lista"><xsl:value-of select="@prezzo" /></span></center></td>
        <td> <center><span class="lista"><xsl:value-of select="@quantita" /></span></center></td>
        <td> <a href="javascript:add('{@nome}+{@prezzo}+{@descrizione}+{@tipo}')"> 
        <img src="images/ITA/add.gif"  width="30" height="30" /> 
        </a>&#160;
	<a href="javascript:sub('{@nome}+{@prezzo}+{@descrizione}+{@tipo}')">
        <img src="images/ITA/remove.gif"  width="30" height="30" /> 
        </a>&#160;&#160;</td>
             <td> <center><span class="lista"><xsl:value-of select="@prezzoparziale" /></span></center></td>
             <td> 
             <img>
             <xsl:attribute name="src">
             <xsl:text>images/ITA/</xsl:text>
             <xsl:value-of select="@tipo"/>
             <xsl:text>.jpg</xsl:text>
             </xsl:attribute>
             <xsl:attribute  name="width">
             <xsl:text>50</xsl:text>
             </xsl:attribute>
             <xsl:attribute  name="height">
             <xsl:text>50</xsl:text>
             </xsl:attribute> 
             </img>         
       </td>     
    </tr>
     </xsl:template>
     
     
   
  
<xsl:template match="prezzototale" >

  <br/><br/><br/>
     
  <tr>
     <td><img src="images/ITA/euro.gif"  width="90" height="90" /> </td>
     <td><span class="fire"><xsl:value-of select="@valore" /> Euro</span></td>
     <td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
     <td><img src="images/ITA/send_cd.GIF"/></td>
     <td> <a href="InviaOrdine.jsp"><span class="stilerosso">Invia il tuo ordine!</span></a> </td>
  </tr>
</xsl:template>



</xsl:stylesheet>