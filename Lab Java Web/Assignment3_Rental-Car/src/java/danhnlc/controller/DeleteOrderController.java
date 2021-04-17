
package danhnlc.controller;

import danhnlc.dao.OrderDAO;
import danhnlc.dao.OrderDetailDAO;
import danhnlc.dto.OrderDetailDTO;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "MainController?btnAction=GetHistory";
        try {
            String orderId = request.getParameter("txtOrderId");
            String date = request.getParameter("txtDate");
            Timestamp orderDay = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
            
            boolean check = true;
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            List<OrderDetailDTO> listOrderDetail = orderDetailDAO.getListByOrderId(orderId);
            for(OrderDetailDTO dto : listOrderDetail) {
                if(orderDay.after(dto.getPickupDate()) || orderDay.equals(dto.getPickupDate())) {
                    check = false;
                    break;
                } 
            }
            
            if(check) {
                orderDAO.deleteOrder(orderId);
                request.setAttribute("success", "success");
            } else {
                request.setAttribute("failure", "failure");
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
