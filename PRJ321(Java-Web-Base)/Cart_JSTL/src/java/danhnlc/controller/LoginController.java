package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.daos.UserDAO;
import danhnlc.dtos.User;
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
        String url = ActionPage.ERROR_PAGE.getAction();
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            UserDAO dao = new UserDAO();
            User user = dao.checkLogin(username, password);
            HttpSession session = request.getSession();
            if (user.getRole().equals("admin")) {
                url = ActionPage.ADMIN_HOME_PAGE.getAction();
                session.setAttribute("LOGIN_USER", user.getFullname());
                session.setAttribute("ROLE", "admin");
            } else {
                url = ActionPage.USER_HOME_PAGE.getAction();
                session.setAttribute("LOGIN_USER", user.getFullname());
                session.setAttribute("ROLE", "user");
            }
        } catch (Exception e) {
        } finally {
            response.sendRedirect(url);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
