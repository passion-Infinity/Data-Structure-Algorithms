package danhnlc.dto;

public class ProductCart {

    private CarDTO product;
    private int quantity;

    public ProductCart() {
    }

    public ProductCart(CarDTO product) {
        this.product = product;
        this.quantity = 1;
    }

    public CarDTO getProduct() {
        return product;
    }

    public void setProduct(CarDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
