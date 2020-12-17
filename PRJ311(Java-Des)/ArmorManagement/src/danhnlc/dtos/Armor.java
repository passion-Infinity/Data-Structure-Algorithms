/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.dtos;

import java.io.Serializable;
import java.util.Date;
import java.util.Vector;

/**
 *
 * @author User
 */
public class Armor implements Serializable {

    private String armorID;
    private String classification;
    private String description;
    private String status;
    private Date timeOfCreate;
    private int defense;

    public Armor() {
    }

    public Armor(String armorID, String classification, String description, String status, Date timeOfCreate, int defense) {
        this.armorID = armorID;
        this.classification = classification;
        this.description = description;
        this.status = status;
        this.timeOfCreate = timeOfCreate;
        this.defense = defense;
    }
    
    

    public Vector toVector() {
        Vector v = new Vector();
        v.add(armorID);
        v.add(classification);
        v.add(timeOfCreate);
        v.add(defense);
        return v;
    }

    public String getArmorID() {
        return armorID;
    }

    public void setArmorID(String armorID) {
        this.armorID = armorID;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getTimeOfCreate() {
        return timeOfCreate;
    }

    public void setTimeOfCreate(Date timeOfCreate) {
        this.timeOfCreate = timeOfCreate;
    }

    public int getDefense() {
        return defense;
    }

    public void setDefense(int defense) {
        this.defense = defense;
    }

}
