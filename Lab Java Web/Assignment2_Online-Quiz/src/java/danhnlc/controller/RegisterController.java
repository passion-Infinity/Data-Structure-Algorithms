package danhnlc.controller;

import danhnlc.dao.AccountDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.error.AccountError;
import danhnlc.util.Action;
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
        String url = "MainController?btnAction=Register_Page";
        AccountError error = new AccountError("", "", "", "");
        HttpSession session = request.getSession();
        try {
            String email = request.getParameter("txtEmail");
            String name = request.getParameter("txtName");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String role = request.getParameter("rdRole");
            session.setAttribute("email", email);
            session.setAttribute("name", name);
            
            boolean valid = true;
            if(!email.matches("^[a-zA-z0-9_]+\\w@[a-z]+[.]?[a-z]{2,6}?\\.[a-z]{2,6}$")) {
                error.setEmail("Invalid Email");
                valid = false;
            }
            if(name.matches("^\\W+$")) {
                error.setName("Name is not valid. Name does not include some speacial characters!");
                valid = false;
            }
            if(!confirm.equals(password)) {
                error.setConfirm("Password is not matched.");
                valid = false;
            }
            
            if(valid) {
                AccountDAO dao = new AccountDAO();
                AccountDTO dto = new AccountDTO(email, name, password, role, "New");
                if(dao.registerAccount(dto)) {
                    session.setAttribute("account", dto);
                    session.setAttribute("email", null);
                    session.setAttribute("name", null);
                    session.setAttribute("accountError", null);
                    session.setAttribute("UpdateError", null);
                    session.setAttribute("loginError", null);
                    url = Action.HOME.getAction();
                }
            } else {
                session.setAttribute("accountErr", error);
            }
        } catch (Exception e) {
            session.setAttribute("updateError", "Duplicated account.");
            log("Error at RegisterController: " + e.toString());
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
