package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.User;

public class UserDAO extends AbstractDAO {
    
    public User checkLogin(String userID, String password) throws Exception {
        User dto = null;
        try {
            String sql = "Select userID, fullName, role From tblUser Where userID=? And password=?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                dto = new User();
                dto.setUserID(userID);
                dto.setFullName(rs.getString("fullName"));
                dto.setRole(rs.getString("role"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean insert(User dto) throws Exception {
        String sql = "Insert Into tblUser(userID, fullName, password, role) Values(?,?,?,?)";
        return query(sql, dto.getUserID(), dto.getFullName(), dto.getPassword(), dto.getRole());
    }
}
