package danhnlc.controller;

import danhnlc.dao.CarDAO;
import danhnlc.dto.Cart;
import danhnlc.dto.ProductCart;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String carId = request.getParameter("txtCarId");
            String pickup = request.getParameter("txtPickupDate");
            String dropout = request.getParameter("txtDropoutDate");
            Timestamp p = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(pickup).getTime());
            Timestamp d = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(dropout).getTime());
            String carID = String.valueOf(carId + formatDate(p)+ formatDate(d));
            
            String quantity = request.getParameter("txtQuantity");
            CarDAO carDAO = new CarDAO();
            int checkQuantity = carDAO.getQuantityOfCarById(carId);
            if (checkQuantity < Integer.parseInt(quantity)) {
                request.setAttribute("message_updateCart_failure", "failure");
            } else {
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    for (ProductCart productCart : cart.getCart().values()) {
                        String a = String.valueOf(productCart.getProduct().getId()) + formatDate(productCart.getProduct().getPickupDate())
                + formatDate(productCart.getProduct().getDropoutDate());
                        if (String.valueOf(a).equals(carID)) {
                            cart.update(productCart, Integer.parseInt(quantity));
                            session.setAttribute("CART", cart);
                        }
                    }
                }
            }
            url = "CountProductCartController";
        } catch (Exception e) {
            log("Error at UpdateCartController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    public String formatDate(Timestamp date) {
        String s = String.valueOf(date);
        String[] strs = s.split(" ");
        return strs[0];
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
