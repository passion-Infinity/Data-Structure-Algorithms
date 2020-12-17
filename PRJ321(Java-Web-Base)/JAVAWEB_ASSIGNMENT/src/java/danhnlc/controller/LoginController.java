package danhnlc.controller;

import danhnlc.common.ActionPage;
import danhnlc.common.VerifyUtils;
import danhnlc.daos.UserDAO;
import danhnlc.dtos.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class LoginController extends HttpServlet {

    Logger logger = Logger.getLogger(LoginController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.LOGIN_PAGE.getAction();
        try {
            HttpSession session = request.getSession();
//            session.setAttribute("ERROR_TITLE", null);
//            session.setAttribute("ERROR", null);
            boolean valid = false;
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            valid = VerifyUtils.verify(gRecaptchaResponse);
            
            session.setAttribute("USERNAME", username);
            
            UserDAO dao = new UserDAO();
            User user = dao.checkLogin(username, password);
            if (valid) {
                if (user != null) {
                    session.setAttribute("LOGIN_USER", user);
                    session.setAttribute("USERNAME", null);
                    logger.info("Login by Account of Resort!");
                    if (user.getRoleID().equals("CUS")) {
                        logger.info(user.getUsername() + " access successful!");
                        url = ActionPage.HOME_PAGE.getAction();
                    } else if (user.getRoleID().equals("MA")) {
                        logger.info(user.getUsername() + " access successful!");
                        url = ActionPage.ADMIN_PAGE.getAction();
                    }
                } else {
                    session.setAttribute("LOGIN_USER", "incorrect");
                    logger.info("Incorrect username or password!!!");
                }
            } else {
                session.setAttribute("LOGIN_USER", "recaptchaFail");
                logger.info("Not accept reCAPTCHA before login!");
            }
        } catch (Exception e) {
            logger.error(e);
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
