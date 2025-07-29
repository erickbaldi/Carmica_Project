/*
 * Catalogo.java
 *
 * Created on 21 marzo 2006, 11.07
 */

package blogics;

import java.sql.*;

import util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

/*
 *
 * @author  Erick Baldi e Riccardo Fiocchi
 */
public class Prodotto {

        public String nome;
        public String descrizione;
        public double prezzo;
        public String tipo;

        public Prodotto(String nome, String descrizione, double prezzo, String tipo) {

        this.nome=nome;
        this.descrizione=descrizione;
        this.prezzo=prezzo;
        this.tipo=tipo;
        }

        public Prodotto(ResultSet resultSet) {


        try {nome=resultSet.getString("NOME");} catch (SQLException sqle) {}
        try {descrizione=resultSet.getString("DESCRIZIONE");} catch (SQLException sqle) {}
        try {prezzo=resultSet.getDouble("PREZZO");} catch (SQLException sqle) {}
        try {tipo=resultSet.getString("TIPO");} catch (SQLException sqle) {}
        }


   public void insert(DataBase database)
   throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String sql="";

        /* check di unicita */
        sql+= " SELECT * "+
              "   FROM CATALOGO "+
              " WHERE " +
              "   NOME='"+Conversion.getDatabaseString(nome)+"' ";

        ResultSet resultSet=database.select(sql);

        boolean exist=false;

        try {
          exist=resultSet.next();
          resultSet.close();
        } catch (SQLException e) {
          throw new ResultSetDBException("Prodotto: insert(): Errore sul ResultSet.");
        }

        if (exist)
        {
          throw new DuplicatedRecordDBException("Prodotto: insert(): Tentativo di inserimento di un prodotto gia esistente.");
          
        }


        /*  inserimento nuovo prodotto */


        sql=" INSERT INTO CATALOGO "+
                 "("+
                 "NOME,DESCRIZIONE,PREZZO,TIPO"+
                 ")"+
            " VALUES ("+

             "'"+Conversion.getDatabaseString(nome)+"',"+
             "'"+Conversion.getDatabaseString(descrizione)+"',"+
             ""+prezzo+","+
             "'"+Conversion.getDatabaseString(tipo)+"'"+
             ")";

        database.modify(sql);

  }
 
 public void update(DataBase database) 
    throws NotFoundDBException,ResultSetDBException{
    util.Debug.println("Sto modificando il prodotto selezionato: "+nome+prezzo+descrizione);
    
    String sql="";
    
    
    ResultSet resultSet=null;
    
    sql=" UPDATE CATALOGO "+
        " SET "+
        "   DESCRIZIONE = '"+Conversion.getDatabaseString(descrizione)+"', "+
        "   PREZZO = "+prezzo+", "+
        "   TIPO = '"+Conversion.getDatabaseString(tipo)+"' "+
        " WHERE "+
        "   NOME = '"+Conversion.getDatabaseString(nome)+"' ";
    
    database.modify(sql);
        
  }

  public void delete(DataBase database)
  throws NotFoundDBException,ResultSetDBException {

    String sql;

    sql=" DELETE FROM CATALOGO "+
        " WHERE "+
        " NOME='"+Conversion.getDatabaseString(nome)+"'";

    database.modify(sql);

  }

}