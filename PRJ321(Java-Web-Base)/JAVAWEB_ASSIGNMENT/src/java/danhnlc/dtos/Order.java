package danhnlc.dtos;

import java.sql.Timestamp;

public class Order {

    private String orderID;
    private User username;
    private Timestamp date;
    private float total;

    public Order() {
    }

    public Order(String orderID, User username, Timestamp date, float total) {
        this.orderID = orderID;
        this.username = username;
        this.date = date;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
