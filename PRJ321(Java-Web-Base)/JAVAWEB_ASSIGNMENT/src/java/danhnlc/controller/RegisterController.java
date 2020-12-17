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

public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.SIGNUP_PAGE.getAction();
        HttpSession session = request.getSession();
        session.setAttribute("ERROR_TITLE", null);
        try {
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String roleID = request.getParameter("role");

            UserError error = new UserError("", "", "", "", "", "", "");
            boolean check = true;

            if (!username.matches("^[a-zA-Z][\\w]{4,19}$")) {
                error.setUsernameError("Not a valid username.");
                check = false;
            }
            if (!fullname.matches("^[a-zA-Z ]{3,30}$")) {
                error.setFullnameError("It only includes 'aphabet & space' and name of length is 3-30 character");
                check = false;
            }
            if (email.contains("!#$%^&*") || email.matches("^[0-9][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$")) {
                error.setEmailError("Not include speacial charaters, and not begin number character.");
                check = false;
            }

            if (check) {
                UserDAO dao = new UserDAO();
                User user = new User(username, fullname, password, email, phone, address, roleID);
                session.setAttribute("ERROR", error);
                if (dao.register(user)) {
                    request.setAttribute("SUCCESS", "SUCCESS!!!");
                }
            } else {
                session.setAttribute("ERROR", error);
                session.setAttribute("ERROR_TITLE", "FAILED!!!");
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                session.setAttribute("ERROR_TITLE", "FAILED!!!");
                request.setAttribute("DUPLICATE", "Username is duplicated.");
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
