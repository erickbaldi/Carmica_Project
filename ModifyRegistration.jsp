<%@ page info="Modifica dei dati di un utente." %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean id="registerBean" scope="page" class="bflows.RegisterBean" />
<jsp:setProperty name="registerBean" property="*" />


<%
    Cookie[] cookies=null;
    cookies=request.getCookies();
    
    String stato;
    
    if(request.getParameter("stato") == null)
        stato = "view";
    else
        stato = request.getParameter("stato");

    if(stato.equals("modifica"))
        registerBean.registerBeanModify();

    String messaggio = null;

    if(registerBean.getResult() == -1)
    throw new Exception("Errore durante l'esecuzione dell'applicazione: per maggiori informazioni consultare i logs.");
    else if(registerBean.getResult() == -2)
        {
            messaggio = registerBean.getErrorCode();
        }
    
%>


<c:set var="xmlDocument" scope="page">

<PAGINA>
    
    <%if(stato.equals("modifica")){%>
        <USER>
            <USERCODE><%=Session.getUserCode(cookies) %></USERCODE>
            <FIRSTNAME><%=Session.getUserFirstname(cookies) %></FIRSTNAME>
            <SURNAME><%=Session.getUserSurname(cookies)%></SURNAME>
            <%if(registerBean.getNewpwd()!=null){%>
                <PASSWORD><%=registerBean.getNewpwd()%></PASSWORD>
            <%}else{%>
                <PASSWORD><%=registerBean.getPassword()%></PASSWORD>
            <%}%>
            <LANGUAGE><%=registerBean.getLanguage() %></LANGUAGE>  
            <TELEFONO><%=registerBean.getTelefono() %></TELEFONO>
            <VIA><%=registerBean.getVia() %></VIA>
            <DATANASCITA><%=registerBean.getDatanascita() %></DATANASCITA>
        </USER>
    <%}else{%>
        <USER>
            <USERCODE><%=Session.getUserCode(cookies) %></USERCODE>
            <FIRSTNAME><%=Session.getUserFirstname(cookies) %></FIRSTNAME>
            <SURNAME><%=Session.getUserSurname(cookies)%></SURNAME>
            <PASSWORD><%=Session.getUserPassword(cookies)%></PASSWORD>
            <LANGUAGE><%=Session.getUserLanguageCode(cookies)%></LANGUAGE> 
            <TELEFONO><%=Session.getUserTelefono(cookies) %></TELEFONO>
            <VIA><%=Session.getUserVia(cookies) %></VIA>
            <DATANASCITA><%=Session.getUserDate(cookies) %></DATANASCITA>
        </USER>
    <%}%>

    <NODO>
        <MODIFICA FATTA="<%=(stato.equals("modifica") && (messaggio==null))?"S":"N" %>"></MODIFICA>
        <FormModifica>
             <input type="hidden" name="stato" value="modifica"/>
        </FormModifica>


        <form name="logon"  method="POST" action="home.jsp">
            <input type="hidden" name="status" value="logout"    />
        </form>

    </NODO>

    

    <VARIABILE>
        <ALERTMESSAGE ABILITATO="<%=(messaggio!=null)?"S":"N"%>" MESSAGGIO="<%=(messaggio != null)?messaggio:""%>">
        </ALERTMESSAGE>
    </VARIABILE>

</PAGINA>


</c:set>

<x:parse xml="${xmlDocument}" var="xml"/>

<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/ModifyRegistration.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>

<x:transform xml="${xml}" xslt="${xsl}"/>