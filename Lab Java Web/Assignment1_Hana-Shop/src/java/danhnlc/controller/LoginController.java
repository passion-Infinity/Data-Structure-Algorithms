package danhnlc.controller;

import danhnlc.dao.UserDAO;
import danhnlc.dto.User;
import danhnlc.dto.UserError;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.LOGIN_PAGE.getAction();
        try {
            //Get request from client
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            boolean valid = true;
            UserError error = new UserError("", "");
            HttpSession session = request.getSession();
            session.setAttribute("USERNAME", username);

            //Validation of username
            if (username.length() > 50) {
                error.setUserIDError("Username is not over 50 characters!");
                valid = false;
            }
            //Validation of password
            if (password.length() > 50) {
                error.setPasswordError("Password is not over 50 characters!");
                valid = false;
            }

            if (valid) {
                UserDAO dao = new UserDAO();

                // Verifity account
                User dto = dao.checkLogin(username, password);
                if (dto != null) {
                    session.setAttribute("LOGIN_USER", dto);

                    // Delete session is not important
                    session.setAttribute("ERROR", null);
                    session.setAttribute("USERNAME", null);
                    session.setAttribute("INVALID", null);

                    // Separated Role
                    if (dto.getRole().equals("admin")) {
                        url = "MainController?btnAction=Admin_Index_Page";
                    } else if (dto.getRole().equals("member")) {
                        if (session.getAttribute("PRODUCT") != null) {
                            url = "MainController?btnAction=Add_Cart_After_Login";
                        } else {
                            url = ActionPage.SEARCH.getAction();
                        }
                    }
                } else {
                    session.setAttribute("ERROR", null);
                    session.setAttribute("INVALID", "Username or password is not valid!!");
                }
            } else {
                session.setAttribute("INVALID", null);
                session.setAttribute("ERROR", error);
            }
        } catch (Exception e) {
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
