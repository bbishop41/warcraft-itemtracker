/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import DBConnectionHandler.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author BrentB
 */
public class Member {
    
    public void InsertMember(String name, String className) throws SQLException {
        String sql = "INSERT INTO members (charName, className, isApproved) VALUES (?,?,1)";
        Connection con = new DBConnect().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, className);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
    
    public void DeleteMember(String name) throws SQLException {
        String sql = "DELETE FROM members WHERE charName ='" + name + "'";
        Connection con = new DBConnect().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
