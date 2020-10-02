/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bai1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

/**
 *
 * @author User
 */

/*
    *Create IOFile class to get and write data.
    * Ham co 2 phuong thuc: 
      - Doc file: dau vao la 1 file can doc, dau ra la mot danh sach doc duoc tu file va dc sap xep
      - Ghi file: ghi file theo de bai yeu cau.
        + Dau vao: la mot danh sach luu infor cua nguoi choi, va file can ghi
 */
public class IOFile {

    public static PriorytiQueue readFile(String file) {
//        File f = null;
        FileReader fr = null;
        BufferedReader br = null;
        PriorytiQueue queue = new PriorytiQueue();
        try {
//            f = new File(file);
            fr = new FileReader(file);
            br = new BufferedReader(fr);
            String s = br.readLine();
            while (br.ready()) {
                s = br.readLine();
                StringTokenizer stk = new StringTokenizer(s, ", ");
                String email = stk.nextToken();
                long point = Long.parseLong(stk.nextToken());

                Player player = new Player(email, point);
                queue.addAndSort(player);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
                if (fr != null) {
                    fr.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return queue;
    }
    
    public static void writeToFile(PriorytiQueue queue, String file) {
        if (queue.getList().getSize() == 0) {
            System.out.println("Error: List empty");
        } else {
            File f = null;
            FileWriter fw = null;
            PrintWriter pw = null;
            try {
                f = new File(file);
                fw = new FileWriter(f);
                pw = new PrintWriter(fw);
                pw.println("Email, point");
                DoublyLinkedList.Node<Player> current = queue.getList().getHeader();// lay gia tri dau tien cua hang doi
                while (current.getNext() != null) {// duyet danh sach cho den phan tu cuoi cung
                    pw.println(current.getElement().toString());
                    current = current.getNext();// buoc nhay
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pw != null) {
                        pw.close();
                    }
                    if (fw != null) {
                        fw.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
