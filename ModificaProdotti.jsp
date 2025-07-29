<%@ page info="Modifica Prodotti" %>
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

    if (cookies==null) response.sendRedirect("home.jsp");
  
    String stato;
    stato=request.getParameter("stato");

    String messaggio=null;
    
    if (stato.equals("modifica"))
        prodottoBean.prodottoBeanModify(); 

%>




<c:set var="xmlDocument" scope="page">

<pagina>
    
    <%      //conversione del prezzo
            Float fl = new Float(prodottoBean.getPrezzo());
            String[] val = fl.toString().replace('.',',').split(",");
            String imp;
            if(val[1].length()==1)
                imp = val[0]+"."+val[1].substring(0,1);
            else
                imp = val[0]+"."+val[1].substring(0,2);
    
    %>
        <PRODOTTO> 
            <NOME><%=prodottoBean.getNome()%></NOME>
            <DESCRIZIONE><%=prodottoBean.getDescrizione()%></DESCRIZIONE>
            <PREZZO><%=prodottoBean.getPrezzo()%></PREZZO>
            <TIPO><%=prodottoBean.getTipo()%></TIPO>
        </PRODOTTO>

    <nodo>
        <MODIFICA FATTA="<%=(stato.equals("modifica")?"S":"N") %>"></MODIFICA>
        <FormModifica>
            <input type="hidden" name="stato" value="modifica"/>
        </FormModifica>
        
        <form name="indietro" method="post" action="AmministrazioneProdotti.jsp">            
            <input type="hidden" name="stato" value="view"/>
        </form>
        
         <form name="amministratoreView"  method="POST" action="home.jsp">
            <input type="hidden" name="status" value="amministratoreView"    />
        </form>

    </nodo>
</pagina>

</c:set>

<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/ModificaProdotti.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>