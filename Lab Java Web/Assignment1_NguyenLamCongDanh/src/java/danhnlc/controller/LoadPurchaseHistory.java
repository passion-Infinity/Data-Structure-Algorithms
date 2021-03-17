package danhnlc.controller;

import danhnlc.dao.OrderDAO;
import danhnlc.dao.OrderDetailDAO;
import danhnlc.dao.ProductDAO;
import danhnlc.dto.Order;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadPurchaseHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.HISTORY_PAGE.getAction();
        try {
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }

            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();

            OrderDAO orderDAO = new OrderDAO();
  
            int indexPage = Integer.parseInt(index);
            int endPage = orderDAO.getNumberPage(userID, 3);
            List<Order> list = orderDAO.getOrderListByUserID(userID, search, indexPage, 3);
            
            if (list != null) {
                session.setAttribute("LIST_ORDER", list);
                session.setAttribute("END_PAGE_ORDER", endPage);
                request.setAttribute("INDEX_PAGE_ORDER", index);
                request.setAttribute("SEARCH", search);
                url = ActionPage.HISTORY_PAGE.getAction();
            } 
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
