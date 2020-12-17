package danhnlc.common;

public enum ActionPage {
    ERROR("error.html"),
    LOGIN("LoginController"),
    LOGOUT("LogoutController"),
    LOAD_TABLE_USER("LoadTableUserController"),
    LOAD_TABLE_ROOM("LoadTableRoomController"),
    LOAD_TABLE_ROOM_TYPE("LoadTableRoomTypeController"),
    REGISTER("RegisterController"),
    UPDATE_USER("UpdateUserController"),
    DELETE_USER("DeleteUserController"),
    INSERT_ROOM("InsertRoomController"),
    CREATE_ROOMTYPE("CreateRoomTypeController"),
    UPDATE_ROOM("UpdateRoomController"),
    UPDATE_ROOMTYPE("UpdateRoomTypeController"),
    DELETE_ROOM("DeleteRoomController"),
    DELETE_ROOMTYPE("DeleteRoomTypeController"),
    BOOKING("BookingController"),
    ADDTOCART("AddToCartController"),
    UPDATECART("UpdateCartController"),
    DELETECART("DeleteCartController"),
    CHECKOUT("CheckOutController"),
    GETPASSWORD("GetPasswordController"),
    SIGNUP_PAGE("signup.jsp"),
    LOGIN_PAGE("login.jsp"),
    HOME_PAGE("home.jsp"),
    ADMIN_PAGE("admin.jsp"),
    INDEX_PAGE("index.jsp"),
    TABLE_USER_PAGE("table-user.jsp"),
    TABLE_ROOM_PAGE("table-room.jsp"),
    CREATE_ROOM_PAGE("create-room.jsp"),
    TABLE_ROOM_TYPE_PAGE("table-roomType.jsp"),
    TABLE_ROLE_PAGE("table-role.jsp"),
    ADMIN_REGISTER_PAGE("admin_signup.jsp"),
    BOOKING_PAGE("booking.jsp"),
    VIEW_CART_PAGE("view-cart.jsp");
    
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
