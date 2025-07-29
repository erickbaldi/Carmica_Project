
package blogics;

import java.util.*;
import java.sql.*;

import util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

/**
 *
 * @author  Erick Baldi e Riccardo Fiocchi
 */

public class OrdineService extends Object {

    public OrdineService() {}
  
  public static Ordine insertNewOrdine(DataBase database,String userCode,
                            String nome,String descrizione,
                            String prezzo,String quantita)
    throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

   Ordine ordine;

   ordine=new Ordine(userCode,nome,descrizione,prezzo,quantita);
   ordine.insert(database);
   return ordine;

  }
  
   public static Vector getOrdini(DataBase database,String scelta) 
    throws NotFoundDBException,ResultSetDBException {
    Ordine ordine;
    Vector ordini=new Vector();  
    String sql ="";
    
    sql=" SELECT * FROM ORDINI "  +
       " WHERE "+
       " FLAG='"+Conversion.getDatabaseString(scelta)+"'"+
       " ORDER BY TIMESTAMP ";
  
    
        
    
    ResultSet resultSet=database.select(sql);        
    
    try {

      while (resultSet.next()) {
        ordine=new Ordine(resultSet);
        ordini.add(ordine);
      }             
      
    } catch (SQLException ex) {
      throw new ResultSetDBException("OrdineService: getOrdini():  Errore nel ResultSet: "+ex.getMessage(),database);
    }

    return ordini;

  }
  
   
    public static Ordine getOrdine(DataBase database,String contatore) 
    throws NotFoundDBException,ResultSetDBException {
    Ordine ordine;
    String sql;
    
    sql=" SELECT *" +
        " FROM ORDINI "+
        " WHERE " +
        " FLAG='O'";
   
    ResultSet resultSet=database.select(sql);    
   
    try {

      if (resultSet.next()) {
        ordine=new Ordine(resultSet);
      } else {
        return null;
      }

    } catch (SQLException ex) {
      throw new ResultSetDBException("OrdineService: getOrdine():  Errore nel ResultSet: "+ex.getMessage(),database);
    }

    return ordine;

  }
   
   
   
}  
  