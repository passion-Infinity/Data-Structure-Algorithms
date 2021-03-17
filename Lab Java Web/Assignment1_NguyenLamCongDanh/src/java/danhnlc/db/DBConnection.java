package danhnlc.db;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Context context = new InitialContext();
            Context end = (Context) context.lookup("java:comp/env");
            DataSource ds = (DataSource) end.lookup("DBConnection");
            conn = ds.getConnection();
        } catch (SQLException | NamingException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
