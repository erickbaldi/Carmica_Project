<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Crea la tua maglietta personalizzata</title>
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
            alert("La tua maglietta attuale costa: "+prezzo+" euro");}   
                       
       
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
            { alert("Inserisci un nome per la maglietta creata da te!");
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
   <a href="Catalogo.jsp"><span class="stile">Scopri il nostro catalogo</span></a> 
   <br/><br/><br/>
   <img src="images/ITA/cd5.GIF" />
   <br/>
   <a href="CreaCD.jsp"><span class="stile">Crea il tuo CD!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/dvd_player.gif" />
   <br/>
   <a href="CreaDVD.jsp"><span class="stile">Crea il tuo DVD!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/carrello.jpg" /> 
   <br/>    
   <a href="javascript:view()"><span class="stile">Vai al carrello</span></a>      
 </div>   
       
<div class="T6"> 
  <span class="fire" align="center">CREA LA TUA MAGLIETTA!</span> 
      <form name="insertForm" action="Basket.jsp" method="post">
             <span class="stile" >
             
                 Nome
                 <br/>
                 <input type="text" name="nome_Maglietta" size="20" maxlength="30"/>
                 <br/><br/><hr/><br/>
                
                 Tipo
                 <br/><br/>
                 <input type="radio" name="tipo_Maglietta" value="MagliettaC" checked="checked" /> Maglietta a maniche corte
                 <br/>
                 <input type="radio" name="tipo_Maglietta" value="MagliettaL"/> Maglietta a maniche lunghe
                 <br/><br/><hr/><br/>
                 
                 Fronte
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
                 
                 Retro
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
             
                <input type="button" name="Calcolaprezzo" value="CALCOLA SUBITO IL PREZZO"  class="stile" onclick="calcolaprezzo()"/>
                <br/><br/><br/><br/>
             
                <input type="button" value="invia" class="stile"  onClick="insertMaglietta()"/>
               
             </span>
         </form>
     </div>
     
<div class="T2">    
       
       <span class="stilerosso" > 
       <br/><br/>
       Scegli un nome per la tua maglietta.
       <br/><br/><br/><br/><br/><br/>
       Poi scegli se la vuoi con le maniche lunghe o corte 
       <br/><br/><br/><br/><br/><br/>
       Ora aggiungi i disegni che vuoi dalla tabella 
       <br/><br/>
       Scegli con cura perche' ne puoi mettere al massimo 3
       <br/><br/>
       Ogni disegno costa 1 euro.
       <br/> <br/> <br/> <br/>
       <img src="images/ITA/tastierachitarra.gif" />
       <br/><br/><br/><br/><br/><br/><br/><br/>
       FATTO....semplice no? 
       </span>
</div>   
          
</body>
</html>
</xsl:template>
</xsl:stylesheet>


