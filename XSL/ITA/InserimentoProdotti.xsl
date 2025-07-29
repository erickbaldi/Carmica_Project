<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Inserimento Prodotti</title>
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
                                alert("Inserire il nome del prodotto!");
                                return;
                            }
                            
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
    </div>    
 
   <div class="T6">
      <span class="fire" align="center">Inserimento nuovo prodotto </span> <br/><br/><br/>
          
          <form name="inserimento" action="InserimentoProdotti.jsp" method="post">        
    
              <span class="stile" >
              Nome  
              <br/>
              <input type="text" name="nome" class="stile" size="20" maxlength="30"/>
              <br/><br/>
              Descrizione
              <br/>
              <input type="text" name="descrizione" class="stile" value="{pagina/prodotto/descrizione}" size="20" maxlength="100"/>
              <br/><br/>
              Prezzo 
              <br/>
              <input type="text" class="stile" name="prezzo" value="{pagina/prodotto/prezzo}" size="5"/>
              <br/><br/>  
              Tipo 
              <br/>
              <input type="text" class="stile" name="tipo" value="{pagina/prodotto/tipo}" size="1"/>
              <br/><br/>
             
               <input type="button" value="Inserisci prodotto!" class="stilerosso" onClick="inserisciProdotto()"/>
               <br/>
               <input type="button" value="Indietro" onClick="indietro.submit()" class="stilerosso"/>
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
                <xsl:text>alert("Inserimento prodotto effettuato correttamente!!\n\n\n</xsl:text>
                <xsl:text>Il prodotto avrà le seguenti caratteristiche:\n\n</xsl:text>

                 <xsl:text>Nome: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/nome"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Descrizione: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/descrizione"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Prezzo: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/prezzo"/>
                 <xsl:text>\n</xsl:text>
                 <xsl:text>Tipo: </xsl:text>
                 <xsl:value-of select="pagina/prodotto/tipo"/>
                 <xsl:text>");</xsl:text>
            </script>
       </xsl:if>

       <xsl:if test="pagina/VARIABILE/ALERTMESSAGE[@ABILITATO='S']">
         <script>
                <xsl:choose>
                <xsl:when test="pagina/VARIABILE/ALERTMESSAGE[@MESSAGGIO='PRODOTTO_DUPLICATO']">
                    <xsl:text>
                        alert("Il nome del prodotto inserito esiste gia&apos;. Prego inserire un altro nome.");
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
 
