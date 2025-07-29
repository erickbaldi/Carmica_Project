<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Modify Registration</title>
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
                             alert("Insert your address!!!!");
                                    return;}



                            // Telefono
                             if ((isEmpty(f.telefono.value))|(!isInteger(f.telefono.value))) {
                                alert("The telephone number is wrong");
                                return;}
                                    
                            //Password
                            if (isEmpty(f.password.value)) {
                              alert("Insert your password.");
                              return;
                            }      

                            //Riconferma Password
                            if (f.newpwd.value!=f.newpwd2.value){
                               alert("The new password is not correct: please make sure to insert the same password two times");
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
                    <a href="home.jsp"><img src="images/ENG/home.gif" /></a>
                    <br/><br/><br/><br/>
                    <span class="stile" >
                    Please insert your data to change.<br/>
                    Of course there are uneditable fields..<br/>
                    so don't worry if you can't change your surname!!
                    <br/><br/><br/><br/>
                    <img src="images/ITA/register2.GIF" />  
                    <br/><br/><br/>
                    Send us an email to unregister your data.<br/>
                    We will provide to erase them within 7 days (sigh!!) :-(
                    </span>
                </div>
                
                <div class="T6">
                  <span class="fire" align="center">User data change </span> <br/><br/><br/>

                      <form name="modifica" action="ModifyRegistration.jsp" method="post">        

                          <span class="stile" >
                          Name  
                          <br/>
                          <input type="text" name="firstname" readonly="true" class="stile" value="{PAGINA/USER/FIRSTNAME}" size="20" maxlength="30"/>
                          <br/><br/>

                          Surname
                          <br/>
                          <input type="text" name="surname" readonly="true" class="stile" value="{PAGINA/USER/SURNAME}" size="20" maxlength="30"/>
                          <br/><br/>

                          Complete Address  
                          <br/>
                          <input type="text" class="stile" name="via" value="{PAGINA/USER/VIA}" size="50"/>
                          <br/><br/>

                          Telephone number 
                          <br/>
                          <input type="text" name="telefono" class="stile" value="{PAGINA/USER/TELEFONO}" onChange="isInteger(telefono)" size="20"/>

                          <br/><br/>
                          Birthday:
                          <br/>
                          <input type="text" name="datanascita" readonly="true" class="stile" value="{PAGINA/USER/DATANASCITA}" size="50"/>

                          <br/><br/>

                          Language:
                          <br/>
                          <img src="images/ITA/eng.jpg" height="35" weight="20"/>
                          <input type="radio" name="language" value="ENG" checked="checked">
                            <xsl:if test="PAGINA/USER/LANGUAGE='ENG'">
                                   <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>

                            </input>
                            <input type="radio" name="language" value="ITA">
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
                           
                           New Password (optional field):
                           <br/>
                           <input type="password" name="newpwd" class="stile" size="10" maxlength="5"/>
                           <br/><br/>
                           
                           Confirm new password
                           <br/>
                           <input type="password" name="newpwd2" class="stile" size="10"  maxlength="5"/>
                           <br/><br/>

                           <br/>
                           <input type="button" value="Modify data!" class="stilerosso" onClick="modifyUser()"/>
                           <br/>
                           <input type="button" value="Back" onClick="javascript:logonHome()" class="stilerosso"/>
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
                            <xsl:text>alert("The change has been carried out with success!!\n\n\n\n</xsl:text>
                            <xsl:text>Insert in the left coloumn of the homepage these fields:\n\n</xsl:text>

                             <xsl:text>New User: </xsl:text>
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
                                    alert("The password is wrong. Please insert it again");
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