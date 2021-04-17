package danhnlc.dao;

import danhnlc.dto.CarDTO;
import danhnlc.dto.OrderDetailDTO;
import danhnlc.util.DBConnection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends AbstractDAO {

    public boolean createOrder(OrderDetailDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert Into tblOrderDetails(OrderId, CarId, Price, PickupDate, DropoutDate, quantity, discount) Values(?,?,?,?,?,?,?)";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, dto.getOrderId());
            statement.setInt(2, dto.getCarId());
            statement.setFloat(3, dto.getPrice());
            statement.setTimestamp(4, dto.getPickupDate());
            statement.setTimestamp(5, dto.getDropoutDate());
            statement.setInt(6, dto.getQuantity());
            statement.setInt(7, dto.getDiscount());
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int getQuantityOfAbleRent(int carId, Timestamp pickupDate, Timestamp dropoutDate) throws Exception {
        int result = 0;
        String sql = "getQuantityOfAbleRent ?, ?, ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setTimestamp(1, pickupDate);
            statement.setTimestamp(2, dropoutDate);
            statement.setInt(3, carId);
            rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getInt("Quantity") - rs.getInt("RentedCar");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<OrderDetailDTO> getListByOrderId(String orderId) throws Exception {
        List<OrderDetailDTO> result = null;
        OrderDetailDTO dto = null;
        String sql = "Select CarId, Price, PickupDate, DropoutDate, quantity, discount From tblOrderDetails Where OrderId = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, orderId);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new OrderDetailDTO();
                dto.setCarId(rs.getInt("CarId"));
                dto.setDiscount(rs.getInt("discount"));
                dto.setPickupDate(rs.getTimestamp("PickupDate"));
                dto.setDropoutDate(rs.getTimestamp("DropoutDate"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setPrice(rs.getFloat("Price"));
                CarDAO carDAO = new CarDAO();
                CarDTO carDTO = carDAO.getCarById(rs.getInt("CarId"));
                dto.setCar(carDTO);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<String> getListOrderIdByEmail(String email) throws Exception {
        List<String> result = null;
        String sql = "Select Id From tblOrders Where Email = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                result.add(rs.getString("Id"));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean checkRentedCarByEmail(String email, String carId) throws Exception {
        boolean check = false;
        String sql = "Select count(Id) From tblOrderDetails Where OrderId = ? And CarId = ?";
        try {
            List<String> list = getListOrderIdByEmail(email);
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            for (String x : list) {
                statement.setString(1, x);
                statement.setString(2, carId);
                rs = statement.executeQuery();
                while (rs.next()) {
                    check = rs.getInt(1) > 0;
                    if (check) {
                        break;
                    }
                }
                if (check) {
                    break;
                }
            }

        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean DeleteOrderDetail(String orderID) throws  Exception{
        boolean check = false;
        String sql = "Delete tblOrderDetails Where OrderId = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, orderID);
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

}
