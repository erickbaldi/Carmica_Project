<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Create your personal DVD</title>
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
            alert("Your actual DVD cost: "+prezzo+" euro");}   
                       
       
       function radiobutton(){ 
               for (contatore = 0; contatore < insertForm.tipo_DVD.length; contatore++)
                     { 
                     if (insertForm.tipo_DVD[contatore].checked)
                             { 
                              radio  = insertForm.tipo_DVD[contatore].value; 
                              if (radio=="DVDspecial") prezzo=prezzo+3;
                              else prezzo=prezzo;
                              } 
                      }
               } 

     
       function numeroCheck()
       {
      
       count=0;
       for (contatore = 0; contatore < insertForm.descrizione_DVD.length; contatore++)
           {if (count<=3)
              {if (insertForm.descrizione_DVD[contatore].checked)
                 count=count+1;
              }
              else
              {
              insertForm.descrizione_DVD[contatore].checked = false;
              }
            }  
       }                  

                      
     function checkbutton(){
       check=""; 
               for (contatore = 0; contatore < insertForm.descrizione_DVD.length; contatore++)
                  {if (insertForm.descrizione_DVD[contatore].checked)
                 
                 
                     if (insertForm.descrizione_DVD[contatore].checked)
                     {prezzo= prezzo+3;
                      check  = check+" / "+insertForm.descrizione_DVD[contatore].value;
                      } 
                 }
             }
           
           
           
  function insertDVD() 
          {
          f=document.insertForm;
          prezzo=0;
          radiobutton();
          checkbutton();
          
          if (isEmpty(f.nome_DVD.value)) 
            { alert("Insert a name for your DVD!");
              return;
              }      
            
          if (isNomeValido(f.nome_DVD.value)) 
            { alert("The symbol ---> + <----- is not valid in the name ");
              return;
            }   
          
          nome=""   +f.nome_DVD.value+  "+"   +prezzo+   "+"    +radio+   " "   +check+   "+x";
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
   <a href="home.jsp"><img src="images/ENG/home3.gif" /></a> 
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ENG/chit3.gif" />
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Discover our catalogue</span></a> 
   <br/><br/><br/>
   <img src="images/ENG/cd5.GIF" /> 
   <br/>
   <a href="CreaCD.jsp"><span class="stile">Create your CD!</span></a> 
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
  <span class="fire" align="center">CREATE YOUR DVD!</span> 
      <form name="insertForm" action="Basket.jsp" method="post">
             <span class="stile" >
             
                 Name
                 <br/>
                 <input type="text" name="nome_DVD" size="20" maxlength="30"/>
                 <br/><br/><hr/><br/>
            
                 Type
                 <br/><br/>
                 <input type="radio" name="tipo_DVD" value="DVDspecial" checked="checked" /> DVD with cover and serigraphy in colors
                 <br/>
                 <input type="radio" name="tipo_DVD" value="DVDbase"/> Simple DVD
                 <br/><br/><hr/><br/>
                
                 Videos
                 <br/>
                 <table border="1">
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="bobnocry"/>Senza suono</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="whofriend"/>Okinawa</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="rolldevil"/>Okinawa - Radio edit</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="protpale"/>La vergine dell'erba</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="rollsati"/>Lucy's dream</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="danwork"/>Vestita di rosso</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="rollsati"/>Quello che non c'è (Afterhours cover)</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="danwork"/>Foxy Lady (Jimi Hendrix cover)</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="deephush"/>Hey Joe (Jimi Hendrix cover)</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_DVD" value="ledlotta"/>Male di miele (Afterhours cover)</td>
                 </tr>                
                 </table>                
                 <br/><br/>
             
                <input type="button" name="Calcolaprezzo" value="CALCULATE PRICE NOW"  class="stile" onclick="calcolaprezzo()"/>
                <br/><br/><br/><br/>
             
                <input type="button" value="submit" class="stile"  onClick="insertDVD()"/>
               
             </span>
         </form>
     </div>
     
<div class="T2">  

       <span class="stilerosso" > 
       <br/><br/>
       Choose a name for your DVD.
       <br/><br/><br/><br/><br/>
       Then choose if you want it with cover (3 euro) or not
       <br/><br/><br/><br/><br/><br/><br/>
       Now add videos from the table.
       <br/><br/>
       Remember: you can add a maximum of 4 videos.
       <br/><br/><br/><br/>
       Every video costs 3 euro.
       <br/> <br/> <br/> <br/>
       <img src="images/ENG/tastierachitarra.gif" />
       <br/><br/><br/><br/><br/><br/>
       DONE...simple or not? 
       </span>
</div>   
          
</body>
</html>
</xsl:template>
</xsl:stylesheet>


