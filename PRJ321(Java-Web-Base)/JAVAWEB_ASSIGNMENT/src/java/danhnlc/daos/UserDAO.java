package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.Order;
import danhnlc.dtos.User;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class UserDAO extends AbstractDAO {
    
    public User checkLogin(String username, String password) throws Exception {
        User user = null;
        String sql = "Select fullname, email, roleID From tblUsers Where username=? And password=?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(username);
                user.setFullname(rs.getString("fullname"));
                user.setPassword("");
                user.setEmail(rs.getString("email"));
                user.setPhone("");
                user.setAddress("");
                user.setRoleID(rs.getString("roleID"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }
    
    public List<User> getList() throws Exception {
        List<User> result = null;
        User user = null;
        String sql = "Select username, fullname, email, phone, address, roleID From tblUsers";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname"));
                user.setPassword("*****");
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRoleID(rs.getString("roleID"));
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public User getInfor(String email) throws Exception {
        User user = null;
        String sql = "Select username, fullname, password, email, roleID From tblUsers Where email=?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setRoleID(rs.getString("roleID"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }
    
    public boolean register(User user) throws Exception {
        String sql = "Insert Into tblUsers(username, fullname, password, email, phone, address, roleID) Values(?,?,?,?,?,?,?)";
        return query(sql, user.getUsername(), user.getFullname(), user.getPassword(), user.getEmail(), user.getPhone(), user.getAddress(), user.getRoleID());
    }
    
    public boolean update(User user) throws Exception {
        String sql = "Update tblUsers Set fullname=?, email=?, phone=?, address=?, roleID=? Where username=?";
        return query(sql, user.getFullname(), user.getEmail(), user.getPhone(), user.getAddress(), user.getRoleID(), user.getUsername());
    }
    
    public boolean delete(String username) throws Exception {
        String sql = "Delete From tblUsers Where username=?";
        return query(sql, username);
    }
    
    public static boolean sendMail(String to, String subject, String text) {
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
            message.setText(text);
            Transport.send(message);
        } catch (MessagingException e) {
            return false;
        }
        return true;
    }
    
    public boolean passwordRecovery(String email) throws Exception {
        boolean check = false;
        User user = getInfor(email);
        if (user != null) {
            sendMail(email, "Password recovery", user.getPassword());
            check = true;
        }
        return check;
    }
    
    public boolean confirmCheckOut(String email) throws Exception {
        boolean check = false;
        User user = getInfor(email);
        if (user != null) {
            OrderDAO dao = new OrderDAO();
            Order order = dao.getOrder(user.getUsername());
            String content = "You have already make a reservation successful at Resort with order content:\n"
                    + "Order ID: " + order.getOrderID() + "\n"
                    + "At time: " + order.getDate() + "\n"
                    + "Total: " + order.getTotal() + "\n\n"
                    + "                                         Thank you!";
            sendMail(email, "Confirm Booking at Resort", content);
            check = true;
        }
        return check;
    }
}
