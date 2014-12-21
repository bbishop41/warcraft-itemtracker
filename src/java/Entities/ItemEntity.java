package Entities;

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
    private String charName, itemName, itemID, dateLooted, spec, bonusIdList;

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
}
