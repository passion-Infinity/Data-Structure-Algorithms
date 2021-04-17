package danhnlc.dao;

import danhnlc.dto.FeedBackDTO;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class FeedBackDAO extends AbstractDAO {

    public List<FeedBackDTO> getListFeedBack(String carId) throws Exception {
        List<FeedBackDTO> result = null;
        FeedBackDTO dto = null;
        String sql = "Select Email, CarId, Cont, CreatedDate From tblFeedBacks Where CarId = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, carId);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new FeedBackDTO();
                dto.setCarId(rs.getInt("CarId"));
                dto.setEmail(rs.getString("Email"));
                dto.setCont(rs.getString("Cont"));
                dto.setCreatedDate(rs.getTimestamp("CreatedDate"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertFeedBack(FeedBackDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert tblFeedBacks(Email, CarId, Cont, CreatedDate) Values(?,?,?,?)";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, dto.getEmail());
            statement.setInt(2, dto.getCarId());
            statement.setString(3, dto.getCont());
            statement.setTimestamp(4, dto.getCreatedDate());
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
