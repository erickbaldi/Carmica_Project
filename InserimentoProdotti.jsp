<%@ page info="Inserimento prodotti" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean id="prodottoBean" scope="page" class="bflows.ProdottoBean" />
<jsp:setProperty name="prodottoBean" property="*" />




<%  int i;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    
String stato;
    
    if(request.getParameter("stato") == null)
        stato = "view";
    else
        stato = request.getParameter("stato");

    if(stato.equals("insert"))
        prodottoBean.prodottoBeanInsert();
    String messaggio = null;

    if(prodottoBean.getResult() == -1)
    throw new Exception("Errore durante l'esecuzione dell'applicazione: per maggiori informazioni consultare i logs.");
    else if(prodottoBean.getResult() == -2)
        {
            messaggio = prodottoBean.getErrorCode();
        }
    prodottoBean.setDescrizione(request.getParameter("descrizione"));
%>


<c:set var="xmlDocument" scope="page">

<pagina>

    <%if(stato.equals("insert")){%>
        <prodotto>
            <nome><%=prodottoBean.getNome()%></nome>
            <descrizione><%=prodottoBean.getDescrizione()%></descrizione>
            <tipo><%=prodottoBean.getTipo() %></tipo>
            <prezzo><%=prodottoBean.getPrezzo()%></prezzo> 
        </prodotto>
    <%}else{%>
        <prodotto>
            <nome></nome>
            <descrizione></descrizione>
            <tipo></tipo>
            <prezzo></prezzo> 
        </prodotto>
    <%}%>

    <nodo>
        <INSERIMENTO FATTO="<%=(stato.equals("insert") && (messaggio==null))?"S":"N" %>"></INSERIMENTO>
        <FormInserimento>
            <input type="hidden" name="stato" value="insert"/>
        </FormInserimento>
         <form name="amministratoreView"  method="POST" action="home.jsp">
            <input type="hidden" name="status" value="amministratoreView"    />
        </form>
        <form name="indietro" method="post" action="AmministrazioneProdotti.jsp">
            <input type="hidden" name="stato" value="view"/>
        </form>
    </nodo>

    <VARIABILE>
        <ALERTMESSAGE ABILITATO="<%=(messaggio!=null)?"S":"N"%>" MESSAGGIO="<%=(messaggio != null)?messaggio:""%>">
        </ALERTMESSAGE>
    </VARIABILE>

</pagina>


</c:set>

<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/InserimentoProdotti.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>