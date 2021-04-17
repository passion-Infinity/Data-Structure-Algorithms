package danhnlc.controller;

import danhnlc.dao.HistoryDAO;
import danhnlc.dao.QuestionDAO;
import danhnlc.dto.QuestionDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.HISTORY_PAGE.getAction();
        try {
            String search = request.getParameter("txtSearch");
            if(search == null) {
                search = "";
            }
            String index = request.getParameter("index");
            if(index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            int size = 5;
            
            int submitId = 0;
            if (request.getSession().getAttribute("submitId") != null) {
                submitId = (int) request.getSession().getAttribute("submitId");
            }
            
            String detail = request.getParameter("detail");
            if(detail != null) {
                submitId = Integer.parseInt(request.getParameter("txtId"));
            }

            QuestionDAO questionDAO = new QuestionDAO();
            int endPage = questionDAO.getNumberOfPages(search, submitId, size);
            HistoryDAO historyDAO = new HistoryDAO();
            List<QuestionDTO> questionReviewList = questionDAO.getReviewQuestionList(submitId, search, indexPage, size);
            List<Integer> answerHistoryList = historyDAO.getAnswerList(submitId);
            request.getSession().setAttribute("questionReviewList", questionReviewList);
            request.getSession().setAttribute("answerHistoryList", answerHistoryList);
            request.setAttribute("endPage", endPage);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("size", size);

            if (detail != null) {
                request.getSession().setAttribute("subjectTest", request.getParameter("subject"));
                request.getSession().setAttribute("numberOfTrue", request.getParameter("numberOfTrue"));
                request.getSession().setAttribute("numberOfQuestion", request.getParameter("numberOfQuestion"));
                request.getSession().setAttribute("point", request.getParameter("point"));
                request.getSession().setAttribute("submitId", submitId);
            }
        } catch (Exception e) {
            log("Error at ReviewQuizController: " + e.toString());
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
