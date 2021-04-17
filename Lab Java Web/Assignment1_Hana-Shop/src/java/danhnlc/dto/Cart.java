package danhnlc.dto;

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

    public void add(ProductCart productCart) {
        if (this.cart == null) {
            cart = new HashMap<>();
        }
        String key = productCart.getProduct().getProductCode();
        if (cart.containsKey(key)) {
            int quantity = this.cart.get(key).getQuantity();
            productCart.setQuantity(quantity + 1);
            cart.replace(key, productCart);
        } else {
            cart.put(productCart.getProduct().getProductCode(), productCart);
        }
        
    }

    public void update(ProductCart productCart, int quantity) {
        if (cart != null) {
            String key = productCart.getProduct().getProductCode();
            if (this.cart.containsKey(key)) {
                productCart.setQuantity(quantity);
                cart.replace(key, productCart);
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
