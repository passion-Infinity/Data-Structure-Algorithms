package danhnlc.dtos;

import java.sql.Timestamp;

public class OrderDetail {

    private int orderDetailID;
    private Order order;
    private Room room;
    private float price;
    private Timestamp checkIn;
    private Timestamp checkOut;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, Order order, Room room, float price, Timestamp checkIn, Timestamp checkOut) {
        this.orderDetailID = orderDetailID;
        this.order = order;
        this.room = room;
        this.price = price;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Timestamp getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Timestamp checkIn) {
        this.checkIn = checkIn;
    }

    public Timestamp getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Timestamp checkOut) {
        this.checkOut = checkOut;
    }

   

}
