package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.RoomDAO;
import danhnlc.dtos.Room;
import danhnlc.dtos.RoomError;
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
public class InsertRoomController extends HttpServlet {
    
    Logger logger = Logger.getLogger(InsertRoomController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = url = ActionPage.CREATE_ROOM_PAGE.getAction();
        RoomError error = new RoomError("", "", "", "", "", "", "");
        try {
            String roomID = request.getParameter("roomID");
            String typeID = request.getParameter("cmbRoom");
            String roomName = request.getParameter("roomName");
            int roomFloor = Integer.parseInt(request.getParameter("roomFloor"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String price = request.getParameter("price");
            int number = Integer.parseInt(request.getParameter("numberOfPersons"));
            boolean status = Boolean.parseBoolean(request.getParameter("cmbStatus"));

            boolean check = true;
            if (!price.matches("^[0-9]+\\.?[0-9]+$") || price.matches("^-[0-9]+\\.?[0-9]+$")) {
                error.setPriceError("Price is not valid!");
                check = false;
            }

            if (check) {
                //xu ly anh
                String folder = "image";
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + folder;
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                Part part = request.getPart("file");
//            String fileName = extractFileName(part);
//            fileName = new File(fileName).getName();
                String fileName = part.getSubmittedFileName();
                String path = folder + File.separator + fileName;
                InputStream is = part.getInputStream();
                Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
//            part.write(uploadPath + File.separator + fileName);

                RoomDAO dao = new RoomDAO();
                Room room = new Room(roomID, typeID, roomName, roomFloor, quantity, Float.parseFloat(price), number, path, status);
                if (dao.create(room)) {
                    request.setAttribute("CREATE_SUCCESS", "SUCCESS!!!");
                    request.setAttribute("ROOM", room);
                    url = ActionPage.LOAD_TABLE_ROOM.getAction();
                }
            } else {
                request.setAttribute("ERROR", error);
            }
        } catch (Exception e) {
            logger.error(e);
            if (e.getMessage().contains("duplicate")) {
                error.setRoomIDError("Duplicated Room ID!");
                request.setAttribute("ERROR", error);
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
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
