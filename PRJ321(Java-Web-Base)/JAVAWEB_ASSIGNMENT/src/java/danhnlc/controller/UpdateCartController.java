package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.dtos.Cart;
import danhnlc.dtos.RoomCart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR.getAction();
        try {
            String roomID = request.getParameter("roomID");
            int quantity = Integer.parseInt(request.getParameter("quantity_cart"));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                for (RoomCart roomCart : cart.getCart().values()) {
                    if (roomCart.getRoom().getRoomID().equals(roomID)) {
                        cart.update(roomCart, quantity);
                        break;
                    }
                }
                session.setAttribute("CART", cart);
                url = ActionPage.VIEW_CART_PAGE.getAction();
            }
        } catch (NumberFormatException e) {
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
