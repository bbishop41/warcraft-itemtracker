/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnectionHandler;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
/**
 *
 * @author BrentB
 */
public class DBConnect {
    
    DataSource ds;
    Connection con;

    
    public DBConnect() throws SQLException{
        try{
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MySQLDS");
            con = ds.getConnection();
            
        }catch (NamingException e){
            e.printStackTrace();
        }
    }   
    
    public Connection getConnection(){
        return this.con;
    }
    
    public void close() throws SQLException{
        this.con.close();
    }
}

