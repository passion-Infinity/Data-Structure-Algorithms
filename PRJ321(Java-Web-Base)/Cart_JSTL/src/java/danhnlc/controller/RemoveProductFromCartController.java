package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.dtos.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveProductFromCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.SHOWCART_PAGE.getAction();
        try {
            String[] list = request.getParameterValues("remove");
            if (list != null) {
                HttpSession session = request.getSession();
                Cart shop = (Cart) session.getAttribute("SHOP");
                if (shop != null) {
                    for (String x : list) {
                        shop.removeProductCart(x);
                    }
                    session.setAttribute("SHOP", shop);
                }
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
