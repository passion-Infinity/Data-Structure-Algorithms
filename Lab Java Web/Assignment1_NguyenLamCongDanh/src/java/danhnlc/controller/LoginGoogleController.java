package danhnlc.controller;

import danhnlc.dao.UserDAO;
import danhnlc.dto.GooglePojo;
import danhnlc.dto.GoogleUtils;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginGoogleController extends HttpServlet {

    public LoginGoogleController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.LOGIN_PAGE.getAction();
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                url = ActionPage.ERROR_LOGIN_GOOGLE_PAGE.getAction();
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);

                //
                User dto = new User();
                dto.setFullName(googlePojo.getEmail());
                dto.setUserID(googlePojo.getEmail());
                dto.setPassword(googlePojo.getId());
                dto.setRole("member");
                
                //
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", dto);
                url = ActionPage.SEARCH.getAction();
                
                UserDAO dao = new UserDAO();
                dao.insert(dto);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
