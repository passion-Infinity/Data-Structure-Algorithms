package danhnlc.controller;

import danhnlc.util.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("btnAction");
            if ("Login".equals(action)) {
                url = Action.LOGIN.getAction();
            } else if ("Logout".equals(action)) {
                url = Action.LOGOUT.getAction();
            } else if ("Register".equals(action)) {
                url = Action.REGISTER.getAction();
            } else if ("StartQuiz".equals(action)) {
                url = Action.START_QUIZ.getAction();
            } else if ("Search".equals(action)) {
                url = Action.SEARCH.getAction();
            } else if ("Home".equals(action)) {
                url = Action.HOME.getAction();
            } else if ("Delete".equals(action)) {
                url = Action.DELETE.getAction();
            } else if ("Edit".equals(action)) {
                url = Action.EDIT.getAction();
            } else if ("Update".equals(action)) {
                url = Action.UPDATE.getAction();
            } else if ("Create".equals(action)) {
                url = Action.CREATE.getAction();
            } else if ("ChangeQuestion".equals(action)) {
                url = Action.CHANGE_QUESTION.getAction();
            } else if ("Submit".equals(action)) {
                url = Action.SUBMIT_QUIZ.getAction();
            } else if ("SubmitLastQuestion".equals(action)) {
                url = Action.CHANGE_QUESTION.getAction();
            } else if ("Review".equals(action)) {
                url = Action.REVIEW_QUIZ.getAction();
            } else if ("GetSubmitHistory".equals(action)) {
                url = Action.GET_SUBMIT_HISTORY.getAction();
            } else if ("Register_Page".equals(action)) {
                url = Action.REGISTER_PAGE.getAction();
            } else if ("Update_Page".equals(action)) {
                url = Action.UPDATE_PAGE.getAction();
            } else if ("Create_Page".equals(action)) {
                url = Action.CREATE_PAGE.getAction();
            } else if ("Admin_Page".equals(action)) {
                url = Action.ADMIN_PAGE.getAction();
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
