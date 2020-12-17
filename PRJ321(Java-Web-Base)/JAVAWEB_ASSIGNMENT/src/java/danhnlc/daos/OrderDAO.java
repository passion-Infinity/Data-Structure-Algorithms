package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.Order;
import danhnlc.dtos.User;
import danhnlc.util.DBConnection;
import java.sql.Timestamp;

public class OrderDAO extends AbstractDAO {

    public boolean insertOrder(Order order) throws Exception {
        String sql = "Insert Into tblOrders(orderID, username, date, total) Values(?,?,?,?)";
        return query(sql, order.getOrderID(), order.getUsername().getUsername(), order.getDate(), order.getTotal());
    }

    public Order getOrder(String username) throws Exception {
        Order order = null;
        String sql = "Select TOP(1) orderID, date, total"
                + " From tblOrders"
                + " Where username=?"
                + " Order By orderID DESC";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String orderID = rs.getString("orderID");
                Timestamp date = rs.getTimestamp("date");
                float total = rs.getFloat("total");
                User user = new User();
                user.setUsername(username);
                order = new Order(orderID, user, date, total);
            }
        } finally {
            closeConnection();
        }
        return order;
    }
}
