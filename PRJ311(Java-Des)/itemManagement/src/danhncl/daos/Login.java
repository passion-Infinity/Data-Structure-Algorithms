/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.daos;

import danhnlc.dtos.Users;
import danhnlc.utils.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class Login implements Serializable{
    
    public boolean checkLogin(String username, String password) throws Exception{
        Connection conn = null;
        PreparedStatement prStm = null;
        ResultSet rs = null;
        String sql = "Select * From tblUsers Where userID=? and password=?";
        try {
            conn = DBConnection.getConnection();
            prStm = conn.prepareStatement(sql);
            prStm.setString(1, username);
            prStm.setString(2, password);
            rs = prStm.executeQuery();
            while(rs.next()) {
                Users user = new Users();
                user.setUsername(rs.getString("userID"));
                user.setPassword(rs.getString("password"));
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) {
                    rs.close();
                }
                if(prStm != null) {
                    prStm.close();
                }
                if(conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        return false;
    }
}
