package danhnlc.db;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {


    public static Connection getConnection() throws Exception {
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBConnection");
        Connection conn = ds.getConnection();
        return conn;
    }

}
