<?xml version="1.0" ?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:output method="html" indent="no"/>

<html>
<head>
<title>Amministrazione Prodotti</title>      
<meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
<link href="stile.css" rel="stylesheet" type="text/css"/>

<script language="javascript">
<![CDATA[	
function add(nome)
  {
  formx.nomeprodotto.value=nome;
  formx.submit();
  }
  function amministratoreHome() 
  {
       document.amministratoreView.submit();
  } 

function inserimentoProdotto()
  {
     document.inserimento.submit();
     return;
  }
  
function cancellaProdotto(name)
  {
     document.cancellazione.nome.value = name;
     document.cancellazione.submit();
     
                            
     return;
  }
  
function modificaProdotto(nome, descrizione, prezzo, tipo)
  {
    f=document.modificaForm;                   
    f.nome.value = nome;
    f.descrizione.value = descrizione;
    f.prezzo.value = prezzo;
    f.tipo.value = tipo;

    f.submit();
                            
    return;
  }
]]>  
</script>

</head>

 
<xsl:for-each select="pagina/foglia/form">
    <form name="{@name}" method="{@method}" action="{@action}">
        <xsl:for-each select="input">
            <input type="{@type}" name="{@name}" value="{@value}" />
        </xsl:for-each>
    </form>
</xsl:for-each>

<body bgcolor="#FFFFFF" text="#000000">
 
<div class="T2">
     <a href="javascript:amministratoreHome()"><img src="images/ITA/home2.gif" /></a>
     <br/><br/><br/><br/>
     <img src="images/ITA/admin.gif" /> 
     <br/> <br/>  <br/> <br/>  
        
     <form name="formy" action="AmministrazioneProdotti.jsp" method="POST">
     <span class="stile">
       <input type="radio" name="tipo_attivo" value="C">
            <xsl:if test="//tipo_attivo='C'">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>  
       </input> CD <br/>
   
       <input type="radio" name="tipo_attivo" value="M">
            <xsl:if test="//tipo_attivo='M'">
		<xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>
       </input> Magliette <br/>
       
       <input type="radio" name="tipo_attivo" value="D">
            <xsl:if test="//tipo_attivo='D'">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>  
       </input> DVD <br/>
  
       <input type="submit" name="s" class="stile" value="GUARDA!"/><br/><br/><br/><br/><br/><br/><br/>
            <xsl:if test="//tipo_attivo='C'">
            </xsl:if>     
   
    <a href="javascript:inserimentoProdotto()"><span class="fire">Nuovo prodotto</span></a><BR/>
    </span>
</form> 
</div>
 
<div class= "T8">       
 <table border="1">
    <tr bgcolor="red">
        <td> <span class="elementiTabella"> Nome </span> </td>
        <xsl:choose>
        <xsl:when test="//tipo_attivo='M'"></xsl:when>
        <xsl:otherwise>
        <td> <span class="elementiTabella"> Descrizione </span> </td>
        </xsl:otherwise>
        </xsl:choose>
        <td> <span class="elementiTabella"> Prezzo </span> </td>
        <td></td> 
        
    </tr>
    <xsl:apply-templates select="//prod" />
 </table>
</div>



</body>
</html>
</xsl:template>

<xsl:template match="prod" >
    <xsl:if test="@tipo=//tipo_attivo">
      
        <tr>
            <td><a href="javascript:modificaProdotto('{@nome}', '{@descrizione}', {@prezzo}, '{@tipo}')"><span class="stilerosso"><xsl:value-of select="@nome" /></span></a> </td>
            <xsl:choose>
            <xsl:when test="//tipo_attivo='M'"></xsl:when>
            <xsl:otherwise>
                <td><span class="lista"> <xsl:value-of select="@descrizione" /></span></td>
            </xsl:otherwise>
            </xsl:choose>
                <td> <span class="lista"><xsl:value-of select="@prezzo" /></span></td>     
            <td> 
            
            <a href="javascript:cancellaProdotto('{@nome}');"> 
            <img src="images/ITA/cancel.gif" />
            </a>
            </td>
        </tr>
         
    </xsl:if>
</xsl:template>
</xsl:stylesheet> 
