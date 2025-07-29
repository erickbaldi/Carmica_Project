
package bflows;

import java.beans.*;
import javax.servlet.http.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;
import services.sessionservice.*;
import blogics.*;

/**
 *
 * @author  Erick Baldi e Riccardo Fiocchi
 * vedi pagine 193->205
 *
 */
public class RegisterBean extends Object implements java.io.Serializable{
  
  //proprieta private degli attributi
  private int result;
  
  private String userCode;
  
  private String newpwd;
  
  private String password;
  
  private String firstname;
  
  private String surname;
  
  private String language;
  
  private String via;
  
  private String telefono;
  
  private String datanascita;
  
  private Cookie[] cookies;
    
  private String errorCode;
  
  private Utente user;
  
  //costruttore vuoto..come da regola
  public RegisterBean() {}
  
  
    public void registerBeanView(String userCode) {
    
    DataBase database = null;
   
    
    try {
      
      database=DBService.getDataBase();
      user=UtenteService.getUtente(database,userCode);      
     
      database.commit();
      
    } catch (NotFoundDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      
    } catch (ResultSetDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      
    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }
    
  }
  
  public void registerBeanInsert() {
    
    DataBase database = null;
    
    try {
      
      database=DBService.getDataBase();
      
     
      user=UtenteService.insertNewUtente(database,firstname,surname,via,telefono,datanascita,language,userCode,password);            

      database.commit();
      
    } catch (NotFoundDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      database.rollBack();
      
    } catch (ResultSetDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      database.rollBack();
      
    } catch (DuplicatedRecordDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.RECOVERABLE_ERROR);
      setErrorCode("DUPLICATED_CONTACT");
      database.rollBack();  
      
    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }
    
  }
  
  public void registerBeanModify()
  {
      
    DataBase database=null;    
    
    try {
      
      database=DBService.getDataBase();
      
      user=UtenteService.getUtente(database,userCode,password);
      
      if (user== null) 
      {
        cookies=null;
        setResult(EService.RECOVERABLE_ERROR);
        setErrorCode("WRONG_CREDENTIALS");
        
      }
      else
      {
          
          if(newpwd!=null)
            user.password=newpwd;
          else
            user.password=password;      
          user.firstname=firstname;
          user.surname=surname;
          user.codeLanguage=language;
          user.via = via;
          user.datanascita = datanascita;
          user.telefono = telefono;


          user.update(database);

          database.commit();
      }
      
    } catch (NotFoundDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      database.rollBack();
      
    } catch (ResultSetDBException ex) {
      
      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);
      database.rollBack();
      
    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }
    
    
  }
  
  public void logon() {

    DataBase database = null;

    try {

      database=DBService.getDataBase();

      Utente utente=UtenteService.getUtente(database,userCode);
      if (utente== null || !utente.password.equals(password)) {
        cookies=null;
        setResult(EService.RECOVERABLE_ERROR);
        setErrorCode("UserName e Password errati");

      } else {
        cookies=Session.createCookie(database,utente.userCode);
      }

      database.commit();

    } catch (NotFoundDBException ex) {

      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);

    } catch (ResultSetDBException ex) {

      EService.logAndRecover(ex);
      setResult(EService.UNRECOVERABLE_ERROR);

    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }

  }




  public void logout() {
    cookies=Session.deleteCookie(cookies);
  }
  
  //proprieta getter e setter degli attributi
  public int getResult() {
    return this.result;
  }
  
  
  public void setResult(int result) {
    this.result = result;
  }
  
  
  public String getUserCode() {
    return this.userCode;
  }
  
  
  public void setUserCode(String userCode) {
    this.userCode = userCode;
  }
  
  
  public String getPassword() {
    return this.password;
  }
  
  
  public void setPassword(String password) {
    this.password = password;
  }
  
  public String getNewpwd() {
    return this.newpwd;
  }
  
  
  public void setNewpwd(String newpwd) {
    this.newpwd = newpwd;
  }
  
  public String getFirstname() {
    return this.firstname;
  }
  
  
  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }
  
  public String getSurname() {
    return this.surname;
  }
  
  
  public void setSurname(String surname) {
    this.surname = surname;
  }
  
  public String getLanguage() {
    return this.language;
  }
  
  
  public void setLanguage(String language) {
    this.language = language;
  }
  
  public Cookie getCookies(int index) {
    return this.cookies[index];
  }
  
  
  public Cookie[] getCookies() {
    return this.cookies;
  }
  
  
  public void setCookies(int index, Cookie cookies) {
    this.cookies[index] = cookies;
  }
  
  
  public void setCookies(Cookie[] cookies) {
    this.cookies = cookies;
  }
  
  
  public String getErrorCode() {
    return this.errorCode;
  }
  
  
  public void setErrorCode(String errorCode) {
    this.errorCode = errorCode;
  }
  
  /** Getter for property via.
   * @return Value of property via.
   *
   */
  public java.lang.String getVia() {
      return via;
  }

  /** Setter for property via.
   * @param via New value of property via.
   *
   */
  public void setVia(java.lang.String via) {
      this.via = via;
  }

  /** Getter for property telefono.
   * @return Value of property telefono.
   *
   */
  public java.lang.String getTelefono() {
      return telefono;
  }

  /** Setter for property telefono.
   * @param telefono New value of property telefono.
   *
   */
  public void setTelefono(java.lang.String telefono) {
      this.telefono = telefono;
  }

  /** Getter for property datanascita.
   * @return Value of property datanascita.
   *
   */
  public java.lang.String getDatanascita() {
      return datanascita;
  }

  /** Setter for property datanascita.
   * @param datanascita New value of property datanascita.
   *
   */
  public void setDatanascita(java.lang.String datanascita) {
      this.datanascita = datanascita;
  }
  
  public Utente getUtente() {
    return this.user;
  }
  
 
  public void setUtente(Utente utente) {
    this.user = utente;
  }
  
}

