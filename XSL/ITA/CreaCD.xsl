<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head>
        <title>Crea il tuo CD personalizzato</title>
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
            alert("Il tuo CD attuale costa: "+prezzo+" euro");}   
                       
       
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
           {if (count<=6)
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
            { alert("Inserisci un nome per la compilation creata da te!");
              return;
              }      
            
          if (isNomeValido(f.nome_CD.value)) 
            { alert("Il segno ---> + <----- non e' valido all'interno del nome ");
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
   <a href="home.jsp"><img src="images/ITA/home3.gif" /> </a>
   <br/>
   <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
   <br/><br/><br/>
   <img src="images/ITA/chit1.gif"/>   
   <br/>
   <a href="Catalogo.jsp"><span class="stile">Scopri il nostro catalogo</span></a> 
   <br/><br/><br/>
   <img src="images/ITA/dvd_player.gif" />
   <br/>
   <a href="CreaDVD.jsp"><span class="stile">Crea il tuo DVD!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/java.GIF" />
   <br/>
   <a href="CreaMaglietta.jsp"><span class="stile">Crea la tua maglietta!</span></a>  
   <br/><br/><br/>
   <img src="images/ITA/carrello.jpg" /> 
   <br/>    
   <a href="javascript:view()"><span class="stile">Vai al carrello</span></a>      
 </div>   
       
<div class="T6"> 
  <span class="fire" align="center">CREA IL TUO CD!</span> 
      <form name="insertForm" action="Basket.jsp" method="post">
             <span class="stile" >
             
                 Nome
                 <br/>
                 <input type="text" name="nome_CD" size="20" maxlength="30"/>
                 <br/><br/><hr/><br/>
            
                 Tipo
                 <br/><br/>
                 <input type="radio" name="tipo_CD" value="CDspecial" checked="checked" /> CD con copertina e serigrafia a colori
                 <br/>
                 <input type="radio" name="tipo_CD" value="CDbase"/> CD base
                 <br/><br/><hr/><br/>
                
                 Canzoni
                 <br/><br/>
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
             
                <input type="button" name="Calcolaprezzo" value="CALCOLA SUBITO IL PREZZO"  class="stile" onclick="calcolaprezzo()"/>
                <br/><br/><br/><br/>
             
                <input type="button" value="invia" class="stile"  onClick="insertCD()"/>
               
             </span>
         </form>
     </div>
     
<div class="T2">    
       
       <span class="stilerosso" > 
       <br/><br/>
       Scegli un nome per il tuo CD.
       <br/><br/><br/><br/><br/><br/>
       Poi scegli se lo vuoi con la copertina e serigrafia (3 euro) oppure senza 
       <br/><br/><br/><br/><br/><br/>
       Ora aggiungi le canzoni che vuoi dalla tabella 
       <br/><br/>
       Scegli con cura perche' ne puoi mettere al massimo 8
       <br/><br/>
       Ogni canzone costa 1 euro.
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


