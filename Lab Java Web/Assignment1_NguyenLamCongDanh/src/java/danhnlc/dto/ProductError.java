package danhnlc.dto;

public class ProductError {

    private String productCodeError;
    private String productNameError;
    private String descriptionError;
    private String imageError;
    private String quantityError;
    private String priceError;

    public ProductError() {
    }

    public ProductError(String productCodeError, String productNameError, String descriptionError, String imageError, String quantityError, String priceError) {
        this.productCodeError = productCodeError;
        this.productNameError = productNameError;
        this.descriptionError = descriptionError;
        this.imageError = imageError;
        this.quantityError = quantityError;
        this.priceError = priceError;
    }

    public String getProductCodeError() {
        return productCodeError;
    }

    public void setProductCodeError(String productCodeError) {
        this.productCodeError = productCodeError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    
}
