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
public class Items implements Serializable {

    private String code;
    private String name;
    private String supCode;
    private String unit;
    private float price;
    private boolean supplying;
    private Suppliers supplierCode;

    public Items() {
    }

    public Items(String code, String name, String supCode, String unit, float price, boolean supplying, Suppliers supplierCode) {
        this.code = code;
        this.name = name;
        this.supCode = supCode;
        this.unit = unit;
        this.price = price;
        this.supplying = supplying;
        this.supplierCode = supplierCode;
    }

    public Vector toVector() {
        Vector v = new Vector();
        v.add(code);
        v.add(name);
        v.add(supplierCode);
        v.add(unit);
        v.add(price);
        v.add(supplying);
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

    public Suppliers getSupplierCode() {
        return supplierCode;
    }

    public void setSupplierCode(Suppliers supplierCode) {
        this.supplierCode = supplierCode;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isSupplying() {
        return supplying;
    }

    public void setSupplying(boolean supplying) {
        this.supplying = supplying;
    }

    public String getSupCode() {
        return supCode;
    }

    public void setSupCode(String supCode) {
        this.supCode = supCode;
    }

}
