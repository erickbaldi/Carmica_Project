<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Create your personal t-shirt</title>
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
            alert("Your personal t-shirt costs: "+prezzo+" euro");}   
                       
       
       function radiobutton(){ 
               for (contatore = 0; contatore < insertForm.tipo_Maglietta.length; contatore++)
                     { 
                     if (insertForm.tipo_Maglietta[contatore].checked)
                             { 
                              radio  = insertForm.tipo_Maglietta[contatore].value; 
                              if (radio=="MagliettaL") prezzo=prezzo+3;
                              else prezzo=prezzo;
                              } 
                      }
               } 

     
       function numeroCheck()
       {
      
       count=0;
       for (contatore = 0; contatore < insertForm.descrizione_Maglietta.length; contatore++)
           {if (count<=1)
              {if (insertForm.descrizione_Maglietta[contatore].checked)
                 count=count+1;
              }
              else
              {
              insertForm.descrizione_Maglietta[contatore].checked = false;
              }
            }  
       }                  

                      
     function checkbutton(){
       check=""; 
               for (contatore = 0; contatore < insertForm.descrizione_Maglietta.length; contatore++)
                  {if (insertForm.descrizione_Maglietta[contatore].checked)
                 
                 
                     if (insertForm.descrizione_Maglietta[contatore].checked)
                     {prezzo= prezzo+1;
                      check  = check+" / "+insertForm.descrizione_Maglietta[contatore].value;
                      } 
                 }
             }
           
           
           
  function insertMaglietta() 
          {
          f=document.insertForm;
          prezzo=0;
          radiobutton();
          checkbutton();
          
          if (isEmpty(f.nome_Maglietta.value)) 
            { alert("Insert a name for your personal t-shirt!");
              return;
              }      
            
          if (isNomeValido(f.nome_Maglietta.value)) 
            { alert("Il segno ---> + <----- non e' valido all'interno del nome ");
              return;
            }   
          
          nome=""   +f.nome_Maglietta.value+  "+"   +prezzo+   "+"    +radio+   " "   +check+   "+x";
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
   <a href="home.jsp"><img src="images/ITA/home3.gif" /> </a>
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ITA/chit1.gif"/>   
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Discover our catalogue</span></a> 
   <br/><br/><br/>
   <img src="images/ITA/cd5.GIF" />
   <br/>
   <a href="CreaCD.jsp"><span class="stile">Create your CD!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/dvd_player.gif" />
   <br/>
   <a href="CreaDVD.jsp"><span class="stile">Create your DVD!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/carrello.jpg" /> 
   <br/>    
   <a href="javascript:view()"><span class="stile">Go to the basket</span></a>      
 </div>   
       
<div class="T6"> 
  <span class="fire" align="center">CREATE YOUR PERSONAL T-SHIRT!</span> 
      <form name="insertForm" action="Basket.jsp" method="post">
             <span class="stile" >
             
                 Name
                 <br/>
                 <input type="text" name="nome_Maglietta" size="20" maxlength="30"/>
                 <br/><br/><hr/><br/>
                
                 Type
                 <br/><br/>
                 <input type="radio" name="tipo_Maglietta" value="MagliettaC" checked="checked" /> T-shirt with short sleeves
                 <br/>
                 <input type="radio" name="tipo_Maglietta" value="MagliettaL"/> T-shirt with long sleeves
                 <br/><br/><hr/><br/>
                 
                 Front
                 <br/><br/>
                 <table border="1">
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="bobnocry"/>Logo Carmica</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="whofriend"/>Carmica - Foto Gruppo</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="rolldevil"/>Fiori meccanici album</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="protpale"/>Scritta Carmica + Fiori meccanici</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="rollsati"/>Lucy's dream</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="danwork"/>Okinawa</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="deephush"/>Senza suono</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="ledlotta"/>La vergine dell'erba</td>
                 </tr>
                 
                 </table>
                 <br/><br/>
                 
                 Back
                 <table border="1">
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="bobnocry"/>Logo Carmica</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="whofriend"/>Carmica - Foto Gruppo</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="rolldevil"/>Fiori meccanici album</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="protpale"/>Scritta Carmica + Fiori meccanici</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="rollsati"/>Lucy's dream</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="danwork"/>Okinawa</td>
                 </tr>
                 
                 <tr>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="deephush"/>Senza suono</td>
                 <td><input type="checkbox" onChange="numeroCheck()" name="descrizione_Maglietta" value="ledlotta"/>La vergine dell'erba</td>
                 </tr>
                 </table>                
                 <br/><br/>
             
                <input type="button" name="Calcolaprezzo" value="CALCULATE PRICE NOW"  class="stile" onclick="calcolaprezzo()"/>
                <br/><br/><br/><br/>
             
                <input type="button" value="submit" class="stile"  onClick="insertMaglietta()"/>
               
             </span>
         </form>
     </div>
     
<div class="T2">    
       
       <span class="stilerosso" > 
       <br/><br/>
       Select a name for your t-shirt.
       <br/><br/><br/><br/><br/><br/>
       Then choose if you want it with short or long sleeves 
       <br/><br/><br/><br/><br/><br/>
       Now add the drawings from the table 
       <br/><br/>
       You can choose a maximum of 3 drawings
       <br/><br/>
       Every draw costs 1 euro.
       <br/> <br/> <br/> <br/>
       <img src="images/ITA/tastierachitarra.gif" />
       <br/><br/><br/><br/><br/><br/><br/><br/>
       DONE!......simple or not? 
       </span>
</div>   
          
</body>
</html>
</xsl:template>
</xsl:stylesheet>
