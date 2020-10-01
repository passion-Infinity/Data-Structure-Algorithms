
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CLI;

import Program.AVLTree;
import Program.Player;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Main {

    public static void main(String[] args) {
        commandLine(args);
    }

    /**
     * @define a constant HELP
     */
    final static String HELP = "Help: \n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -lnr <<new_user_CSV_file>>: Read the user csv file and save the tree strucutre with LNR order into csv file\n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -nlr <<new_user_CSV_file>>: Read the user csv file and save the tree strucutre with NLR order into csv file\n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -lrn <<new_user_CSV_file>>: Read the user csv file and save the tree strucutre with LRN order into csv file\n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -insert <<another_user_CSV_file>> -<<order>>  <<new_user_CSV_file>>: Read the user csv file, insert the users from another user CSV file and save the tree strucutre with <<order>> into csv file, <<order>> is one in [lnr, nlr, lrn]\n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -delete <<email>> -<<order>> <<new_user_CSV_file>>: Read the user csv file, delete the users with email and save the tree strucutre with <<order>> into csv file, <<order>> is one in [lnr, nlr, lrn], <<delete_mode>> is one in [merge-right, merge-left, copy-right, copy-left]\n"
            + "java -jar LAB2.jar -r <<user_CSV_file>> -update <<another_user_CSV_file>> -<<order>>  <<new_user_CSV_file>>: Read the user csv file, update the user point from another user CSV file and save the tree strucutre with <<order>> into csv file, <<order>> is one in [lnr, nlr, lrn]\n";

    /**
     * @param String[] a, String s
     * @return a position of s in a
     */
    private static int find(String[] a, String s) {
        for (int i = 0; i < a.length; i++) {
            if (a[i].equals(s)) {
                return i;
            }
        }
        return -1;

    }

    /**
     * Kiem tra dieu kien users nhap tu commandline
     *
     * @param cmdStrings
     * @return String
     */
    public static String checkFormatCommandLine(String[] cmdStrings) {
        String result = "";
        String checkFormat = cmdStrings.length != 0 ? cmdStrings[0] : "";
        if (cmdStrings.length == 0 || checkFormat.equalsIgnoreCase("-h")) {
            result = HELP;
        } else {
            if (find(cmdStrings, "-r") == -1) {
                result = "Error: Not input file.";
            } else if (find(cmdStrings, "-1") + 1 >= cmdStrings.length) {
                result = "Error: Not found file.";
            }
        }
        return result;
    }

    /**
     *
     * @param cmdStrings
     */
    public static void commandLine(String[] cmdStrings) {
        List<Player> list = new ArrayList<>();
        AVLTree<Player> aVLTree = new AVLTree();
        String msg = checkFormatCommandLine(cmdStrings);
        if (msg.equals("") && cmdStrings[0].equals("-r")) {
            try {
                for (int i = 0; i < cmdStrings.length; i++) {
                    switch (cmdStrings[i]) {
                        case "-r":
                            String inputFile = cmdStrings[i + 1].trim();
                            aVLTree.insert(list, inputFile);
                            break;

                        case "-lnr":
                            String outputLNR = cmdStrings[i + 1].trim();
                            aVLTree.ghi("lnr", outputLNR);
                            break;

                        case "-nlr":
                            String outputNLR = cmdStrings[i + 1].trim();
                            aVLTree.ghi("nlr", outputNLR);
                            break;

                        case "-lrn":
                            String outputLRN = cmdStrings[i + 1].trim();
                            aVLTree.ghi("lrn", outputLRN);
                            break;

                        case "-insert":
                            String insertFile = cmdStrings[i + 1].trim();
                            aVLTree.insert(list, insertFile);
                            break;

                        case "-delete":
                            String deleteFile = cmdStrings[i + 1].trim();
                            aVLTree.delete(list, deleteFile);
                            break;

                        case "-update":
                            String updateFile = cmdStrings[i + 1].trim();
                            aVLTree.update(list, updateFile);
                            break;
                    }
                }
            } catch (Exception e) {
                System.out.println("Wrong instructor!");
            }
        } else {
            System.out.println(msg);
        }

    }

}
