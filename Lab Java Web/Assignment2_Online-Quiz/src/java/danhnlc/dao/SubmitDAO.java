package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.SubmitDTO;
import danhnlc.util.AbstractDAO;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SubmitDAO extends AbstractDAO {

    public boolean submit(SubmitDTO dto) throws Exception {
        String sql = "Insert Into tblSubmit(Email, SubjectId, Point, NumberOfTrue, QuantityOfQuestion, StartTime, EndTime) Values(?,?,?,?,?,?,?)";
        return query(sql, dto.getEmail(), dto.getSubject(), dto.getPoint(),
                dto.getNumberOfTrue(), dto.getQuantityOfQuestion(), dto.getStartTime(), dto.getEndTime());
    }

    public boolean updateSubmit(int submitId, float point, int numberOfTrue, int numberOfQuestion) throws Exception {
        String sql = "Update tblSubmit Set Point = ?, NumberOfTrue = ?, QuantityOfQuestion = ? Where Id = ?";
        return query(sql, point, numberOfTrue, numberOfQuestion, submitId);
    }

    public int getSubmitId(String email, Timestamp startTime) throws Exception {
        String sql = "SELECT Id FROM tblSubmit "
                + "Where Email = ? And StartTime = ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            preStm.setString(2, String.valueOf(startTime));
            rs = preStm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberOfPages(String email, String search, int size) throws Exception {
        String sql = "SELECT COUNT(Id) FROM tblSubmit Where Email = ? And SubjectId Like ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            preStm.setString(2, "%" + search + "%");
            rs = preStm.executeQuery();
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
        } finally {
            closeConnection();
        }
        return 0;
    }

    public List<SubmitDTO> getAllSubmit(String email, String search, int index, int size) throws Exception {
        List<SubmitDTO> result = null;
        SubmitDTO dto = null;
        String sql = "SELECT Id, Email, SubjectId, Point, NumberOfTrue, QuantityOfQuestion, StartTime "
                + "FROM tblSubmit "
                + "WHERE Email = ? And SubjectId Like ? "
                + "ORDER BY Id "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            preStm.setString(2, "%" + search + "%");
            preStm.setInt(3, (index - 1) * size);
            preStm.setInt(4, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new SubmitDTO();
                dto.setId(rs.getInt("Id"));
                dto.setEmail(rs.getString("Email"));
                dto.setSubject(rs.getString("SubjectId"));
                dto.setPoint(rs.getFloat("Point"));
                dto.setNumberOfTrue(rs.getInt("NumberOfTrue"));
                dto.setQuantityOfQuestion(rs.getInt("QuantityOfQuestion"));
                dto.setStartTime(rs.getTimestamp("StartTime"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
