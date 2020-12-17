package danhnlc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String SERVERID = "localhost";
    private static final String PORT = "6054";
    private static final String DATABASE = "ReservationResort";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "danh123";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + SERVERID + ":" + PORT + ";databaseName=" + DATABASE;
            conn = DriverManager.getConnection(url, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
        }
        return conn;
    }
}
