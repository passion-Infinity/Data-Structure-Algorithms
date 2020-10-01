/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Program;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author User
 */
public class AVLTree<E> {

    private class Node<E> {

        public int bf;

        public Player value;

        public int height;

        public Node left, right;

        public Node(Player value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return value.getEmail() + ", " + value.getPoint();
        }

    }

    private Node root;

    public AVLTree() {
        this.root = null;
    }

    private int height() {
        if (root == null) {
            return 0;
        }
        return root.height;
    }

    private boolean contains(Node<E> node, Player value) {
        if (node == null) {
            return false;
        }

        if (value.getPoint() < node.value.getPoint()) {
            return contains(node.left, value);
        }

        if (value.getPoint() > node.value.getPoint()) {
            return contains(node.right, value);
        }

        return true;
    }

    public boolean insert(Player value) {
        if (value == null) {
            return false;
        }
        if (!contains(root, value)) {
            root = insert(root, value);
            return true;
        }
        return false;
    }

    private Node<E> insert(Node<E> node, Player value) {
        if (node == null) {
            return new Node(value);
        }

        if (value.getPoint() < node.value.getPoint()) {
            node.left = insert(node.left, value);
        }

        if (value.getPoint() > node.value.getPoint()) {
            node.right = insert(node.right, value);
        }
        
        update(node);
        return balance(node);
    }

    private void update(Node<E> node) {
        int leftNodeHeight = (node.left == null) ? -1 : node.left.height;
        int rightNodeHeight = (node.right == null) ? -1 : node.right.height;

        node.height = 1 + Math.max(leftNodeHeight, rightNodeHeight);
        node.bf = rightNodeHeight - leftNodeHeight;
    }

    private Node<E> balance(Node<E> node) {
        if (node.bf == -2) {
            if (node.left.bf <= 0) {
                return leftLeftCase(node);
            } else {
                return leftRightCase(node);
            }
        } else if (node.bf == +2) {
            if (node.right.bf >= 0) {
                return rightRightCase(node);
            } else {
                return rightLeftCase(node);
            }
        }
        return node;
    }

    private Node<E> leftLeftCase(Node<E> node) {
        return rightRotation(node);
    }

    private Node<E> leftRightCase(Node<E> node) {
        node.left = leftRotation(node.left);
        return leftLeftCase(node);
    }

    private Node<E> rightRightCase(Node<E> node) {
        return leftRotation(node);
    }

    private Node<E> rightLeftCase(Node<E> node) {
        node.right = rightRotation(node.right);
        return rightRightCase(node);
    }

    private Node<E> leftRotation(Node<E> node) {
        Node newParent = node.right;
        node.right = newParent.left;
        newParent.left = node;
        update(node);
        update(newParent);
        return newParent;
    }

    private Node<E> rightRotation(Node<E> node) {
        Node newParent = node.left;
        node.left = newParent.right;
        newParent.right = node;
        update(node);
        update(newParent);
        return newParent;
    }

    private boolean remove(Player value) {
        if (value == null) {
            return false;
        }
        if (contains(root, value)) {
            root = remove(root, value);
            return true;
        }
        return false;
    }

    static int count = 1;
    private Node<E> remove(Node<E> node, Player value) {
        if (node == null) {
            return null;
        }

        if (value.getPoint() < node.value.getPoint()) {
            node.left = remove(node.left, value);

        } else if (value.getPoint() > node.value.getPoint()) {
            node.right = remove(node.right, value);

        } else {
            if (node.left == null) {
                if (count == 1) {
                    System.out.println("[Delete] " + node.toString());
                }
                return node.right;

            } else if (node.right == null) {
                if (count == 1) {
                    System.out.println("[Delete] " + node.toString());
                }
                return node.left;

            } else {
                if (node.left.height > node.right.height) {
                    System.out.println("[Delete RightMost] " + node.toString());
                    count++;
                    Player successorValue = findMax(node.left);
                    node.value = successorValue;
                    node.left = remove(node.left, successorValue);

                } else {
                    System.out.println("[Delete LeftMost] " + node.toString());
                    count++;
                    Player successorValue = findMin(node.right);
                    node.value = successorValue;
                    node.right = remove(node.right, successorValue);
                }
            }
        }

        update(node);
        return balance(node);
    }

    private Player findMin(Node<E> node) {
        while (node.left != null) {
            node = node.left;
        }
        return node.value;
    }

    private Player findMax(Node<E> node) {
        while (node.right != null) {
            node = node.right;
        }
        return node.value;
    }

    private void NLR(Node<E> node, PrintWriter output) {
        if (node == null) {
            return;
        }
        output.println(node.toString());
        NLR(node.left, output);
        NLR(node.right, output);
    }

    private void LNR(Node<E> node, PrintWriter output) {
        if (node == null) {
            return;
        }
        LNR(node.left, output);
        output.println(node.toString());
        LNR(node.right, output);
    }

    private void LRN(Node<E> node, PrintWriter output) {
        if (node == null) {
            return;
        }
        LRN(node.left, output);
        LRN(node.right, output);
        output.println(node.toString());
    }

    private void NLR(Node<E> node) {
        if (node == null) {
            return;
        }
        System.out.print(node.value.toString());
        NLR(node.left);
        NLR(node.right);
    }

    private void LNR(Node<E> node) {
        if (node == null) {
            return;
        }
        LNR(node.left);
        System.out.print(node.value.toString());
        LNR(node.right);
    }

    public void ghi(String type, String file) {
        PrintWriter pw = null;
        try {
            pw = new PrintWriter(new FileWriter(file));
            pw.println("Email, Point");
            switch (type.trim().toLowerCase()) {
                case "nlr":
                    NLR(root, pw);
                    break;
                case "lnr":
                    LNR(root, pw);
                    break;
                case "lrn":
                    LRN(root, pw);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pw != null) {
                    pw.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void update(List<Player> list, String file) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String s = br.readLine();
            while (br.ready()) {
                s = br.readLine();
                String[] rows = s.split(",");
                String email = rows[0].trim();
                long point = Long.parseLong(rows[1].trim());
                Player player = new Player(email, point);
                Player temp = new Player();
                for (Player x : list) {
                    if (x.getEmail().equalsIgnoreCase(email)) {
                        temp.setEmail(x.getEmail());
                        temp.setPoint(x.getPoint());
                        list.remove(x);
                        break;
                    }
                }
                remove(temp);
                insert(player);
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

    public void delete(List<Player> list, String file) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String s = br.readLine();
            while (br.ready()) {
                s = br.readLine();
                String[] rows = s.split(",");
                String email = rows[0].trim();
                long point = Long.parseLong(rows[1].trim());
                Player player = new Player(email, point);
                remove(player);
                list.remove(player);
                NLR(root);
                System.out.println();
                LNR(root);
                System.out.println("\n");
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

    public void insert(List<Player> list, String file) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String s = br.readLine();
            while (br.ready()) {
                s = br.readLine();
                String[] rows = s.split(",");
                String email = rows[0].trim();
                long point = Long.parseLong(rows[1].trim());
                Player player = new Player(email, point);
                insert(player);
                list.add(player);
                System.out.println("[INSERT]" + player.toString());
                NLR(root);
                System.out.println();
                LNR(root);
                System.out.println("\n");
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
