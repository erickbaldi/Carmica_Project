<%@ page info="Error Page" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="10kb" %>
<%@ page isErrorPage="true" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="services.errorservice.*"%>

<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%int i;%>

<c:set var="xmlDocument" scope="page">

<ROOT>

  <%-- =====[[ ECCEZIONE  ]]===== --%>

  <EXCEPTION>
<% if (exception!=null){
    String message=(exception.getMessage()!=null)?exception.getMessage():"Nessun Messaggio";
    ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
    exception.printStackTrace(new PrintWriter(stackTrace,true)); %>
    <MESSAGE><![CDATA[<%=message%>]]></MESSAGE>
    <STACKTRACE>      
      <![CDATA[
        <%=stackTrace.toString()%>
      ]]>
    </STACKTRACE>
<% } else { %>
    <MESSAGE><![CDATA[ ERRORE!! Eccezione NULLA ]]></MESSAGE>
    <STACKTRACE> <![CDATA[No Stack Trace]]></STACKTRACE>
<% } %>
  </EXCEPTION>

  <%-- =====[[ /ECCEZIONE  ]]===== --%>

  <%-- =====[[ PARAMETERS  ]]===== --%>

<%int pc;
  String parameterName;  
  Vector parameters=new Vector();
  Enumeration parameterNames=request.getParameterNames(); %>
  <PARAMETERS>
  <%while (parameterNames.hasMoreElements()) {
      parameterName=(String)parameterNames.nextElement();    
      String[] parameterValues=request.getParameterValues(parameterName);
      for (pc=0;pc<parameterValues.length;pc++) {
        out.print("<"+parameterName+" INDEX=\""+pc+"\"><![CDATA[");
        out.print(parameterValues[pc]);
        out.println("]]></"+parameterName+">");        
        parameters.add( parameterName+"["+pc+"]: "+parameterValues[pc] );
      }      
   } %>
  </PARAMETERS>
  <%-- =====[[ /PARAMETERS  ]]===== --%>

  <%-- =====[[ INFO  ]]===== --%>

<%Enumeration headersNames; 
  String headerName;
  String header; 
  Hashtable info=new Hashtable();
  headersNames=request.getHeaderNames(); %>
  <INFO>
<%while (headersNames.hasMoreElements()) {
    headerName=(String)headersNames.nextElement(); %>
    <%out.println("<"+headerName+">");%>
  <%Enumeration headers=request.getHeaders(headerName);
    while (headers.hasMoreElements()) {
      header=(String)headers.nextElement();      
      if (header!=null)
        info.put(headerName,(info.get(headerName)!=null?info.get(headerName):"")+" "+header);  %>
      <![CDATA[<%=(header!=null)?header:"-"%>]]>
  <%}%>
    <%out.println("</"+headerName+">");%>
<%}%>
    <%String remoteHost=request.getRemoteHost();%>
    <REMOTEHOST><![CDATA[<%=(remoteHost!=null)?remoteHost:"-"%>]]></REMOTEHOST>
    <%if (remoteHost!=null) info.put("RemoteHost",remoteHost);  %>
    <%String remoteUser=request.getRemoteUser();%>
    <REMOTEUSER><![CDATA[<%=(remoteUser!=null)?remoteUser:"-"%>]]></REMOTEUSER>
    <%if (remoteUser!=null) info.put("RemoteUser",remoteUser);  %>
  </INFO>

  <%-- =====[[ /INFO  ]]===== --%>

  <VAR>		    
    <DEBUG><%=global.Constants.DEBUG?"S":"N"%></DEBUG>
  </VAR>

</ROOT>

<%if (exception!=null){
      EService.logFrontendException(exception,info,parameters); 
  } else {
      EService.logFrontend("No Exception",info,parameters);
  }%>

</c:set>

<c:import var="xslDocument" url="/XSL/ITA/ErrorPage.xsl" scope="page"/>
<x:parse xml="${xmlDocument}" var="xml"/>
<x:parse xml="${xslDocument}" var="xsl"/>

<x:transform xml="${xml}" xslt="${xsl}"/>
