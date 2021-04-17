package danhnlc.dao;

import danhnlc.db.DBConnection;
import danhnlc.dto.AccountDTO;
import danhnlc.util.AbstractDAO;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class AccountDAO extends AbstractDAO {

    private String hashStringSHA256(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        password = Base64.getEncoder().encodeToString(hash);
        return password;
    }

    //Register for an account
    public boolean registerAccount(AccountDTO account) throws Exception {
        String sql = "Insert Into tblAccount(Email, Name, Password, Role, Status) Values(?,?,?,?,?)";
        return query(sql, account.getEmail(), account.getName(), hashStringSHA256(account.getPassword()), account.getRole(), account.getStatus());
    }

    //Check Account to login
    public AccountDTO checkLogin(String email, String password) throws Exception {
        AccountDTO account = null;
        String sql = "Select Email, Name, Role, Status From tblAccount Where Email=? And Password=?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            preStm.setString(2, hashStringSHA256(password));
            rs = preStm.executeQuery();
            if (rs.next()) {
                account = new AccountDTO();
                account.setEmail(email);
                account.setName(rs.getString("Name"));
                account.setRole(rs.getString("Role"));
                account.setStatus(rs.getString("Status"));
            }
        } finally {
            closeConnection();
        }
        return account;
    }
}
