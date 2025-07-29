/*
 * Session.java
 *
 */

package services.sessionservice;

import java.util.*;
import javax.servlet.http.*;

//import util.*;
import services.errorservice.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

import blogics.*;

public class Session {
  
  //costruttore vuoto
  public Session() {}
  
  public static Cookie[] createCookie(DataBase database, String userCode) 
  throws NotFoundDBException,ResultSetDBException {
    
    Cookie[] cookies=new Cookie[3];
    Cookie cookie;
    
    Utente utente= UtenteService.getUtente(database,userCode);
    
    cookie=new Cookie("userCode",utente.userCode);
    cookies[0]=cookie;
    
    cookie=new Cookie("userInfo",utente.firstname+"#"+utente.surname+"#"+utente.codeLanguage);
    cookies[1]=cookie;
    
    cookie=new Cookie("userInfoPlus",utente.datanascita+"#"+utente.telefono+"#"+utente.via+"#"+utente.password);
    cookies[2]=cookie;
    
    for (int i=0; i<cookies.length; i++) {
      cookies[i].setPath("/");
    }
    
    return cookies;
  }
  
  public static String getValue(Cookie cookies[], String name, int position) {
    
    int i;
    boolean found=false;
    String value=null;
    
    for (i=0;i<cookies.length && !found;i++)
      if (cookies[i].getName().equals(name)) {
        Vector oV = util.Conversion.tokenizeString(cookies[i].getValue(),"#");
        value=(String)oV.elementAt(position);
        found=true;
      }        
    
    return value;
    
  }
  
  //-----------------------X il Basket -------------------------
  //vedi la relativa JSP: Basket.jsp
  public static String getInfo(Cookie cookies[], int i, int info) {  
   // 0= Codice
   // 1= Prezzo
   // 2= Descrizione 
   // 3= tipo
   String value=null;
   Vector oV = util.Conversion.tokenizeString(cookies[i].getName(),"+");
   value=(String)oV.elementAt(info);
   return value;   
  }
  
  //analogo a quello sopra ma essendo un ordine nuovo non ha indice in lista
  public static String getPrimaInfo(Cookie cookie,int inf) { 
   String value=null;
   Vector oV = util.Conversion.tokenizeString(cookie.getName(),"+");
   value=(String)oV.elementAt(inf); 
   return value;
    
  }
  
  //---------------------------------------------------------
  
  
  public static String getUserCode(Cookie[] cookies) {
    return getValue(cookies, "userCode", 0);
  }
  
  public static String getUserFirstname(Cookie[] cookies) {
    return getValue(cookies, "userInfo", 0);
  }
  
  public static String getUserSurname(Cookie[] cookies) {
    return getValue(cookies, "userInfo", 1);
  }    
  
  public static String getUserLanguageCode(Cookie[] cookies) {
    return getValue(cookies, "userInfo", 2);
  }
  
  public static String getUserPassword(Cookie[] cookies) {
    return getValue(cookies, "userInfoPlus", 3);
  }
  
  public static String getUserDate(Cookie[] cookies) {
    return getValue(cookies, "userInfoPlus", 0);
  }
  
  public static String getUserVia(Cookie[] cookies) {
    return getValue(cookies, "userInfoPlus", 2);
  }
  
  public static String getUserTelefono(Cookie[] cookies) {
    return getValue(cookies, "userInfoPlus", 1);
  }
    
  public static Cookie[] deleteCookie(Cookie[] cookies) {
    
    for (int i=0; i<cookies.length; i++) {
      cookies[i].setMaxAge(0);
      cookies[i].setPath("/");
    }
    
    return cookies;
  }  
  
}