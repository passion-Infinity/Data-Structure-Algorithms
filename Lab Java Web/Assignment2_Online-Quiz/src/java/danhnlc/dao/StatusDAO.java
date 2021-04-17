package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.StatusDTO;
import danhnlc.util.AbstractDAO;
import java.util.ArrayList;
import java.util.List;

public class StatusDAO extends AbstractDAO {

    public List<StatusDTO> getAllStatus() throws Exception {
        List<StatusDTO> result = null;
        StatusDTO dto = null;
        String sql = "Select Name From tblStatus";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new StatusDTO(rs.getString("Name"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
