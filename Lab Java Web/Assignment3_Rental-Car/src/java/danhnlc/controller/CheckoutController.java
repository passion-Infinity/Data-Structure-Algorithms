package danhnlc.controller;

import danhnlc.dao.CarDAO;
import danhnlc.dao.OrderDAO;
import danhnlc.dao.OrderDetailDAO;
import danhnlc.dto.Cart;
import danhnlc.dto.CustomerDTO;
import danhnlc.dto.OrderDTO;
import danhnlc.dto.OrderDetailDTO;
import danhnlc.dto.ProductCart;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "CountProductCartController";
        try {

            Cart cart = (Cart) request.getSession().getAttribute("CART");
            CarDAO carDAO = new CarDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            boolean check = true;
            boolean flag = false; // dùng để phân biệt sử dụng  2 thông báo lỗi tới người dùng
            String code = "";
            int quantity = 0;

            // kiểm tra số lượng trên giỏ hàng so với số lượng trong kho
            for (ProductCart productCart : cart.getCart().values()) {
                int checkQuantity = carDAO.getQuantityOfCarById(String.valueOf(productCart.getProduct().getId()));
                if (productCart.getQuantity() > checkQuantity) {
                    check = false;
                    code = productCart.getProduct().getName();
                    quantity = checkQuantity;
                    break;
                }
            }

            if (check) {
                CustomerDTO customerDTO = (CustomerDTO) request.getSession().getAttribute("customer");
                String email = customerDTO.getEmail();

                String total = request.getParameter("txtTotal");

                String nowStr = String.valueOf(LocalDate.now());
                Timestamp now = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(nowStr).getTime());

                /////////////////////////// Beign recode
                ArrayList<String> listFailure = new ArrayList<>();
                boolean valid = true;
                for (ProductCart productCart : cart.getCart().values()) {
                    if (orderDetailDAO.getQuantityOfAbleRent(productCart.getProduct().getId(),
                            productCart.getProduct().getPickupDate(),
                            productCart.getProduct().getDropoutDate()) >= productCart.getQuantity()) {
                        continue;
                    }
                    String failure = String.valueOf(productCart.getProduct().getId())
                            + orderDetailDAO.formatDate(productCart.getProduct().getPickupDate())
                            + orderDetailDAO.formatDate(productCart.getProduct().getDropoutDate());
                    listFailure.add(failure);
                    valid = false;
                }

                if (valid) {
                    //Tạo hóa đơn
                    Date date = new Date();
                    String orderId = "" + date.getTime();
                    OrderDTO orderDTO = new OrderDTO(orderId, email, now, Float.parseFloat(total));
                    OrderDAO orderDAO = new OrderDAO();
                    if (orderDAO.createOrder(orderDTO)) {

                        //Tạo chi tiết hóa đơn cho hóa đơn
                        for (ProductCart productCart : cart.getCart().values()) {
                            if (orderDetailDAO.getQuantityOfAbleRent(productCart.getProduct().getId(),
                                    productCart.getProduct().getPickupDate(),
                                    productCart.getProduct().getDropoutDate()) >= productCart.getQuantity()) {

                                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(0, orderId, productCart.getProduct().getId(),
                                        productCart.getProduct().getPrice(), productCart.getProduct().getPickupDate(),
                                        productCart.getProduct().getDropoutDate(), productCart.getQuantity(), productCart.getProduct().getDiscount());

                                if (orderDetailDAO.createOrder(orderDetailDTO)) {
                                    flag = true;
                                }
                            } else {
                                flag = false;
                                String failure = String.valueOf(productCart.getProduct().getId())
                                        + orderDetailDAO.formatDate(productCart.getProduct().getPickupDate())
                                        + orderDetailDAO.formatDate(productCart.getProduct().getDropoutDate());
                                listFailure.add(failure);
                            }
                        }
                    }
                    
                    if (listFailure.size() > 0) {
                        flag = false;
                    }

                    if (flag) {
                        request.getSession().setAttribute("CART", null);
                        request.setAttribute("checkout_failure", null);
                        request.setAttribute("listFailure", null);
                        request.setAttribute("success", "success");
                    } else {
                        request.setAttribute("fail", "fail");
                        request.setAttribute("listFailure", listFailure);
                        orderDetailDAO.DeleteOrderDetail(orderId);
                        orderDAO.deleteOrderByCheckoutFail(orderId);
                    }
                } else {
                    request.setAttribute("listFailure", listFailure);
                }

                ////////////////////////// end recode
                /*
                
                //Tạo hóa đơn
                Date date = new Date();
                String orderId = "" + date.getTime();
                OrderDTO orderDTO = new OrderDTO(orderId, email, now, Float.parseFloat(total));
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.createOrder(orderDTO);

                ArrayList<String> listRemove = new ArrayList<>();
                //Tạo chi tiết hóa đơn cho hóa đơn
                for (ProductCart productCart : cart.getCart().values()) {
                    if (orderDetailDAO.getQuantityOfAbleRent(productCart.getProduct().getId(),
                            productCart.getProduct().getPickupDate(),
                            productCart.getProduct().getDropoutDate()) >= productCart.getQuantity()) {

                        OrderDetailDTO orderDetailDTO = new OrderDetailDTO(0, orderId, productCart.getProduct().getId(),
                                productCart.getProduct().getPrice(), productCart.getProduct().getPickupDate(),
                                productCart.getProduct().getDropoutDate(), productCart.getQuantity(), productCart.getProduct().getDiscount());

                        orderDetailDAO.createOrder(orderDetailDTO);

                        String key = String.valueOf(productCart.getProduct().getId())
                                + orderDetailDAO.formatDate(productCart.getProduct().getPickupDate())
                                + orderDetailDAO.formatDate(productCart.getProduct().getDropoutDate());
                        listRemove.add(key);

                    } else {
                        flag = false;
                    }
                }

                // Tất cả oto đều in hóa đơn thành công
                if (flag) {
                    request.getSession().setAttribute("CART", null);
                    request.setAttribute("checkout_failure", null);
                    request.setAttribute("success", "success");
                } else {
                    //Xóa những oto đã dc in hóa đơn
                    if (!listRemove.isEmpty()) {
                        for (String key : listRemove) {
                            cart.getCart().remove(key);
                        }
                        request.getSession().setAttribute("CART", cart);
                        request.setAttribute("success_half", "success");//xac nhận hóa đơn 1 vài sản phẩm
                    } else {
                        request.setAttribute("fail", "fail");
                    }
                }

                 */
            } else {
                request.setAttribute("checkout_failure", "Số lượng xe " + code.toUpperCase() + " đã vượt số lượng trong kho."
                        + "\nKho hiện tại còn: " + quantity + " chiếc");
            }

        } catch (Exception e) {
            log("Error at CheckoutController: " + e.getMessage());
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
