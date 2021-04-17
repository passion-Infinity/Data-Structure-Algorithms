package danhnlc.dao;

import danhnlc.dto.CustomerDTO;
import danhnlc.util.DBConnection;
import java.sql.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class CustomerDAO extends AbstractDAO {

    public CustomerDTO checkLogin(String email, String password) throws Exception {
        CustomerDTO dto = null;
        String sql = "Select Email, Fullname, Status, Code, Role From tblCustomers Where Email = ? And Password = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            rs = statement.executeQuery();
            if (rs.next()) {
                dto = new CustomerDTO();
                dto.setEmail(rs.getString("Email"));
                dto.setFullname(rs.getString("Fullname"));
                dto.setStatus(rs.getString("Status"));
                dto.setCode(rs.getString("Code"));
                dto.setRole(rs.getString("Role"));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean registerAccount(CustomerDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert Into tblCustomers(Email,Fullname,Password,Phone,Address,Status,CreatedDate,Role) Values(?,?,?,?,?,?,?,?)";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, dto.getEmail());
            statement.setString(2, dto.getFullname());
            statement.setString(3, dto.getPassword());
            statement.setString(4, dto.getPhone());
            statement.setString(5, dto.getAddress());
            statement.setString(6, dto.getStatus());
            statement.setDate(7, (Date) dto.getCreatedDate());
            statement.setString(8, "customer");
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public static boolean sendMail(String to, String subject, String content) {
        String email = "tentoiladanhdeptrai@gmail.com";
        String password = "AaaBbbCcc123456";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException e) {
            return false;
        }
        return true;
    }

    public String sendActiveCode(String email) throws Exception {
        String title = "KICH HOAT TAI KHOAN";
        int code = (int) Math.floor(((Math.random() * 899999) + 100000));
        String content = "Ma kich hoat: " + code;
        sendMail(email, title, content);
        return String.valueOf(code);
    }

    public String checkStatusEmail(String email) throws Exception {
        String result = null;
        String sql = "Select Status From tblCustomers Where Email = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getString("Status");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updateCode(String code, String email) throws Exception {
        boolean check = false;
        String sql = "Update tblCustomers Set Code = ? Where Email = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, code);
            statement.setString(2, email);
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updateStatus(String email) throws Exception {
        boolean check = false;
        String sql = "Update tblCustomers Set Status = 'Active' Where Email = ?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            check = statement.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
