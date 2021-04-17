package danhnlc.controller;

import danhnlc.dao.OrderDAO;
import danhnlc.dao.OrderDetailDAO;
import danhnlc.dao.ProductDAO;
import danhnlc.dto.Cart;
import danhnlc.dto.Order;
import danhnlc.dto.OrderDetail;
import danhnlc.dto.Product;
import danhnlc.dto.ProductCart;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.VIEW_CART_PAGE.getAction();
        HashMap<String, Integer> list = new HashMap<>();
        HttpSession session = request.getSession();
        try {
            
            Cart cart = (Cart) session.getAttribute("CART");

            boolean check = true;
            String code = "";
            String name = "";
            int q = 0;

            ProductDAO productDAO = new ProductDAO();
            for (ProductCart productCart : cart.getCart().values()) {
                int quantity = productDAO.getQuantityOfProduct(productCart.getProduct().getProductCode());
                if (productCart.getQuantity() > quantity) {
                    check = false;
                    code = productCart.getProduct().getProductCode();
                    name = productCart.getProduct().getProductName();
                    q = quantity;
                    break;
                }
                // Tạo ra 1 list lưu giá trị productCode và số lượng hiện tại trong giỏ hàng để lấy sản phẩm đó dưới db cập nhật lại số lượng
                list.put(productCart.getProduct().getProductCode(), productCart.getQuantity());
            }

            //
            if (check) {
                User user = (User) session.getAttribute("LOGIN_USER");
                String total = request.getParameter("total");
                
                //Update quantity of product
                for (Map.Entry<String, Integer> entry : list.entrySet()) {
                    String key = entry.getKey();
                    Integer value = entry.getValue();
                    Product product = productDAO.getProduct(key);
                    int quantity = product.getQuantity() - value;
                    productDAO.updateQuantityOfProduct(quantity, key);
                }
                
                // Get date current
                long millis = System.currentTimeMillis();
                java.sql.Date now = new java.sql.Date(millis);

                //Create order
                Date date = new Date();
                String orderID = "" + date.getTime();
                Order order = new Order(orderID, user, now, Float.parseFloat(total));
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.createOrder(order);
                
                //Create orderDetail
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                for (Map.Entry<String, ProductCart> ds : cart.getCart().entrySet()) {
                    ProductCart prod = ds.getValue();
                    OrderDetail orderDetail = new OrderDetail(0, order, prod.getProduct(), prod.getQuantity(), prod.getProduct().getPrice());
                    orderDetailDAO.createOrderDetail(orderDetail);
                }
                session.setAttribute("CART", null);
                request.setAttribute("MESSAGE", "Check-out successfully. Hanna Shop thank you to buy product here. See you again!");

            } else {
                request.setAttribute("MESSAGE", "Product" + name + "(" + code + ") " + "has not enough quantity in storage that has only " + q);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.setAttribute("REAL_TIME", null);
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
