/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author User
 */
public class DBConnection implements Serializable {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Properties p = new Properties();
            BufferedReader br = new BufferedReader(new FileReader("connection.properties"));
            p.load(br);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String serverID = p.getProperty("serverID");
            String host = p.getProperty("host");
            String databaseName = p.getProperty("databaseName");
            String username = p.getProperty("username");
            String password = p.getProperty("password");
            String url = "jdbc:sqlserver://" + serverID + ":" + host + ";databaseName=" + databaseName;
            conn = DriverManager.getConnection(url, username, password);
        } catch (IOException | ClassNotFoundException | SQLException e) {
            e.getStackTrace();
        }
        return conn;
    }
}
