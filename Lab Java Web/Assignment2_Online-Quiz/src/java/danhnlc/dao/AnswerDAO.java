package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.AnswerDTO;
import danhnlc.util.AbstractDAO;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO extends AbstractDAO {

    public List<AnswerDTO> getAnswerListByQuestionId(int questionId) throws Exception {
        List<AnswerDTO> result = null;
        AnswerDTO dto = null;
        String sql = "Select Id, Cont, correctly From tblAnswer Where QuestionId = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, questionId);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                dto = new AnswerDTO();
                dto.setId(rs.getInt("Id"));
                dto.setCont(rs.getString("Cont"));
                dto.setCorrectly(rs.getBoolean("Correctly"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public AnswerDTO getAnswerByQuestionId(String id) throws Exception {
        AnswerDTO dto = null;
        String sql = "Select Id, Cont, Correctly From tblAnswer Where QuestionId = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()) {
                dto = new AnswerDTO();
                dto.setId(rs.getInt("Id"));
                dto.setCont(rs.getString("Cont"));
                dto.setCorrectly(rs.getBoolean("Correctly"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean update(String questionId, int id, AnswerDTO answer) throws Exception {
        String sql = "Update tblAnswer Set Cont=?, Correctly=? Where QuestionId = ? And Id = ?";
        return query(sql, answer.getCont(), answer.isCorrectly(), questionId, id);
    }
    
    public boolean create(AnswerDTO dto) throws Exception {
        String sql = "Insert Into tblAnswer(Cont, QuestionId, Correctly) Values(?,?,?)";
        return query(sql, dto.getCont(), dto.getQuestion(), dto.isCorrectly());
    }
}
