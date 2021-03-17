package danhnlc.controller;

import danhnlc.dao.ProductDAO;
import danhnlc.dto.Cart;
import danhnlc.dto.Product;
import danhnlc.dto.ProductCart;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProductCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String productCode = request.getParameter("productCode");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();

            int checkQuantity = dao.getQuantityOfProduct(productCode);
            if (checkQuantity < Integer.parseInt(quantity)) {
                request.setAttribute("message_addCart_failure", "failure");
            } else {
                Product product = dao.getProduct(productCode);
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    for (ProductCart productCart : cart.getCart().values()) {
                        if (productCart.getProduct().getProductCode().equals(productCode)) {
                            cart.update(productCart, Integer.parseInt(quantity));
                            //       
                            List<Product> list = (List<Product>) session.getAttribute("LIST");
                            for (Product x : list) {
                                if (x.getProductCode().equals(productCart.getProduct().getProductCode())) {
                                    x.setQuantity(product.getQuantity() - Integer.parseInt(quantity));
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    session.setAttribute("CART", cart);
                    url = ActionPage.VIEW_CART_PAGE.getAction();
                }
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
