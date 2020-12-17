/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class DBConnection implements Serializable {

    private static ArrayList<String> list = new ArrayList<>();

    public static Connection getConnection() {
        String fileName = "DBConnection.txt";
        loadFile(fileName);
        try {
            Class.forName(list.get(0));
            Connection conn = DriverManager.getConnection(list.get(1), list.get(2), list.get(3));
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static void loadFile(String fileName) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(fileName));
            String str;
            while ((str = br.readLine()) != null) {
                String[] s = str.split("==");
                list.add(s[1].trim());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
