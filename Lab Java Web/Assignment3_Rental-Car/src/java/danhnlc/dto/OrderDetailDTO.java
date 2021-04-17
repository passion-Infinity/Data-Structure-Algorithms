package danhnlc.dto;

import java.sql.Timestamp;

public class OrderDetailDTO {

    private int id, carId;
    private String orderId;
    private float price;
    private Timestamp pickupDate, dropoutDate;
    private int quantity;
    private int discount;
    private CarDTO car;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int id, String orderId, int carId, float price, Timestamp pickupDate, Timestamp dropoutDate, int quantity) {
        this.id = id;
        this.orderId = orderId;
        this.carId = carId;
        this.price = price;
        this.pickupDate = pickupDate;
        this.dropoutDate = dropoutDate;
        this.quantity = quantity;
    }
    
    public OrderDetailDTO(int id, String orderId, int carId, float price, Timestamp pickupDate, Timestamp dropoutDate, int quantity, int discount) {
        this.id = id;
        this.orderId = orderId;
        this.carId = carId;
        this.price = price;
        this.pickupDate = pickupDate;
        this.dropoutDate = dropoutDate;
        this.quantity = quantity;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Timestamp getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(Timestamp pickupDate) {
        this.pickupDate = pickupDate;
    }

    public Timestamp getDropoutDate() {
        return dropoutDate;
    }

    public void setDropoutDate(Timestamp dropoutDate) {
        this.dropoutDate = dropoutDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public CarDTO getCar() {
        return car;
    }

    public void setCar(CarDTO car) {
        this.car = car;
    }
 
}
