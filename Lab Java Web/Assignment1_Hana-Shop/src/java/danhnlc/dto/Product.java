package danhnlc.dto;

import java.util.Date;

public class Product {

    private String productCode;
    private String productName;
    private String description;
    private String image;
    private int quantity;
    private float price;
    private boolean status;
    private Date createdDate;
    private String createdBy;
    private Date modifiedDate;
    private String modifiedBy;

    public Product() {
    }

    public Product(String productCode, String productName, String description, String image, int quantity, float price) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
    }

    public Product(String productCode, String productName, String description, String image, int quantity, float price, boolean status) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
    }

    public Product(String productCode, String productName, String description, String image, int quantity, float price, boolean status, Date createdDate, String createdBy) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
    }

    public Product(String productCode, String productName, String description, String image, int quantity, float price, Date modifiedDate, String modifiedBy, boolean status) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
        this.status = status;
    }

    public Product(String productCode, String productName, String description, String image, int quantity, float price, boolean status, Date createdDate, String createdBy, Date modifiedDate, String modifiedBy) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
    }
    
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
}
