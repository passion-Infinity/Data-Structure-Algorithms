package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.Product;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends AbstractDAO {

    public List<Product> getListForAdmin(String search, int index, int size) throws Exception {
        List<Product> result = null;
        Product dto = null;
        String sql = "Select productCode, productName, description, image, quantity, price, status, createdDate, createdBy, modifiedDate, modifiedBy "
                + "From tblProduct "
                + "Where productName Like ? or price Like ? "
                + "Order By productCode "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            preStm.setString(2, "%" + search + "%");
            preStm.setInt(3, (index - 1) * size);
            preStm.setInt(4, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new Product();
                dto.setProductCode(rs.getString("productCode"));
                dto.setProductName(rs.getString("productName"));
                dto.setDescription(rs.getString("description"));
                dto.setImage(rs.getString("image"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setPrice(rs.getFloat("price"));
                dto.setStatus(rs.getBoolean("status"));
                dto.setCreatedDate(rs.getDate("createdDate"));
                dto.setCreatedBy(rs.getString("createdBy"));
                dto.setModifiedDate(rs.getDate("modifiedDate"));
                dto.setModifiedBy(rs.getString("modifiedBy"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberPage(int size) throws Exception {
        String sql = "Select count(*) from tblProduct";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / size;
                if (countPage % size != 0) {
                    countPage++;
                }
                return countPage;
            }
        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public int getNumberPageRecode(String search, int size) throws Exception {
        String sql = "Select count(*) from tblProduct Where productName Like ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / size;
                if (total % size == 0) {
                    return countPage;
                }
                return ++countPage;
            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public List<Product> getListBySearching(String search, int index, int size) throws Exception {
        List<Product> result = null;
        Product dto = null;
        String sql = "Select productCode, productName, description, image, quantity, price, status, createdDate, createdBy, modifiedDate, modifiedBy "
                + "From tblProduct "
                + "Where status = 1 And quantity > 0 And productName Like ? "
                + "Order By productCode "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            preStm.setInt(2, (index - 1) * size);
            preStm.setInt(3, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new Product();
                dto.setProductCode(rs.getString("productCode"));
                dto.setProductName(rs.getString("productName"));
                dto.setDescription(rs.getString("description"));
                dto.setImage(rs.getString("image"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setPrice(rs.getFloat("price"));
                dto.setStatus(rs.getBoolean("status"));
                dto.setCreatedDate(rs.getDate("createdDate"));
                dto.setCreatedBy(rs.getString("createdBy"));
                dto.setModifiedDate(rs.getDate("modifiedDate"));
                dto.setModifiedBy(rs.getString("modifiedBy"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getQuantityOfProduct(String code) throws Exception {
        int result = 0;
        String sql = "Select quantity From tblProduct Where productCode = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, code);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getInt("quantity");
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public Product getProduct(String code) throws Exception {
        Product dto = null;
        String sql = "Select productCode, productName, description, image, quantity, price, status From tblProduct Where productCode = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, code);
            rs = preStm.executeQuery();
            if(rs.next()) {
                dto = new Product();
                dto.setProductCode(code);
                dto.setProductName(rs.getString("productName"));
                dto.setDescription(rs.getString("description"));
                dto.setImage(rs.getString("image"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setPrice(rs.getFloat("price"));
                dto.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean updateQuantityOfProduct(int quantity, String code) throws Exception {
        String sql = "Update tblProduct Set quantity = ? Where productCode = ?";
        return query(sql, quantity, code);
    }

    public boolean createProduct(Product pro) throws Exception {
        String sql = "Insert Into tblProduct(productCode, productName, description, image, quantity, price, "
                + "status, createdDate, createdBy) "
                + "Values(?,?,?,?,?,?,?,?,?)";
        return query(sql, pro.getProductCode(), pro.getProductName(), pro.getDescription(), pro.getImage(),
                pro.getQuantity(), pro.getPrice(), pro.isStatus(), pro.getCreatedDate(), pro.getCreatedBy());
    }

    public boolean deleteProduct(String code) throws Exception {
        String sql = "Update tblProduct Set status=0 Where productCode=?";
        return query(sql, code);
    }

    public boolean updateProduct(Product pro) throws Exception {
        String sql = "Update tblProduct Set productName=?, description=?, image=?, quantity=?, price=?, modifiedDate=?, modifiedBy = ?, status=? Where productCode=?";
        return query(sql, pro.getProductName(), pro.getDescription(), pro.getImage(), pro.getQuantity(), pro.getPrice(), 
                pro.getModifiedDate(), pro.getModifiedBy(), pro.isStatus(), pro.getProductCode());
    }
}
