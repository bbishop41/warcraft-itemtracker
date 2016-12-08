/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SearchHandlers;

import DBConnectionHandler.DBConnect;
import Entities.ItemEntity;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BrentB
 */
public class SearchLoot {
    private DBConnect con;
    private Statement st;
    private ResultSet rs;
       
    public ArrayList<ItemEntity> getLootByMember(String sql) throws SQLException{
        try{
            con = new DBConnect();
            st = con.getConnection().createStatement();
            rs = st.executeQuery(sql);
            ArrayList<ItemEntity> results = new ArrayList();
            ItemEntity item = null;
            while(rs.next()){
                item = new ItemEntity();
                item.setItemEntry(rs.getInt("itemEntry"));
                item.setCharName(rs.getString("charName"));
                item.setItemName(rs.getString("itemName"));
                item.setItemID(rs.getString("itemID"));
                item.setDateLooted(rs.getString("dateTimeLooted"));
                item.setSpec(rs.getString("spec"));
                item.setBonusIdList(rs.getString("bonusIdList"));
                item.setDungeon(rs.getString("dungeon"));
                results.add(item);
            }
            return results;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }finally{
            if(rs != null){
                rs.close();
            }
            if(st != null){
                st.close();
            }
            if(con != null){
                con.close();
            }        
        }        
    }
    
    
     public ArrayList<ItemEntity> getLootByString(String sql) throws SQLException{
        try{
            con = new DBConnect();
            st = con.getConnection().createStatement();
            rs = st.executeQuery(sql);
            ArrayList<ItemEntity> results = new ArrayList();
            ItemEntity item = null;
            while(rs.next()){
                item = new ItemEntity();
                item.setItemEntry(rs.getInt("itemEntry"));
                item.setCharName(rs.getString("charName"));
                item.setItemName(rs.getString("itemName"));
                item.setItemID(rs.getString("itemID"));
                item.setDateLooted(rs.getString("dateTimeLooted"));
                item.setSpec(rs.getString("spec"));
                item.setBonusIdList(rs.getString("bonusIdList"));
                item.setDungeon(rs.getString("dungeon"));
                results.add(item);
            }
            return results;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }finally{
            if(rs != null){
                rs.close();
            }
            if(st != null){
                st.close();
            }
            if(con != null){
                con.close();
            }        
        }        
    }
}
