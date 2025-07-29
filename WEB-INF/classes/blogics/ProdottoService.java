
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

public class ProdottoService extends Object {

    public ProdottoService() {}
  
  public static Prodotto insertNewProdotto(DataBase database,String nome,String descrizione,
                                       double prezzo, String tipo)
    throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

   Prodotto prodotto;

   prodotto=new Prodotto(nome,descrizione,prezzo,tipo);
   prodotto.insert(database);
   return prodotto;

  }
  
  public static Prodotto getProdotto(DataBase database, String nome)
    throws NotFoundDBException,ResultSetDBException {

    Prodotto prodotto=null;

    String sql=" SELECT * " +
                "   FROM CATALOGO " +
                " WHERE " +
                "   NOME = '" + util.Conversion.getDatabaseString(nome)+"'";
    
    ResultSet resultSet = database.select(sql);
    
    try {
      if (resultSet.next())
        prodotto=new Prodotto(resultSet);
      resultSet.close();
    } catch (SQLException ex) {
      throw new ResultSetDBException("ProdottoService: getProdotto():  ResultSetDBException: "+ex.getMessage(), database);
    }
    return prodotto;

  } 
  
  public static Vector getProdotti(DataBase database,String tipo) 
    throws NotFoundDBException,ResultSetDBException {
    Prodotto prodotto;
    Vector prodotti=new Vector();  
    String sql ="";
    
    sql=" SELECT * FROM CATALOGO "  +
       " WHERE "+
       " TIPO='"+Conversion.getDatabaseString(tipo)+"'";
  
    
        
    
    ResultSet resultSet=database.select(sql);        
    
    try {
      util.Debug.println("Carico i prodotti:");
      while (resultSet.next()) {
        prodotto=new Prodotto(resultSet);
        prodotti.add(prodotto);
        util.Debug.println(prodotto.nome);
      }             
      
    } catch (SQLException ex) {
      throw new ResultSetDBException("ProdottoService: getProdotti():  Errore nel ResultSet: "+ex.getMessage(),database);
    }

    return prodotti;

  }
  
} 
