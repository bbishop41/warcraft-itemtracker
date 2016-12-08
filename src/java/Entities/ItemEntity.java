package Entities;

import DBConnectionHandler.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author BrentB
 */
public class ItemEntity {
    private int itemEntry;
    private String charName, itemName, itemID, dateLooted, spec, bonusIdList, dungeon;

    public int getItemEntry() {
        return itemEntry;
    }

    public void setItemEntry(int itemEntry) {
        this.itemEntry = itemEntry;
    }

    public String getCharName() {
        return charName;
    }

    public void setCharName(String charName) {
        this.charName = charName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getDateLooted() {
        return dateLooted;
    }

    public void setDateLooted(String dateLooted) {
        this.dateLooted = dateLooted;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getBonusIdList() {
        return bonusIdList;
    }

    public void setBonusIdList(String bonusIdList) {
        this.bonusIdList = bonusIdList;
    }
    
    public String getDungeon() {
        return dungeon;
    }
    
    public void setDungeon(String d){
        this.dungeon = d;
    }
    
    public ArrayList<ItemEntity> getLootedItems() throws SQLException{
        try{
            Connection con = new DBConnect().getConnection();
            String sql = "SELECT * FROM obsidiumloot.looteditems order by dateTimeLooted DESC limit 50";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<ItemEntity> results = new ArrayList();
            ItemEntity item;
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
            ps.close();
            con.close();
            return results;
        }catch(SQLException e){
            return null;
        }
    }
    
    public ArrayList<ItemEntity> getRecentItems() throws SQLException{
        try{
            Connection con = new DBConnect().getConnection();
            String sql = "SELECT * FROM obsidiumloot.looteditems order by dateTimeLooted DESC limit 10";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<ItemEntity> results = new ArrayList();
            ItemEntity item;
            while(rs.next()){
                item = new ItemEntity();
                item.setItemEntry(rs.getInt("itemEntry"));
                item.setCharName(rs.getString("charName"));
                item.setItemName(rs.getString("itemName"));
                item.setItemID(rs.getString("itemID"));
                item.setDateLooted(rs.getString("dateTimeLooted"));
                item.setSpec(rs.getString("spec"));
                item.setBonusIdList(rs.getString("bonusIdList"));
                item.setDungeon("dungeon");
                results.add(item);
            }
            ps.close();
            con.close();
            return results;
        }catch(SQLException e){
            return null;
        }
    }
    
    public void deleteItems(String[] items) throws SQLException{
        try{
            Connection con = new DBConnect().getConnection();
            PreparedStatement ps = null;
            
            for (int i=0; i < items.length; i++){
                String sql = "DELETE FROM obsidiumloot.looteditems WHERE itemEntry = " + items[i];
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }
            
            ps.close();
            con.close();
        }catch(SQLException e){
            
        }
    }
}
