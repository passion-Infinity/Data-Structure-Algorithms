
package danhnlc.controller;

import danhnlc.dao.OrderDetailDAO;
import danhnlc.dao.ProductDAO;
import danhnlc.dto.Order;
import danhnlc.dto.OrderDetail;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadOrderDetailHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String orderID = request.getParameter("orderID");
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }

            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            
            HttpSession session = request.getSession();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            int endPage = orderDetailDAO.getNumberPage(orderID, 3);
            List<OrderDetail> list = orderDetailDAO.getOrderDetailHistoryList(orderID, search, indexPage, 3);
            if (list != null) {
                session.setAttribute("LIST_ORDERDETAIL", list);
                session.setAttribute("END_PAGE_ORDERDETAIL", endPage);
                request.setAttribute("INDEX_PAGE_ORDERDETAIL", index);
                request.setAttribute("SEARCH", search);
                url = ActionPage.ORDERDETAIL_HISTORY_PAGE.getAction();
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
