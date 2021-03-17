package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.Order;
import danhnlc.dto.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends AbstractDAO {

    public boolean createOrder(Order dto) throws Exception {
        String sql = "Insert Into tblOrder(orderID, userID, createdDate, total) Values(?,?,?,?)";
        return query(sql, dto.getOrderID(), dto.getUser().getUserID(), dto.getCreatedDate(), dto.getTotal());
    }

    public Order getOrder(String orderID) throws Exception {
        Order dto = null;
        String sql = "Select orderID, createdDate, total From tblOrder Where orderID = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                dto = new Order();
                dto.setOrderID(orderID);
                dto.setTotal(rs.getFloat("total"));
                dto.setCreatedDate(rs.getDate("createdDate"));
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<String> getOrderID(String userID) throws Exception {
        List<String> result = null;
        String sql = "Select orderID From tblOrder Where userID = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String orderID = rs.getString("orderID");
                result.add(orderID);
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<Order> getOrderListByUserID(String userID, String search, int index, int size) throws Exception {
        List<Order> result = null;
        User user = new User();
        user.setUserID(userID);
        String sql = "Select orderID, createdDate, total "
                + "From tblOrder "
                + "Where userID = ? And createdDate Like ? "
                + "Order By createdDate "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, "%" + search + "%");
            preStm.setInt(3, (index - 1) * size);
            preStm.setInt(4, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getString("orderID"));
                order.setUser(user);
                order.setCreatedDate(rs.getDate("createdDate"));
                order.setTotal(rs.getFloat("total"));
                result.add(order);
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getNumberPage(String userID, int size) throws Exception {
        String sql = "Select count(*) from tblOrder Where userID = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
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
