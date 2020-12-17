package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.dtos.Cart;
import danhnlc.dtos.Room;
import danhnlc.dtos.RoomCart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class AddToCartController extends HttpServlet {
    
    Logger logger = Logger.getLogger(AddToCartController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR.getAction();
        try {
            String roomID = request.getParameter("roomID");
            String typeID = request.getParameter("typeID");
            String roomName = request.getParameter("roomName");
            String image = request.getParameter("image");
            int roomFloor = Integer.parseInt(request.getParameter("roomFloor"));
            int num = Integer.parseInt(request.getParameter("num"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));

            Room room = new Room(roomID, typeID, roomName, roomFloor, quantity, price, num, image, false);
            RoomCart roomCart = new RoomCart(room);

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart(roomID, null);
            }
            cart.add(roomCart);
            session.setAttribute("CART", cart);
            request.setAttribute("MESSAGE_SUCCESS", "You just added to cart a room " + room.getRoomName() + " successful!");
            url = ActionPage.BOOKING.getAction();
        } catch (NumberFormatException e) {
            logger.error(e);
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
