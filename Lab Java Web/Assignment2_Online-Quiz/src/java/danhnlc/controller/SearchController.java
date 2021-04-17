package danhnlc.controller;

import danhnlc.dao.QuestionDAO;
import danhnlc.dto.QuestionDTO;
import danhnlc.dto.SubjectDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.HOME.getAction();
        try {
            String search = request.getParameter("txtSearch");
            String subject = request.getParameter("txtSubject");
            String status = request.getParameter("txtStatus");

            request.setAttribute("subjectSelection", subject);
            request.setAttribute("statusSelection", status);

            //Lấy vị trí trang hiện tại
            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            int numberOfQuestionInOnePage = 5;
            int numberOfSubjectOnePage = 5;
            QuestionDAO questionDAO = new QuestionDAO();
            int endPage = questionDAO.getNumberOfPages(search, subject, status, numberOfQuestionInOnePage);

            List questionList = questionDAO.getQuestionListBySearching(search, subject, status, indexPage, numberOfQuestionInOnePage);
            for (Object x : questionList) {
                if (x instanceof QuestionDTO) {
                    request.setAttribute("searchForQuestion", "searchForQuestion");
                    request.setAttribute("searchForSubject", null);
                    break;
                } else if (x instanceof SubjectDTO) {
                    
                    request.setAttribute("searchForQuestion", null);
                    request.setAttribute("searchForSubject", "searchForSubject");
                    endPage = questionDAO.getNumberOfPages(numberOfSubjectOnePage);
                    questionList = questionDAO.getQuestionListBySearching("", "", "", indexPage, numberOfSubjectOnePage);
                    break;
                }
            }
            if (questionList.isEmpty() && indexPage > 1) {
                questionList = questionDAO.getQuestionListBySearching(search, subject, status, indexPage, numberOfSubjectOnePage);
                request.setAttribute("searchForQuestion", null);
                request.setAttribute("searchForSubject", "searchForSubject");
                endPage = questionDAO.getNumberOfPages(numberOfSubjectOnePage);
            }
            request.setAttribute("questionList", questionList);
            request.setAttribute("endPage", endPage);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("sizeForQuestion", numberOfQuestionInOnePage);
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
