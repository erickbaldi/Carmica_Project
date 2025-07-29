<%@ page info="Invia Ordine" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%-- =====[[ Uso il bean per le ordinazioni  ]]===== --%>
<jsp:useBean id="ordinaBean" scope="page" class="bflows.OrdinaBean" />
<jsp:setProperty name="ordinaBean" property="*" />

<% 
  // Setto lo status a "Invio Ordine" in caso sia nullo 
  String status=request.getParameter("status");
  if (status==null) status="Invio Ordine";
  util.Debug.println("status: "+status);
%>

<%
  int i;
  Cookie cookie=null;
  Cookie[] cookies=request.getCookies();
  // Per trovare il cookie che mi interessa
  boolean found=false;

// Ciclo i cookie della spesa dell'utente
  for (i=3;i<cookies.length & !found;i++) 
     // Trovo i cookie che mi interessano
     {found=cookies[i].getName().equals(request.getParameter("nomeprodotto"));}
 %>

<c:set var="xmlDocument" scope="page">


<carrello>
   <basket>
<% 
//---------------STATUS: "INVIO ORDINE" ---------------------------
   if (status.equals("Invio Ordine")){
        for (i=3;i<cookies.length;i++) if(cookies[i].getMaxAge()!=0) {%>
<%          /* Nome */           String nome = Session.getInfo(cookies,i,0);%>
<%          /* Prezzo */         String prezzo= Session.getInfo(cookies,i,1);%>
<%          /* Descrizione */    String descrizione = Session.getInfo(cookies,i,2);%>
<%          /* Tipo */           String tipo = Session.getInfo(cookies,i,3);%>">
<%          /* Quantita' */      String quantita= cookies[i].getValue();%>
<%          /*Nome Utente*/      String userCode=Session.getUserCode(cookies);
 

// SCRIVO SUL DB LE ORDINAZIONI ACQUISITE DAI COOKIES:
     ordinaBean.ordinaBeanInsert(userCode,nome,descrizione,prezzo,tipo,quantita);
 }%>

<!-- DOPO AVER SCRITTO SUL DB CANCELLO DAL CARRELLO LE ORDINAZIONI.... -->
<% for (i=3;i<cookies.length;i++) if(cookies[i].getMaxAge()!=0) 
  {
    cookies[i].setMaxAge(0);
    response.addCookie(cookies[i]); 
  } 
  status = "ordinazioni registrate";
}
//------------------------------------------------------------------------
%>


<%
//---------------STATUS: "ORDINAZIONI REGISTRATE" --------------------------- 
if (status.equals("ordinazioni registrate"))
{
// Numero CD in lista
   int conta=0;

util.Debug.println("CONTIAMO: 1");
// Visualizza le compilation ancora da fare:    
   ordinaBean.ordinaBeanView("O");

// Ciclo tutti gli ordini
for (i=0;i<ordinaBean.getOrdini().length;i++) { %>
<ORDINI> 
<% // Nella lista escludo le magliette
   if  (!(ordinaBean.getOrdini(i)).descrizione.equals("-")) 
       { 
        // Setto di default che il cd visualizzato non appartenga all'utente.
        boolean utente= false;
        if  (((ordinaBean.getOrdini(i)).userCode).equals(Session.getUserCode(cookies)))
            // Il cd appartiene all'utente e quindi lo evidenzio
               utente= true;
%>


<%-- =====[[ PRODOTTI IN LISTA DI ATTESA  ]]===== --%>
<ORDINE CODE="<%=(ordinaBean.getOrdini(i)).contatore%>">
      <NUMERO><%=(i+1)%></NUMERO>     
      <NOMEUTENTE><%=(ordinaBean.getOrdini(i)).userCode%></NOMEUTENTE>
      <NOME><%=(ordinaBean.getOrdini(i)).nomeCD %></NOME>
      <QUANTITA><%=(ordinaBean.getOrdini(i)).quantita %></QUANTITA>
      <TIMESTAMP><%= ordinaBean.getOrdini(i).timestamp %></TIMESTAMP>
      <UTENTE><%=utente? "S":"N"%></UTENTE>        
<% // Sommo il numero dei prodotti a quelli totali in attesa:
      conta=conta+(Integer.parseInt((ordinaBean.getOrdini(i)).quantita));%>
 </ORDINE>
<%-- =====[[ /PRODOTTI IN LISTA DI ATTESA  ]]===== --%>
<%}%>
</ORDINI>
<%}
%>

<%-- Quanto tempo c'e' da aspettare per gli ultimi prodotti? --%>
<TEMPO><%=((conta*4)/60)%></TEMPO>
<%}%>


</basket>

</carrello>


</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/InviaOrdine.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>