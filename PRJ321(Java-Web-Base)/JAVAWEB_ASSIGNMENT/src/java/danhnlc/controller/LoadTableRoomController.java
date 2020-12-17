package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomDAO;
import danhnlc.daos.RoomTypeDAO;
import danhnlc.dtos.Room;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class LoadTableRoomController extends HttpServlet {
    
    Logger logger = Logger.getLogger(LoadTableRoomController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.TABLE_ROOM_PAGE.getAction();
        try {
            HttpSession session = request.getSession();
            session.setAttribute("CREATE_SUCCESS", request.getAttribute("CREATE_SUCCESS"));
            session.setAttribute("ROOM", request.getAttribute("ROOM"));
            session.setAttribute("UPDATE_SUCCESS", request.getAttribute("UPDATE_SUCCESS"));
            session.setAttribute("DELETE_SUCCESS", request.getAttribute("DELETE_SUCCESS"));
            
            RoomDAO dao = new RoomDAO();
            List<Room> listRooms = dao.getList();
            RoomTypeDAO dao1 = new RoomTypeDAO();
            List<String> listRoomType = dao1.getTypeID();
            session.setAttribute("LIST_TYPE", listRoomType);
            session.setAttribute("LIST_ROOM", listRooms);
        } catch (Exception e) {
            logger.error(e);
        } finally {
            response.sendRedirect(url);
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
