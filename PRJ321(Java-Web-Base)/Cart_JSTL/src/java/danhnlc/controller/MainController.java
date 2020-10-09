package danhnlc.controller;

import danhnlc.common.ActionPage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR_PAGE.getAction();
        try {
            String action = request.getParameter("btnAction");
            String ac = request.getParameter("action");
            if ("Login".equals(action)) {
                url = ActionPage.LOGIN.getAction();
            } else if ("User_register".equals(action)) {
                url = ActionPage.USER_REGISTER_PAGE.getAction();
            } else if ("Staffs Management".equals(action)) {
                url = ActionPage.STAFF_MANAGEMENT_PAGE.getAction();
            } else if ("Search".equals(action)) {
                url = ActionPage.SEARCH.getAction();
            } else if ("Admin_register".equals(action)) {
                url = ActionPage.ADMIN_REGISTER_PAGE.getAction();
            } else if ("Register".equals(action)) {
                url = ActionPage.REGISTER.getAction();
            } else if ("Delete".equals(action)) {
                url = ActionPage.DELETE_STAFF.getAction();
            } else if ("Update".equals(action)) {
                url = ActionPage.UPDATE_STAFF.getAction();
            } else if ("Logout".equals(action)) {
                url = ActionPage.LOGOUT.getAction();
            } else if ("Product Management".equals(action)) {
                url = ActionPage.PRODUCT.getAction();
            } else if ("Update".equals(ac)) {
                url = ActionPage.UPDATE_PRODUCT.getAction();
            } else if ("Delete".equals(ac)) {
                url = ActionPage.DELETE_PRODUCT.getAction();
            } else if ("Create New Product".equals(ac)) {
                url = ActionPage.INSERT_PRODUCT_PAGE.getAction();
            } else if ("Create".equals(ac)) {
                url = ActionPage.INSERT_PRODUCT.getAction();
            } else if ("LoadData".equals(action)) {
                url = ActionPage.PRODUCT.getAction();
            } else if ("Add to Cart".equals(action)) {
                url = ActionPage.ADD_PRODUCT_TO_CART.getAction();
            } else if("View Cart".equals(action)) {
                url = ActionPage.SHOWCART_PAGE.getAction();
            } else if("Add more".equals(action)) {
                url = ActionPage.PRODUCT.getAction();
            } else if("Remove".equals(action)) {
                url = ActionPage.REMOVE_PRODUCT_FROM_CART.getAction();
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
