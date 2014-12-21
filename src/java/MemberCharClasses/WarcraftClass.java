/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MemberCharClasses;

import DBConnectionHandler.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author BrentB
 */
public class WarcraftClass {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public WarcraftClass() throws SQLException{
        
    }
    
    public ArrayList<String> getClassMembers(String className) throws SQLException{
        try{
            con = new DBConnect().getConnection();
            String sql = "SELECT * FROM members WHERE className = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, className);
            rs = ps.executeQuery();
            ArrayList<String> results = new ArrayList();
            while(rs.next()){
                results.add(rs.getString("charName"));
            }
            return results;
        }catch(SQLException e){
            return null;
        }finally{
            close(con, rs, ps);
        }
    }
    
    private void close(Connection connection, ResultSet rs, PreparedStatement stmt) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (Exception ex) {
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception ex) {
            } finally {
                try {
                    if (connection != null) {
                        connection.close();
                    }
                } catch (Exception ex) {
                }
            }
        }
    }
}
