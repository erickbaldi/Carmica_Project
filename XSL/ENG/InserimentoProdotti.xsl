<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Insert Products</title>
                <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                
                <script language="javascript">
                    <![CDATA[
                    
                        function isVuoto(value)
                        {
                            if(value == null || value.length == 0)
                                return true;
                            for(var i = 0; i < value.length; i++)
                            {
                                if(value.charAt(i) != " ")
                                    return false;
                            }
                            return true;
                         }
                         function amministratoreHome() 
                          {
                               document.amministratoreView.submit();
                          }
                          
                           
                           function isValoreInvalido(descrizione) {
                             trovato=0;
                             for (count = 0; count < descrizione.length; count++)
                                  if (!CarattereValido(descrizione.charAt(count)))
                                     trovato= trovato+1;
              
                                            
                               if (trovato>0) return true;
                               else return false;
                               }    
                               
                           function isPrezzoValido(prezzo) {
                             trovato=0;
                             for (count = 0; count < prezzo.length; count++)
                                  if (prezzo.charAt(count) == ",") trovato=trovato+1; 
                               if (trovato>0) return true;
                               else return false;
                               }  
                           
                         function inserisciProdotto()
                         {
                            f = document.inserimento;
                            
                            if(isVuoto(f.nome.value))
                            {
                                alert("Insert name of the product");
                                return;
                            }
                            
                            if(isVuoto(f.descrizione.value))
                            {
                                alert("Insert product's description!");
                                return;
                            }
                            
                            if(isVuoto(f.prezzo.value))
                            {
                                alert("Insert product's price!");
                                return;
                            }
                            
                            if(isVuoto(f.tipo.value))
                            {
                                alert("Insert product type: M for shirt, C for CD e D for DVD!");
                                return;
                             }
                             
                             if(f.tipo.value != 'M' && f.tipo.value != 'C' && f.tipo.value != 'D') {
                                alert("The inserted type isn't corrected: M for shirt, C for CD e D for DVD!");
                                return;
                             }
                             
                            
                            if(isNaN(f.prezzo.value) && !isPrezzoValido(f.prezzo.value)) {
                                alert("The inserted price is not a number!");
                                return;
                             }
                             
                             if(isPrezzoValido(f.prezzo.value)) {
                                alert("The inserted price is wrong: please use the point for decimal!");
                                return;
                             }  
                             
                            
                            f.submit();
                            return;
                         }
                         
                       
                    ]]>
                </script>
                
            </head>
            
<body bgcolor="#FFFFFF" text="#000000">

<form name="lingua" action="InserimentoProdotti.jsp" method="post">
     <input type="hidden" name="lingua" value="ITA"/>
</form> 

                 
   <div class="T2">
        <a href="javascript:amministratoreHome()"><img src="images/ENG/home2.gif" /></a>
        <br/><br/>
    </div>    
 
   <div class="T6">
      <span class="fire" align="center">Insert new product </span> <br/><br/><br/>
          
          <form name="inserimento" action="InserimentoProdotti.jsp" method="post">        
    
              <span class="stile" >
              Name  
              <br/>
              <input type="text" name="nome" class="stile" size="20" maxlength="30"/>
              <br/><br/>
              Description
              <br/>
              <input type="text" name="descrizione" class="stile" size="20" maxlength="100"/>
              <br/><br/>
              Price 
              <br/>
              <input type="text" class="stile" name="prezzo" size="5"/>
              <br/><br/>  
              Type 
              <br/>
              <input type="text" class="stile" name="tipo" size="1"/>
              <br/><br/>
             
               <input type="button" value="Insert product!" class="stilerosso" onClick="inserisciProdotto()"/>
               <br/>
               <input type="button" value="Back" onClick="indietro.submit()" class="stilerosso"/>
               </span>  
               <xsl:for-each select="pagina/nodo/FormInserimento/*">
                    <input type="{@type}" name="{@name}" value="{@value}"/>
               </xsl:for-each>
        </form> 
        <xsl:for-each select="pagina/nodo/form">
            <form name="{@name}" method="{@method}" action="{@action}">
                <xsl:for-each select="input">
                    <input type="{@type}" name="{@name}" value="{@value}"/>
                </xsl:for-each>
            </form>
        </xsl:for-each>
        
        <xsl:if test="/pagina/nodo/INSERIMENTO[@FATTO='S']">
            <script>
                <xsl:text>alert("The product is been inserted!!\n\n\n</xsl:text>
                <xsl:text>The product have this attributes:\n\n</xsl:text>

                 <xsl:text>Name: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/nome"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Description: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/descrizione"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Price: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/prezzo"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Type: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/tipo"/>
                 <xsl:text>");</xsl:text>
            </script>
       </xsl:if>

       <xsl:if test="pagina/VARIABILE/ALERTMESSAGE[@ABILITATO='S']">
         <script>
                <xsl:choose>
                <xsl:when test="pagina/VARIABILE/ALERTMESSAGE[@MESSAGGIO='PRODOTTO_DUPLICATO']">
                    <xsl:text>
                        alert("The product name already exists. Please insert a new name.");
                    </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>
                        alert("</xsl:text>
                               <xsl:value-of select="pagina/VARIABILE/ALERTMESSAGE"/>
                               <xsl:text>");
                    </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </script>
      </xsl:if>   
   </div>
 
  
          
  
      
</body>
</html>

</xsl:template>
</xsl:stylesheet>
 
