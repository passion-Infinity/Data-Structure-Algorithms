package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.Order;
import danhnlc.dto.OrderDetail;
import danhnlc.dto.Product;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends AbstractDAO {

    public boolean createOrderDetail(OrderDetail dto) throws Exception {
        String sql = "Insert Into tblOrderDetail(orderID, productCode, productName, quantity, price) Values(?,?,?,?,?)";
        return query(sql, dto.getOrder().getOrderID(), dto.getProduct().getProductCode(), dto.getProduct().getProductName(),
                dto.getQuantity(), dto.getPrice());
    }

    public List<OrderDetail> getOrderDetailHistoryList(String orderID, String search, int index, int size) throws Exception {
        List<OrderDetail> result = null;
        OrderDetail dto = null;
        ProductDAO dao = new ProductDAO();
        OrderDAO orderDAO = new OrderDAO();
        String sql = "Select productCode, quantity, price "
                + "From tblOrderDetail "
                + "Where orderID = ? And productName Like ? "
                + "Order By productCode "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            preStm.setString(2, "%" + search + "%");
            preStm.setInt(3, (index - 1) * size);
            preStm.setInt(4, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productCode = rs.getString("productCode");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                Order order = orderDAO.getOrder(orderID);
                Product product = dao.getProduct(productCode);
                dto = new OrderDetail(0, order, product, quantity, price);
                result.add(dto);
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getNumberPage(String orderID, int size) throws Exception {
        String sql = "Select count(*) from tblOrderDetail Where orderID = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
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
}
