package danhnlc.controller;

import danhnlc.common.ActionPage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class MainController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "error404.jsp";
        try {
            String action = request.getParameter("btnAction");
            if ("Login_Page".equals(action)) {
                url = ActionPage.LOGIN_PAGE.getAction();
            } else if ("Login".equals(action)) {
                url = ActionPage.LOGIN.getAction();
            } else if ("Register".equals(action)) {
                url = ActionPage.REGISTER.getAction();
            } else if ("Signup_Page".equals(action)) {
                url = ActionPage.SIGNUP_PAGE.getAction();
            } else if ("Logout".equals(action)) {
                url = ActionPage.LOGOUT.getAction();
            } else if ("Delete_user".equals(action)) {
                url = ActionPage.DELETE_USER.getAction();
            } else if ("Load_table_user".equals(action)) {
                url = ActionPage.LOAD_TABLE_USER.getAction();
            } else if ("Update_user".equals(action)) {
                url = ActionPage.UPDATE_USER.getAction();
            } else if ("Admin_signup_page".equals(action)) {
                url = ActionPage.ADMIN_REGISTER_PAGE.getAction();
            } else if ("Load_table_room".equals(action)) {
                url = ActionPage.LOAD_TABLE_ROOM.getAction();
            } else if ("Load_table_roomType".equals(action)) {
                url = ActionPage.LOAD_TABLE_ROOM_TYPE.getAction();
            } else if ("Delete_roomType".equals(action)) {
                url = ActionPage.DELETE_ROOMTYPE.getAction();
            } else if ("Update_roomType".equals(action)) {
                url = ActionPage.UPDATE_ROOMTYPE.getAction();
            } else if ("Create_roomType".equals(action)) {
                url = ActionPage.CREATE_ROOMTYPE.getAction();
            } else if ("InsertRoomPage".equals(action)) {
                url = ActionPage.CREATE_ROOM_PAGE.getAction();
            } else if ("Create_room".equals(action)) {
                url = ActionPage.INSERT_ROOM.getAction();
            } else if ("Delete_room".equals(action)) {
                url = ActionPage.DELETE_ROOM.getAction();
            } else if ("Update_room".equals(action)) {
                url = ActionPage.UPDATE_ROOM.getAction();
            } else if ("Add_to_cart".equals(action)) {
                url = ActionPage.ADDTOCART.getAction();
            } else if ("Update_cart".equals(action)) {
                url = ActionPage.UPDATECART.getAction();
            } else if ("Delete_cart".equals(action)) {
                url = ActionPage.DELETECART.getAction();
            } else if ("View_cart".equals(action)) {
                url = ActionPage.VIEW_CART_PAGE.getAction();
            } else if ("Check_out".equals(action)) {
                url = ActionPage.CHECKOUT.getAction();
            } else if ("ForgotPassword".equals(action)) {
                url = ActionPage.GETPASSWORD.getAction();
            } else if ("Search".equals(action)) {
                url = ActionPage.BOOKING.getAction();
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
