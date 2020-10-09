package danhnlc.dtos;

import java.io.Serializable;

public class ProductCart implements Serializable {

    private Product productCart;
    private int quantity;

    public ProductCart() {
    }

    public ProductCart(Product productCart) {
        this.productCart = productCart;
        this.quantity = 1;
    }

    public Product getProductCart() {
        return productCart;
    }

    public void setProductCart(Product productCart) {
        this.productCart = productCart;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
