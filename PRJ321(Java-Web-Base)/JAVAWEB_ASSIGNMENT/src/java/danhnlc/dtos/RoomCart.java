package danhnlc.dtos;

public class RoomCart {

    private Room room;
    private int quantity;

    public RoomCart() {
    }

    public RoomCart(Room room) {
        this.room = room;
        this.quantity = 1;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
