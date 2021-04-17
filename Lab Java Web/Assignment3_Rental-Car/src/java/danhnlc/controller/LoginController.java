package danhnlc.controller;

import danhnlc.dao.CustomerDAO;
import danhnlc.dto.CustomerDTO;
import danhnlc.dto.CustomerError;
import danhnlc.dto.VerifyUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "MainController?btnAction=Login_Page";
        try {
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            String code = request.getParameter("txtCode");
            if (code == null) {
                code = "";
            }
            request.getSession().setAttribute("email", email);

            boolean valid = true;
            boolean check = false;
            check = VerifyUtils.verify(gRecaptchaResponse);
            CustomerError error = new CustomerError("", "", "", "", "");
            if (!email.matches("^[a-zA-Z0-9_][\\w]+@[a-z]+[.]?[a-z]{2,6}?\\.[a-z]{2,6}$")) {
                error.setEmailError("Email không hợp lệ!");
                valid = false;
            }

            request.getSession().setAttribute("error", null);
            request.getSession().setAttribute("recaptcha", null);
            request.getSession().setAttribute("status", null);
            request.getSession().setAttribute("accountError", null);

            if (check) {
                if (valid) {
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerDTO customerDTO = customerDAO.checkLogin(email, password);
                    if (customerDTO != null) { // tài khoản tồn tại
                        if ("customer".equals(customerDTO.getRole())) {
                            if ("Active".equals(customerDTO.getStatus())) { // tài khoản đã kích hoạt
                                request.getSession().setAttribute("Email", null);
                                request.getSession().setAttribute("code", null);
                                request.getSession().setAttribute("customer", customerDTO);
                                url = "SearchController";
                            } else if ("New".equals(customerDTO.getStatus())) { // tài khoản chưa kích hoạt
                                if (code.equals(customerDTO.getCode())) { // kích hoạt tài khoản
                                    customerDAO.updateStatus(email);
                                    request.getSession().setAttribute("Email", null);
                                    request.getSession().setAttribute("code", null);
                                    request.getSession().setAttribute("customer", customerDTO);
                                    url = "SearchController";
                                } else { // 
                                    if (code.isEmpty()) {
                                        request.getSession().setAttribute("status", "New");
                                    } else { // mã kích hoạt không đúng
                                        request.getSession().setAttribute("status", "wrong");
                                    }
                                }
                            } else { // trạng thái tài khoản không hợp lệ
                                request.getSession().setAttribute("accountError", "Tài khoản của bạn hết hạn đăng nhập!");
                            }
                        } else {
                            request.getSession().setAttribute("accountError", "Quyền đăng nhập không hợp lê.");
                        }
                    } else { // tài khoản đăng nhập không đúng
                        request.getSession().setAttribute("accountError", "Email hoặc mặt khẩu không chính xác !");
                    }
                } else { // lỗi rèn buộc dữ liệu trên textbox
                    request.getSession().setAttribute("error", error);
                }
            } else { // chưa xác thực recaptcha
                request.getSession().setAttribute("recaptcha", "Vui lòng xác thực reCAPTCHA!");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
        } finally {
            response.sendRedirect(url);
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
