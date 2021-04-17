package danhnlc.controller;

import danhnlc.dao.CustomerDAO;
import danhnlc.dto.CustomerDTO;
import danhnlc.dto.CustomerError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "MainController?btnAction=Register_Page";
        try {
            String email = request.getParameter("txtEmail");
            String fullname = request.getParameter("txtFullname");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");

            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("fullname", fullname);
            request.getSession().setAttribute("phone", phone);
            request.getSession().setAttribute("address", address);

            boolean valid = true;
            CustomerError error = new CustomerError("", "", "", "", "");
            if (!email.matches("^[a-zA-Z0-9_][\\w]+@[a-z]+[.]?[a-z]{2,6}?\\.[a-z]{2,6}$")) {
                error.setEmailError("Email không hợp lệ!");
                valid = false;
            }
            if (!phone.matches("^[0]+[\\d]{10,14}$")) {
                error.setPhoneError("Số điện thoại không phù hợp!");
                valid = false;
            }
            if (!confirm.equals(password)) {
                error.setConfirm("Mật khẩu không chính xác!");
                valid = false;
            }
            if (fullname.matches("^\\W+$")) {
                error.setFullnameError("Tên không hợp lệ! Tên không chứa kí tự đặc biệt");
                valid = false;
            }

            if (valid) {
                CustomerDAO customerDAO = new CustomerDAO();
                //Get current date
                long millis = System.currentTimeMillis();
                java.sql.Date now = new java.sql.Date(millis);
                CustomerDTO customerDTO = new CustomerDTO(email, fullname, password, phone, address, "New", now);
                if (customerDAO.registerAccount(customerDTO)) {
                    request.getSession().setAttribute("success", "Đăng ký thành công!");
                    request.getSession().setAttribute("error", null);
                    request.getSession().setAttribute("accountError", null);

                    request.getSession().setAttribute("email", null);
                    request.getSession().setAttribute("fullname", null);
                    request.getSession().setAttribute("phone", null);
                    request.getSession().setAttribute("address", null);
                }
            } else {
                request.getSession().setAttribute("accountError", null);
                request.getSession().setAttribute("error", error);
            }
        } catch (Exception e) {
            request.getSession().setAttribute("error", null);
            request.getSession().setAttribute("accountError", "Tài khoản đã tồn tại!");
            log("Error at RegisterController: " + e.getMessage());
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
