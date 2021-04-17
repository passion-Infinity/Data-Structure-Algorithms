package danhnlc.dao;

import danhnlc.dto.OrderDTO;
import danhnlc.util.DBConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends AbstractDAO {

    public boolean createOrder(OrderDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert Into tblOrders(Id, Email, Date, Total, Status) Values(?,?,?,?,?)";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, dto.getId());
            statement.setString(2, dto.getEmail());
            statement.setTimestamp(3, dto.getDate());
            statement.setFloat(4, dto.getTotal());
            statement.setString(5, "active");
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public OrderDTO getOrder(String orderID) throws Exception {
        OrderDTO dto = null;
        String sql = "Select Id, Date, Total From tblOrders Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, orderID);
            rs = statement.executeQuery();
            if (rs.next()) {
                dto = new OrderDTO();
                dto.setId(orderID);
                dto.setTotal(rs.getFloat("Total"));
                dto.setDate(rs.getTimestamp("Date"));
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return dto;
    }

    public List<OrderDTO> getListOrder(String search, String email, String date, int index, int size) throws Exception {
        List<OrderDTO> result = null;
        OrderDTO dto = null;
        String sql = "Select Id, Date, Total, Status From tblOrders "
                + "Where Id Like ? And Email = ? ";
        if (!date.isEmpty()) {
            sql += "And Date = ? ";
        }

        sql += "Order By Date DESC "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            int count = 1;
            statement.setString(count, "%" + search + "%");
            statement.setString(++count, email);
            if (!date.isEmpty()) {
                statement.setString(++count, date);
            }
            statement.setInt(++count, (index - 1) * size);
            statement.setInt(++count, size);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new OrderDTO();
                dto.setId(rs.getString("Id"));
                dto.setTotal(rs.getFloat("Total"));
                dto.setDate(rs.getTimestamp("Date"));
                dto.setStatus(rs.getString("Status"));
                result.add(dto);
            }
        } catch (SQLException e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberPages(String search, String email, String date, int size) throws Exception {
        String sql = "Select COUNT(Id) From tblOrders Where Id Like ? And Email = ? ";
        if (!date.isEmpty()) {
            sql += "And Date = ?";
        }

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            statement.setString(2, email);
            if (!date.isEmpty()) {
                statement.setString(3, date);
            }
            rs = statement.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int currentPage = 0;
                currentPage = total / size;
                if (total % size == 0) {
                    return currentPage;
                } else {
                    return ++currentPage;
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public boolean deleteOrder(String orderId) throws Exception {
        boolean check = false;
        String sql = "Update tblOrders Set Status = 'inactive' Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, orderId);
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    
    public boolean deleteOrderByCheckoutFail(String orderId) throws Exception {
        boolean check = false;
        String sql = "Delete tblOrders  Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, orderId);
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
}
