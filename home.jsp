<%@ page info="Home Page" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>
<%@ page errorPage="/ErrorPage.jsp" %>

<%@ page import="services.sessionservice.*" %>

<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%-- =====[[ Uso il bean per le registrazioni utente  ]]===== --%>
<jsp:useBean id="registerBean" scope="page" class="bflows.RegisterBean" />
<jsp:setProperty name="registerBean" property="*" />

<%Cookie[] cookies=null;
  cookies=request.getCookies();

// Setto i parametri di controllo...
  boolean loggedOn=(cookies!=null);
  boolean amministratore=false;
  int i;
  String message=null;
  String status;
  String userCode=null;
  String password=null;
  String lingua=null;

// Setto la lingua italiana di default
     boolean linguaITA=true;
 
 // Se caricando la pagina mi giunge l'informazione di visualizzarla in Inglese, la modifico
     if (request.getParameter("lingua")!=null && request.getParameter("lingua").equals("ENG"))
     linguaITA=false;
     //Piccolo controllo per conferma sulla lingua
     util.Debug.println("Lingua Italiana?: "+linguaITA);

// Acquisisco il nuovo status se c'e' altrimenti rimango in "VIEW"
  status=request.getParameter("status");
  if (status==null) status="view";
    util.Debug.println("statusRicevuto: "+status);

   lingua=request.getParameter("codeLanguage");
   if (lingua==null) lingua="ITA";

// Se sono nello status: "LOGON"--------------------------
  if (status.equals("logon")) {
    registerBean.logon();    
   if (registerBean.getCookies()!=null) {
      for(i=0;i<registerBean.getCookies().length;i++)
        response.addCookie(registerBean.getCookies(i));
      cookies=registerBean.getCookies();
      loggedOn=true;    
      if (registerBean.getUserCode().equals("a"))
          amministratore=true;
    }
  }
//--------------------------------------------------------


// Se sono nello status: "LOGOUT"-------------------------
  if (status.equals("logout")) {
    if (loggedOn) {
      registerBean.setCookies(cookies);//aggiornamento cookies
      registerBean.logout();    
      for(i=0;i<registerBean.getCookies().length;i++)
        response.addCookie(registerBean.getCookies(i));
      loggedOn=false;
    }
  }
//--------------------------------------------------------

// Se sono nello status: "AMMINISTRATOREVIEW"-------------  
 if (status.equals("amministratoreView"))
  {
   {
    loggedOn=true;    
    amministratore=true;
   }
  }
//--------------------------------------------------------

// Se sono nello status: "NUOVOUTENTE"--------------------
 if (status.equals("nuovo utente"))
 {
  registerBean.registerBeanInsert();
 }
//-------------------------------------------------------

// Se si sono verificati problemi...---
if (registerBean.getResult()==-1){    
    throw new Exception("Errore nell'applicazione: consultare i logs.");
  } else if (registerBean.getResult()==-2) {
    message=registerBean.getErrorCode();
  }
//-------------------------------------
%>

<c:set var="xmlDocument" scope="page">

<ROOT>  

<%-- =====[[ NOME/COGNOME da Visualizzare al LOGON  ]]===== --%>

  <%if (loggedOn) { %>
      <USER>
        <FIRSTNAME><%=Session.getUserFirstname(cookies)%></FIRSTNAME>
        <SURNAME><%=Session.getUserSurname(cookies)%></SURNAME>     
      </USER>
  <% }%>
<%-- =====[[ ......................................  ]]===== --%>


<%-- =====[[ Bottone nascosto per la ricezione degli status ]]===== --%>       
 <FLOW>
    <logonForm>
      <input type="hidden" name="status" value="logon"/>
    </logonForm>
 </FLOW>
<%-- =====[[ ..............................................  ]]===== --%>


<VAR>
     <%-- Verifica se e' loggato --%>
    <LOGGEDON><%=loggedOn?"S":"N"%></LOGGEDON>

     <%-- Veridica se e' l'amministratore --%>
    <AMMINISTRATORE><%=amministratore? "S":"N"%></AMMINISTRATORE>   
     
     <%-- Verifica se c'e' stato un errore da segnalare --%>
    <ALERTMSG><%=(message!=null)?"S":"N"%></ALERTMSG> 
   
    <%-- Avverte dell'inserimento del nuovo Nick e Pwd --%>
    <AVVISOLOGIN><%=((message==null)&&(status.equals("nuovo utente")))?"S":"N"%></AVVISOLOGIN> 
    <NICK><%=request.getParameter("userCode")%></NICK> 
    <PWD> <%=request.getParameter("password")%></PWD>  
 
<%util.Debug.println("HOME lingua: "+lingua);%>
</VAR>

</ROOT>

</c:set>
<x:parse xml="${xmlDocument}" var="xml"/>
<c:set var="xslUrl"><%="/XSL/"+(linguaITA?"ITA":"ENG")+"/home.xsl"%></c:set>
<c:set var="xslUrl"><%="/XSL/"+(loggedOn?Session.getUserLanguageCode(cookies):lingua)+"/home.xsl"%></c:set>
<c:import var="xslDocument" url="${xslUrl}" scope="page"/>
<x:parse xml="${xslDocument}" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"/>