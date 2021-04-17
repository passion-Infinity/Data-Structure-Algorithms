package danhnlc.controller;

import danhnlc.dao.CarDAO;
import danhnlc.dao.FeedBackDAO;
import danhnlc.dao.OrderDetailDAO;
import danhnlc.dto.CarDTO;
import danhnlc.dto.CustomerDTO;
import danhnlc.dto.FeedBackDTO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCarDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = "";
        try {
            CarDAO carDAO = new CarDAO();
            FeedBackDAO feedBackDAO = new FeedBackDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            String carId = request.getParameter("txtCarId");
            String comment = request.getParameter("txtComment");
            if(comment == null) {
                comment = "";
            }
            CustomerDTO customerDTO = (CustomerDTO) request.getSession().getAttribute("customer");
            long millis = System.currentTimeMillis();
            Timestamp now = new Timestamp(millis);

            if (!comment.isEmpty()) {
                if (orderDetailDAO.checkRentedCarByEmail(customerDTO.getEmail(), carId)) {
                    FeedBackDTO feedBackDTO = new FeedBackDTO(0, Integer.parseInt(carId),
                            customerDTO.getEmail(), comment, now);
                    feedBackDAO.insertFeedBack(feedBackDTO);
                }
            }

            CarDTO carDTO = carDAO.getCarById(Integer.parseInt(carId));
            List<FeedBackDTO> listFeedBack = feedBackDAO.getListFeedBack(carId);
            if(listFeedBack.isEmpty()) {
                request.setAttribute("emptyList", "empty");
            }
            request.setAttribute("carDTO", carDTO);
            request.setAttribute("listFeedBack", listFeedBack);
            url = "MainController?btnAction=ViewCarDetail";
        } catch (Exception e) {
            log("Error at GetCarDetailController:" + e.getMessage());
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
