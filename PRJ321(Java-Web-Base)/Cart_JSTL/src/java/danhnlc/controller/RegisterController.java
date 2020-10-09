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
        String url = ActionPage.USER_REGISTER_PAGE.getAction();
        HttpSession session = request.getSession();
        if (session.getAttribute("ROLE").equals("admin")) {
            url = ActionPage.ADMIN_REGISTER_PAGE.getAction();
        }
        UserError errorUser = new UserError("", "", "", "", "");

        String username = request.getParameter("txtUsername");
        String fullname = request.getParameter("txtFullname");
        String password = request.getParameter("txtPassword");
        String role = request.getParameter("txtRole");
        String confirm = request.getParameter("txtConfirm");

        boolean check = true;
        if (username.isEmpty()) {
            errorUser.setUsernameError("Username can not empty!");
            check = false;
        }
        if (fullname.isEmpty()) {
            errorUser.setFullnameError("Fullname can not empty!");
            check = false;
        }
        if (password.isEmpty()) {
            errorUser.setPasswordError("Password can not empty!");
        }
        if (!password.equals(confirm)) {
            errorUser.setConfirmError("Password is not correct!");
            check = false;
        }
        try {
            if (check) {
                UserDAO dao = new UserDAO();
                User user = new User(username, fullname, password, role);
                if (dao.register(user)) {
                    url = "login.jsp";
                    if (session.getAttribute("ROLE").equals("admin")) {
                        url = "MainController?btnAction=Search&txtSearch=";
                    }
                }
            } else {
                request.setAttribute("ERROR", errorUser);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                errorUser.setUsernameError("Duplicated username!");
                request.setAttribute("ERROR", errorUser);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
