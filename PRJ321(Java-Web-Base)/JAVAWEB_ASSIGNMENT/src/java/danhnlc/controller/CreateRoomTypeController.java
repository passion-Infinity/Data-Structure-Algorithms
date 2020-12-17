package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomTypeDAO;
import danhnlc.dtos.RoomType;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateRoomTypeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.TABLE_ROOM_TYPE_PAGE.getAction();
        try {
            String typeID = request.getParameter("roomTypeID");
            String typeName = request.getParameter("roomTypeName");
            String description = request.getParameter("description");
            RoomTypeDAO dao = new RoomTypeDAO();
            RoomType roomType = new RoomType(typeID, typeName, description);
            if (dao.isnert(roomType)) {
                request.setAttribute("MESSAGE_CREATE_ROOMTYPE", "Create successfully!");
                url = ActionPage.LOAD_TABLE_ROOM_TYPE.getAction();
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                request.setAttribute("MESSAGE_CREATE_ROOMTYPE", "RoomType is duplicated. Please try again!");
            }
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
