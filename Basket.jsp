<%@ page info="Carrello" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>


<%
// Setto lo status iniziale a "CARRELLO CARMICA"
   String status;
   status="Carrello Carmica";
   util.Debug.println("status: "+status);
%>


<%int i;
  Cookie cookie=null;
  Cookie[] cookies=request.getCookies();

// Booleano che mi dice se trovo un determinato prodotto.
 boolean found=false;

// Booleani per sapere quale comando mi e' arrivato dalle altre pagine.
 boolean view=request.getParameter("cmd")!=null && request.getParameter("cmd").equals("view");
 boolean tokill=request.getParameter("cmd")!=null && request.getParameter("cmd").equals("del");
 boolean toadd=request.getParameter("cmd")!=null && request.getParameter("cmd").equals("add");
 boolean tosub=request.getParameter("cmd")!=null && request.getParameter("cmd").equals("sub");

// Ciclo i cookie della spesa dell'utente
// lasciando stare quelli relativi all'utente
  for (i=3;i<cookies.length & !found;i++) 
     {
    // Trovo i cookie che mi interessano->quelli relativi al prodotto
       found=cookies[i].getName().equals(request.getParameter("nomeprodotto"));
       if (found)
         { 
         
         // Incremento la quantita':
            if (toadd) cookies[i].setValue((Integer.parseInt(cookies[i].getValue())+1)+"");
     
         // Decremento la quantita (CON CONTROLLO DEL LIMITE DI NEGATIVI o DI ZERI)    
            if ((Integer.parseInt(cookies[i].getValue())>1)&& tosub)
               cookies[i].setValue((Integer.parseInt(cookies[i].getValue())-1)+"");
         // Rimuovo il bene:
            if (tokill)
                //Evito che possa toccare i coookie del Login        
                   if(i>=3)
                       cookies[i].setMaxAge(0);
                       
         response.addCookie(cookies[i]);
         }
      }
 

// Se arrivo da una pagina dove ho scelto un bene provvedo ad aggiungerlo:
if (!found && !view)
 {
   cookie=new Cookie(request.getParameter("nomeprodotto"),"1");
   response.addCookie(cookie);
  }
%>


<c:set var="xmlDocument" scope="page">


<carrello>
 <basket>
  <%-- =====[[ ORDINI VECCHI  ]]===== --%>
  <% for (i=3;i<cookies.length;i++)
        if(cookies[i].getMaxAge()!=0) {%>
          <prodotto nome="<%=Session.getInfo(cookies,i,0)%>"
                    prezzo="<%=Session.getInfo(cookies,i,1)%>"
                    descrizione="<%=Session.getInfo(cookies,i,2)%>"
                    tipo="<%=Session.getInfo(cookies,i,3)%>"
                    quantita="<%=cookies[i].getValue()%>"
                    prezzoparziale="<%= ((Float.parseFloat(Session.getInfo(cookies,i,1))*(Integer.parseInt(cookies[i].getValue())))) %>">
          </prodotto> 
<%}  

  if (!found && !view) {%>

  <%-- =====[[ ORDINE NUOVO   ]]===== --%>
          <prodotto nome="<%=Session.getPrimaInfo(cookie,0)%>" 
                    prezzo="<%=Session.getPrimaInfo(cookie,1)%>"
                    descrizione="<%=Session.getPrimaInfo(cookie,2)%>"
                    tipo="<%=Session.getPrimaInfo(cookie,3)%>"
                    quantita="<%=cookie.getValue()%>"
                    prezzoparziale="<%=Session.getPrimaInfo(cookie,1)%>">
          </prodotto>
<%  }%>
</basket>



<totale>
<%  // Totale da pagare:
    float conto=0;
     // Conta Vecchi ordini
       for (i=3;i<cookies.length;i++) if(cookies[i].getMaxAge()!=0) 
          {conto=conto+(Float.parseFloat(Session.getInfo(cookies,i,1))*(Float.parseFloat(cookies[i].getValue()))); }
     // Conta Nuovo ordine
        if (!found && !view)
          {conto=conto+(Float.parseFloat(Session.getPrimaInfo(cookie,1)));}%>
<prezzototale valore="<%=conto%>"></prezzototale>
</totale>

</carrello>



</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/Basket.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>