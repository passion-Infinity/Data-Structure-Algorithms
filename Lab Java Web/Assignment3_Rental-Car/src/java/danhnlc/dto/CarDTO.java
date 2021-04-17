package danhnlc.dto;

import java.sql.Timestamp;

public class CarDTO {

    private int id, carType, quantity, seat;
    private String name, image, color, status;
    private float price;
    private String typeName;
    private Timestamp pickupDate, dropoutDate;
    private int discount;

    public CarDTO() {
    }

    public CarDTO(int id, int quantity, String name, String image, float price, String typeName) {
        this.id = id;
        this.quantity = quantity;
        this.name = name;
        this.image = image;
        this.price = price;
        this.typeName = typeName;
    }

    public CarDTO(int id, int carType, int quantity, int seat, String name, String image, String color, String status, float price) {
        this.id = id;
        this.carType = carType;
        this.quantity = quantity;
        this.seat = seat;
        this.name = name;
        this.image = image;
        this.color = color;
        this.status = status;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarType() {
        return carType;
    }

    public void setCarType(int carType) {
        this.carType = carType;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
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

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

}
