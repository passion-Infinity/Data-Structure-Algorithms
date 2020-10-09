package danhnlc.common;

import danhnlc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AbstractDAO {

    protected Connection conn = null;
    protected PreparedStatement preStm = null;
    protected ResultSet rs = null;

    protected void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setParameters(PreparedStatement preStm, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof String) {
                    preStm.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    preStm.setInt(index, (int) parameter);
                } else if (parameter instanceof Float) {
                    preStm.setFloat(index, (float) parameter);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected boolean query(String sql, Object... obj) throws Exception {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            setParameters(preStm, obj);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
