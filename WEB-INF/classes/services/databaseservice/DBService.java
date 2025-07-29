
package services.databaseservice;

import java.sql.*;

import global.*;
import services.databaseservice.exception.*;

public class DBService extends Object {
  
  public DBService() {}

  public static synchronized DataBase getDataBase() throws NotFoundDBException {

     try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();//sun.jdbc.odbc.JdbcOdbcDriver
        Connection connection = DriverManager.getConnection(Constants.DB_CONNECTION_STRING, Constants.DB_USER_NAME, Constants.DB_PASSWORD);               
        return new DataBase(connection);
      } catch (Exception e) {
        throw new NotFoundDBException("DBService: Impossibile creare la Connessione al DataBase: " + e);
      }
    }

    


}