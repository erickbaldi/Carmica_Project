<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Modifica registrazione</title>
                <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                
                <script language="javascript">
                    <![CDATA[
                    
                        function isEmpty(value)
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
                         
                         function logonHome() 
                          {
                               document.logon.submit();
                          } 
                          
                         function isInteger(num){
                            resto=num%1;
                            if (resto==0) return true;
                            else {
                                num="";
                                return false;
                            }
                          }
                         
                         function modifyUser()
                         {
                            f = document.modifica;           
                             // Indirizzo 
                             if (isEmpty(f.via.value) ) {
                             alert("Inserire un Indirizzo!!!!");
                                    return;}



                            // Telefono
                             if ((isEmpty(f.telefono.value))|(!isInteger(f.telefono.value))) {
                                alert("Telefono non corretto");
                                return;}
                                    
                            //Password
                            if (isEmpty(f.password.value)) {
                              alert("Inserire una password.");
                              return;
                            }      

                            //Riconferma Password
                            if (f.newpwd.value!=f.newpwd2.value){
                               alert("Errore nell'inserimento della nuova password: assicurarsi di riscrivere la nuova password 2 volte");
                               return;
                               }
                            
                            f.submit();
                            return;
                         }
                    ]]>
                </script>
                
            </head>
            
            <body bgcolor="#000000" text="#FFFFFF">
                <div class="T2">
                    <a href="home.jsp"><img src="images/ITA/home.gif" /></a>
                    <br/><br/><br/><br/>
                    <span class="stile" >
                    Inserisci nei vari campi i dati che vuoi modificare.<br/>
                    Ovviamente vi sono dei campi non editabili..<br/> 
                    non ti spaventare se non puoi cambiare il tuo cognome!!
                    <br/><br/><br/><br/>
                    <img src="images/ITA/register2.GIF"  />  
                    <br/><br/><br/>
                    Per cancellarti dal database mandaci una e-mail!<br/>
                    Entro 7 giorni provvederemo a cancellarti (sigh!!) :-(
                    </span>
                </div>
                
                <div class="T6">
                  <span class="fire" align="center">Modifica dati utente </span> <br/><br/><br/>

                      <form name="modifica" action="ModifyRegistration.jsp" method="post">        

                          <span class="stile" >
                          Nome  
                          <br/>
                          <input type="text" name="firstname" readonly="true" class="stile" value="{PAGINA/USER/FIRSTNAME}" size="20" maxlength="30"/>
                          <br/><br/>

                          Cognome
                          <br/>
                          <input type="text" name="surname" readonly="true" class="stile" value="{PAGINA/USER/SURNAME}" size="20" maxlength="30"/>
                          <br/><br/>

                          Indirizzo completo 
                          <br/>
                          <input type="text" class="stile" name="via" value="{PAGINA/USER/VIA}" size="50"/>
                          <br/><br/>

                          Telefono 
                          <br/>
                          <input type="text" name="telefono" class="stile" value="{PAGINA/USER/TELEFONO}" onChange="isInteger(telefono)" size="20"/>

                          <br/><br/>
                          Data di nascita:
                          <br/>
                          <input type="text" name="datanascita" readonly="true" class="stile" value="{PAGINA/USER/DATANASCITA}" size="50"/>

                          <br/><br/>

                          Lingua:
                          <br/>
                          <img src="images/ITA/eng.jpg" height="35" weight="20"/>
                          <input type="radio" name="language" value="ENG">
                            <xsl:if test="PAGINA/USER/LANGUAGE='ENG'">
                                   <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>

                            </input>
                            <input type="radio" name="language" value="ITA" checked="checked">
                                <xsl:if test="PAGINA/USER/LANGUAGE='ITA'">
                                       <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                            <img src="images/ITA/ita.gif" height="35" weight="20"/>
                            </input>
                          <br/><br/>

                           Username:
                           <br/>
                           <input type="text" name="userCode" readonly="true" class="stile" size="20" value="{PAGINA/USER/USERCODE}" maxlength="20"/>
                           <br/><br/>

                           Password:
                           <br/>
                           <input type="password" name="password" class="stile" size="10"  maxlength="5"/>
                           <br/><br/>
                           
                           Nuova Password (campo opzionale):
                           <br/>
                           <input type="password" name="newpwd" class="stile" size="10" maxlength="5"/>
                           <br/><br/>
                           
                           Conferma Nuova Password
                           <br/>
                           <input type="password" name="newpwd2" class="stile" size="10"  maxlength="5"/>
                           <br/><br/>

                           <br/>
                           <input type="button" value="Modifica dati!" class="stilerosso" onClick="modifyUser()"/>
                           <br/>
                           <input type="button" value="Indietro" onClick="javascript:logonHome()" class="stilerosso"/>
                       </span>
                       <xsl:for-each select="PAGINA/NODO/FormModifica/*">
                          <input type="{@type}" name="{@name}" value="{@value}"/>
                       </xsl:for-each>  
                    </form>
                    <xsl:for-each select="PAGINA/NODO/form">
                        <form name="{@name}" method="{@method}" action="{@action}">
                            <xsl:for-each select="input">
                                <input type="{@type}" name="{@name}" value="{@value}"/>
                            </xsl:for-each>
                        </form>
                    </xsl:for-each>

                    <xsl:if test="/PAGINA/NODO/MODIFICA[@FATTA='S']">
                        <script>
                            <xsl:text>alert("Modifica Effettuata Correttamente!!\n\n\n\n</xsl:text>
                            <xsl:text>Inserisci nella home nella colonna di sinistra i seguenti campi:\n\n</xsl:text>

                             <xsl:text>Nome Utente: </xsl:text>
                             <xsl:value-of select="PAGINA/USER/USERCODE"/>
                             <xsl:text>\n</xsl:text>
                             <xsl:text>Password: </xsl:text>
                             <xsl:value-of select="PAGINA/USER/PASSWORD"/>

                             <xsl:text>");</xsl:text>
                        </script>
                   </xsl:if>

                   <xsl:if test="PAGINA/VARIABILE/ALERTMESSAGE[@ABILITATO='S']">
                     <script>
                            <xsl:choose>
                            <xsl:when test="PAGINA/VARIABILE/ALERTMESSAGE[@MESSAGGIO='WRONG_CREDENTIALS']">
                                <xsl:text>
                                    alert("la password inserita non è corretta. Prego inserirla nuovamente.");
                                </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>
                                    alert("</xsl:text>
                                           <xsl:value-of select="PAGINA/VARIABILE/ALERTMESSAGE"/>
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
