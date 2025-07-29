
package bflows;

import java.util.*;
import java.beans.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;
import blogics.*;

/**
 *
 * @author Erick Baldi e Riccardo Fiocchi
 */
public class ProdottoBean {
    
    private Prodotto[] DVDs;
    private Prodotto[] CDs;
    private Prodotto[] magliette;
    private String nome;
    private String descrizione;
    private String prezzo;
    private String tipo;
    private String errorCode;
    private int result;
    
    private Prodotto prodotto;
    
    /** Creates a new instance of ProdottoBean */
    public ProdottoBean() {
    }
    
    
    //--------------------
    // visualizzazione dei prodotti
  public void catalogoView() {
    
    DataBase database = null;
    Vector vProdotti=new Vector(); // Vettore ausiliario
    int i;
    
    try {
      // prodotto=DVD
      database=DBService.getDataBase();
      vProdotti=ProdottoService.getProdotti(database,"D");      
      DVDs=new Prodotto[vProdotti.size()];
      vProdotti.copyInto(DVDs);
      //prodotto=CD
      vProdotti=new Vector();
      vProdotti=ProdottoService.getProdotti(database,"C");      
      CDs=new Prodotto[vProdotti.size()];
      vProdotti.copyInto(CDs);
      //Prodotto=Maglietta
      vProdotti=new Vector();
      vProdotti=ProdottoService.getProdotti(database,"M");      
      magliette=new Prodotto[vProdotti.size()];
      vProdotti.copyInto(magliette);
      
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

  
  
  
  
  public void prodottoBeanInsert() {
    util.Debug.println("Sto inserendo il prodotto: "+nome);  
      
    DataBase database = null;    
    try {
      
      database=DBService.getDataBase();
      
      prodotto=ProdottoService.insertNewProdotto(database,nome,descrizione,Double.parseDouble(prezzo),tipo);            
      util.Debug.println("Ho inserito il prodotto: "+nome);
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
      setErrorCode("PRODOTTO_DUPLICATO");
      database.rollBack();  
      
    } finally {
      try { database.close(); }
      catch (NotFoundDBException e) { EService.logAndRecover(e); }
    }
    
  }
  
  public void prodottoBeanModify() {
    util.Debug.println("Sto modificando il prodotto selezionato: "+nome);
    
    DataBase database=null;    
    
    try {
      
      database=DBService.getDataBase();
      
      prodotto=ProdottoService.getProdotto(database,nome);
            
      prodotto.nome=nome;
      prodotto.descrizione=descrizione;
      prodotto.prezzo=Double.parseDouble(prezzo);
      prodotto.tipo=tipo;      
      
      prodotto.update(database);
      
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
  
  public void prodottoBeanDelete() {
    util.Debug.println("Sto cancellando il prodotto selezionato: "+nome);

    DataBase database = null;
    Prodotto prodotto;
    
    try {
      
      database=DBService.getDataBase();
       
      prodotto=ProdottoService.getProdotto(database,nome);
      if(prodotto!=null)
         prodotto.delete(database);
      util.Debug.println("Ho cancellato il prodotto: "+nome);

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
  
  //GETTER E SETTER
  
  /** Getter for property userCode.
   * @return Value of property userCode.
   */
  public String getNome() {
    return nome;
  }
  
  /** Setter for property userCode.
   * @param userCode New value of property userCode.
   */
  public void setNome(String nome) {
    this.nome = nome;
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
  public String getTipo() {
      return tipo;
  }
  
  /** Setter for property password.
   * @param password New value of property password.
   *
   */
  public void setTipo(String tipo) {
      this.tipo = tipo;
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
  
  public Prodotto getProdotto() {
    return this.prodotto;
  }
  
  /** Setter for property contact.
   * @param contact New value of property contact.
   */
  public void setProdotto(Prodotto prodotto) {
    this.prodotto = prodotto;
  }
  
    public Prodotto getCD(int index) {
    return this.CDs[index];
  }
  
  /** Getter for property contacts.
   * @return Value of property contacts.
   */
  public Prodotto[] getCDs() {
    return this.CDs;
  }
  
     public Prodotto getDVD(int index) {
    return this.DVDs[index];
  }
  
  /** Getter for property contacts.
   * @return Value of property contacts.
   */
  public Prodotto[] getDVDs() {
    return this.DVDs;
  }
  
     public Prodotto getMaglietta(int index) {
    return this.magliette[index];
  }
  
  /** Getter for property contacts.
   * @return Value of property contacts.
   */
  public Prodotto[] getMagliette() {
    return this.magliette;
  }
  
  /** Indexed setter for property contacts.
   * @param index Index of the property.
   * @param contacts New value of the property at <CODE>index</CODE>.
   */
  public void setDVD(int index, Prodotto DVD){
    this.DVDs[index] = DVD;
  }
  
  /** Setter for property contacts.
   * @param contacts New value of property contacts.
   */
  public void setDVDs(Prodotto[] DVDs) {
    this.DVDs = DVDs;
  }
  
   public void setCD(int index, Prodotto CD) {
    this.CDs[index] = CD;
  }
  
  /** Setter for property contacts.
   * @param contacts New value of property contacts.
   */
  public void setCDs(Prodotto[] CDs) {
    this.CDs = CDs;
  }
  
   public void setMaglietta(int index, Prodotto maglietta) {
    this.magliette[index] = maglietta;
  }
  
  /** Setter for property contacts.
   * @param contacts New value of property contacts.
   */
  public void setMagliette(Prodotto[] magliette) {
    this.magliette = magliette;
  }
  
}
