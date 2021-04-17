package danhnlc.controller;

import danhnlc.dao.ProductDAO;
import danhnlc.dto.Product;
import danhnlc.dto.User;
import danhnlc.enumm.ActionPage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ActionPage.INDEX_PAGE.getAction();
        HttpSession session = request.getSession();
        try {
            //
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }

            //Get Index Page
            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            
            //Get List
            ProductDAO dao = new ProductDAO();
//            int endPage = dao.getNumberPage(3);
            int endPage = dao.getNumberPageRecode(search, 3);
            List<Product> list = dao.getListBySearching(search, indexPage, 3);
            if (list != null) {
                session.setAttribute("LIST", list);
                session.setAttribute("END_PAGE", endPage);
                request.setAttribute("INDEX_PAGE", index);
                session.setAttribute("SEARCH", search);
            } 
            if(list.isEmpty()) {
                request.setAttribute("emptyList", "Not found product");
            }

            // Check the page will display
            User dto = (User) session.getAttribute("LOGIN_USER");
            if (session.getAttribute("ADMIN_PRODUCT") != null && "admin".equals(dto.getRole())) {
                url = ActionPage.ADMIN_PRODUCT_LIST_PAGE.getAction();
            } else if ("admin".equals(dto.getRole())) {
                //Get List for admin
                String indexpage = (String) request.getAttribute("indexpage");
                List<Product> listAdmin = dao.getListForAdmin(search, indexPage, 3);
                if(indexpage != null) {
                    request.setAttribute("INDEX_PAGE", indexpage);
                    listAdmin = dao.getListForAdmin(search, Integer.parseInt(indexpage), 3);
                }
                session.setAttribute("LIST", listAdmin);
                url = ActionPage.PRODUCT_MANAGEMENT_PAGE.getAction();
            }
            
            // Session real time for quantity of product 
//            if (session.getAttribute("REAL_TIME") != null) {
//                List<Product> lst = (List<Product>) session.getAttribute("REAL_TIME");
//                List<Product> l = (List<Product>) session.getAttribute("LIST");
//                for (Product x : l) {
//                    for (Product x1 : lst) {
//                        if(!x1.getProductCode().equals(x.getProductCode())) {
//                            lst.add(x);
//                        }
//                    }
//                }
//                session.setAttribute("LIST", lst);
//            }

        } catch (Exception e) {
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
