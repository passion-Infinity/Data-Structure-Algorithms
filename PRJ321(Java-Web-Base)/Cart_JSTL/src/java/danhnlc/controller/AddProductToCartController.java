package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.dtos.Cart;
import danhnlc.dtos.Product;
import danhnlc.dtos.ProductCart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddProductToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.PRODUCT_SHOPPING_PAGE.getAction();
        try {
            HttpSession session = request.getSession();
            Cart shop = (Cart) session.getAttribute("SHOP");
            if (shop == null) {
                shop = new Cart();
            }
            String productID = request.getParameter("txtProductID");
            String productName = request.getParameter("txtProductName");
            float price = Float.parseFloat(request.getParameter("txtPrice"));
            Product product = new Product(productID, productName, price);
            ProductCart productCart = new ProductCart(product);
            shop.addProductToCart(productCart);
            session.setAttribute("SHOP", shop);
            url = ActionPage.PRODUCT.getAction();
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
