<%@ page info="Crea la maglietta personalizzata" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>


<%
  // Avviso il debugger della pagina visualizzata
     String status="Crea la tua maglietta";
     util.Debug.println("status: "+status);
%>


<%
  Cookie[] cookies=null;
  cookies=request.getCookies();
%>

<c:set var="xmlDocument" scope="page">

<ROOT>
  <FLOW>
   <insertForm>
      <input type="hidden" name="status" value="insert"/>
    </insertForm>
  </FLOW>
</ROOT> 

</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/CreaMaglietta.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>