<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
    
        <html>
            <head>
                <title>Modifica Prodotti</title>
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
                               
                         function modificaProdotto()
                         {
                            f = document.modifica;
                            
                            if(isVuoto(f.descrizione.value))
                            {
                                alert("Inserire la descrizione del prodotto!");
                                return;
                            }
                            
                            if(isVuoto(f.prezzo.value))
                            {
                                alert("Inserire il prezzo del prodotto!");
                                return;
                            }
                            
                            if(isVuoto(f.tipo.value))
                            {
                                alert("Inserire il tipo del prodotto, M per maglietta, C per CD e D per DVD!");
                                return;
                             }
                             
                             if(f.tipo.value != 'M' && f.tipo.value != 'C' && f.tipo.value != 'D') {
                                alert("Il tipo inserito non è corretto: M per maglietta, C per CD o D per DVD!");
                                return;
                             }
                             
                             if(isNaN(f.prezzo.value) && !isPrezzoValido(f.prezzo.value)) {
                                alert("Il prezzo inserito non è un numero!");
                                return;
                             }
                             
                             if(isPrezzoValido(f.prezzo.value)) {
                                alert("Il prezzo inserito non è corretto: usare il punto per i decimali e non la virgola!");
                                return;
                             }
                             
                            
                            f.submit();
                            return;
                         }
                
                    ]]>
                </script>
            </head>
            
            
            <body bgcolor="#FFFFFF" text="#000000">
                
                <div class="T2">
                    <a href="javascript:amministratoreHome()"><img src="images/ITA/home2.gif" /></a>
                    <br/><br/>
                    <span class="stile">
                    ATTENZIONE!<br/>
                    Puoi modificare soltanto prezzo e descrizione del prodotto!
                    </span>
                </div>
                
                <div class="T6">
                    <span class="fire" align="center">Modifica prodotto </span> <br/><br/><br/>
                      <form name="modifica" action="ModificaProdotti.jsp" method="post">        
                        <span class="stile" >
                                    Nome  
                                    <br/>
                                    <input type="text" readonly="true" name="nome" value="{pagina/PRODOTTO/NOME}" class="stile" size="20" maxlength="30"/>
                                    <br/><br/>
                                    Descrizione
                                    <br/>
                                    <input type="text" name="descrizione" value="{pagina/PRODOTTO/DESCRIZIONE}" class="stile" size="50" maxlength="100"/>
                                    <br/><br/>
                                    Prezzo 
                                    <br/>
                                    <input type="text" class="stile"  name="prezzo" value="{pagina/PRODOTTO/PREZZO}" size="3"/>
                                    <br/><br/>  
                                    Tipo 
                                    <br/>
                                    <input type="text" readonly="true" class="stile" name="tipo" value="{pagina/PRODOTTO/TIPO}" size="1"/>
                                    <br/><br/>
             
                                    <input type="button" value="Modifica prodotto!" class="stilerosso" onClick="modificaProdotto()"/>
                                    <br/><br/>
                                    <input type="button" value="Indietro" onClick="indietro.submit()" class="stilerosso"/>
                                    
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
                                    La modifica e&apos; stata effettuata correttamente.
                                </td>
                            </tr>
                        </table>
                    </xsl:if>
               </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet> 
