
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

public class UtenteService extends Object {

    public UtenteService() {}
  
  public static Utente insertNewUtente(DataBase database,String firstname,String surname,
                                       String via,String telefono,String datanascita,
                                       String codeLanguage, String userCode,String password)
    throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

   Utente utente;

   utente=new Utente(firstname,surname,via,telefono,datanascita,codeLanguage,userCode,password);
   utente.insert(database);
   return utente;

  }
  
  public static Utente getUtente(DataBase database, String userCode)
    throws NotFoundDBException,ResultSetDBException {

    Utente utente=null;

    String sql=" SELECT * " +
                "   FROM UTENTI " +
                " WHERE " +
                "   CD_USER = '" + util.Conversion.getDatabaseString(userCode)+"'";
    
    ResultSet resultSet = database.select(sql);
    
    try {
      if (resultSet.next())
        utente=new Utente(resultSet);
      resultSet.close();
    } catch (SQLException ex) {
      throw new ResultSetDBException("UtenteService: getUser():  ResultSetDBException: "+ex.getMessage(), database);
    }
    return utente;

  }
  
     public static Utente getUtente(DataBase database, String userCode, String password)
    throws NotFoundDBException,ResultSetDBException {

    Utente user=null;

    String sql=" SELECT * " +
                "   FROM UTENTI" +
                " WHERE " +
                "   CD_USER = '" + util.Conversion.getDatabaseString(userCode)+"'"+
                " AND PWD = '" + util.Conversion.getDatabaseString(password)+"' ";
                

    ResultSet resultSet = database.select(sql);
    
    try {
      if (resultSet.next())
        user=new Utente(resultSet);
        
      resultSet.close();
    } catch (SQLException ex) {
      throw new ResultSetDBException("UserService: getUser():  ResultSetDBException: "+ex.getMessage(), database);
    }
    return user;

  }
}  
  