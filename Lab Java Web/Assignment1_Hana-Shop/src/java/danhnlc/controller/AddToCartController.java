package danhnlc.controller;

import danhnlc.dao.ProductDAO;
import danhnlc.dto.Cart;
import danhnlc.dto.Product;
import danhnlc.dto.ProductCart;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.List;
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
            //Get request from client
            String productCode = request.getParameter("productCode");
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart(productCode, null);
            }
            ProductDAO productDAO = new ProductDAO();

            int quantityOfCart = 0;
            if (cart.getCart() != null) {
                for (ProductCart x : cart.getCart().values()) {
                    if (x.getProduct().getProductCode().equals(productCode)) {
                        quantityOfCart = x.getQuantity();
                        break;
                    }
                }
            }
            
            int quantityOfProductDB = productDAO.getQuantityOfProduct(productCode);
            if (quantityOfProductDB == 0 || quantityOfProductDB <= quantityOfCart) {
                request.setAttribute("message_addCart_failure", "failure");
            } else {

                String productName = request.getParameter("productName");
                String description = request.getParameter("description");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                String image = request.getParameter("image");

                //set model
                Product product = new Product(productCode, productName, description, image, Integer.parseInt(quantity), Float.parseFloat(price));

                //
                session.setAttribute("PRODUCT", product);
                User user = (User) session.getAttribute("LOGIN_USER");

                if (user == null || !"member".equals(user.getRole())) {
                    url = ActionPage.LOGIN_PAGE.getAction();
                } else {
                    ProductCart productCart = new ProductCart(product);

                    cart.add(productCart);
                    session.setAttribute("CART", cart);
                    url = ActionPage.SEARCH.getAction();

                    //
                    int newQuantity = product.getQuantity() - 1;
                    List<Product> list = (List<Product>) session.getAttribute("LIST");
                    for (Product x : list) {
                        if (x.getProductCode().equals(product.getProductCode())) {
                            x.setQuantity(newQuantity);
                        }
                    }
                    session.setAttribute("REAL_TIME", list);
                }
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
