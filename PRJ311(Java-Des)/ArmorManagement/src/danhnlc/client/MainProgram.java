/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.client;

import danhnlc.Interface.ArmorInterface;
import danhnlc.ui.LoginJFrame;
import java.rmi.Naming;

/**
 *
 * @author User
 */
public class MainProgram {
    
    public static void main(String[] args)  {
        try {
            ArmorInterface name = (ArmorInterface) Naming.lookup("rmi://localhost:8888/ArmorRMI");
            new LoginJFrame().setVisible(true);
        } catch (Exception e) {
            System.out.println("Connection refused: Not found server!");
        }
    }
}
