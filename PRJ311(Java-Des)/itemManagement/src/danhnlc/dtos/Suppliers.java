/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.dtos;

import java.io.Serializable;
import java.util.Vector;

/**
 *
 * @author User
 */
public class Suppliers implements Serializable {

    private String code;
    private String name;
    private String address;
    private boolean collaborating;

    public Suppliers() {
    }

    public Suppliers(String code, String name, String address, boolean collaborating) {
        this.code = code;
        this.name = name;
        this.address = address;
        this.collaborating = collaborating;
    }

    public Vector toVector() {
        Vector v = new Vector();
        v.add(code);
        v.add(name);
        v.add(address);
        return v;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isCollaborating() {
        return collaborating;
    }

    public void setCollaborating(boolean collaborating) {
        this.collaborating = collaborating;
    }

    @Override
    public String toString() {
        return this.code + "-" + this.name;
    }

}
