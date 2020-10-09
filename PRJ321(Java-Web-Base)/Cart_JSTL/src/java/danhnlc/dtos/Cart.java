package danhnlc.dtos;

import java.util.HashMap;

public class Cart extends HashMap {

    public Cart() {
        super();
    }

    public void addProductToCart(ProductCart productCart) {
        String key = productCart.getProductCart().getProductID();
        if (this.containsKey(key)) {
            int oldQuantity = ((ProductCart) this.get(key)).getQuantity();
            ((ProductCart) this.get(key)).setQuantity(oldQuantity + 1);
        } else {
            this.put(productCart.getProductCart().getProductID(), productCart);
        }
    }

    public boolean removeProductCart(String productID) {
        boolean check = true;
        if (this.containsKey(productID)) {
            this.remove(productID);
            check = true;
        }
        return check;
    }
}
