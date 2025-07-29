<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Create your personal CD </title>
        <meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="stile.css" rel="stylesheet" type="text/css"/>     				
        								
	<script language="javascript">
          <![CDATA[										

  
          
           function isEmpty(value) 
           {
           if (value == null || value.length == 0) return true;
            for (count = 0; count < value.length; count++) 
                 {
                    if (value.charAt(count) != " ") return false;
                  }
                return true;
           }     
       
          
        function isNomeValido(nome) {
             trovato=0;
               for (count = 0; count < nome.length; count++)
                  if (nome.charAt(count) == "+") trovato=trovato+1; 
               if (trovato>0) return true;
               else return false;
               }
       
        function calcolaprezzo(){
            prezzo=0;
            radiobutton();
            checkbutton();
            alert("Your actual CD cost: "+prezzo+" euro");}   
                       
       
       function radiobutton(){ 
               for (contatore = 0; contatore < insertForm.tipo_CD.length; contatore++)
                     { 
                     if (insertForm.tipo_CD[contatore].checked)
                             { 
                              radio  = insertForm.tipo_CD[contatore].value; 
                              if (radio=="CDspecial") prezzo=prezzo+3;
                              else prezzo=prezzo;
                              } 
                      }
               } 

     
       function numeroCheck()
       {
      
       count=0;
       for (contatore = 0; contatore < insertForm.descrizione_CD.length; contatore++)
           {if (count<=7)
              {if (insertForm.descrizione_CD[contatore].checked)
                 count=count+1;
              }
              else
              {
              insertForm.descrizione_CD[contatore].checked = false;
              }
            }  
       }                  

                      
     function checkbutton(){
       check=""; 
               for (contatore = 0; contatore < insertForm.descrizione_CD.length; contatore++)
                  {if (insertForm.descrizione_CD[contatore].checked)
                 
                 
                     if (insertForm.descrizione_CD[contatore].checked)
                     {prezzo= prezzo+1;
                      check  = check+" / "+insertForm.descrizione_CD[contatore].value;
                      } 
                 }
             }
           
           
           
  function insertCD() 
          {
          f=document.insertForm;
          prezzo=0;
          radiobutton();
          checkbutton();
          
          if (isEmpty(f.nome_CD.value)) 
            { alert("Insert a name for your CD!");
              return;
              }      
            
          if (isNomeValido(f.nome_CD.value)) 
            { alert("The symbol ---> + <----- is not valid in the name ");
              return;
            }   
          
          nome=""   +f.nome_CD.value+  "+"   +prezzo+   "+"    +radio+   " "   +check+   "+x";
          formx.nomeprodotto.value=nome;
          formx.submit();
          }
     
           function view() 
                {
                 document.updateform.cmd.value="view";
                 document.updateform.submit();
                }
                
          ]]>
        </script>
        
</head>
<body bgcolor="#FFFFFF" text="#000000">
 
<form name="formx" action="Basket.jsp" method="POST">
      <input type="hidden" name="nomeprodotto" value="0" /> 
</form>  

<form name="updateform"  method="POST" action="Basket.jsp">
      <input type="hidden" name="cmd"    />
</form>
         

 <div class="T2">
   <a href="home.jsp"><img src="images/ENG/home3.gif"/></a> 
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ENG/chit3.gif" />
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Discover our catalogue</span></a> 
   <br/><br/><br/>
   <img src="images/ENG/dvd_player.gif" />
   <br/>
   <a href="CreaDVD.jsp"><span class="stile">Create your DVD!</span></a>  
   <br/><br/><br/>
   <img src="images/ENG/java.GIF" />
   <br/>
   <a href="CreaMaglietta.jsp"><span class="stile">Create your t-shirt!</span></a>  
   <br/><br/><br/>
   <img src="images/ENG/carrello.jpg"  width="120" height="110" /> 
   <br/>    
   <a href="javascript:view()"><span class="stile">Go to the Basket</span></a>      
 </div>   
       
<div class="T6"> 
  <span class="fire" align="center">CREATE YOUR CD!</span> 
      <form name="insertForm" action="Basket.jsp" method="post">
             <span class="stile" >
             
                 Name
                 <br/>
                 <input type="text" name="nome_CD" size="20" maxlength="30"/>
                 <br/><br/><hr/><br/>
            
                 Type
                 <br/><br/>
                 <input type="radio" name="tipo_CD" value="CDspecial" checked="checked" /> CD with cover and serigraphy in colors
                 <br/>
                 <input type="radio" name="tipo_CD" value="CDbase"/> Simple CD
                 <br/><br/><hr/><br/>
                
                 Songs
                 <br/>
                 <table border="1">
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="bobnocry"/>Senza suono</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="whofriend"/>Okinawa</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="rolldevil"/>Okinawa - Radio edit</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="protpale"/>La vergine dell'erba</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="rollsati"/>Lucy's dream</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="danwork"/>Vestita di rosso</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="rollsati"/>Quello che non c'è (Afterhours cover)</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="danwork"/>Foxy lady (Jimi Hendrix cover)</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="deephush"/>Hey Joe (Jimi Hendrix cover)</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_CD" value="ledlotta"/>Male di miele (Afterhours cover)</td>
                 </tr>
                 </table>                
                 <br/><br/>
             
                <input type="button" name="Calcolaprezzo" value="CALCULATE PRICE NOW"  class="stile" onclick="calcolaprezzo()"/>
                <br/><br/><br/><br/>
             
                <input type="button" value="submit" class="stile"  onClick="insertCD()"/>
               
             </span>
         </form>
     </div>
     
<div class="T2">   

       <span class="stilerosso" > 
       <br/><br/><br/>
       Choose a name for your CD.
       <br/><br/><br/><br/><br/>
       Then choose the type of your CD: with cover (3 euro) or without
       <br/><br/><br/><br/><br/><br/><br/><br/>
       Now add songs from the table.
       <br/><br/>
       Remember: you can add a maximum of 8 songs.
       <br/><br/>
       Every song costs 1 euro.
       <br/> <br/> <br/> <br/>
       <img src="images/ITA/tastierachitarra.gif" />
       <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
       DONE...simple or not? 
       </span>
</div>   
          
</body>
</html>
</xsl:template>
</xsl:stylesheet>


