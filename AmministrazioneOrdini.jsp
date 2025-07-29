<%@ page info="AmministrazioneOrdini" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%-- =====[[ Uso il bean per le registrazioni utente  ]]===== --%>
<jsp:useBean id="registerBean" scope="page" class="bflows.RegisterBean" />
<jsp:setProperty name="registerBean" property="*" />
<%-- =====[[ Uso il bean per le ordinazioni  ]]===== --%>
<jsp:useBean id="ordinaBean" scope="page" class="bflows.OrdinaBean" />
<jsp:setProperty name="ordinaBean" property="*" />


<%
  int i;
  Cookie[] cookies=null;
  cookies=request.getCookies();

 // Controllo lo status della pagina e se nullo lo setto a "NUOVI ORDINI"...
    String status=request.getParameter("status");
      if (status==null) 
         status="nuoviOrdini";
    // Controllo sullo status molto utile
       util.Debug.println("status: "+status);

// Se sono nello status: "DELETE"--------------------------
 if (status.equals("delete"))
  {
    ordinaBean.ordinaBeanDelete(request.getParameter("contatore"));
    //Rivisualizza la lista dei nuovi elementi...   
    ordinaBean.ordinaBeanView("O");
  }
//---------------------------------------------------------   

// Se sono nello status: "VECCHIORDINI"-------------------------
 if (status.equals("vecchiOrdini"))
  {
    ordinaBean.ordinaBeanView("F");
  }   
//--------------------------------------------------------------

// Se sono nello status: "NUOVIORDINI"--------------------------
 if (status.equals("nuoviOrdini"))
  {
    ordinaBean.ordinaBeanView("O");
  }   
//--------------------------------------------------------------

// Se sono nello status: "INFOUTENTE"--------------------------
 if (status.equals("infoUtente"))
  { 
  //Raccolgo il nick dell'utente di cui si vuole conoscere tutte le info
   String nome=request.getParameter("nome");
  //Faccio una ricerca per UserName
   registerBean.registerBeanView(nome);
   util.Debug.println("Nome che devo cercare: "+nome);
  


  }
//-------------------------------------------------------------
%>

<c:set var="xmlDocument" scope="page">

<ROOT>



  <%-- =====[[ ORDINI ]]=====  --%>
<%
// Controllo che non sia nella pagine di Info dell'utente
if (!(status.equals("infoUtente"))){
 // Ciclo tutti gli ordini ricevuti
 for (i=0;i<ordinaBean.getOrdini().length;i++) {
%>
  <ORDINI>
      <ORDINE CODE="<%=(ordinaBean.getOrdini(i)).contatore%>">
         <NOMEUTENTE><%=(ordinaBean.getOrdini(i)).userCode%></NOMEUTENTE>
         <NOMECD><%=(ordinaBean.getOrdini(i)).nomeCD %></NOMECD>
         <DESCRIZIONE><%= (ordinaBean.getOrdini(i)).descrizione %></DESCRIZIONE>
         <PREZZO><%= (ordinaBean.getOrdini(i)).prezzo %></PREZZO>
         <QUANTITA><%= (ordinaBean.getOrdini(i)).quantita %></QUANTITA>
         <TIMESTAMP><%= ordinaBean.getOrdini(i).timestamp %></TIMESTAMP>
         <PAGINA><%=(status.equals("vecchiOrdini"))?"vecchi":"nuovi"%></PAGINA>  
      </ORDINE>
</ORDINI>
<%}
}%>
<%-- =====[[ /ORDINI  ]]===== --%>

<%-- =====[[----------------INFO UTENTE-----------------]]===== --%>

<% if (status.equals("infoUtente")){ %>
<UTENTE>
    <USERCODE><%=(registerBean.getUtente()).userCode%></USERCODE>
    <PASSWORD><%=(registerBean.getUtente()).password%></PASSWORD>
    <NOME><%=(registerBean.getUtente()).firstname%></NOME>
    <COGNOME><%=(registerBean.getUtente()).surname%></COGNOME>
    <VIA><%=(registerBean.getUtente()).via%></VIA>
    <TELEFONO><%=(registerBean.getUtente()).telefono%></TELEFONO>
    <DATANASCITA><%=(registerBean.getUtente()).datanascita%></DATANASCITA>
    <LINGUA><%=(registerBean.getUtente()).codeLanguage%></LINGUA>
</UTENTE>
<%}%>
  

<FLOW>
 <form name="ordini" method="post" action="AmministrazioneOrdini.jsp">     
  <input type="hidden" name="status" />
  <input type="hidden" name="nome" />
  <input type="hidden" name="contatore" />
 </form>

 <form name="amministratoreView"  method="POST" action="home.jsp">
  <input type="hidden" name="status" value="amministratoreView"    />
 </form> 

</FLOW>
</ROOT>

</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/AmministrazioneOrdini.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>