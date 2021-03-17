package danhnlc.controller;

import danhnlc.enumm.ActionPage;
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
        String url = "";
        try {
            String action = request.getParameter("btnAction");
            if ("Login".equals(action)) {
                url = ActionPage.LOGIN.getAction();
            } else if ("Login_Page".equals(action)) {
                url = ActionPage.LOGIN_PAGE.getAction();
            } else if ("Logout".equals(action)) {
                url = ActionPage.LOGOUT.getAction();
            } else if ("Create_Page".equals(action)) {
                url = ActionPage.CREATE_PAGE.getAction();
            } else if ("Create_Product".equals(action)) {
                url = ActionPage.CREATE_PRODUCT.getAction();
            } else if ("Delete_Product".equals(action)) {
                url = ActionPage.DELETE_PRODUCT.getAction();
            } else if ("Update_Product".equals(action)) {
                url = ActionPage.UPDATE_PRODUCT.getAction();
            } else if ("Update_Page".equals(action)) {
                url = ActionPage.UPDATE_PAGE.getAction();
            } else if ("Add_To_Cart".equals(action)) {
                url = ActionPage.ADD_TO_CART.getAction();
            } else if ("Show_Detail_Product".equals(action)) {
                url = ActionPage.SHOW_DETAIL.getAction();
            } else if ("Search".equals(action)) {
                url = ActionPage.SEARCH.getAction();
            } else if ("Admin_Product_List_Page".equals(action)) {
                url = ActionPage.ADMIN_PRODUCT_LIST_PAGE.getAction();
            } else if ("Admin_Index_Page".equals(action)) {
                url = ActionPage.ADMIN_INDEX_PAGE.getAction();
            } else if ("View_Cart_Page".equals(action)) {
                url = ActionPage.VIEW_CART_PAGE.getAction();
            } else if ("Delete_Cart".equals(action)) {
                url = ActionPage.DELETE_PRODUCT_CART.getAction();
            } else if ("Update_Cart".equals(action)) {
                url = ActionPage.UPDATE_PRODUCT_CART.getAction();
            } else if ("Check_Out".equals(action)) {
                url = ActionPage.CHECKOUT.getAction();
            } else if ("Load_History".equals(action)) {
                url = ActionPage.LOAD_HISTORY.getAction();
            } else if ("Product_Manager_Page".equals(action)) {
                url = ActionPage.PRODUCT_MANAGEMENT_PAGE.getAction();
            } else if ("Edit".equals(action)) {
                url = ActionPage.EDIT.getAction();
            } else if ("Detail_Page".equals(action)) {
                url = ActionPage.DETAIL_PAGE.getAction();
            } else if ("Add_Cart_After_Login".equals(action)) {
                url = ActionPage.ADD_CART_LOGIN.getAction();
            } else if ("Count_Product_Cart".equals(action)) {
                url = ActionPage.COUNT_PRODUCT_CART.getAction();
            } else if ("Load_Order_History".equals(action)) {
                url = ActionPage.LOAD_HISTORY.getAction();
            } else if ("Load_OrderDetail_History".equals(action)) {
                url = ActionPage.LOAD_HISTORY_ORDERTAIL.getAction();
            }
        } catch (Exception e) {
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
