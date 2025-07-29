<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
    
        <html>
            <head>
                <title>Modify Products</title>
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
                         
                         
                         function modificaProdotto()
                         {
                            f = document.modifica;
                            
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
                         
                         function amministratoreHome() 
                          {
                               document.amministratoreView.submit();
                          }  
                         
                    ]]>
                </script>
            </head>
            
            
            <body bgcolor="#FFFFFF" text="#000000">
                
                <div class="T2">
                    <a href="javascript:amministratoreHome()"><img src="images/ITA/home2.gif"/></a>
                    <br/><br/>
                    <span class="stile">
                    ATTENTION PLEASE!<br/>
                    You can only modify the product's prize and description
                    </span>
                </div>
                
                <div class="T6">
                    <span class="fire" align="center">Modify the product </span> <br/><br/><br/>
                      <form name="modifica" action="ModificaProdotti.jsp" method="post">        
                        <span class="stile" >
                                    Name  
                                    <br/>
                                    <input type="text" readonly="true" name="nome" value="{pagina/PRODOTTO/NOME}" class="stile" size="20" maxlength="30"/>
                                    <br/><br/>
                                    Description
                                    <br/>
                                    <input type="text" name="descrizione" value="{pagina/PRODOTTO/DESCRIZIONE}" class="stile" size="50" maxlength="100"/>
                                    <br/><br/>
                                    Price 
                                    <br/>
                                    <input type="text" class="stile"  name="prezzo" value="{pagina/PRODOTTO/PREZZO}" size="3"/>
                                    <br/><br/>  
                                    Type 
                                    <br/>
                                    <input type="text" readonly="true" class="stile" name="tipo" value="{pagina/PRODOTTO/TIPO}" size="1"/>
                                    <br/><br/>
             
                                    <input type="button" value="Modify the product!" class="stilerosso" onClick="modificaProdotto()"/>
                                    <br/><br/>
                                    <input type="button" value="Back" onClick="indietro.submit()" class="stilerosso"/>
                                    
                           </span>  
                           <xsl:for-each select="pagina/nodo/FormModifica/*">
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

                    <xsl:if test="pagina/nodo/MODIFICA[@FATTA='S']">
                        <table border="1" cellspacing="0" bgcolor="#F0F0F0" bordercolor="red">
                            <tr>
                                <td>
                                    The modify is been done!
                                </td>
                            </tr>
                        </table>
                    </xsl:if>
               </div>
              
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet> 
