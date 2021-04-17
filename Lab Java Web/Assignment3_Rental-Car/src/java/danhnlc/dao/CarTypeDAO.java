package danhnlc.dao;

import danhnlc.dto.CarTypeDTO;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class CarTypeDAO extends AbstractDAO {

    public List<CarTypeDTO> getAllType() throws Exception {
        List<CarTypeDTO> result = null;
        String sql = "Select Id, Name From tblCar_Type";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                CarTypeDTO dto = new CarTypeDTO();
                dto.setId(rs.getInt("Id"));
                dto.setName(rs.getString("Name"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String getName(String typeId) throws Exception {
        String result = null;
        String sql = "Select Name From tblCar_Type Where Id = ?";
        try {
          conn = DBConnection.getConnection();
          statement = conn.prepareStatement(sql);
          statement.setString(1, typeId);
          rs = statement.executeQuery();
          if(rs.next()) {
              result = rs.getString("Name");
          }
        } finally {
            closeConnection();
        }
        return result;
    }
}
