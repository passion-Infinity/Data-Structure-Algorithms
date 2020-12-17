package danhnlc.dtos;

import java.io.Serializable;

public class Room implements Serializable{

    private String roomID;
    private String typeID;
    private String roomName;
    private int roomFloor;
    private int quantity;
    private float price;
    private int numberOfPersons;
    private String image;
    private boolean status;

    public Room() {
    }

    public Room(String roomID, String typeID, String roomName, int roomFloor, int quantity, float price, int numberOfPersons, String image, boolean status) {
        this.roomID = roomID;
        this.typeID = typeID;
        this.roomName = roomName;
        this.roomFloor = roomFloor;
        this.quantity = quantity;
        this.price = price;
        this.numberOfPersons = numberOfPersons;
        this.image = image;
        this.status = status;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getTypeID() {
        return typeID;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(int roomFloor) {
        this.roomFloor = roomFloor;
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

    public int getNumberOfPersons() {
        return numberOfPersons;
    }

    public void setNumberOfPersons(int numberOfPersons) {
        this.numberOfPersons = numberOfPersons;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
