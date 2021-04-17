package danhnlc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private final static String LOGIN = "LoginController";
    private final static String LOGIN_PAGE = "login.jsp";
    private final static String LOGOUT = "LogoutController";
    private final static String SEARCH = "SearchController";
    private final static String REGISTER = "RegisterController";
    private final static String REGISTER_PAGE = "register.jsp";
    private final static String VIEWCART_PAGE = "viewCart.jsp";
    private final static String ADDCART = "AddToCartController";
    private final static String DELETECART = "DeleteCartController";
    private final static String UPDATECART = "UpdateCartController";
    private final static String ACTIVATE_ACCOUNT = "ActivateAccountController";
    private final static String HISTORY_PAGE = "history.jsp";
    private final static String GETHISTORY = "GetOrderHistoryController";
    private final static String CHECKOUT = "CheckoutController";
    private final static String AJAX = "GetListOrderDetailController";
    private final static String DELETE_ORDER = "DeleteOrderController";
    private final static String CAR_DETAIL = "GetCarDetailController";
    private final static String CAR_DETAIL_PAGE = "carDetail.jsp";
    private final static String ERROR_PAGE = "error-404.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("btnAction");
            if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Login_Page".equals(action)) {
                url = LOGIN_PAGE;
            } else if ("Register".equals(action)) {
                url = REGISTER;
            } else if ("Register_Page".equals(action)) {
                url = REGISTER_PAGE;
            } else if ("View_Cart_Page".equals(action)) {
                url = VIEWCART_PAGE;
            } else if ("AddToCart".equals(action)) {
                url = ADDCART;
            } else if ("Delete_Cart".equals(action)) {
                url = DELETECART;
            } else if ("Update_Cart".equals(action)) {
                url = UPDATECART;
            } else if ("getActiveCode".equals(action)) {
                url = ACTIVATE_ACCOUNT;
            } else if ("Error".equals(action)) {
                url = ERROR_PAGE;
            } else if ("ViewHistory".equals(action)) {
                url = HISTORY_PAGE;
            } else if ("GetHistory".equals(action)) {
                url = GETHISTORY;
            } else if ("Check_Out".equals(action)) {
                url = CHECKOUT;
            } else if ("GetListOrderDetail".equals(action)) {
                url = AJAX;
            } else if ("Delete_Order".equals(action)) {
                url = DELETE_ORDER;
            } else if ("GetCarDetail".equals(action)) {
                url = CAR_DETAIL;
            } else if ("ViewCarDetail".equals(action)) {
                url = CAR_DETAIL_PAGE;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
