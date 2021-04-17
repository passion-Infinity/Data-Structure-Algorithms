package danhnlc.controller;

import danhnlc.dao.CarDAO;
import danhnlc.dao.CarTypeDAO;
import danhnlc.dto.CarDTO;
import danhnlc.dto.CarTypeDTO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }
            String typeId = request.getParameter("typeId");
            if (typeId == null) {
                typeId = "";
            }
            String pickupDate = request.getParameter("txtPickupDate");
            if (pickupDate == null) {
                pickupDate = String.valueOf(LocalDate.now());
            }
            String dropoutDate = request.getParameter("txtDropoutDate");
            if (dropoutDate == null) {
                dropoutDate = String.valueOf(LocalDate.now());
            }
            String number = request.getParameter("txtNumber");
            if (number == null) {
                number = "";
            }

            CarDAO carDAO = new CarDAO();
            CarTypeDAO carTypeDAO = new CarTypeDAO();

            int size = 3;
//            int endPage = carDAO.getNumberPages(search, pickupDate, dropoutDate, typeId, number, size);
            int endPage = carDAO.getNumberPagesTest(search, pickupDate, dropoutDate, typeId, number, size);

            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);

//            List<CarDTO> listCar = carDAO.getListCarBy(search, typeId, number, pickupDate, dropoutDate, indexPage, size);
            List<CarDTO> listCar = carDAO.getListCarByTest(search, typeId, number, pickupDate, dropoutDate, indexPage, size);
            List<CarTypeDTO> listCarType = carTypeDAO.getAllType();

            request.setAttribute("listCar", listCar);
            request.getSession().setAttribute("listCarType", listCarType);
            request.setAttribute("endPage", endPage);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("typeId", typeId);
            request.setAttribute("now", LocalDate.now());
            request.setAttribute("search", search);
            request.getSession().setAttribute("pickupDate", pickupDate);
            request.getSession().setAttribute("dropoutDate", dropoutDate);
            request.setAttribute("number", number);

            if (listCar.isEmpty()) {
                request.setAttribute("emptyList", "empty");
            }
            url = "index.jsp";
        } catch (Exception e) {
            log("Error at SearchController: " + e.getMessage());
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
