
package blogics;

import java.sql.*;

import util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

/**
 *
 * @author  Erick Baldi e Riccardo Fiocchi
 */
public class Ordine  {
  
  public String userCode;
  public String nomeCD;
  public String descrizione;
  public String prezzo;
  public String quantita;
  public String flag;
  public String contatore;
  public Timestamp timestamp;
  
  
  public Ordine(String userCode,String nomeCD, String descrizione, String prezzo, String quantita) {
    
    this.userCode=userCode;
    this.descrizione=descrizione;
    this.prezzo=prezzo;
    this.nomeCD=nomeCD;
    this.quantita= quantita;

  
  }
  
  public Ordine(ResultSet resultSet) {
    try {contatore=resultSet.getString("CONTATORE");} catch (SQLException sqle) {}
    try {userCode=resultSet.getString("CD_USER");} catch (SQLException sqle) {}
    try {nomeCD=resultSet.getString("SCELTA");} catch (SQLException sqle) {}
    try {descrizione=resultSet.getString("CANZONI");} catch (SQLException sqle) {}
    try {prezzo=resultSet.getString("PREZZO");} catch (SQLException sqle) {}
    try {flag=resultSet.getString("FLAG");} catch (SQLException sqle) {}
    try {quantita=resultSet.getString("QUANTITA");} catch (SQLException sqle) {}
    try {timestamp=resultSet.getTimestamp("TIMESTAMP");} catch (SQLException sqle) {}
   
    
  }
  
  
  public void insert(DataBase database)
  throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {
    
    String sql="";
    
    /*  inserimento nuovo contatto */
    
    sql=" INSERT INTO ORDINI "+
        "   ( CD_USER,"+
        "     SCELTA,"+
        "     CANZONI,PREZZO,FLAG,QUANTITA"+
        "   ) "+
        " VALUES ("+
        
        "'"+Conversion.getDatabaseString(userCode)+"',"+
        "'"+Conversion.getDatabaseString(nomeCD)+"',"+
        "'"+Conversion.getDatabaseString(descrizione)+"',"+
        "'"+Conversion.getDatabaseString(prezzo)+"',"+
        "'O',"+
        "'"+Conversion.getDatabaseString(quantita)+"')";
           
    database.modify(sql);
    
  }
  
   public void delete(DataBase database,String contatore) 
  throws NotFoundDBException,ResultSetDBException {
    
    String sql;
    
    sql=" UPDATE ORDINI "+
        " SET FLAG='F' "+
        " WHERE "+
        " CONTATORE="+Conversion.getDatabaseString(contatore)+"";
    
    database.modify(sql);        
    
  }
  
}  