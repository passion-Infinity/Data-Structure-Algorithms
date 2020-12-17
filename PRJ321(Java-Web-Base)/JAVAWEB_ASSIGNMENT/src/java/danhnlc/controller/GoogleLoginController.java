package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.common.GooglePojo;
import danhnlc.common.GoogleUtils;
import danhnlc.daos.UserDAO;
import danhnlc.dtos.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class GoogleLoginController extends HttpServlet {
    
    Logger logger = Logger.getLogger(GoogleLoginController.class);

    public GoogleLoginController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.ERROR.getAction();
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                url = ActionPage.LOGIN_PAGE.getAction();
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                UserDAO dao = new UserDAO();
                User user = null;
                List<User> list = dao.getList();
                for (User dto : list) {
                    if (dto.getEmail().equals(googlePojo.getEmail())) {
                        user = dao.getInfor(googlePojo.getEmail());
                    }
                }
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);
                    url = ActionPage.HOME_PAGE.getAction();
                } else {
                    url = "invalid_email.html";
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
