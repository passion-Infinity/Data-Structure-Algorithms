package danhnlc.dto;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class Cart {

    private String customerName;
    private Map<String, ProductCart> cart;

    public Cart() {
    }

    public Cart(String customerName, Map<String, ProductCart> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Map<String, ProductCart> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductCart> cart) {
        this.cart = cart;
    }
    
    public String formatDate(Timestamp date) {
        String s = String.valueOf(date);
        String[] strs = s.split(" ");
        return strs[0];
    }

    public void add(ProductCart productCart) {
        if (this.cart == null) {
            cart = new HashMap<>();
        }
        String pick = formatDate(productCart.getProduct().getPickupDate());
        String drop = formatDate(productCart.getProduct().getDropoutDate());
        String a = String.valueOf(productCart.getProduct().getId()) + pick + drop;
        String key = String.valueOf(a);
        if (cart.containsKey(key)) {
            Timestamp pickupDate = this.cart.get(key).getProduct().getPickupDate();
            Timestamp dropoutDate = this.cart.get(key).getProduct().getDropoutDate();
            if (pick.equals(formatDate(pickupDate)) && drop.equals(formatDate(dropoutDate))) {
                int quantity = this.cart.get(key).getQuantity();
                productCart.setQuantity(quantity + 1);
                cart.replace(key, productCart);
            }
            cart.put(key, productCart);
        } else {
            cart.put(key, productCart);
        }

    }

    public void update(ProductCart productCart, int quantity) {
        if (cart != null) {
            String a = String.valueOf(productCart.getProduct().getId()) + formatDate(productCart.getProduct().getPickupDate())
                + formatDate(productCart.getProduct().getDropoutDate());
            String key = String.valueOf(a);
            if (this.cart.containsKey(key)) {
                productCart.setQuantity(quantity);
                cart.replace(key, productCart);
            }
        }
    }

    public void delete(String key) {
        if (cart != null) {
            if (cart.containsKey(key)) {
                cart.remove(key);
            }
        }
    }
}
