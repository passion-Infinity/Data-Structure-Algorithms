package danhnlc.controller;

import danhnlc.dao.ProductDAO;
import danhnlc.dto.Product;
import danhnlc.dto.ProductError;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CreateProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.CREATE_PAGE.getAction();
        ProductError error = new ProductError("", "", "", "", "", "");
        
        try {
            //Get request from client
            String productCode = request.getParameter("productCode");
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");

            //Make request to save infor inside client
            request.setAttribute("productCode", productCode);
            request.setAttribute("productName", productName);
            request.setAttribute("description", description);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);

            // Get username
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            String username = user.getUserID();

            //
            boolean valid = true;

            //Check validation
            if (productCode.length() > 15) {
                error.setProductCodeError("Product Code is not over 15 characters!!");
                valid = false;
            }
            if (!productCode.matches("^[A-Z]+\\d{3}$")) {
                error.setProductCodeError("Product Code is malformed. The correct formater: A001, B125, C999,...");
                valid = false;
            }
            if (productName.length() > 100) {
                error.setProductNameError("Product Name is not over 100 character!!");
                valid = false;
            }

            // Check special characters for productName
            String specialAndNumberCharacter = "!@#$%&*()'+,-./:;<=>?[]^_`{|}0123456789";
            for (int i = 0; i < productName.length(); i++) {
                char ch = productName.charAt(i);
                if (specialAndNumberCharacter.contains(Character.toString(ch))) {
                    error.setProductNameError("ProductName does not include special characters and number characters.");
                    valid = false;
                    break;
                }
            }

            if (description.length() > 200) {
                error.setDescriptionError("Description is not over 200 characters!!");
                valid = false;
            }
            if (!price.matches("^[0-9]+\\.?[0-9]+$") || price.matches("^-[0-9]+\\.?[0-9]+$")) {
                error.setPriceError("Price is invalid.");
                valid = false;
            }

            if (valid) {
                // Handling Image
                String folder = "upload";
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + folder;
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                String path = folder + File.separator + fileName;
                InputStream is = part.getInputStream();
                Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                // Get date current
                long millis = System.currentTimeMillis();
                java.sql.Date now = new java.sql.Date(millis);

                //
                ProductDAO dao = new ProductDAO();
                Product dto = new Product(productCode, productName, description, path,
                        Integer.parseInt(quantity), Float.parseFloat(price), true, now, username);

                // create Product
                if (dao.createProduct(dto)) {
//                    request.setAttribute("PRODUCT", dto);
                    request.setAttribute("SUCCESS", "Create successfully.");
                    url = ActionPage.CREATE_PAGE.getAction();
                }
            } else {
                request.setAttribute("ERROR", error);
            }

        } catch (Exception e) {
            if(e.getMessage().contains("duplicate")) {
                request.setAttribute("ERROR", error);
                request.setAttribute("DUPLICATE", "The Product Code duplicated.");
            }
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
