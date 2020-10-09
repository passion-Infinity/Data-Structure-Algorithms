package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.Product;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends AbstractDAO {

    public List<Product> getAll() throws Exception {
        List<Product> result = null;
        String productID, productName;
        float price;
        int quantity;
        String sql = "Select productID, productName, price, quantity From tblProducts";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                productName = rs.getString("productName");
                price = rs.getFloat("price");
                quantity = rs.getInt("quantity");
                result.add(new Product(productID, productName, price, quantity));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean create(Product product) throws Exception {
        String sql = "Insert Into tblProducts(productID, productName, price, quantity) Values(?,?,?,?)";
        return query(sql, product.getProductID(), product.getProductName(), product.getPrice(), product.getQuantity());
    }

    public boolean update(Product product) throws Exception {
        String sql = "Update tblProducts Set productName=?, price=?, quantity=? Where productID=?";
        return query(sql, product.getProductName(), product.getPrice(), product.getQuantity(), product.getProductID());
    }

    public boolean delete(String productID) throws Exception {
        String sql = "Delete From tblProducts Where productID=?";
        return query(sql, productID);
    }
}
