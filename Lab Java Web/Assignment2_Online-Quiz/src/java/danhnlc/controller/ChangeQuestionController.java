package danhnlc.controller;

import danhnlc.dao.AnswerDAO;
import danhnlc.dto.AnswerDTO;
import danhnlc.dto.QuestionDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.START_QUIZ.getAction();
        try {
            List<QuestionDTO> questionList = (List<QuestionDTO>) request.getSession().getAttribute("questionListTest");
            AnswerDAO answerDAO = new AnswerDAO();
            HashMap<Integer, Integer> submitList;
            if (request.getSession().getAttribute("submitList") == null) {
                submitList = new HashMap<>();
            } else {
                submitList = (HashMap<Integer, Integer>) request.getSession().getAttribute("submitList");
            }
            for (QuestionDTO a : questionList) {
                String selectedAnswer = request.getParameter(String.valueOf(a.getId()));
                if (selectedAnswer != null) {
                    List<AnswerDTO> answerList = answerDAO.getAnswerListByQuestionId(a.getId());
                    for (AnswerDTO b : answerList) {
                        if (b.getId() == Integer.parseInt(selectedAnswer)) {
                            int answerId = Integer.parseInt(selectedAnswer);
                            int questionId = a.getId();
                            boolean checkExist = false;
                            for (Map.Entry pair : submitList.entrySet()) {
                                if (pair.getKey().equals(questionId)) {
                                    if (!pair.getValue().equals(answerId)) {
                                        pair.setValue(answerId);
                                    }
                                    checkExist = true;
                                }
                            }
                            if (!checkExist) {
                                submitList.put(questionId, answerId);
                            }
                            break;
                        }
                    }
                }
            }
            
            String submitLast = request.getParameter("submitLastQuestion");
            if("Submit".equals(submitLast)) {
                url = "MainController?btnAction=Submit";
            }
            
            request.getSession().setAttribute("submitList", submitList);
        } catch (Exception e) {
            log("Error at ChangeQuestionController: " + e.toString());
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
