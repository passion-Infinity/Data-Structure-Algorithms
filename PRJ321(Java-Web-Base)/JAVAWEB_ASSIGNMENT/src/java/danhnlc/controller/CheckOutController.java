package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.OrderDAO;
import danhnlc.daos.OrderDetailDAO;
import danhnlc.daos.RoomDAO;
import danhnlc.daos.UserDAO;
import danhnlc.dtos.Cart;
import danhnlc.dtos.Order;
import danhnlc.dtos.OrderDetail;
import danhnlc.dtos.RoomCart;
import danhnlc.dtos.User;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class CheckOutController extends HttpServlet {

    Logger logger = Logger.getLogger(CheckOutController.class);
    HashMap<String, Integer> hs = null;

    private String formatDate(String date) {
        String result = "";
        String[] s = date.split("-");
        for (int i = s.length - 1; i >= 0; i--) {
            if (i == 0) {
                result += s[i];
            } else {
                result += s[i] + "/";
            }
        }
        return result;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR.getAction();
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");

            boolean check = true;
            RoomDAO roomDAO = new RoomDAO();
            for (RoomCart roomCart : cart.getCart().values()) {
                int temp = roomDAO.checkQuantity(roomCart.getRoom().getRoomID());
                if (roomCart.getQuantity() > temp) {
                    check = false;
                    if (hs == null) {
                        hs = new HashMap<>();
                    }
                    hs.put(roomCart.getRoom().getRoomName(), temp);
                }
            }

            if (check) {
                User user = (User) session.getAttribute("LOGIN_USER");
                float total = Float.parseFloat(request.getParameter("total"));
                String checkIn = formatDate((String) session.getAttribute("DATE1"));
                String checkOut = formatDate((String) session.getAttribute("DATE2"));
                Date dateCheckIn = new SimpleDateFormat("dd/MM/yyyy").parse(checkIn);
                Date dateCheckOut = new SimpleDateFormat("dd/MM/yyyy").parse(checkOut);
                Date date = new Date();
                String orderID = "" + date.getTime();

                Order order = new Order(orderID, user, new Timestamp(new Date().getTime()), total);
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.insertOrder(order);

                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                for (Map.Entry<String, RoomCart> ds : cart.getCart().entrySet()) {
                    RoomCart value = ds.getValue();
                    OrderDetail orderDetail = new OrderDetail(0, order, value.getRoom(), total,
                            new Timestamp(dateCheckIn.getTime()), new Timestamp(dateCheckOut.getTime()));
                    orderDetailDAO.insertOrderDetail(orderDetail);
//                    roomDAO.updateStautsRoom(ds.getValue().getRoom().getRoomID());
                }
                request.setAttribute("MESSAGE", "Check-out success!!!");
                url = ActionPage.VIEW_CART_PAGE.getAction();
                UserDAO userDAO = new UserDAO();
                userDAO.confirmCheckOut(user.getEmail());
                session.setAttribute("CART", null);
            } else {
                session.setAttribute("UNVALID_LIST", hs);
            }
        } catch (Exception e) {
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
