package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.UserDAO;
import danhnlc.dtos.User;
import danhnlc.dtos.UserError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateUserController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.TABLE_USER_PAGE.getAction();
        try {
            HttpSession session = request.getSession();
            session.setAttribute("UPDATE_SUCCESS", null);
            session.setAttribute("ERROR_TITLE", null);
            session.setAttribute("ERROR", null);
            
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String role = request.getParameter("role");
            
            UserError error = new UserError("", "", "", "", "", "", "");
            boolean check = true;
            if (fullname.isEmpty()) {
                error.setFullnameError("Fullname can not empty!");
                check = false;
            }
            if (email.isEmpty()) {
                error.setEmailError("Email can not empty!");
                check = false;
            }
            if (phone.isEmpty()) {
                error.setPhoneError("Phone can not empty!");
            }
            if (address.isEmpty()) {
                error.setAddressError("Address can not empty!");
                check = false;
            }
            if (role.isEmpty()) {
                error.setRoleIDError("Role can not empty!");
                check = false;
            }
            if (!role.equals("CUS") && !role.equals("MA")) {
                error.setRoleIDError("RoleID is only 'CUS' or 'MA'!");
                check = false;
            }
            
            if (check) {
                UserDAO dao = new UserDAO();
                User user = new User(username, fullname, "", email, phone, address, role);
                if (dao.update(user)) {
                    request.setAttribute("UPDATE_SUCCESS", "SUCCESS!!!");
                    session.setAttribute("ERROR", error);
                    url = ActionPage.LOAD_TABLE_USER.getAction();
                }
            } else {
                session.setAttribute("ERROR", error);
                session.setAttribute("ERROR_TITLE", "Update failed!!!");
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
