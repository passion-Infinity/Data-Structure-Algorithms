package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomTypeDAO;
import danhnlc.dtos.RoomType;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateRoomTypeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.TABLE_ROOM_TYPE_PAGE.getAction();
        try {
            HttpSession session = request.getSession();
            session.setAttribute("UPDATE_SUCCESS", null);
            ArrayList<RoomType> listRoomTypes = (ArrayList<RoomType>) session.getAttribute("LIST_ROOMTYPE");
            if (listRoomTypes != null) {
                String[] list = request.getParameterValues("update");
                if (list != null) {
                    String typeName = request.getParameter("roomTypeName");
                    String description = request.getParameter("description");
                    RoomTypeDAO dao = new RoomTypeDAO();
                    RoomType roomType = null;
                    for (String x : list) {
                        for (RoomType dto : listRoomTypes) {
                            if (dto.getTypeID().equals(x)) {
                                roomType = new RoomType(dto.getTypeID(), typeName, description);
                                break;
                            }
                        }
                        dao.update(roomType);
                    }
                    request.setAttribute("UPDATE_SUCCESS", "Update successfully!");
                }
                url = ActionPage.LOAD_TABLE_ROOM_TYPE.getAction();
            }
        } catch (Exception e) {
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
