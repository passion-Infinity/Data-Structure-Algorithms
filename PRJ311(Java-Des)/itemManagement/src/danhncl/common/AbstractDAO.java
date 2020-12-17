/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.common;

import static danhnlc.utils.DBConnection.getConnection;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class AbstractDAO implements Serializable {

    protected Connection conn = null;
    protected CallableStatement cs = null;
    protected ResultSet rs = null;

    protected void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if(cs != null) {
                cs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected boolean query(String sql, Object... parameters) throws Exception {
        boolean check = false;
        try {
            conn = getConnection();
            cs = conn.prepareCall(sql);
            setParameters(cs, parameters);
            check = cs.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    private void setParameters(CallableStatement cs, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof String) {
                    cs.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    cs.setInt(index, (Integer) parameter);
                } else if(parameter instanceof Boolean) {
                    cs.setBoolean(index, (Boolean) parameter);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }
}
