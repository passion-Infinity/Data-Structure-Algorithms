
package danhnlc.controller;

import danhnlc.dao.SubmitDAO;
import danhnlc.dto.AccountDTO;
import danhnlc.dto.SubmitDTO;
import danhnlc.util.Action;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetSubmitHistoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Action.VIEW_SUBMIT_HISTORY.getAction();
        try {
            AccountDTO accountDTO = (AccountDTO) request.getSession().getAttribute("account");
            String email = accountDTO.getEmail();
            
            String search = request.getParameter("txtSearch");
            if(search == null) {
                search = "";
            }
            String index = request.getParameter("index");
            if(index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            int size = 10;
            
            SubmitDAO submitDAO = new SubmitDAO();
            int endPage = submitDAO.getNumberOfPages(email, search, size);
            
            List<SubmitDTO> list = submitDAO.getAllSubmit(email, search, indexPage, size);
            request.setAttribute("SubmitedList", list);
            request.getSession().removeAttribute("submitList");
            request.setAttribute("endPage", endPage);
            request.setAttribute("indexPage", indexPage);
            
        } catch (Exception e) {
            log("Error at GetSubmitHistoryController: " + e.toString());
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
