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
public class UpdateProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.SEARCH.getAction();
        ProductError error = new ProductError("", "", "", "", "", "");
        try {
            //Get request from client
            String productCode = request.getParameter("productCode");
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String image = request.getParameter("image");
            String status = request.getParameter("comboxStatus");
            String index = (String) request.getSession().getAttribute("indexpage");

            request.setAttribute("productCode", productCode);
            request.setAttribute("productName", productName);
            request.setAttribute("description", description);
            request.setAttribute("image", image);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);
            request.setAttribute("status",status);
            request.setAttribute("indexpage", index);
            
            //
            boolean valid = true;

            //Check validation
            if (productName.length() > 100) {
                error.setProductNameError("Product Name is not over 100 character!!");
                valid = false;
            }
            if(productName.trim().isEmpty()) {
                error.setProductNameError("Product Name is a required field");
                valid = false;
            }
            if(description.trim().isEmpty()) {
                error.setDescriptionError("description is a required field");
                valid = false;
            }

            // Check special characters for productName
            String specialAndNumberCharacter = "!@#$%&*()'+,-./:;<=>?[]^_`{|}";
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
//            if (!price.matches("^[0-9]+\\.?[0-9]+$") || price.matches("^-[0-9]+\\.?[0-9]+$")) {
//                error.setPriceError("Price is invalid.");
//                valid = false;
//            }
            if (!price.matches("^[0-9](\\d+)?\\.?(\\d+)?$")) {
                error.setPriceError("Price is invalid.");
                valid = false;
            }
            if (price.matches("^[0]([0]+)?\\.?([0]+)?$")) {
                error.setPriceError("Price must be greater than 0.");
                valid = false;
            }
            
            //Get user
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("LOGIN_USER");
            
            //
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

                if (path.equals(folder + File.separator)) {
                    path = image;
                } else {
                    Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
                    request.setAttribute("image", path);
                }
                
                // Get date current
                long millis = System.currentTimeMillis();
                java.sql.Date now = new java.sql.Date(millis);

                //
                ProductDAO dao = new ProductDAO();
                Product dto = new Product(productCode, productName, description, path, Integer.parseInt(quantity), 
                        Float.parseFloat(price), now, user.getUserID(), Boolean.parseBoolean(status));
                if (dao.updateProduct(dto)) {
                    request.setAttribute("SUCCESS", "Update successfully.");
                }
            } else {
                url = ActionPage.UPDATE_PAGE.getAction();
                request.setAttribute("ERROR", error);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
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
