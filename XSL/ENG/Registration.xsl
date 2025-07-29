<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Register New User</title>
        <meta name="author" content="Erick Baldi and Riccardo Fiocchi"/>
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
		case "2": if (day.value>29) {alert("The month or the day is wrong");return false; }
		case "11":
		case "6":
		case "9":
		case "4": if (day.value==31) {alert("The month or the day is wrong");return false;}
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
              alert("Insert your name");
              return;
            }      
             
            //Cognome
            if (isEmpty(f.surname.value)) {
              alert("Insert your surname");
              return;
             }   
            
             // Indirizzo 
             if (isEmpty(f.via.value) ) {
             alert("Insert your address!!!!");
                    return;}
            
            
             
            // Telefono
             if ((isEmpty(f.telefono.value))|(!isInteger(f.telefono.value))) {
                alert("Wrong telephone number");
                return;}
		
              
             //Username
            if (isEmpty(f.userCode.value)) {
              alert("Insert your username");
              return;
            }      
            //Password
            if (isEmpty(f.password.value)) {
              alert("Insert your password.");
              return;
            }      
            //Password2
            if (isEmpty(f.password2.value)) {
              alert("Confirm your password.");
              return;
            }
            
            //Riconferma Password
            if (f.password.value!=f.password2.value){
               alert("The two passwords are not equal: you must rewrite the same password");
               return;
               }
                  
            //Data
            if ((isEmpty(f.giorno.value))|(isEmpty(f.mese.value))|(isEmpty(f.anno.value))| (!(isValidDate(f.giorno,f.mese,f.anno)))) {
              alert("Not valid date!");
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
     <input type="hidden" name="lingua" value="ITA"/>
</form>       
                 
   <div class="T2">
        <a href="home.jsp"><img src="images/ENG/2HOME.GIF" /></a>
        <br/><br/><br/><br/>
        <span class="stile" >
        Insert your data in this page to sign-in.
        Once registered you will enter the site 
        to discover our basket and buy online our CDs, DVDs and t-shirts!<br/>
        We will send them at your address!
        <br/><br/><br/><br/>
        <img src="images/ENG/register2.GIF"  />  
        <br/><br/><br/>
        Then you can also create your personal compilations<br/>
        (CD or DVD format) choosing among the songs and videos avaiable!<br/>
        SO...WHAT ARE YOU WAITING?! REGISTER NOW!!  
        </span>
    </div>    
 
   <div class="T6">
      <span class="fire" align="center"> User registration </span> <br/><br/><br/>
          
          <form name="insertForm" action="Registration.jsp" method="post">        
    
              <span class="stile" >
              Name  
              <br/>
              <input type="text" name="firstname" class="stile" value="{PAGINA/USER/NOME}" size="20" maxlength="30"/>
              <br/><br/>
            
              Surname
              <br/>
              <input type="text" name="surname" class="stile" value="{PAGINA/USER/COGNOME}" size="20" maxlength="30"/>
              <br/><br/>
            
              Complete address (road, city, C/O) 
              <br/>
              <input type="text" class="stile" name="via" value="{PAGINA/USER/VIA}" size="50"/>
              <br/><br/>
              
              Telephone number 
              <br/>
              <input type="text" name="telefono" class="stile" value="{PAGINA/USER/TELEFONO}" onChange="isInteger(telefono)" size="20"/>
              
              <br/><br/>
              Birthdate
              <br/>
              Day<select name="giorno" class="stile">
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
                
              
              Month <select name="mese" class="stile">
                <option value="1">January</option>
                <option value="2">February</option>
                <option value="3">March</option>
                <option value="4">April</option>
                <option value="5">May</option>
                <option value="6">June</option>
                <option value="7">July</option>
                <option value="8">August</option>
                <option value="9">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
                </select>
    
               
             Year<input type="text" name="anno" size="4" maxlength="4" class="stile" onChange="isValidDate(giorno,mese,anno)"/>
             <br/><br/><br/>
              
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
               <input type="text" name="userCode" class="stile" size="20" value="{PAGINA/USER/USERNAME}" maxlength="20"/>
               <br/><br/>
               
               Password (maximum of 5 chars):
               <br/>
               <input type="password" name="password" class="stile" size="10" maxlength="5"/>
               <br/><br/>
               
               (confirm Password)
               <br/>
               <input type="password" name="password2" class="stile" size="10" maxlength="5"/>
               <br/><br/>
               
             
               <input type="hidden" name="datanascita" value="" />
               <br/>
               <input type="hidden" name="status" value="nuovo utente"/>
               <input type="button" value="Register now!" class="stilerosso" onClick="insertUtente()"/>
               <br/>
               <input type="button" value="Back" onClick="indietro.submit()" class="stilerosso"/>
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
                            <xsl:text>alert("Registration successful!!\n\n\n\n</xsl:text>
                            <xsl:text>Insert in the home page the following fields:\n\n</xsl:text>

                             <xsl:text>Username: </xsl:text>
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
                                    alert("The inserted user already exists. Please insert another User.");
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
        Sei italiano?!<br/>
        Clicca nell'immagine sotto e registrati in italiano!<br/>
        </span>
           <a href="javascript:lingua()">
           <img src="images/ENG/italiaflag.gif" height="50" weight="50" />
           </a>
           <br/>
           <span class="stilepiccolo">
           Italian Version
           </span>
   </div>   
          
  
      
</body>
</html>

</xsl:template>
</xsl:stylesheet>


