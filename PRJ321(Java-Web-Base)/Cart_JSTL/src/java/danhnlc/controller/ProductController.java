package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.ProductDAO;
import danhnlc.dtos.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.PRODUCT_MANAGEMENT_PAGE.getAction();
        HttpSession session = request.getSession();
        if (session.getAttribute("ROLE").equals("user")) {
            url = ActionPage.PRODUCT_SHOPPING_PAGE.getAction();
        }
        try {
            ProductDAO dao = new ProductDAO();
            List<Product> list = dao.getAll();
            if (list != null) {
                request.setAttribute("PLIST", list);
            }
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
