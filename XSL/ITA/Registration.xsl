<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Registrazione Nuovo Utente</title>
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>     				
        								
	<script language="javascript">
          <![CDATA[										

          function isEmpty(value) {

                 if (value == null || value.length == 0)
                    return true;
                 for (var count = 0; count < value.length; count++) {
                      if (value.charAt(count) != " ") return false;}
                 
                 if (value==undefined) return true;
		 if (value==null) return true;
		 if (value=="") return true;
                       return true; }                  
          
     
	function isValidDate(day,month,year){
		if (year.value<2010 && year.value>1900) {
		switch(month.value){
		case "2": if (day.value>29) {alert("Mese o Giorno errato");return false; }
		case "11":
		case "6":
		case "9":
		case "4": if (day.value==31) {alert("Mese o Giorno errato");return false;}
		default: return true;
		}
		}
		else {insertForm.anno.value="";return false;}
		}
                 
       function isInteger(num){
            resto=num%1;
                if (resto==0) return true;
                else {num="";
                      return false;}}     
                 
       
         
          function insertUtente() {

            f=document.insertForm;
          
            //Nome
            if (isEmpty(f.firstname.value)) {
              alert("Inserire il nome.");
              return;
            }      
             
            //Cognome
            if (isEmpty(f.surname.value)) {
              alert("Inserire il cognome.");
              return;
             }   
            
             // Indirizzo 
             if (isEmpty(f.via.value) ) {
             alert("Inserire un Indirizzo!!!!");
                    return;}
            
            
             
            // Telefono
             if ((isEmpty(f.telefono.value))|(!isInteger(f.telefono.value))) {
                alert("Telefono non corretto");
                return;}
		
              
             //Username
            if (isEmpty(f.userCode.value)) {
              alert("Inserire l'username.");
              return;
            }      
            //Password
            if (isEmpty(f.password.value)) {
              alert("Inserire una password.");
              return;
            }      
            //Password2
            if (isEmpty(f.password2.value)) {
              alert("Riconfermare la password.");
              return;
            }
            
            //Riconferma Password
            if (f.password.value!=f.password2.value){
               alert("Le due password non coincidono: assicurarsi di riscrivere la stessa password 2 volte");
               return;
               }
                  
            //Data
            if ((isEmpty(f.giorno.value))|(isEmpty(f.mese.value))|(isEmpty(f.anno.value))| (!(isValidDate(f.giorno,f.mese,f.anno)))) {
              alert("Data non valida!");
              return;
              }
	    f.datanascita.value=f.giorno.value+"/"+f.mese.value+"/"+f.anno.value;
              
            f.submit();
            return;
     
          }
          
          
           function lingua() 
                {
                 document.lingua.submit();
                }
          ]]>
        </script>
        
      </head>
<body bgcolor="#000000" text="#FFFFFF">
                
<form name="lingua" action="Registration.jsp" method="post">
     <input type="hidden" name="lingua" value="ENG"/>
</form>       
                 
   <div class="T2">
        <a href="home.jsp"><img src="images/ITA/2HOME.GIF" /></a>
        <br/><br/><br/><br/>
        <span class="stile" >
        Inserisci in questa pagina i tuoi dati per registrarti.<br/>
        Una volta registrato potrai accedere al nostro catalogo online<br/>
        e acquistare i nostri CD e DVD o acquistare le nostre magliette!<br/>
        Verranno spediti al tuo indirizzo!
        <br/><br/><br/><br/>
        <img src="images/ITA/register2.GIF" />   
        <br/><br/><br/>
        Inoltre potrai anche crearti le tue compilation personali<br/>
        (in CD e DVD) scegliendo tra le canzoni e i video disponibili!<br/>
        COSA ASPETTI?! REGISTRATI SUBITO!! 
        </span>
    </div>    
 
   <div class="T6">
      <span class="fire" align="center">Registrazione nuovo utente </span> <br/><br/><br/>
          
          <form name="insertForm" action="Registration.jsp" method="post">        
    
              <span class="stile" >
              Nome  
              <br/>
              <input type="text" name="firstname" class="stile" value="{PAGINA/USER/FIRSTNAME}" size="20" maxlength="30"/>
              <br/><br/>
            
              Cognome
              <br/>
              <input type="text" name="surname" class="stile" value="{PAGINA/USER/SURNAME}" size="20" maxlength="30"/>
              <br/><br/>
            
              Indirizzo completo (via, citta, CAP) 
              <br/>
              <input type="text" class="stile" name="via" value="{PAGINA/USER/VIA}" size="50"/>
              <br/><br/>
              
              Telefono 
              <br/>
              <input type="text" name="telefono" class="stile" value="{PAGINA/USER/TELEFONO}" onChange="isInteger(telefono)" size="20"/>
              
              <br/><br/>
              Data di nascita:
              <br/>
              Giorno<select name="giorno" class="stile">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 <option value="5">5</option>
                 <option value="6">6</option>
                 <option value="7">7</option>
                 <option value="8">8</option>
                 <option value="9">9</option>
                 <option value="10">10</option>
                 <option value="11">11</option>
                 <option value="12">12</option>
                 <option value="13">13</option>
                 <option value="14">14</option>
                 <option value="15">15</option>
                 <option value="16">16</option>
                 <option value="17">17</option>
                 <option value="18">18</option>
                 <option value="19">19</option>
                 <option value="20">20</option>
                 <option value="21">21</option>
                 <option value="22">22</option>
                 <option value="23">23</option>
                 <option value="24">24</option>
                 <option value="25">25</option>
                 <option value="26">26</option>
                 <option value="27">27</option>
                 <option value="28">28</option>
                 <option value="29">29</option>
                 <option value="30">30</option>
                 <option value="31">31</option>
                 </select>
                
              
              Mese <select name="mese" class="stile">
                <option value="1">Gennaio</option>
                <option value="2">Febbraio</option>
                <option value="3">Marzo</option>
                <option value="4">Aprile</option>
                <option value="5">Maggio</option>
                <option value="6">Giugno</option>
                <option value="7">Luglio</option>
                <option value="8">Agosto</option>
                <option value="9">Settembre</option>
                <option value="10">Ottobre</option>
                <option value="11">Novembre</option>
                <option value="12">Dicembre</option>
                </select>
    
               
             Anno<input type="text" name="anno" size="4" maxlength="4" class="stile" onChange="isValidDate(giorno,mese,anno)"/>
             <br/><br/><br/>
              
              Lingua:
              <br/>
              <img src="images/ITA/eng.jpg" height="35" weight="20"/>
              <input type="radio" name="language" value="ENG">
                <xsl:if test="PAGINA/USER/LINGUA='ENG'">
                       <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>

                </input>
                <input type="radio" name="language" value="ITA" checked="checked">
                    <xsl:if test="PAGINA/USER/LINGUA='ITA'">
                           <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                <img src="images/ITA/ita.gif" height="35" weight="20"/>
                </input>
              <br/><br/>
              
               Username:
               <br/>
               <input type="text" name="userCode" class="stile" size="20" value="{PAGINA/USER/USERNAME}" maxlength="20"/>
               <br/><br/>
               
               Password (massimo 5 caratteri):
               <br/>
               <input type="password" name="password" class="stile" size="10" maxlength="5"/>
               <br/><br/>
               
               (conferma Password)
               <br/>
               <input type="password" name="password2" class="stile" size="10" maxlength="5"/>
               <br/><br/>
               
             
               <input type="hidden" name="datanascita" value="" />
               <br/>
               <input type="hidden" name="status" value="nuovo utente"/>
               <input type="button" value="Registrati!" class="stilerosso" onClick="insertUtente()"/>
               <br/>
               <input type="button" value="Indietro" onClick="indietro.submit()" class="stilerosso"/>
           </span>
           <xsl:for-each select="PAGINA/NODO/FormInserimento/*">
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
                    
                    <xsl:if test="/PAGINA/NODO/INSERIMENTO[@FATTO='S']">
                        <script>
                            <xsl:text>alert("Registrazione Effettuata Correttamente!!\n\n\n\n</xsl:text>
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
                            <xsl:when test="PAGINA/VARIABILE/ALERTMESSAGE[@MESSAGGIO='DUPLICATED_CONTACT']">
                                <xsl:text>
                                    alert("L'username inserito esiste gia&apos;. Prego inserire un altro username.");
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
 
   <div class="T2"> 
           <br/><br/>
           <span class="stile">
           Aren't you italian?<br/>Click on the image below<br/>
           and register in english language!<br/>
           </span>
           <a href="javascript:lingua()">
           <img src="images/ITA/inghilterraflag.gif" height="50" weight="50" />
           </a>
           <br/>
           <span class="stilepiccolo">
           English Version
           </span>
   </div>   
          
  
      
</body>
</html>

</xsl:template>
</xsl:stylesheet>


