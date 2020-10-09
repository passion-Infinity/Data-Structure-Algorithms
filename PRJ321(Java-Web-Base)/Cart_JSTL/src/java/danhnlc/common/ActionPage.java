package danhnlc.common;

public enum ActionPage {

    LOGIN("LoginController"),
    LOGOUT("LogoutController"),
    REGISTER("RegisterController"),
    UPDATE_STAFF("UpdateStaffController"),
    DELETE_STAFF("DeleteStaffController"),
    SEARCH("SearchController"),
    PRODUCT("ProductController"),
    INSERT_PRODUCT("InsertProductController"),
    UPDATE_PRODUCT("UpdateProductController"),
    DELETE_PRODUCT("DeleteProductController"),
    ADD_PRODUCT_TO_CART("AddProductToCartController"),
    REMOVE_PRODUCT_FROM_CART("RemoveProductFromCartController"),
    ERROR_PAGE("error.jsp"),
    ADMIN_HOME_PAGE("admin_home.jsp"),
    USER_HOME_PAGE("user_home.jsp"),
    STAFF_MANAGEMENT_PAGE("staff_management.jsp"),
    PRODUCT_MANAGEMENT_PAGE("product_management.jsp"),
    PRODUCT_SHOPPING_PAGE("product_shopping.jsp"),
    USER_REGISTER_PAGE("user_register.jsp"),
    ADMIN_REGISTER_PAGE("admin_register.jsp"),
    SHOWCART_PAGE("showCart.jsp"),
    INSERT_PRODUCT_PAGE("insertProduct.jsp");

    private String action;

    private ActionPage(String action) {
        this.action = action;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

}
