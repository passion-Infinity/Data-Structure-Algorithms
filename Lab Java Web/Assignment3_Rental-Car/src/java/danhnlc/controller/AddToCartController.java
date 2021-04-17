package danhnlc.controller;

import danhnlc.dao.CarDAO;
import danhnlc.dao.DiscountDAO;
import danhnlc.dto.CarDTO;
import danhnlc.dto.Cart;
import danhnlc.dto.DiscountDTO;
import danhnlc.dto.ProductCart;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            HttpSession session = request.getSession();
            CarDAO carDAO = new CarDAO();
            String carId = request.getParameter("txtCarId");
            String amountOfCar = request.getParameter("txtQuantity");
            String pickupDate = (String) session.getAttribute("pickupDate");
            String dropoutDate = (String) session.getAttribute("dropoutDate");
            Timestamp pickup = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(pickupDate).getTime());
            Timestamp dropout = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(dropoutDate).getTime());
            String discountCode = request.getParameter("txtDiscount");
            String discount = "0";
            if (!discountCode.isEmpty()) {
                DiscountDAO discountDAO = new DiscountDAO();
                DiscountDTO discountDTO = discountDAO.getDiscount(carId, discountCode, pickupDate, dropoutDate);
                if(discountDTO != null) {
                    discount = discountDTO.getValue();
                }
            }

            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart(carId, null);
            }

            int quantityOfCart = 0;
            if (cart.getCart() != null) {
                for (ProductCart x : cart.getCart().values()) {
                    if (x.getProduct().getId() == Integer.parseInt(carId)
                            && carDAO.formatDate(x.getProduct().getPickupDate()).equals(carDAO.formatDate(pickup))
                            && carDAO.formatDate(x.getProduct().getDropoutDate()).equals(carDAO.formatDate(dropout))) {
                        quantityOfCart = x.getQuantity();
                        break;
                    }
                }
            }

            int checkQuantity = carDAO.getQuantityOfCarById(carId);
            if (checkQuantity == 0 || checkQuantity <= quantityOfCart || Integer.parseInt(amountOfCar) <= quantityOfCart) {
                request.setAttribute("message_addCart_failure", "failure");
            } else {

                String carName = request.getParameter("txtCarName");
                String typeName = request.getParameter("txtTypeName");
                String image = request.getParameter("txtImage");
                String price = request.getParameter("txtPrice");
                String quantity = request.getParameter("txtQuantity");

                CarDTO product = new CarDTO(Integer.parseInt(carId), Integer.parseInt(quantity),
                        carName, image, Float.parseFloat(price), typeName);

                product.setPickupDate(pickup);
                product.setDropoutDate(dropout);
                product.setDiscount(Integer.parseInt(discount));

                ProductCart productCart = new ProductCart(product);

                cart.add(productCart);

                session.setAttribute("CART", cart);

                session.setAttribute("COUNT", "count");
            }

            url = "SearchController";

        } catch (Exception e) {
            log("Error at AddToCartController: " + e.getMessage());
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
