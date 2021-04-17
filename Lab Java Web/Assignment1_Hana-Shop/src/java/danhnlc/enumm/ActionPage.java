package danhnlc.enumm;

public enum ActionPage {
    ERROR_LOGIN_GOOGLE_PAGE("error.jsp"),
    LOGIN_PAGE("login.jsp"),
    LOGIN("LoginController"),
    LOGOUT("LogoutController"),
    CHECKOUT("CheckOutController"),
    LOAD_PRODUCT("LoadProductController"),
    CREATE_PRODUCT("CreateProductController"),
    DELETE_PRODUCT("DeleteProductController"),
    UPDATE_PRODUCT("UpdateProductController"),
    ADD_TO_CART("AddToCartController"),
    SHOW_DETAIL("ShowDetailController"),
    SEARCH("SearchController"),
    PAGING("PagingController"),
    DELETE_PRODUCT_CART("DeleteProductCartController"),
    UPDATE_PRODUCT_CART("UpdateProductCartController"),
    EDIT("EditController"),
    ADD_CART_LOGIN("AddCartLoginController"),
    LOAD_HISTORY("LoadPurchaseHistory"),
    LOAD_HISTORY_ORDERTAIL("LoadOrderDetailHistory"),
    COUNT_PRODUCT_CART("CountProductCart"),
    INDEX_PAGE("index.jsp"),
    ADMIN_INDEX_PAGE("admin_index.jsp"),
    PRODUCT_LIST_PAGE("productList.jsp"),
    PRODUCT_MANAGEMENT_PAGE("productManagement.jsp"),
    CREATE_PAGE("createProduct.jsp"),
    UPDATE_PAGE("updateProduct.jsp"),
    DETAIL_PAGE("detail.jsp"),
    ADMIN_PRODUCT_LIST_PAGE("productList.jsp"),
    VIEW_CART_PAGE("viewCart.jsp"),
    HISTORY_PAGE("history.jsp"),
    ORDERDETAIL_HISTORY_PAGE("historyDetail.jsp"),
    ;

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
