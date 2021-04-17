package danhnlc.dao;

import danhnlc.dto.CarDTO;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class CarDAO extends AbstractDAO {

    public List<CarDTO> getListCarBy(String search, String typeId, String quantity, String date1, String date2, int index, int size) throws Exception {
        List<CarDTO> result = null;
        CarTypeDAO carTypeDAO = new CarTypeDAO();
        String sql = "Select Id, Name, TypeId, Image, Quantity, Price, Seat From tblCars "
                + "Where Id not in "
                + "("
                + "Select CarId From tblOrderDetails "
                + "Where Pickupdate <= ? And DropoutDate >= ?"
                + ") "
                + "And Name Like ? ";
        if (!typeId.isEmpty()) {
            sql += "And TypeId = ? ";
        }
        if (!quantity.isEmpty()) {
            sql += "And Quantity >= ? ";
        }

        sql += "Order By Id "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            int count = 1;
            statement.setString(count, date2);
            statement.setString(++count, date1);
            statement.setString(++count, "%" + search + "%");
            if (!typeId.isEmpty()) {
                statement.setString(++count, typeId);
            }
            if (!quantity.isEmpty()) {
                statement.setString(++count, quantity);
            }
            statement.setInt(++count, (index - 1) * size);
            statement.setInt(++count, size);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                CarDTO dto = new CarDTO();
                dto.setId(rs.getInt("Id"));
                dto.setName(rs.getString("Name"));
                dto.setCarType(rs.getInt("TypeId"));
                dto.setTypeName(carTypeDAO.getName(String.valueOf(dto.getCarType())));
                dto.setImage(rs.getString("Image"));
                dto.setQuantity(rs.getInt("Quantity"));
                dto.setPrice(rs.getFloat("Price"));
                dto.setSeat(rs.getInt("Seat"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<CarDTO> getListCarByTest(String search, String typeId, String quantity, String date1, String date2, int index, int size) throws Exception {
        List<CarDTO> result = null;
        CarTypeDAO carTypeDAO = new CarTypeDAO();
        String sql = "";
        if (quantity.isEmpty()) {
            quantity = "0";
        }
        if (!typeId.isEmpty()) {
            sql = "Search_Paging_CarType ?,?,?,?,?,?,? ";
        } else {
            sql = "Search_Paging ?,?,?,?,?,? ";
        }
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            int count = 1;
            statement.setString(count, date1);
            statement.setString(++count, date2);
            statement.setString(++count, search);
            if (!typeId.isEmpty()) {
                statement.setString(++count, typeId);
            }
            statement.setString(++count, quantity);
            statement.setInt(++count, index);
            statement.setInt(++count, size);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                CarDTO dto = new CarDTO();
                dto.setId(rs.getInt("Id"));
                dto.setName(rs.getString("Name"));
                dto.setCarType(rs.getInt("TypeId"));
                dto.setTypeName(carTypeDAO.getName(String.valueOf(dto.getCarType())));
                dto.setImage(rs.getString("Image"));
                dto.setQuantity(rs.getInt("Quantity") - rs.getInt("RentedCar"));
                dto.setPrice(rs.getFloat("Price"));
                dto.setSeat(rs.getInt("Seat"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberPages(String search, String date1, String date2, String typeId, String quantity, int size) throws Exception {
        String sql = "Select COUNT(Id) From tblCars "
                + "Where Id not in "
                + "("
                + "Select CarId From tblOrderDetails "
                + "Where Pickupdate <= ? And DropoutDate >= ?"
                + ") "
                + "And Name Like ? ";
        if (!typeId.isEmpty()) {
            sql += "And typeId = ? ";
        }
        if (!quantity.isEmpty()) {
            sql += "And Quantity >= ?";
        }
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            int count = 1;
            statement.setString(count, date2);
            statement.setString(++count, date1);
            statement.setString(++count, "%" + search + "%");
            if (!typeId.isEmpty()) {
                statement.setString(++count, typeId);
            }
            if (!quantity.isEmpty()) {
                statement.setString(++count, quantity);
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

    public int getNumberPagesTest(String search, String date1, String date2, String typeId, String quantity, int size) throws Exception {
        String sql = "";
        if (quantity.isEmpty()) {
            quantity = "0";
        }
        if (!typeId.isEmpty()) {
            sql = "Search_CarType ?,?,?,?,? ";
        } else {
            sql = "Search ?,?,?,? ";
        }

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            int count = 1;
            statement.setString(count, date1);
            statement.setString(++count, date2);
            statement.setString(++count, search);
            if (!typeId.isEmpty()) {
                statement.setString(++count, typeId);
            }
            statement.setString(++count, quantity);
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

    public int getQuantityOfCarById(String carId) throws Exception {
        int result = 0;
        String sql = "Select Quantity From tblCars Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, carId);
            rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getInt("Quantity");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public CarDTO getCarById(int id) throws Exception{
        CarDTO dto = null;
        String sql = "Select Id, Name, Image, Color, Seat, Price From tblCars Where Id = ? ";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            if(rs.next()) {
                dto = new CarDTO();
                dto.setId(id);
                dto.setName(rs.getString("Name"));
                dto.setColor(rs.getString("Color"));
                dto.setSeat(rs.getInt("Seat"));
                dto.setImage(rs.getString("Image"));
                dto.setPrice(rs.getFloat("Price"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
