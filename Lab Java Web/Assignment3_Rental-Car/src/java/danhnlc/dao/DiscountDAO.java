package danhnlc.dao;

import danhnlc.dto.DiscountDTO;
import danhnlc.util.DBConnection;

public class DiscountDAO extends AbstractDAO {

    public DiscountDTO getDiscount(String carId, String discountId, String pickupDate, String dropoutDate) throws Exception {
        DiscountDTO dto = null;
        String discount = "";
        boolean check = false;
        String sql = "Select DiscountId From tblDiscountDetail Where CarId = ? And DiscountId = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, carId);
            statement.setString(2, discountId);
            rs = statement.executeQuery();
            if(rs.next()) {
                discount = rs.getString(1);
                check = true;
            }
            if(check) {
                sql = "Select Id, Name, StartDay, EndDay, Value From tblDiscount Where Id = ? And Status = 1 And StartDay <= ? And EndDay >= ?";
                statement = conn.prepareStatement(sql);
                statement.setString(1, discount);
                statement.setString(2, pickupDate);
                statement.setString(3, dropoutDate);
                rs = statement.executeQuery();
                if(rs.next()) {
                    dto = new DiscountDTO();
                    dto.setId(rs.getString("Id"));
                    dto.setName(rs.getString("Name"));
                    dto.setStartDay(rs.getTimestamp("StartDay"));
                    dto.setEndDay(rs.getTimestamp("EndDay"));
                    dto.setValue(rs.getString("Value"));
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    
}
