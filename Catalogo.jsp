<%@ page info="Menu di Ordinazione" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%-- =====[[ Uso il bean per i prodotti  ]]===== --%>
<jsp:useBean id="prodottoBean" scope="page" class="bflows.ProdottoBean" />
<jsp:setProperty name="prodottoBean" property="*" />

<%
  // Avviso il debugger della pagina visualizzata
    String status="Scelta dal menu";
    util.Debug.println("status: "+status);
%>


<%
  Cookie[] cookies=null;
  cookies=request.getCookies();
  prodottoBean.catalogoView();
%>

<c:set var="xmlDocument" scope="page">


<%-- =====[[ CDs ]]===== --%>
<prodotti>
<% for (int i=0; i<prodottoBean.getCDs().length;i++){
  Float fl = new Float(prodottoBean.getCD(i).prezzo);
  String[] val = fl.toString().replace('.',',').split(",");
  String imp;
  if(val[1].length()==1)
        imp = val[0]+"."+val[1].substring(0,1);
  else
        imp = val[0]+"."+val[1].substring(0,2);
%>

   <prod nome="<%=prodottoBean.getCD(i).nome%>" descrizione="<%=prodottoBean.getCD(i).descrizione%>"   prezzo="<%=imp%>" tipo="<%=prodottoBean.getCD(i).tipo%>"/>
 <%}%> 
 <%-- =====[[ /CDs  ]]===== --%> 

 <%-- =====[[ MAGLIETTE  ]]===== --%>
  
 <% for (int i=0; i<prodottoBean.getMagliette().length;i++){
  Float fl = new Float(prodottoBean.getMaglietta(i).prezzo);
  String[] val = fl.toString().replace('.',',').split(",");
  String imp;
  if(val[1].length()==1)
        imp = val[0]+"."+val[1].substring(0,1);
  else
        imp = val[0]+"."+val[1].substring(0,2);
%>

   <prod nome="<%=prodottoBean.getMaglietta(i).nome%>" descrizione="<%=prodottoBean.getMaglietta(i).descrizione%>"   prezzo="<%=imp%>" tipo="<%=prodottoBean.getMaglietta(i).tipo%>"/>
 <%}%> 
 <%-- =====[[ /MAGLIETTE  ]]===== --%>


 <%-- =====[[ DVDs ]]===== --%>
  
 <% for (int i=0; i<prodottoBean.getDVDs().length;i++){
  Float fl = new Float(prodottoBean.getDVD(i).prezzo);
  String[] val = fl.toString().replace('.',',').split(",");
  String imp;
  if(val[1].length()==1)
        imp = val[0]+"."+val[1].substring(0,1);
  else
        imp = val[0]+"."+val[1].substring(0,2);
%>

   <prod nome="<%=prodottoBean.getDVD(i).nome%>" descrizione="<%=prodottoBean.getDVD(i).descrizione%>"   prezzo="<%=imp%>" tipo="<%=prodottoBean.getDVD(i).tipo%>"/>
 <%}%> 
 <%-- =====[[ /DVDs  ]]===== --%>
  
  <tipo_attivo><%=(request.getParameter("tipo_attivo")==null)?"C":request.getParameter("tipo_attivo")%></tipo_attivo>
</prodotti>


</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/Catalogo.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>