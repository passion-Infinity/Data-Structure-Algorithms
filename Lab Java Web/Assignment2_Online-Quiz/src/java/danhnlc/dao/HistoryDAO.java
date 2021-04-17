package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.util.AbstractDAO;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO extends AbstractDAO {

    public List<Integer> getAnswerList(int submitId) throws Exception {
        List<Integer> result = null;
        String sql = "SELECT AnswerId FROM tblQuizHistory Where SubmitId = ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, submitId);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                result.add(rs.getInt("AnswerId"));
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
