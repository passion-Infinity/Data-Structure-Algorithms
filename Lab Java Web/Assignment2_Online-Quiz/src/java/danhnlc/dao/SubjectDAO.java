package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.SubjectDTO;
import danhnlc.util.AbstractDAO;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO extends AbstractDAO {

    public List<SubjectDTO> getAllSubject() throws Exception {
        List<SubjectDTO> result = null;
        SubjectDTO dto = null;
        String sql = "Select Id, Name From tblSubject";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new SubjectDTO();
                dto.setId(rs.getString("Id"));
                dto.setName(rs.getString("Name"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getTimeToTest(String subjectId) throws Exception {
        String sql = "SELECT TestTime FROM tblSubject Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, subjectId);
            rs = preStm.executeQuery();
            if(rs.next()) {
                return rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return 0;
    }
    
    
}
