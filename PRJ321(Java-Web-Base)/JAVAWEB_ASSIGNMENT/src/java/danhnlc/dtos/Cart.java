package danhnlc.dtos;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private String customerName;
    private Map<String, RoomCart> cart;

    public Cart() {
    }

    public Cart(String customerName, Map<String, RoomCart> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public Map<String, RoomCart> getCart() {
        return cart;
    }

    public void setCart(Map<String, RoomCart> cart) {
        this.cart = cart;
    }

    public void add(RoomCart roomCart) {
        if (this.cart == null) {
            cart = new HashMap<>();
        }
        String key = roomCart.getRoom().getRoomID();
        if (cart.containsKey(key)) {
            int quantity = this.cart.get(key).getQuantity();
            roomCart.setQuantity(quantity + 1);
        } else {
            cart.put(roomCart.getRoom().getRoomID(), roomCart);
        }
    }

    public void update(RoomCart roomCart, int quantity) {
        if (cart != null) {
            String key = roomCart.getRoom().getRoomID();
            if (this.cart.containsKey(key)) {
                roomCart.setQuantity(quantity);
            }
        }
    }

    public void delete(String id) {
        if (cart != null) {
            if (cart.containsKey(id)) {
                cart.remove(id);
            }
        }
    }
}
