package danhnlc.controller;

import danhnlc.dao.QuestionDAO;
import danhnlc.dao.SubmitDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.dto.SubmitDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubmitQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            //Lịch sử làm quiz cần lưu những thông tin sau
            // 1. Email, name
            // 2. Point
            // 3. Number of true answer 
            // 4. Start time
            // 5. End time
            // 6. Subject
            // 7. Review quiz

            //
            AccountDTO account = (AccountDTO) request.getSession().getAttribute("account");
            String email = account.getEmail();
            String name = account.getName();

            // 
            Timestamp startTime = (Timestamp) request.getSession().getAttribute("startTime");
            Timestamp endTime = (Timestamp) request.getSession().getAttribute("endTime");

            // 
            String subject = (String) request.getSession().getAttribute("subjectTest");
            
            //
            HashMap<Integer, Integer> submitList = (HashMap<Integer, Integer>) request.getSession().getAttribute("submitList");
            QuestionDAO questionDAO = new QuestionDAO();

            SubmitDAO submitDAO = new SubmitDAO();
            SubmitDTO submitDTO = new SubmitDTO(0, email, subject, 0, 0, 0, startTime, endTime);
            //
            if (submitDAO.submit(submitDTO)) {
                int submitId = submitDAO.getSubmitId(email, startTime);
                request.getSession().setAttribute("submitId", submitId);
                int numberOfTrueAnswer = questionDAO.getNumberOfTrueAnswer(submitList, submitId);
                // Point
                DecimalFormat f = new DecimalFormat("##.00");
                float point = Float.valueOf(numberOfTrueAnswer) / submitList.size() * 10;
                String pointFormat = f.format(point);
                submitDAO.updateSubmit(submitId, Float.valueOf(pointFormat), numberOfTrueAnswer, submitList.size());
                request.getSession().setAttribute("point", pointFormat);
                request.getSession().setAttribute("numberOfTrue", numberOfTrueAnswer);
                request.getSession().setAttribute("numberOfQuestion", submitList.size());
                request.getSession().removeAttribute("subjectName");
                url = Action.END_QUIZ_PAGE.getAction();
            } else {
                request.setAttribute("fail", "Submit falied!");
            }

        } catch (Exception e) {
            log("Error at SubmitQuizController: " + e.toString());
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
