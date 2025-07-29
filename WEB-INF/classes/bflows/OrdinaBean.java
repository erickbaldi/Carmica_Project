

package bflows;

import java.util.*;
import java.beans.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;
import blogics.*;

/**
 *
 * @author  Erick Baldi e Riccardo Fiocchi
 */
public class OrdinaBean implements java.io.Serializable{
    
 
  
  
  
  private int result;
  private Ordine[] ordini;
  private String userCode;
  private String errorCode;
  private String descrizione;
  private String prezzo;
  private String password;
  private String codeLanguage;
  private String contatore;
  private String quantita;
 
  private Ordine ordine;
  
  public OrdinaBean() {}
    
  
  
//--------------------
  public void ordinaBeanView(String scelta) {
    
    DataBase database = null;
    Vector vOrdini=new Vector();
    int i;
    
    try {
      
      database=DBService.getDataBase();
      vOrdini=OrdineService.getOrdini(database,scelta);      
      ordini=new Ordine[vOrdini.size()];
      vOrdini.copyInto(ordini);
     
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

  
  
  
  
  public void ordinaBeanInsert(String userCode,String nome,String descrizione,String prezzo,String tipo,String quantita) {
    this.userCode = nome;
    this.prezzo = prezzo;
    this.descrizione = descrizione;
    this.password = tipo;
    this.codeLanguage = quantita;
    this.userCode = userCode;
    this.quantita= quantita;
    DataBase database = null;    
    Ordine ordine;
    
    try {
      
      database=DBService.getDataBase();
      
      ordine=OrdineService.insertNewOrdine(database,userCode,nome,descrizione,prezzo,quantita);            
      
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
      setErrorCode("ORDINE_DUPLICATO");
      database.rollBack();  
      
    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }
    
  }
  
   
  public void ordinaBeanDelete(String contatore) {
    util.Debug.println("Sto cancellando l'ordine numero: "+contatore);

    this.contatore = contatore;
    DataBase database = null;
    Ordine ordine;
    
    try {
      
      database=DBService.getDataBase();
       
      util.Debug.println("Provo a trovare l'ordinazione..");
      ordine=OrdineService.getOrdine(database,contatore);
      util.Debug.println("Ho trovato l'ordine numero: "+contatore);
      
      ordine.delete(database, contatore);
      util.Debug.println("Ho cancellato l'ordine numero: "+contatore);

      database.commit();
      
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
  //--------------------
  
  
  
  
  
  
  

 
  /** Getter for property userCode.
   * @return Value of property userCode.
   */
  public String getUserCode() {
    return this.userCode;
  }
  
  /** Setter for property userCode.
   * @param userCode New value of property userCode.
   */
  public void setUserCode(String userCode) {
    this.userCode = userCode;
  }
  
 
  /** Getter for property errorCode.
   * @return Value of property errorCode.
   */
  public String getErrorCode() {
    return this.errorCode;
  }
  
  /** Setter for property errorCode.
   * @param errorCode New value of property errorCode.
   */
  public void setErrorCode(String errorCode) {
    this.errorCode = errorCode;
  }
   /** Getter for property result.
   * @return Value of property result.
   */
  public int getResult() {
    return this.result;
  }
  
  /** Setter for property result.
   * @param result New value of property result.
   */
  public void setResult(int result) {
    this.result = result;
  }
  
  /** Getter for property codeLanguage.
   * @return Value of property codeLanguage.
   *
   */
  public String getCodeLanguage() {
      return codeLanguage;
  }  
  
  /** Setter for property codeLanguage.
   * @param codeLanguage New value of property codeLanguage.
   *
   */
  public void setCodeLanguage(String codeLanguage) {
      this.codeLanguage = codeLanguage;
  }
  
  /** Getter for property password.
   * @return Value of property password.
   *
   */
  public String getPassword() {
      return password;
  }
  
  /** Setter for property password.
   * @param password New value of property password.
   *
   */
  public void setPassword(String password) {
      this.password = password;
  }
  
    /** Getter for property password.
   * @return Value of property password.
   *
   */
  public String getPrezzo() {
      return prezzo;
  }
  
  /** Setter for property password.
   * @param password New value of property password.
   *
   */
  public void setPrezzo(String prezzo) {
      this.prezzo = prezzo;
  }
   /** Getter for property password.
   * @return Value of property password.
   *
   */
  public String getQuantita() {
      return quantita;
  }
  
  /** Setter for property password.
   * @param password New value of property password.
   *
   */
  public void setQuantita(String quantita) {
      this.quantita = quantita;
  }
    /** Getter for property password.
   * @return Value of property password.
   *
   */
  public String getDescrizione() {
      return descrizione;
  }
  
  /** Setter for property password.
   * @param password New value of property password.
   *
   */
  public void setDescrizione(String descrizione) {
      this.descrizione = descrizione;
  }
  
  
  public Ordine getOrdine() {
    return this.ordine;
  }
  
  /** Setter for property contact.
   * @param contact New value of property contact.
   */
  public void setOrdine(Ordine ordine) {
    this.ordine = ordine;
  }
  
    public Ordine getOrdini(int index) {
    return this.ordini[index];
  }
  
  /** Getter for property contacts.
   * @return Value of property contacts.
   */
  public Ordine[] getOrdini() {
    return this.ordini;
  }
  
  /** Indexed setter for property contacts.
   * @param index Index of the property.
   * @param contacts New value of the property at <CODE>index</CODE>.
   */
  public void setOrdini(int index, Ordine ordini) {
    this.ordini[index] = ordini;
  }
  
  /** Setter for property contacts.
   * @param contacts New value of property contacts.
   */
  public void setOrdini(Ordine[] ordini) {
    this.ordini = ordini;
  }
  
  
  
  
  
  
}