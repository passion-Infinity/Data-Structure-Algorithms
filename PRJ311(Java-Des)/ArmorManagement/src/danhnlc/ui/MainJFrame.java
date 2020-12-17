/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.ui;

import danhnlc.Interface.ArmorInterface;
import danhnlc.daos.ArmorDAO;
import danhnlc.dtos.Armor;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User LocalDate now = java.time.LocalDate.now();
 */
public class MainJFrame extends javax.swing.JFrame {

    DefaultTableModel model;
    LocalDate now = java.time.LocalDate.now();
    ArmorInterface armorInterface;

    public MainJFrame() {
        initComponents();
        this.setLocationRelativeTo(null);
        model = (DefaultTableModel) tblViewArmor.getModel();
        txtTimeOfCreate.setEditable(false);
    }

    private void display() {
        try {
            armorInterface = new ArmorDAO();
            List<Armor> list = armorInterface.findAllArmor();
            
            for (Armor armor : list) {
                model.addRow(armor.toVector());
            }
            writeToFile();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void writeToFile() {
        FileWriter fw;
        BufferedWriter pw;
        try {
            fw = new FileWriter(new File("Export.txt"));
            pw = new BufferedWriter(fw);
            pw.write("ArmorID, " + "Classification, " + "TimeOfCreate, " + "Defense\n");
            for (int j = 0; j < tblViewArmor.getRowCount(); j++) {
                for (int k = 0; k < tblViewArmor.getColumnCount(); k++) {
                    pw.write("" + model.getValueAt(j, k) + ", ");
                    
                }
                pw.write("\n");
            }
            pw.close();
            fw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private boolean showDialog() {
        int dialog = JOptionPane.showConfirmDialog(null, "Do you want to continute?", "Message", JOptionPane.YES_OPTION);
        return dialog == JOptionPane.YES_OPTION;
    }

    private String reverseString(String s) {
        String[] str = s.split("-");
        String result = "";
        for (int i = str.length - 1; i >= 0; i--) {
//            if(i == 2) {
//                str[i] = String.valueOf(Integer.parseInt(str[i]) + 2);
//            }
            if (i != 0) {
                result += str[i] + "/";
            } else {
                result += str[i];
            }
        }
        return result;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        rootPanel = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblViewArmor = new javax.swing.JTable();
        btnGetAll = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtArmorID = new javax.swing.JTextField();
        btnFindByID = new javax.swing.JButton();
        txtClassification = new javax.swing.JTextField();
        txtTimeOfCreate = new javax.swing.JTextField();
        txtDefense = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtStatus = new javax.swing.JTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtDescription = new javax.swing.JTextArea();
        btnCreate = new javax.swing.JButton();
        btnUpdate = new javax.swing.JButton();
        btnRemove = new javax.swing.JButton();
        btnClearAll = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tblViewArmor.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Classification", "TimeOfCreate", "Defense"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.Object.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tblViewArmor.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblViewArmorMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                tblViewArmorMouseReleased(evt);
            }
        });
        jScrollPane1.setViewportView(tblViewArmor);

        btnGetAll.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        btnGetAll.setText("Get All");
        btnGetAll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGetAllActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 736, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(302, 302, 302)
                .addComponent(btnGetAll)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 406, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(80, 80, 80)
                .addComponent(btnGetAll)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 30)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 51, 255));
        jLabel1.setText("Armor Client");

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Armor's Detail", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 14))); // NOI18N

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("ArmorID: ");

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Classification: ");

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("TimeOfCreate: ");

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Defense: ");

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("Description: ");

        btnFindByID.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnFindByID.setText("FindByID");
        btnFindByID.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFindByIDActionPerformed(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("Status: ");

        txtDescription.setColumns(20);
        txtDescription.setRows(5);
        jScrollPane2.setViewportView(txtDescription);

        btnCreate.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnCreate.setText("Create");
        btnCreate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCreateActionPerformed(evt);
            }
        });

        btnUpdate.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnUpdate.setText("Update");
        btnUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUpdateActionPerformed(evt);
            }
        });

        btnRemove.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnRemove.setText("Remove");
        btnRemove.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRemoveActionPerformed(evt);
            }
        });

        btnClearAll.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnClearAll.setText("Clear All");
        btnClearAll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnClearAllActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(27, 27, 27)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jLabel7)
                            .addComponent(jLabel6)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(52, 52, 52)
                        .addComponent(btnCreate)))
                .addGap(24, 24, 24)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtDefense, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtTimeOfCreate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(txtArmorID)
                                    .addComponent(txtClassification, javax.swing.GroupLayout.DEFAULT_SIZE, 218, Short.MAX_VALUE))
                                .addGap(36, 36, 36)
                                .addComponent(btnFindByID))
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(txtStatus, javax.swing.GroupLayout.Alignment.LEADING)))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(43, 43, 43)
                        .addComponent(btnUpdate)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 55, Short.MAX_VALUE)
                        .addComponent(btnRemove)
                        .addGap(48, 48, 48)
                        .addComponent(btnClearAll)
                        .addGap(55, 55, 55))))
        );

        jPanel2Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {txtClassification, txtDefense, txtStatus, txtTimeOfCreate});

        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtArmorID, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnFindByID))
                .addGap(45, 45, 45)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addComponent(txtClassification, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(56, 56, 56)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtTimeOfCreate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(56, 56, 56)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtDefense, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(48, 48, 48)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(35, 35, 35)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(txtStatus, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 63, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCreate)
                    .addComponent(btnUpdate)
                    .addComponent(btnRemove)
                    .addComponent(btnClearAll))
                .addGap(62, 62, 62))
        );

        jPanel2Layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {txtClassification, txtDefense, txtStatus, txtTimeOfCreate});

        javax.swing.GroupLayout rootPanelLayout = new javax.swing.GroupLayout(rootPanel);
        rootPanel.setLayout(rootPanelLayout);
        rootPanelLayout.setHorizontalGroup(
            rootPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(rootPanelLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(rootPanelLayout.createSequentialGroup()
                .addGap(553, 553, 553)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        rootPanelLayout.setVerticalGroup(
            rootPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, rootPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(rootPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(rootPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(rootPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGetAllActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGetAllActionPerformed
        model.getDataVector().removeAllElements();
        display();
    }//GEN-LAST:event_btnGetAllActionPerformed

    private void tblViewArmorMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewArmorMouseReleased
        // TODO add your handling code here:
        int row = tblViewArmor.getSelectedRow();
        int col = tblViewArmor.getSelectedColumn();
        tblViewArmor.getCellEditor(row, col).cancelCellEditing();
    }//GEN-LAST:event_tblViewArmorMouseReleased

    private void tblViewArmorMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewArmorMouseClicked
        // TODO add your handling code here:
        try {
            int row = tblViewArmor.getSelectedRow();
            String code = (String) tblViewArmor.getValueAt(row, 0);
            armorInterface = new ArmorDAO();
            Armor ar = armorInterface.findByArmorID(code);
            txtArmorID.setText(ar.getArmorID());
            txtArmorID.setEditable(false);
            txtClassification.setText(ar.getClassification());
            txtDescription.setText(ar.getDescription());
            txtStatus.setText(ar.getStatus());
            txtTimeOfCreate.setText(reverseString(String.valueOf(ar.getTimeOfCreate())));
            txtTimeOfCreate.setEditable(true);
            txtDefense.setText(String.valueOf(ar.getDefense()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_tblViewArmorMouseClicked

    private void btnFindByIDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFindByIDActionPerformed
        // TODO add your handling code here:
        boolean check = false;
        try {
            String code = txtArmorID.getText();
            armorInterface = new ArmorDAO();
            Armor ar = armorInterface.findByArmorID(code);
            List<Armor> list = armorInterface.findAllArmor();
            for (Armor armor : list) {
                if (ar.getArmorID().equals(armor.getArmorID())) {
                    check = true;
                    break;
                }
            }
            if (check) {
                txtArmorID.setText(ar.getArmorID());
                txtArmorID.setEditable(false);
                txtClassification.setText(ar.getClassification());
                txtDescription.setText(ar.getDescription());
                txtStatus.setText(ar.getStatus());
                txtTimeOfCreate.setText(reverseString(String.valueOf(ar.getTimeOfCreate())));
                txtTimeOfCreate.setEditable(true);
                txtDefense.setText(String.valueOf(ar.getDefense()));
            } else {
                JOptionPane.showMessageDialog(this, "Not found empID!");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Not found empID!");
        }
    }//GEN-LAST:event_btnFindByIDActionPerformed

    private void btnClearAllActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnClearAllActionPerformed
        // TODO add your handling code here:
        txtArmorID.setText("");
        txtArmorID.requestFocus();
        txtArmorID.setEditable(true);
        txtClassification.setText("");
        txtDescription.setText("");
        txtStatus.setText("");
        txtTimeOfCreate.setText("");
        txtTimeOfCreate.setEditable(false);
        txtDefense.setText("");
    }//GEN-LAST:event_btnClearAllActionPerformed

    private void btnCreateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCreateActionPerformed
        // TODO add your handling code here:
        String armorID = txtArmorID.getText();
        String classification = txtClassification.getText();
        String description = txtDescription.getText();
        String status = txtStatus.getText();
        String timeOfCreate = reverseString(String.valueOf(now));
        String defense = txtDefense.getText();
        Pattern pID = Pattern.compile("^\\w+$");
        String valid = "";

        if (!pID.matcher(armorID).find()) {
            valid += "ArmorID is not blank and not contain  special characters (@, #, $)\n";
        }
        if (classification.isEmpty()) {
            valid += "Classification is not blank!\n";
        }
        if (description.isEmpty()) {
            valid += "Description is not blank!\n";
        }
        if (defense.isEmpty()) {
            valid += "Defense is not blank!\n";
        }
        if (status.isEmpty()) {
            valid += "Status is not blank!\n";
        }

        try {
            if (valid.isEmpty()) {
                armorInterface = new ArmorDAO();
                Armor armor = new Armor(armorID, classification, description, status, new SimpleDateFormat("dd/MM/yyyy").parse(timeOfCreate), Integer.parseInt(defense));
                if (showDialog()) {
                    if (armorInterface.createArmor(armor)) {
                        JOptionPane.showMessageDialog(this, "Insert successfully.");
                        btnGetAllActionPerformed(evt);
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (e.getMessage().contains("duplicate")) {
                JOptionPane.showMessageDialog(this, "The armorID is existed!");
            }
        }
    }//GEN-LAST:event_btnCreateActionPerformed

    private void btnUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUpdateActionPerformed
        // TODO add your handling code here:
        String armorID = txtArmorID.getText();
        String classification = txtClassification.getText();
        String description = txtDescription.getText();
        String status = txtStatus.getText();
        String timeOfCreate = txtTimeOfCreate.getText();
        String defense = txtDefense.getText();

        Pattern pID = Pattern.compile("^\\w+$");
        Pattern pTimeOfCreate = Pattern.compile("^\\d{2}/\\d{2}/\\d{4}$");
        String valid = "";

        if (!pID.matcher(armorID).find()) {
            valid += "ArmorID is not blank and not contain  special characters (@, #, $)\n";
        }
        if (classification.isEmpty()) {
            valid += "Classification is not blank!\n";
        }
        if (description.isEmpty()) {
            valid += "Description is not blank!\n";
        }
        if (defense.isEmpty()) {
            valid += "Defense is not blank!\n";
        }
        if (status.isEmpty()) {
            valid += "Status is not blank!\n";
        }
        if (!pTimeOfCreate.matcher(timeOfCreate).find()) {
            valid += "Not available timeOfCreate!\n";
        }

        try {
            if (valid.isEmpty()) {
                armorInterface = new ArmorDAO();
                Armor armor = new Armor(armorID, classification, description, status, new SimpleDateFormat("dd/MM/yyyy").parse(timeOfCreate), Integer.parseInt(defense));
                if (showDialog()) {
                    if (armorInterface.updateArmor(armor)) {
                        JOptionPane.showMessageDialog(this, "Update successfully.");
                        btnGetAllActionPerformed(evt);
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_btnUpdateActionPerformed

    private void btnRemoveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRemoveActionPerformed
        // TODO add your handling code here:
        try {
            int row = tblViewArmor.getSelectedRow();
            String id = (String) tblViewArmor.getValueAt(row, 0);
            armorInterface = new ArmorDAO();
            if (showDialog()) {
                if (armorInterface.removeArmor(id)) {
                    JOptionPane.showMessageDialog(this, "Delete successfully.");
                    btnGetAllActionPerformed(evt);
                    btnClearAllActionPerformed(evt);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_btnRemoveActionPerformed

//    /**
//     * @param args the command line arguments
//     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(MainJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(MainJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(MainJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(MainJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new MainJFrame().setVisible(true);
//            }
//        });
//    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnClearAll;
    private javax.swing.JButton btnCreate;
    private javax.swing.JButton btnFindByID;
    private javax.swing.JButton btnGetAll;
    private javax.swing.JButton btnRemove;
    private javax.swing.JButton btnUpdate;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JPanel rootPanel;
    private javax.swing.JTable tblViewArmor;
    private javax.swing.JTextField txtArmorID;
    private javax.swing.JTextField txtClassification;
    private javax.swing.JTextField txtDefense;
    private javax.swing.JTextArea txtDescription;
    private javax.swing.JTextField txtStatus;
    private javax.swing.JTextField txtTimeOfCreate;
    // End of variables declaration//GEN-END:variables
}
