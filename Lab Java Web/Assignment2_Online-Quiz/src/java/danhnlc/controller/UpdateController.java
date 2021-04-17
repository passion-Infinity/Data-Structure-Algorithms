package danhnlc.controller;

import danhnlc.dao.AnswerDAO;
import danhnlc.dao.QuestionDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.dto.AnswerDTO;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String id = request.getParameter("questionId");
            String cont = request.getParameter("txtContent");
            String answer1 = request.getParameter("txtAnswer1");
            String answer2 = request.getParameter("txtAnswer2");
            String answer3 = request.getParameter("txtAnswer3");
            String answer4 = request.getParameter("txtAnswer4");
            String subject = request.getParameter("txtSubject");
            String status = request.getParameter("txtStatus");
            String correctly = request.getParameter("txtCorrectAnswer");
            String index = request.getParameter("index");

            AnswerDTO ans1 = new AnswerDTO(answer1, false);
            AnswerDTO ans2 = new AnswerDTO(answer2, false);
            AnswerDTO ans3 = new AnswerDTO(answer3, false);
            AnswerDTO ans4 = new AnswerDTO(answer4, false);

            switch (correctly) {
                case "answer1":
                    ans1.setCorrectly(true);
                    break;
                case "answer2":
                    ans2.setCorrectly(true);
                    break;
                case "answer3":
                    ans3.setCorrectly(true);
                    break;
                case "answer4":
                    ans4.setCorrectly(true);
                    break;
            }

            List<AnswerDTO> answerList = new ArrayList<>();
            answerList.add(ans1);
            answerList.add(ans2);
            answerList.add(ans3);
            answerList.add(ans4);

            //Get current date
            long millis = System.currentTimeMillis();
            Date now = new Date(millis);

            //Get account
            AccountDTO accountDTO = (AccountDTO) request.getSession().getAttribute("account");

            //Execute update function
            QuestionDAO questionDAO = new QuestionDAO();
            if (questionDAO.update(id, cont, status, subject, now, accountDTO.getName())) {
                AnswerDAO answerDAO = new AnswerDAO();
                int i = 0;
                AnswerDTO answerDTO = answerDAO.getAnswerByQuestionId(id);
                int answerId = answerDTO.getId();
                for (AnswerDTO x : answerList) {
                    if(answerDAO.update(id, answerId, x)) {
                        answerId++;
                    }
                }
                request.setAttribute("success", "Update successfully.");
                url = "MainController?btnAction=Search&index=" + index + "&txtSearch=&txtSubject=&txtStatus=";
            }

        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
