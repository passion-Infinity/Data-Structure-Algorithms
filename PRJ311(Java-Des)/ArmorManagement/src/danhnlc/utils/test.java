/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.utils;

import java.sql.Connection;

/**
 *
 * @author User
 */
public class test {
    public static void main(String[] args) {
        Connection conn = DBConnection.getConnection();
        if(conn != null) {
            System.out.println("Ok");
        } else {
            System.out.println("failed");
        }
    }
}
