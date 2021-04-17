package danhnlc.controller;

import danhnlc.dao.QuestionDAO;
import danhnlc.dao.SubjectDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.dto.QuestionDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StartQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.STUDENT_PAGE.getAction();
        try {
            String subjectName = (String) request.getSession().getAttribute("subjectName");
            String temp = request.getParameter("temp");
            if(temp != null) {
                subjectName = null;
            }

            //Get subject
            String subject = request.getParameter("txtSubject");
            request.setAttribute("ChooseSubject", subject);
            boolean valid = true;
            if (subject.trim().isEmpty()) {
                valid = false;
            }
            
            QuestionDAO questionDAO = new QuestionDAO();
            boolean flag = false;
            if(questionDAO.CheckListQuestionBySubject(subject)) {
                flag = true;
            }
            
            //Get index Page
            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            
            if (valid && flag && subjectName == null) {
                
                request.getSession().setAttribute("subjectName", subject);
                //Get time to test
                if(temp == null) {
                    SubjectDAO subjectDAO = new SubjectDAO();
                    int testTime = subjectDAO.getTimeToTest(subject);
                    request.getSession().setAttribute("timeToTest", testTime);
                    Date now = new Date();
                    Timestamp endTime = new Timestamp(now.getTime() + testTime * 60 * 1000);
                    Timestamp startTime = new Timestamp(now.getTime());
                    request.getSession().setAttribute("endTime", endTime);
                    request.getSession().setAttribute("startTime", startTime);
                }

                // Set up data
                int numberOfQuestion = 10;
                int size = 2;
                request.setAttribute("size", size);
                int totalQuestion = questionDAO.getNumberOfQuestion(subject);
                if(numberOfQuestion > totalQuestion) {
                    numberOfQuestion = totalQuestion;
                }

                //Get Number of Page 
                int total = numberOfQuestion;
                int endPage = total / size;
                if (total % size != 0) {
                    ++endPage;
                }

                //Get email
                AccountDTO accountDTO = (AccountDTO) request.getSession().getAttribute("account");
                String email = accountDTO.getEmail();
                
                //Get start time 
                Timestamp startTime = (Timestamp) request.getSession().getAttribute("startTime");

                List<QuestionDTO> questionList = questionDAO.getListQuestionToTest(numberOfQuestion, subject, indexPage, size, temp, email, startTime);
                if (questionList.size() > size) {
                    url = "MainController?btnAction=StartQuiz&temp=HasAValue";
                } else {
                    request.getSession().setAttribute("questionListTest", questionList);
                    request.setAttribute("endPage", endPage);
                    request.getSession().setAttribute("indexPage", indexPage);
                    request.getSession().setAttribute("subjectTest", subject);
                    
                    url = Action.START_QUIZ_PAGE.getAction();
                }
            } else {
                request.setAttribute("error", "Please select a subject to start your test");
                if(!flag) {
                    request.setAttribute("error", "Don't have any question in " + subject);
                }
                if(subjectName != null) {
                    request.setAttribute("error", "You are doing quiz, not join another one.");
                }
            }
        } catch (Exception e) {
            log("Error at StartQuizController: " + e.toString());
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
