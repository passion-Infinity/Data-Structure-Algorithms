package danhnlc.controller;

import danhnlc.dao.CustomerDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActivateAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "MainController?btnAction=Login_Page";
        try {
            request.setAttribute("status", null);
            request.getSession().setAttribute("status", null);
            String email = request.getParameter("txtEmail");
            CustomerDAO customerDAO = new CustomerDAO();

            String status = customerDAO.checkStatusEmail(email);
            if ("Active".equals(status)) {
                request.setAttribute("status", "Active");
            } else if ("New".equals(status)) {
                    String code = customerDAO.sendActiveCode(email);
                    customerDAO.updateCode(code, email);
                    request.setAttribute("send_email_success", "success");
            } else {
                request.setAttribute("status", "no-exist");
            }

        } catch (Exception e) {
            log("Error at ActivateAccountController: " + e.getMessage());
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
