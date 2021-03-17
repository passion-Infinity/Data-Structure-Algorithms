package danhnlc.dto;

import java.util.Date;

public class Order {

    private String orderID;
    private User user;
    private Date createdDate;
    private float total;

    public Order() {
    }

    public Order(String orderID, User user, Date createdDate, float total) {
        this.orderID = orderID;
        this.user = user;
        this.createdDate = createdDate;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    
}
