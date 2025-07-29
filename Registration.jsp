<%@ page info="Registrazione nuovo utente" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>

<%@ page import="services.sessionservice.*" %>

<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean id="registerBean" scope="page" class="bflows.RegisterBean" />
<jsp:setProperty name="registerBean" property="*" />


<%
     String lingua=null;
  // Setto la lingua italiana di default
     boolean linguaITA=true;
 
 // Se caricando la pagina mi giunge l'informazione di visualizzarla in Inglese, la modifico
     if (request.getParameter("lingua")!=null && request.getParameter("lingua").equals("ENG"))
     linguaITA=false;
     //Piccolo controllo per conferma sulla lingua
     util.Debug.println("Lingua Italiana?: "+linguaITA);

    Cookie[] cookies=null;
    cookies=request.getCookies();
    boolean loggedOn=(cookies!=null);

//controllo lingua dai parametri della request
    lingua=request.getParameter("codeLanguage");
    if (lingua==null) lingua="ITA";
    
    String stato;
     
    if(request.getParameter("stato") == null)
        stato = "view";
    else
        stato = request.getParameter("stato");

    if(stato.equals("insert"))
        registerBean.registerBeanInsert();

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
    
    <%if(stato.equals("insert")){%>
        <USER>
            <USERCODE><%=registerBean.getUserCode()%></USERCODE>
            <PASSWORD><%=registerBean.getPassword()%></PASSWORD>
            <FIRSTNAME><%=registerBean.getFirstname() %></FIRSTNAME>
            <SURNAME><%=registerBean.getSurname()%></SURNAME> 
            <TELEFONO><%=registerBean.getTelefono()%></TELEFONO>
            <LINGUA><%=registerBean.getLanguage()%></LINGUA>
            <VIA><%=registerBean.getVia()%></VIA>
        </USER>
    <%}else{%>
        <USER>
            <USERCODE></USERCODE>
            <PASSWORD></PASSWORD>
            <FIRSTNAME></FIRSTNAME>
            <SURNAME></SURNAME> 
            <TELEFONO></TELEFONO>
            <LINGUA></LINGUA>
            <VIA></VIA>
        </USER>
    <%}%>

    <NODO>
        <INSERIMENTO FATTO="<%=(stato.equals("insert") && (messaggio==null))?"S":"N" %>"></INSERIMENTO>
        <FormInserimento>
             <input type="hidden" name="stato" value="insert"/>
        </FormInserimento>


        <form name="indietro" method="post" action="home.jsp">
            
            <input type="hidden" name="stato" value="view"/>
        </form>

    </NODO>

    

    <VARIABILE>
        <ALERTMESSAGE ABILITATO="<%=(messaggio!=null)?"S":"N"%>" MESSAGGIO="<%=(messaggio != null)?messaggio:""%>">
        </ALERTMESSAGE>
    </VARIABILE>

</PAGINA>


</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+(linguaITA?"ITA":"ENG")+"/Registration.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>