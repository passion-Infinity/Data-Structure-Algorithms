package danhnlc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String SERVERID = "localhost";
    private static final String PORT = "6054";
    private static final String DATABASE = "Cart_JSTL";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "danh123";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + SERVERID + ":" + PORT + ";databaseName=" + DATABASE;
            conn = DriverManager.getConnection(url, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
