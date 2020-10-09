package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.User;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends AbstractDAO {

    public User checkLogin(String username, String password) throws Exception {
        User user = null;
        String us, pas, fu, ro;
        String sql = "Select username, fullname, password, role From tblUsers Where username=? And password=?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                us = rs.getString("username");
                fu = rs.getString("fullname");
                pas = rs.getString("password");
                ro = rs.getString("role");
                user = new User(us, fu, pas, ro);
            }
        } finally {
            closeConnection();
        }
        return user;
    }

    public List<User> getList(String name) throws Exception {
        List<User> result = null;
        String us, fu, pa, ro;
        String sql = "Select username, fullname, password, role From tblUsers Where fullname Like ?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                us = rs.getString("username");
                fu = rs.getString("fullname");
                pa = rs.getString("password");
                ro = rs.getString("role");
                result.add(new User(us, fu, pa, ro));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean register(User user) throws Exception {
        String sql = "Insert Into tblUsers(username, fullname, password, role) Values(?,?,?,?)";
        return query(sql, user.getUsername(), user.getFullname(), user.getPassword(), user.getRole());
    }

    public boolean update(User user) throws Exception {
        String sql = "Update tblUsers Set fullname=?, password=?, role=? Where username=?";
        return query(sql, user.getFullname(), user.getPassword(), user.getRole(), user.getUsername());
    }

    public boolean delete(String username) throws Exception {
        String sql = "Delete From tblUsers Where username=?";
        return query(sql, username);
    }
}
