package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.AnswerDTO;
import danhnlc.dto.QuestionDTO;
import danhnlc.dto.SubjectDTO;
import danhnlc.util.AbstractDAO;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuestionDAO extends AbstractDAO {

    public List getQuestionListBySearching(String search, String subject, String status, int indexPage, int size) throws Exception {
        List result = null;
        QuestionDTO question = null;
        SubjectDTO subjectDTO = null;
        HashMap<String, String> maps = new HashMap<>();
        maps.put("Cont", search);
        maps.put("Subject", subject);
        maps.put("Status", status);
        String sql = "Select Id, Cont, Status, Subject, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy "
                + "From tblQuestion ";
        boolean flag1 = true;
        for (String key : maps.keySet()) {
            String value = maps.get(key);
            if (!value.trim().isEmpty()) {
                if (flag1) {
                    sql += "Where " + key + " ";
                    if (key.equals("Cont")) {
                        sql += "Like ? ";
                    } else {
                        sql += "= ? ";
                    }
                    flag1 = false;
                } else {
                    if (key.equals("Cont")) {
                        sql += "And " + key + " Like ? ";
                    } else {
                        sql += "And " + key + " = ? ";
                    }
                }
            }
        }

        boolean check = false;
        if (!sql.contains("Where")) {
            sql = "Select Id, Name From tblSubject ";
            check = true;
        }

        sql += "Order By Id "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            int index = 1;
            for (String key : maps.keySet()) {
                String value = maps.get(key);
                if (!value.equals("")) {
                    if (key.equals("Cont")) {
                        preStm.setString(index, "%" + value + "%");
                    } else {
                        preStm.setString(index, value);
                    }
                    index++;
                }
            }
            preStm.setInt(index, (indexPage - 1) * size);
            preStm.setInt(++index, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            AnswerDAO answerDAO = new AnswerDAO();
            List<AnswerDTO> answerList = null;
            while (rs.next()) {
                if (check) {
                    subjectDTO = new SubjectDTO();
                    subjectDTO.setId(rs.getString("Id"));
                    subjectDTO.setName(rs.getString("Name"));
                    result.add(subjectDTO);
                } else {
                    question = new QuestionDTO();
                    question.setId(rs.getInt("Id"));
                    question.setCont(rs.getString("Cont"));
                    question.setStatus(rs.getString("Status"));
                    question.setSubject(rs.getString("Subject"));
                    question.setCreatedDate(rs.getDate("CreatedDate"));
                    question.setCreatedBy(rs.getString("CreatedBy"));
                    question.setModifiedDate(rs.getDate("ModifiedDate"));
                    question.setModifiedBy(rs.getString("ModifiedBy"));
                    answerList = answerDAO.getAnswerListByQuestionId(question.getId());
                    question.setAnswerList(answerList);
                    result.add(question);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfPages(String search, String subject, String status, int size) throws Exception {
        HashMap<String, String> maps = new HashMap<>();
        maps.put("Cont", search);
        maps.put("Subject", subject);
        maps.put("Status", status);
        String sql = "Select count(*) From tblQuestion ";
        boolean flag1 = true;
        for (String key : maps.keySet()) {
            String value = maps.get(key);
            if (!value.trim().isEmpty()) {
                if (flag1) {
                    sql += "Where " + key + " ";
                    if (key.equals("Cont")) {
                        sql += "Like ? ";
                    } else {
                        sql += "= ? ";
                    }
                    flag1 = false;
                } else {
                    if (key.equals("Cont")) {
                        sql += "And " + key + " Like ? ";
                    } else {
                        sql += "And " + key + " = ? ";
                    }
                }
            }
        }
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            int index = 1;
            for (String key : maps.keySet()) {
                String value = maps.get(key);
                if (!value.equals("")) {
                    if (key.equals("Cont")) {
                        preStm.setString(index, "%" + value + "%");
                    } else {
                        preStm.setString(index, value);
                    }
                    index++;
                }
            }
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

    public int getNumberOfPages(int size) throws Exception {
        String sql = "Select count(Id) From tblSubject ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
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

    public QuestionDTO getQuestionById(String id) throws Exception {
        QuestionDTO dto = null;
        String sql = "Select Id, Cont, Status, Subject From tblQuestion Where Id = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                dto = new QuestionDTO();
                dto.setId(rs.getInt("Id"));
                dto.setCont(rs.getString("Cont"));
                dto.setSubject(rs.getString("Subject"));
                dto.setStatus(rs.getString("Status"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public int getQuestionId() throws Exception {
        String sql = "Select TOP(1) Id From tblQuestion Order By Id DESC";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                int result = rs.getInt(1);
                return result;
            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public int getNumberOfQuestion(String subject) throws Exception {
        String sql = "SELECT count(Id) From tblQuestion Where Status = 'Actived' And Subject = ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, subject);
            rs = preStm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return 0;
    }

//    public List<QuestionDTO> getListQuestionToTest(int numberOfQuestion, String subject, int index, int size) throws Exception {
//        List<QuestionDTO> result = null;
//        List<AnswerDTO> answerList = null;
//        QuestionDTO questionDTO = null;
//        String sql = "SELECT Id, Cont, Status From "
//                + "(SELECT TOP(?) Id, Cont, Status From tblQuestion Where Subject = ? "
//                + "ORDER BY Id) as tblQuestion "
//                + "ORDER BY Id "
//                + "OFFSET ? ROWS "
//                + "FETCH FIRST ? ROWS ONLY ";
//        try {
//            conn = DBConnection.getConnection();
//            preStm = conn.prepareStatement(sql);
//            preStm.setInt(1, numberOfQuestion);
//            preStm.setString(2, subject);
//            preStm.setInt(3, (index - 1) * size);
//            preStm.setInt(4, size);
//            rs = preStm.executeQuery();
//            result = new ArrayList<>();
//            answerList = new ArrayList<>();
//            AnswerDAO answerDAO = new AnswerDAO();
//            while (rs.next()) {
//                questionDTO = new QuestionDTO();
//                questionDTO.setId(rs.getInt("Id"));
//                questionDTO.setCont(rs.getString("Cont"));
//                questionDTO.setStatus(rs.getString("Status"));
//                answerList = answerDAO.getAnswerListByQuestionId(questionDTO.getId());
//                questionDTO.setAnswerList(answerList);
//                result.add(questionDTO);
//            }
//        } finally {
//            closeConnection();
//        }
//        return result;
//    }
    public List<QuestionDTO> getListQuestionToTest(int numberOfQuestion, String subject, int index, int size, String temp, String email, Timestamp startTime) throws Exception {
        List<QuestionDTO> result = null;
        List<AnswerDTO> answerList = null;
        QuestionDTO questionDTO = null;
        String sql = "";
        if (temp == null) {
            sql = "SELECT TOP(?) Id, Cont, Status, Subject From tblQuestion Where Subject = ? And Status = 'Actived' "
                    + "ORDER BY NEWID() ";

        } else {
            sql = "SELECT Id, QuestionId, Cont, Status, Subject From "
                    + "(SELECT TOP(?) Id, QuestionId, Cont, Status, Subject From tblQuestionTesting "
                    + "Where Subject = ? And Email = ? And StartTime = ? "
                    + "ORDER BY Id) "
                    + "as tblQuestionTesting "
                    + "ORDER BY Id "
                    + "OFFSET ? ROWS "
                    + "FETCH FIRST ? ROWS ONLY ";
        }
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, numberOfQuestion);
            preStm.setString(2, subject);
            if (temp != null) {
                preStm.setString(3, email);
                preStm.setString(4, String.valueOf(startTime));
                preStm.setInt(5, (index - 1) * size);
                preStm.setInt(6, size);
            }
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            answerList = new ArrayList<>();
            AnswerDAO answerDAO = new AnswerDAO();
            while (rs.next()) {
                questionDTO = new QuestionDTO();
                if (temp == null) {
                    questionDTO.setId(rs.getInt("Id"));
                } else {
                    questionDTO.setId(rs.getInt("QuestionId"));
                }
                questionDTO.setCont(rs.getString("Cont"));
                questionDTO.setStatus(rs.getString("Status"));
                questionDTO.setSubject(rs.getString("Subject"));
                answerList = answerDAO.getAnswerListByQuestionId(questionDTO.getId());
                questionDTO.setAnswerList(answerList);
                result.add(questionDTO);
                if (temp == null) {
                    sql = "Insert Into tblQuestionTesting(QuestionId, Cont, Status, Subject, Email, StartTime) Values(?,?,?,?,?,?)";
                    questionDTO.setCreatedBy(email);
                    preStm = conn.prepareStatement(sql);
                    preStm.setInt(1, questionDTO.getId());
                    preStm.setString(2, questionDTO.getCont());
                    preStm.setString(3, questionDTO.getStatus());
                    preStm.setString(4, questionDTO.getSubject());
                    preStm.setString(5, questionDTO.getCreatedBy());
                    preStm.setTimestamp(6, startTime);
                    preStm.executeUpdate();
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfTrueAnswer(HashMap<Integer, Integer> submitList, int submitId) throws Exception {
        String insertHistorySQL = "Insert Into tblQuizHistory(QuestionId, AnswerId, SubmitId) Values(?,?,?) ";
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            preStm = conn.prepareStatement(insertHistorySQL);
            for (Map.Entry pair : submitList.entrySet()) {
                preStm.setInt(1, (int) pair.getKey());
                preStm.setInt(2, (int) pair.getValue());
                preStm.setInt(3, submitId);
                preStm.executeUpdate();
            }
            conn.commit();

            String sql = "DECLARE @count int "
                    + "SET @count = ? "
                    + "SELECT COUNT(history.Correctly) as NumberOfTrue FROM "
                    + "(SELECT TOP(@count) h.QuestionId, h.AnswerId, a.Correctly "
                    + "FROM  tblQuizHistory h "
                    + "JOIN tblAnswer a "
                    + "ON h.AnswerId = a.Id And SubmitId = ?) history "
                    + "WHERE history.Correctly = 1 ";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, submitList.size());
            preStm.setInt(2, submitId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberOfTrue");
            }
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
        } finally {
            closeConnection();
        }
        return 0;
    }

    public List<QuestionDTO> getReviewQuestionList(int submitId, String search, int index, int size) throws Exception {
        List<QuestionDTO> result = null;
        List<AnswerDTO> answerList = null;
        QuestionDTO dto = null;
        String sql = "SELECT q.Id as QuestionId, q.Cont as QuestionContent FROM tblQuestion q "
                + "JOIN tblQuizHistory h "
                + "ON q.Id = h.QuestionId And h.SubmitId = ? And q.Cont Like ? "
                + "ORDER BY q.Id "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, submitId);
            preStm.setString(2, "%" + search + "%");
            preStm.setInt(3, (index - 1) * size);
            preStm.setInt(4, size);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            AnswerDAO answerDAO = new AnswerDAO();
            while (rs.next()) {
                dto = new QuestionDTO();
                dto.setId(rs.getInt("QuestionId"));
                dto.setCont(rs.getString("QuestionContent"));
                answerList = answerDAO.getAnswerListByQuestionId(rs.getInt("QuestionId"));
                dto.setAnswerList(answerList);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfPages(String search, int submitId, int size) throws Exception {
        String sql = "SELECT count(QuestionId) From "
                + "(SELECT q.Id as QuestionId, q.Cont as QuestionContent FROM tblQuestion q "
                + "JOIN tblQuizHistory h "
                + "ON q.Id = h.QuestionId And h.SubmitId = ?) as tblTemp "
                + "WHERE QuestionContent Like ? ";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, submitId);
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

    public boolean delete(String id, Date date, String account) throws Exception {
        String sql = "Update tblQuestion Set Status='InActived', ModifiedDate=?, ModifiedBy=? Where Id = ?";
        return query(sql, date, account, id);
    }

    public boolean update(String id, String cont, String status, String subject, Date date, String account) throws Exception {
        String sql = "Update tblQuestion Set Cont=?, Status=?, Subject=?, ModifiedDate=?, ModifiedBy=? Where Id = ?";
        return query(sql, cont, status, subject, date, account, id);
    }

    public boolean create(QuestionDTO dto) throws Exception {
        String sql = "Insert Into tblQuestion(Cont, Status, Subject, CreatedDate, CreatedBy) Values(?,?,?,?,?)";
        return query(sql, dto.getCont(), dto.getStatus(), dto.getSubject(), dto.getCreatedDate(), dto.getCreatedBy());
    }
    
    public boolean CheckListQuestionBySubject(String subject) throws Exception{
        boolean check = false;
        String sql = "Select Id from tblQuestion Where Subject = ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, subject);
            rs = preStm.executeQuery();
            if(rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }
}
