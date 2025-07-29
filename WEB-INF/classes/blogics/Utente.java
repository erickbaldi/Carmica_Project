
package blogics;

import java.sql.*;
import util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

/**
 *
 * @author   Erick Baldi e Riccardo Fiocchi
 */

public class Utente  {
  
  
  public String userCode;
  public String firstname;
  public String surname;
  public String password;
  public String codeLanguage;
  public String via;
  public String telefono;
  public String datanascita;
  public Timestamp timestamp;
  
  
  public Utente(String firstname, String surname, String via, String telefono, String datanascita,String codeLanguage, String userCode,String password) {
    
    this.userCode=userCode;
    this.firstname=firstname;
    this.surname=surname;
    this.password=password;
    this.codeLanguage=codeLanguage;
    this.via=via;
    this.telefono=telefono;
    this.datanascita=datanascita;
  }
  
  public Utente(ResultSet resultSet) {
    
    
    try {firstname=resultSet.getString("NOME");} catch (SQLException sqle) {}
    try {surname=resultSet.getString("COGNOME");} catch (SQLException sqle) {}
    try {via=resultSet.getString("VIA");} catch (SQLException sqle) {}
    try {telefono=resultSet.getString("TELEFONO");} catch (SQLException sqle) {}
    try {datanascita=resultSet.getString("DATA_NASCITA");} catch (SQLException sqle) {}
    try {codeLanguage=resultSet.getString("LINGUA");} catch (SQLException sqle) {}
    try {userCode=resultSet.getString("CD_USER");} catch (SQLException sqle) {}
    try {password=resultSet.getString("PWD");} catch (SQLException sqle) {}
    try {timestamp=resultSet.getTimestamp("TIMESTAMP");} catch (SQLException sqle) {}
    
  }
  
  
  public void insert(DataBase database)
  throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {
    
    String sql="";
    
    /* check di unicità */
    sql+= " SELECT * "+
          "   FROM UTENTI "+
          " WHERE " +
          "   CD_USER='"+Conversion.getDatabaseString(userCode)+"' ";
    
    ResultSet resultSet=database.select(sql);
    
    boolean exist=false;
    
    try {
      exist=resultSet.next();
      resultSet.close();
    } catch (SQLException e) {
      throw new ResultSetDBException("Utente: insert(): Errore sul ResultSet.");
    }
    
    if (exist)
    {
      throw new DuplicatedRecordDBException("Utente: insert(): Tentativo di inserimento di un contatto già esistente.");
    }
    
 
    /*  inserimento nuovo contatto */
   
    
    sql=" INSERT INTO UTENTI "+
             "("+
             "NOME,COGNOME,VIA,TELEFONO,"+
             "DATA_NASCITA,LINGUA,CD_USER,PWD"+
             ")"+
        " VALUES ("+
        
        
         "'"+Conversion.getDatabaseString(firstname)+"',"+
         "'"+Conversion.getDatabaseString(surname)+"',"+
         "'"+Conversion.getDatabaseString(via)+"',"+
         "'"+Conversion.getDatabaseString(telefono)+"',"+
         "'"+Conversion.getDatabaseString(datanascita)+"',"+
         "'"+Conversion.getDatabaseString(codeLanguage)+"',"+
         "'"+Conversion.getDatabaseString(userCode)+"',"+
         "'"+Conversion.getDatabaseString(password)+"'"+
        ")";
    
    database.modify(sql);
    
  }
  
  public void update(DataBase database)
  throws NotFoundDBException,ResultSetDBException 
  {
      
    String sql="";
    
    
    ResultSet resultSet=null;
    
    sql=" UPDATE UTENTI "+
        " SET "+
        "   NOME = '"+Conversion.getDatabaseString(firstname)+"', "+
        "   COGNOME = '"+Conversion.getDatabaseString(surname)+"',"+
        "   LINGUA = '"+Conversion.getDatabaseString(codeLanguage)+"',"+
        "   PWD = '"+Conversion.getDatabaseString(password)+"',"+
        "   VIA = '"+Conversion.getDatabaseString(via)+"',"+
        "   DATA_NASCITA = '"+Conversion.getDatabaseString(datanascita)+"',"+
        "   TELEFONO = '"+Conversion.getDatabaseString(telefono)+"'"+
        " WHERE "+
        "   CD_USER = '"+Conversion.getDatabaseString(userCode)+"'";
    
    database.modify(sql);
        
  }
  
}  