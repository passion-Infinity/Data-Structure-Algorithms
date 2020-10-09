/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.dtos;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Product implements Serializable {

    private String productID;
    private String productName;
    private float price;
    private int quantity;

    public Product() {
    }
    
    public Product(String productID, String productName, float price) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
    }

    public Product(String productID, String productName, float price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
