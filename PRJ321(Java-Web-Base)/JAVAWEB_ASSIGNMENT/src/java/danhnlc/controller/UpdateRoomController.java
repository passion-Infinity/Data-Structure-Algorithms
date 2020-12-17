package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomDAO;
import danhnlc.dtos.Room;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.log4j.Logger;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateRoomController extends HttpServlet {
    
    Logger logger = Logger.getLogger(UpdateRoomController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.TABLE_ROOM_PAGE.getAction();
        try {
            String roomID = request.getParameter("roomID");
            String typeID = request.getParameter("typeID");
            String roomName = request.getParameter("roomName");
            String image = request.getParameter("image");
            int roomFloor = Integer.parseInt(request.getParameter("roomFloor"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int number = Integer.parseInt(request.getParameter("numberOfPersons"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            boolean check = true;
            if (!request.getParameter("price").matches("^[0-9]+\\.?[0-9]+$")) {
                request.setAttribute("ERROR", "fail");
                check = false;
            }

            if (check) {
                float price = Float.parseFloat(request.getParameter("price"));
                String folder = "image";
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + folder;
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                String path = folder + File.separator + fileName;
                InputStream is = part.getInputStream();

                if (path.equals(folder + File.separator)) {
                    path = image;
                } else {
                    Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
                }

                RoomDAO dao = new RoomDAO();
                Room room = new Room(roomID, typeID, roomName, roomFloor, quantity, price, number, path, status);
                if (dao.update(room)) {
                    request.setAttribute("UPDATE_SUCCESS", "SUCCESS!!!");
                    url = ActionPage.LOAD_TABLE_ROOM.getAction();
                }
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
