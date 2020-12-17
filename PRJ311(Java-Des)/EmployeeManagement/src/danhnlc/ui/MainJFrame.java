/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.ui;

import danhncl.dtos.Employee;
import danhnlc.daos.EmpDAO;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User
 */
public class MainJFrame extends javax.swing.JFrame {

    DefaultTableModel model;
    String VALID_EMAIL = "^\\w+@\\w+[.]\\w+$";
    String VALID_PHONE = "^[0-9]{9,11}$";
    String VALID_EMPID = "^\\w+$";
    String VALID_DOB = "^\\d{1,2}/\\d{1,2}/\\d{4}$";
    boolean flag = false;

    /**
     * Creates new form MainJFrame
     */
    public MainJFrame() {
        initComponents();
        this.setLocationRelativeTo(null);
        model = (DefaultTableModel) tblViewEmp.getModel();
    }

    private boolean showDialog() {
        int dialog = JOptionPane.showConfirmDialog(null, "Do you want to continute?", "Announcement", JOptionPane.YES_OPTION);
        return dialog == JOptionPane.YES_OPTION;
    }

    private void display() {
        try {
            EmpDAO emp = new EmpDAO();
            List<Employee> list = emp.getAll();
            for (Employee employee : list) {
                if (!employee.isIsDelete()) {
                    model.addRow(employee.toVector());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String reverseString(String s) {
        String[] str = s.split("-");
        String result = "";
        for (int i = str.length - 1; i >= 0; i--) {
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
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblViewEmp = new javax.swing.JTable();
        btnGetAll = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtEmpID = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        txtDOB = new javax.swing.JTextField();
        txtFullName = new javax.swing.JTextField();
        txtPhone = new javax.swing.JTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtAddress = new javax.swing.JTextArea();
        btnCreate = new javax.swing.JButton();
        btnUpdate = new javax.swing.JButton();
        btnRemove = new javax.swing.JButton();
        btnFindByEmpID = new javax.swing.JButton();
        btnClear = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 51, 255));
        jLabel1.setText("Employee Management");

        tblViewEmp.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "EmpID", "Fullname", "Phone", "Email"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tblViewEmp.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblViewEmpMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                tblViewEmpMouseReleased(evt);
            }
        });
        jScrollPane1.setViewportView(tblViewEmp);

        btnGetAll.setFont(new java.awt.Font("Times New Roman", 0, 18)); // NOI18N
        btnGetAll.setText("Get all Emp ");
        btnGetAll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGetAllActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(255, 255, 255)
                .addComponent(btnGetAll)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 406, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(84, 84, 84)
                .addComponent(btnGetAll)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Emp's detail", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 14))); // NOI18N

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("EmpID: ");

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Fullname: ");

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Phone: ");

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Email:");

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("Address: ");

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("DOB: ");

        txtAddress.setColumns(20);
        txtAddress.setRows(5);
        jScrollPane2.setViewportView(txtAddress);

        btnCreate.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnCreate.setText("Create Emp");
        btnCreate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCreateActionPerformed(evt);
            }
        });

        btnUpdate.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnUpdate.setText("Update Emp");
        btnUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUpdateActionPerformed(evt);
            }
        });

        btnRemove.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnRemove.setText("Remove Emp");
        btnRemove.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRemoveActionPerformed(evt);
            }
        });

        btnFindByEmpID.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnFindByEmpID.setText("Find By EmpID");
        btnFindByEmpID.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFindByEmpIDActionPerformed(evt);
            }
        });

        btnClear.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        btnClear.setText("Clear All");
        btnClear.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnClearActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jLabel7)
                            .addComponent(jLabel6))
                        .addGap(41, 41, 41)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtDOB)
                            .addComponent(txtEmail)
                            .addComponent(txtEmpID, javax.swing.GroupLayout.DEFAULT_SIZE, 242, Short.MAX_VALUE)
                            .addComponent(txtFullName)
                            .addComponent(txtPhone)
                            .addComponent(jScrollPane2))
                        .addGap(50, 50, 50)
                        .addComponent(btnFindByEmpID)
                        .addContainerGap(63, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(44, 44, 44)
                        .addComponent(btnCreate)
                        .addGap(40, 40, 40)
                        .addComponent(btnUpdate)
                        .addGap(42, 42, 42)
                        .addComponent(btnRemove)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnClear)
                        .addGap(26, 26, 26))))
        );

        jPanel2Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {txtDOB, txtEmail, txtEmpID, txtFullName, txtPhone});

        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnFindByEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(43, 43, 43)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtFullName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(49, 49, 49)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtPhone, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(52, 52, 52)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtEmail, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(52, 52, 52)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 126, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(44, 44, 44)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(txtDOB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 70, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCreate, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnUpdate)
                    .addComponent(btnRemove)
                    .addComponent(btnClear, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(51, 51, 51))
        );

        jPanel2Layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {txtDOB, txtEmail, txtEmpID, txtFullName, txtPhone});

        jPanel2Layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {btnCreate, btnRemove, btnUpdate});

        jPanel2Layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {btnClear, btnFindByEmpID});

        javax.swing.GroupLayout rootPanelLayout = new javax.swing.GroupLayout(rootPanel);
        rootPanel.setLayout(rootPanelLayout);
        rootPanelLayout.setHorizontalGroup(
            rootPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(rootPanelLayout.createSequentialGroup()
                .addGap(534, 534, 534)
                .addComponent(jLabel1)
                .addContainerGap(545, Short.MAX_VALUE))
            .addGroup(rootPanelLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        rootPanelLayout.setVerticalGroup(
            rootPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(rootPanelLayout.createSequentialGroup()
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
        // TODO add your handling code here:
        model.getDataVector().removeAllElements();
        display();
    }//GEN-LAST:event_btnGetAllActionPerformed

    private void btnCreateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCreateActionPerformed

        // TODO add your handling code here:
        Pattern pEmpID = Pattern.compile(VALID_EMPID);
        Pattern pPhone = Pattern.compile(VALID_PHONE);
        Pattern pEmail = Pattern.compile(VALID_EMAIL);
        Pattern pDOB = Pattern.compile(VALID_DOB);
        String empID = txtEmpID.getText();
        String fullName = txtFullName.getText();
        String phone = txtPhone.getText();
        String email = txtEmail.getText();
        String address = txtAddress.getText();
        String dob = txtDOB.getText();
        String valid = "";
        try {
            if (empID.isEmpty()) {
                valid += "EmpID is not blank!\n";
            }
            if (!pEmpID.matcher(empID).find()) {
                valid += "EmpID does not contains special characters (@, #, $)\n";
            }
            if (fullName.isEmpty()) {
                valid += "fullName is not blank!\n";
            }
            if (phone.isEmpty()) {
                valid += "Phone is not blank!\n";
            }
            if (!pPhone.matcher(phone).find()) {
                valid += "Phone is only in range [0-9] and Phone has to 9-11 numbers\n";
            }
            if (email.isEmpty()) {
                valid += "Email is not blank!\n";
            }
            if (!pEmail.matcher(email).find()) {
                valid += "Not available email! Correct formater: nguyenvana@gmail.com\n";
            }
            if(!pDOB.matcher(dob).find()) {
                valid += "Not available dateOfBirth! Correct formater: dd/MM/yyyy\n";
            }

            if (valid.isEmpty()) {
                Employee emp = new Employee(empID, fullName, phone, email, address, new SimpleDateFormat("dd/MM/yyyy").parse(dob));
                EmpDAO dao = new EmpDAO();
                if (showDialog()) {
                    if (dao.insert(emp)) {
                        JOptionPane.showMessageDialog(this, "Insert successfully.");
                        model.addRow(emp.toVector());
                        btnClearActionPerformed(evt);
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }

        } catch (Exception ex) {
            if (ex.getMessage().contains("duplicate")) {
                JOptionPane.showMessageDialog(this, "The " + empID + " is existed");
            }
        }

    }//GEN-LAST:event_btnCreateActionPerformed

    private void tblViewEmpMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewEmpMouseReleased
        // TODO add your handling code here:
        int row = tblViewEmp.getSelectedRow();
        int col = tblViewEmp.getSelectedColumn();
        tblViewEmp.getCellEditor(row, col).cancelCellEditing();
    }//GEN-LAST:event_tblViewEmpMouseReleased

    private void tblViewEmpMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewEmpMouseClicked
        // TODO add your handling code here:
        try {
            flag = true;
            int row = tblViewEmp.getSelectedRow();
            String code = (String) tblViewEmp.getValueAt(row, 0);
            EmpDAO dao = new EmpDAO();
            Employee emp = dao.findByEmpID(code);
            txtEmpID.setText(emp.getEmpID());
            txtEmpID.setEditable(false);
            txtFullName.setText(emp.getFullName());
            txtPhone.setText(emp.getPhone());
            txtEmail.setText(emp.getEmail());
            txtAddress.setText(emp.getAddress());
            txtDOB.setText(reverseString(String.valueOf(emp.getDob())));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_tblViewEmpMouseClicked

    private void btnClearActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnClearActionPerformed
        // TODO add your handling code here:
        txtEmpID.setText("");
        txtEmpID.setEditable(true);
        txtEmpID.requestFocus();
        txtFullName.setText("");
        txtPhone.setText("");
        txtEmail.setText("");
        txtAddress.setText("");
        txtDOB.setText("");
    }//GEN-LAST:event_btnClearActionPerformed

    private void btnFindByEmpIDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFindByEmpIDActionPerformed
        // TODO add your handling code here:
        boolean check = false;
        try {
            String code = txtEmpID.getText();
            EmpDAO dao = new EmpDAO();
            Employee emp = dao.findByEmpID(code);
            List<Employee> list = dao.getAll();
            for (Employee employee : list) {
                if (!employee.isIsDelete() && employee.getEmpID().equals(emp.getEmpID())) {
                    check = true;
                    break;
                }
            }
            if (check) {
                txtEmpID.setText(emp.getEmpID());
                txtFullName.setText(emp.getFullName());
                txtPhone.setText(emp.getPhone());
                txtEmail.setText(emp.getEmail());
                txtAddress.setText(emp.getAddress());
                txtDOB.setText(reverseString(String.valueOf(emp.getDob())));
            } else {
                JOptionPane.showMessageDialog(this, "Employee is deleted out!");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Not found empID!");
        }
    }//GEN-LAST:event_btnFindByEmpIDActionPerformed

    private void btnUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUpdateActionPerformed
        // TODO add your handling code here:
        Pattern pEmpID = Pattern.compile(VALID_EMPID);
        Pattern pPhone = Pattern.compile(VALID_PHONE);
        Pattern pEmail = Pattern.compile(VALID_EMAIL);
        Pattern pDOB = Pattern.compile(VALID_DOB);
        String empID = txtEmpID.getText();
        String fullName = txtFullName.getText();
        String phone = txtPhone.getText();
        String email = txtEmail.getText();
        String address = txtAddress.getText();
        String dob = txtDOB.getText();
        String valid = "";
        try {
            if (empID.isEmpty()) {
                valid += "EmpID is not blank!\n";
            }
            if (!pEmpID.matcher(empID).find()) {
                valid += "Emp does not contains special characters (@, #, $)\n";
            }
            if (fullName.isEmpty()) {
                valid += "fullName is not blank!\n";
            }
            if (phone.isEmpty()) {
                valid += "Phone is not blank!\n";
            }
            if (!pPhone.matcher(phone).find()) {
                valid += "Phone is only in range [0-9] and Phone has to 9-11 numbers";
            }
            if (email.isEmpty()) {
                valid += "Email is not blank!\n";
            }
            if (!pEmail.matcher(email).find()) {
                valid += "Not available email!\n";
            }
            if(!pDOB.matcher(dob).find()) {
                valid += "Not available dateOfBirth! Correct formater: dd/MM/yyyy\n";
            }
            
            if (valid.isEmpty()) {
                Employee emp = new Employee(empID, fullName, phone, email, address, new SimpleDateFormat("dd/MM/yyyy").parse(dob));
                if (showDialog()) {
                    EmpDAO dao = new EmpDAO();
                    if (dao.update(emp)) {
                        JOptionPane.showMessageDialog(this, "Update successfully.");
                        btnGetAllActionPerformed(evt);
                    } else {
                        JOptionPane.showMessageDialog(this, "Can not update! The employee has ID " + emp.getEmpID() + " does not exist!");
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }//GEN-LAST:event_btnUpdateActionPerformed

    private void btnRemoveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRemoveActionPerformed
        // TODO add your handling code here:
        try {
            EmpDAO dao = new EmpDAO();
            Employee employee = new Employee();
            employee.setIsDelete(true);
            employee.setEmpID(txtEmpID.getText());
            if (showDialog()) {
                if (dao.delete(employee)) {
                    JOptionPane.showMessageDialog(this, "Delete successfully!");
                    btnGetAllActionPerformed(evt);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_btnRemoveActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;

                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainJFrame.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainJFrame.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainJFrame.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainJFrame.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainJFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnClear;
    private javax.swing.JButton btnCreate;
    private javax.swing.JButton btnFindByEmpID;
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
    private javax.swing.JTable tblViewEmp;
    private javax.swing.JTextArea txtAddress;
    private javax.swing.JTextField txtDOB;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtEmpID;
    private javax.swing.JTextField txtFullName;
    private javax.swing.JTextField txtPhone;
    // End of variables declaration//GEN-END:variables
}
