package danhnlc.controller;

import danhnlc.dao.AnswerDAO;
import danhnlc.dao.QuestionDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.dto.AnswerDTO;
import danhnlc.dto.QuestionDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.CREATE_PAGE.getAction();
        try {
            String cont = request.getParameter("txtContent");
            String answer1 = request.getParameter("txtAnswer1");
            String answer2 = request.getParameter("txtAnswer2");
            String answer3 = request.getParameter("txtAnswer3");
            String answer4 = request.getParameter("txtAnswer4");
            String subject = request.getParameter("txtSubject");
            String correctly = request.getParameter("txtCorrectAnswer");

            //Check validation
            boolean valid = true;
            if (subject.trim().isEmpty()) {
                valid = false;
            }

            if (valid) {

                QuestionDAO questionDAO = new QuestionDAO();
                AnswerDAO answerDAO = new AnswerDAO();

                //Get current date
                long millis = System.currentTimeMillis();
                Date now = new Date(millis);

                //Get account
                AccountDTO account = (AccountDTO) request.getSession().getAttribute("account");

                QuestionDTO questionDTO = new QuestionDTO(0, cont, "Actived", subject, now, account.getName(), null, null);
                if (questionDAO.create(questionDTO)) {
                    //Get id question just added
                    int questionId = questionDAO.getQuestionId();

                    AnswerDTO ans1 = new AnswerDTO(0, answer1, questionId, false);
                    AnswerDTO ans2 = new AnswerDTO(0, answer2, questionId, false);
                    AnswerDTO ans3 = new AnswerDTO(0, answer3, questionId, false);
                    AnswerDTO ans4 = new AnswerDTO(0, answer4, questionId, false);

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

                    for (AnswerDTO answerDTO : answerList) {
                        answerDAO.create(answerDTO);
                    }
                    
                    request.setAttribute("success", "Create successfully!");
                    url = "MainController?btnAction=Create_Page&txtContent=&txtAnswer1=&txtAnswer2=&txtAnswer3=&txtAnswer4=&txtSubject=";
                }
            } else {
                request.setAttribute("questionError", "Please choose Subject!");
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
