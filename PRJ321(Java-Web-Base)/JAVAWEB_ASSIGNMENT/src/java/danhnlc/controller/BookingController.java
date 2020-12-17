package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomDAO;
import danhnlc.dtos.Room;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class BookingController extends HttpServlet {
    
    Logger logger = Logger.getLogger(BookingController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR.getAction();
        try {
            String date1 = request.getParameter("dateFrom");
            String date2 = request.getParameter("dateTo");
            if (date1 != null && date2 != null && !date1.equals("") && !date2.equals("")) {
                HttpSession session = request.getSession();
                session.setAttribute("DATE1", date1);
                session.setAttribute("DATE2", date2);
                
                RoomDAO dao = new RoomDAO();
                List<Room> listSearch = dao.getList(date1, date2);
                if (listSearch != null) {
                    request.setAttribute("LIST_ROOM", listSearch);
                }
            } else {
                request.setAttribute("MESSAGE", "PLEASE CHOOSE DATE TO MAKE RESERVATION!");
            }
            url = ActionPage.BOOKING_PAGE.getAction();
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
