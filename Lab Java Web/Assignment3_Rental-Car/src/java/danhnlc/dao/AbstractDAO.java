package danhnlc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class AbstractDAO {

    protected Connection conn = null;
    protected PreparedStatement statement = null;
    protected ResultSet rs = null;
    
    protected void closeConnection() throws Exception{
        if(rs != null) {
            rs.close();
        }
        if(statement != null) {
            statement.close();
        }
        if(conn != null) {
            conn.close();
        }
    }
    
    public String formatDate(Timestamp date) {
        String s = String.valueOf(date);
        String[] strs = s.split(" ");
        return strs[0];
    }
}
