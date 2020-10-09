package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.ProductDAO;
import danhnlc.dtos.Product;
import danhnlc.dtos.ProductError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.INSERT_PRODUCT_PAGE.getAction();

        String productID = request.getParameter("txtProductID");
        String productName = request.getParameter("txtProductName");
        float price = Float.parseFloat(request.getParameter("txtPrice"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));

        ProductError errorProduct = new ProductError("", "", "", "");
        boolean check = true;
        if (productID.isEmpty()) {
            errorProduct.setProductIDError("ProductID can not empty!");
            check = false;
        }
        if (productName.isEmpty()) {
            errorProduct.setProductNameError("ProductName can not empty!");
            check = false;
        }
        if (request.getParameter("txtPrice").isEmpty()) {
            errorProduct.setPriceError("Price can not empty");
            check = false;
        }
        if (request.getParameter("txtQuantity").isEmpty()) {
            errorProduct.setQuantity("Quantity can not empty");
            check = false;
        }
        try {
            if (check) {
                Product product = new Product(productID, productName, price, quantity);
                ProductDAO dao = new ProductDAO();
                if(dao.create(product)) {
                    url = ActionPage.PRODUCT.getAction();
                }
            } else {
                request.setAttribute("ERROR", errorProduct);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                errorProduct.setProductIDError("Duplicated productID!");
                request.setAttribute("ERROR", errorProduct);
            }
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
