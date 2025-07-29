<%@ page info="AmministrazioneProdotti" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="20kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>
<%@ page import="services.sessionservice.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean id="prodottoBean" scope="page" class="bflows.ProdottoBean" />
<jsp:setProperty name="prodottoBean" property="*" />





<%
  int i;
  Cookie[] cookies=null;

  cookies=request.getCookies();

  String stato;
  if(request.getParameter("stato") == null)
    stato = "amministratoreView";
  else
    stato = request.getParameter("stato");

  if(stato.equals("delete"))
    prodottoBean.prodottoBeanDelete();
    
  prodottoBean.catalogoView();

  String messaggio = null;

%>

<c:set var="xmlDocument" scope="page">

<pagina>

    <!--REPERIMENTO DEI PRODOTTI DAL DATABASE-->

    <prodotti>
<%-- =====[[ /CDs  ]]===== --%>
        <% for (i=0; i<prodottoBean.getCDs().length;i++){
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

 <%-- =====[[ DVDs  ]]===== --%>
  
        <% for (i=0; i<prodottoBean.getDVDs().length;i++){
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


 <%-- =====[[ MAGLIETTE ]]===== --%>
  
        <% for (i=0; i<prodottoBean.getMagliette().length;i++){
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
  
        <tipo_attivo><%=(request.getParameter("tipo_attivo")==null)?"Z":request.getParameter("tipo_attivo")%></tipo_attivo>

   </prodotti>

    <foglia>

        <form name="inserimento" method="post" action="InserimentoProdotti.jsp">
            <input type="hidden" name="nome" value="<%=prodottoBean.getNome()%>"/>
            <input type="hidden" name="descrizione" value="<%=prodottoBean.getDescrizione()%>"/>
            <input type="hidden" name="prezzo" value="<%=prodottoBean.getPrezzo()%>"/>
            <input type="hidden" name="tipo" value="<%=prodottoBean.getTipo()%>"/>
            
            <input type="hidden" name="stato" value="view"/>
        </form>

        <form name="modificaForm" method="post" action="ModificaProdotti.jsp">
            <input type="hidden" name="nome"/>
            <input type="hidden" name="descrizione"/>
            <input type="hidden" name="prezzo"/>
            <input type="hidden" name="tipo"/>

            <input type="hidden" name="stato" value="view"/>
        </form>

        <form name="cancellazione" method="post" action="AmministrazioneProdotti.jsp">
            <input type="hidden" name="nome"/>
            <input type="hidden" name="stato" value="delete"/>
        </form>
        
        <form name="amministratoreView"  method="POST" action="home.jsp">
            <input type="hidden" name="status" value="amministratoreView"    />
        </form>
    </foglia>

</pagina>

</c:set>

<x:parse xml="${xmlDocument}" var="xml"/>

<c:set var="xslUrl"><%="/XSL/"+Session.getUserLanguageCode(cookies)+"/AmministrazioneProdotti.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>

<x:transform xml="${xml}" xslt="${xsl}"/>