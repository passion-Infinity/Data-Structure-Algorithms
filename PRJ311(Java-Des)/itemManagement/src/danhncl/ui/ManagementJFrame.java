/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.ui;

import danhncl.daos.ItemDAO;
import danhncl.daos.SupplierDAO;
import danhnlc.dtos.Items;
import danhnlc.dtos.Suppliers;
import java.util.List;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User
 */
public class ManagementJFrame extends javax.swing.JFrame {

    DefaultTableModel tblModelSuppliers, tblModelItems;
    boolean addNewSupplier = true;
    boolean addNewItem = true;
    final String VALID_PRiCE = "^\\d*[[.] | [0-9]]+$";
    List<Suppliers> list;
    List<Items> listItem;
    SupplierDAO supplierDAO;
    ItemDAO itemDAO;

    public ManagementJFrame() {
        initComponents();
        this.setLocationRelativeTo(null);
        tblModelSuppliers = (DefaultTableModel) tblViewSupplier.getModel();
        tblModelItems = (DefaultTableModel) tblViewItem.getModel();
        supplierDAO = new SupplierDAO();
        itemDAO = new ItemDAO();
        showSuppliers();
        showItem();
        loadDataCB();
    }

    private void showSuppliers() {
        try {
            tblModelSuppliers.setRowCount(0);
            list = supplierDAO.getAll();
            for (Suppliers suppliers : list) {
                tblModelSuppliers.addRow(suppliers.toVector());
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    private void showItem() {
        try {
            tblModelItems.setRowCount(0);
            listItem = itemDAO.getAll(list);
            for (Items items : listItem) {
                tblModelItems.addRow(items.toVector());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadDataCB() {
        cbSuppliers.removeAllItems();
        cbSuppliers.addItem("Choice");
        for (Suppliers dto : list) {
            cbSuppliers.addItem(dto);
        }
    }

    private boolean showDialog() {
        int dialog = JOptionPane.showConfirmDialog(null, "Do you want to continute?", "Announcement", JOptionPane.YES_OPTION);
        return dialog == JOptionPane.YES_OPTION;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPanel = new javax.swing.JTabbedPane();
        jpnSupplier = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblViewSupplier = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txtCode = new javax.swing.JTextField();
        txtName = new javax.swing.JTextField();
        txtAddress = new javax.swing.JTextField();
        jcbCollaborating = new javax.swing.JCheckBox();
        btnAddNewSupplier = new javax.swing.JButton();
        btnSaveSupplier = new javax.swing.JButton();
        btnDeleteSupplier = new javax.swing.JButton();
        jpnItem = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblViewItem = new javax.swing.JTable();
        jPanel4 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        txtItemCode = new javax.swing.JTextField();
        txtItemName = new javax.swing.JTextField();
        txtUnit = new javax.swing.JTextField();
        txtPrice = new javax.swing.JTextField();
        jcbSypplying = new javax.swing.JCheckBox();
        btnAddNewItem = new javax.swing.JButton();
        btnSaveItem = new javax.swing.JButton();
        btnDeleteItem = new javax.swing.JButton();
        cbSuppliers = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        tblViewSupplier.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Code", "Name", "Address"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tblViewSupplier.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblViewSupplierMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                tblViewSupplierMouseReleased(evt);
            }
        });
        jScrollPane1.setViewportView(tblViewSupplier);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 737, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
        );

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel1.setText("Code: ");

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("Name: ");

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Address: ");

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Collaborating: ");

        btnAddNewSupplier.setFont(new java.awt.Font("Times New Roman", 1, 13)); // NOI18N
        btnAddNewSupplier.setText("Add New");
        btnAddNewSupplier.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddNewSupplierActionPerformed(evt);
            }
        });

        btnSaveSupplier.setFont(new java.awt.Font("Times New Roman", 1, 13)); // NOI18N
        btnSaveSupplier.setText("Save");
        btnSaveSupplier.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveSupplierActionPerformed(evt);
            }
        });

        btnDeleteSupplier.setFont(new java.awt.Font("Times New Roman", 1, 13)); // NOI18N
        btnDeleteSupplier.setText("Delete");
        btnDeleteSupplier.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteSupplierActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(42, 42, 42)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4))
                .addGap(21, 21, 21)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jcbCollaborating)
                        .addComponent(txtCode, javax.swing.GroupLayout.DEFAULT_SIZE, 304, Short.MAX_VALUE)
                        .addComponent(txtName))
                    .addComponent(txtAddress, javax.swing.GroupLayout.PREFERRED_SIZE, 297, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(71, 71, 71)
                .addComponent(btnAddNewSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 79, Short.MAX_VALUE)
                .addComponent(btnSaveSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(73, 73, 73)
                .addComponent(btnDeleteSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(92, 92, 92))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtCode, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(60, 60, 60)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtName, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(60, 60, 60)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtAddress, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(57, 57, 57)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jcbCollaborating))
                .addGap(68, 68, 68)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAddNewSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSaveSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnDeleteSupplier, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(296, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jpnSupplierLayout = new javax.swing.GroupLayout(jpnSupplier);
        jpnSupplier.setLayout(jpnSupplierLayout);
        jpnSupplierLayout.setHorizontalGroup(
            jpnSupplierLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpnSupplierLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jpnSupplierLayout.setVerticalGroup(
            jpnSupplierLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jpnSupplierLayout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 20, Short.MAX_VALUE))
        );

        jTabbedPanel.addTab("Supplier", jpnSupplier);

        tblViewItem.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Code", "Name", "Supplier", "Unit", "Price", "Supplying"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.Object.class, java.lang.String.class, java.lang.Float.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tblViewItem.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblViewItemMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                tblViewItemMouseReleased(evt);
            }
        });
        jScrollPane2.setViewportView(tblViewItem);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 851, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2)
        );

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Item Code: ");

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("Item Name:");

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("Supplier:");

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setText("Unit:");

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("Price:");

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel10.setText("Supplying:");

        btnAddNewItem.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnAddNewItem.setText("Add New");
        btnAddNewItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddNewItemActionPerformed(evt);
            }
        });

        btnSaveItem.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnSaveItem.setText("Save");
        btnSaveItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveItemActionPerformed(evt);
            }
        });

        btnDeleteItem.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnDeleteItem.setText("Delete");
        btnDeleteItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteItemActionPerformed(evt);
            }
        });

        cbSuppliers.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Choice" }));
        cbSuppliers.setSelectedIndex(-1);
        cbSuppliers.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(45, 45, 45)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addComponent(jLabel6)
                            .addComponent(jLabel7)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)
                            .addComponent(jLabel10))
                        .addGap(40, 40, 40)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jcbSypplying)
                            .addComponent(txtItemCode, javax.swing.GroupLayout.DEFAULT_SIZE, 265, Short.MAX_VALUE)
                            .addComponent(txtItemName)
                            .addComponent(txtUnit)
                            .addComponent(txtPrice)
                            .addComponent(cbSuppliers, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(btnAddNewItem, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(57, 57, 57)
                        .addComponent(btnSaveItem, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 44, Short.MAX_VALUE)
                        .addComponent(btnDeleteItem, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(25, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtItemCode, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(52, 52, 52)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtItemName, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(50, 50, 50)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(cbSuppliers, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(54, 54, 54)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(txtUnit, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(54, 54, 54)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(txtPrice, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(53, 53, 53)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(jcbSypplying))
                .addGap(59, 59, 59)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAddNewItem)
                    .addComponent(btnSaveItem)
                    .addComponent(btnDeleteItem))
                .addContainerGap(206, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jpnItemLayout = new javax.swing.GroupLayout(jpnItem);
        jpnItem.setLayout(jpnItemLayout);
        jpnItemLayout.setHorizontalGroup(
            jpnItemLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpnItemLayout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jpnItemLayout.setVerticalGroup(
            jpnItemLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        jTabbedPanel.addTab("Item", jpnItem);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPanel)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPanel)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAddNewSupplierActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddNewSupplierActionPerformed
        // TODO add your handling code here:
        addNewSupplier = true;
        txtCode.setText("");
        txtCode.setEditable(true);
        txtCode.requestFocus();
        txtName.setText("");
        txtAddress.setText("");
        jcbCollaborating.setSelected(false);
    }//GEN-LAST:event_btnAddNewSupplierActionPerformed

    private void btnSaveSupplierActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveSupplierActionPerformed
        // TODO add your handling code here:
        int row = tblViewSupplier.getSelectedRow();
        Suppliers supplier = new Suppliers();
        supplier.setCode(txtCode.getText());
        supplier.setName(txtName.getText());
        supplier.setAddress(txtAddress.getText());
        supplier.setCollaborating(jcbCollaborating.isSelected());

        String valid = "";
        if (txtCode.getText().isEmpty()) {
            valid += "Code is not blank!\n";
        }
        if (txtName.getText().isEmpty()) {
            valid += "Name is not blank!\n";
        }
        try {
            if (valid.isEmpty()) {
                if (addNewSupplier == true) {
                    if (showDialog()) {
                        if (supplierDAO.insert(supplier)) {
                            JOptionPane.showMessageDialog(this, "Add new successfully.");
                            showSuppliers();
                            showItem();
                            loadDataCB();
                        }
                    }
                } else {
                    if (showDialog()) {
                        if (supplierDAO.edit(supplier)) {
                            JOptionPane.showMessageDialog(this, "Update successfully.");
                            showSuppliers();
                            showItem();
                            loadDataCB();
                        }
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                JOptionPane.showMessageDialog(this, supplier.getCode() + " code is existed");
            }
        }
        addNewSupplier = false;
    }//GEN-LAST:event_btnSaveSupplierActionPerformed

    private void tblViewSupplierMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewSupplierMouseClicked
        try {
            addNewSupplier = false;
            int row = tblViewSupplier.getSelectedRow();
            String code = (String) tblModelSuppliers.getValueAt(row, 0);
            Suppliers dto = supplierDAO.findbyPrimaryKey(code);
            txtCode.setText(dto.getCode());
            txtCode.setEditable(false);
            txtName.setText(dto.getName());
            txtAddress.setText(dto.getAddress());
            jcbCollaborating.setSelected(dto.isCollaborating());
        } catch (Exception e) {
            e.getStackTrace();
        }
    }//GEN-LAST:event_tblViewSupplierMouseClicked

    private void tblViewSupplierMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewSupplierMouseReleased
        // TODO add your handling code here:
        int row = tblViewSupplier.getSelectedRow();
        int col = tblViewSupplier.getSelectedColumn();
        tblViewSupplier.getCellEditor(row, col).cancelCellEditing();
    }//GEN-LAST:event_tblViewSupplierMouseReleased

    private void btnDeleteSupplierActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteSupplierActionPerformed
        // TODO add your handling code here:
        int flag = 1;
        int row = tblViewSupplier.getSelectedRow();
        String code = (String) tblModelSuppliers.getValueAt(row, 0);
        try {
            if (showDialog()) {
                for (Items items : listItem) {
                    if(items.getSupCode().equals(code)) {
                        flag = JOptionPane.showConfirmDialog(this, "It will be delete all data relative. Do you want to continute", "Message", JOptionPane.YES_OPTION);
                        break;
                    }
                    
                }
                if (supplierDAO.delete(code) && flag == 0) {
                    JOptionPane.showMessageDialog(this, "Delete successfully.");
                    btnAddNewSupplierActionPerformed(evt);
                    showSuppliers();
                    showItem();
                    loadDataCB();
                }
            }
        } catch (Exception e) {
//            JOptionPane.showMessageDialog(this, "Supplier Code is existed on Item. So can't not delete!");
        }
    }//GEN-LAST:event_btnDeleteSupplierActionPerformed

    private void btnAddNewItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddNewItemActionPerformed
        addNewItem = true;
        txtItemCode.setText("");
        txtItemCode.setEditable(true);
        txtItemCode.requestFocus();
        txtItemName.setText("");
        txtUnit.setText("");
        txtPrice.setText("");
        jcbSypplying.setSelected(false);
        cbSuppliers.setSelectedItem("Choice");

    }//GEN-LAST:event_btnAddNewItemActionPerformed

    private void tblViewItemMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewItemMouseReleased
        int row = tblViewItem.getSelectedRow();
        int col = tblViewItem.getSelectedColumn();
        tblViewItem.getCellEditor(row, col).cancelCellEditing();
    }//GEN-LAST:event_tblViewItemMouseReleased

    private void tblViewItemMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblViewItemMouseClicked
        try {
            addNewItem = false;
            int row = tblViewItem.getSelectedRow();
            String code = (String) tblModelItems.getValueAt(row, 0);
            Items dto = itemDAO.findByPrimarykey(list, code);
            txtItemCode.setText(dto.getCode());
            txtItemCode.setEditable(false);
            txtItemName.setText(dto.getName());
            txtUnit.setText(dto.getUnit());
            txtPrice.setText(String.valueOf(dto.getPrice()));
            jcbSypplying.setSelected(dto.isSupplying());
            for (Suppliers suppliers : list) {
                if (suppliers.getCode().equals(dto.getSupCode())) {
                    cbSuppliers.setSelectedItem(suppliers);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }//GEN-LAST:event_tblViewItemMouseClicked

    private void btnSaveItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveItemActionPerformed
        int row = tblViewItem.getSelectedRow();
        String itemCode = txtItemCode.getText();
        String itemName = txtItemName.getText();
        String itemUnit = txtUnit.getText();
        String itemPrice = txtPrice.getText();
        boolean itemSuppling = jcbSypplying.isSelected();
        Suppliers suppliers = (Suppliers) cbSuppliers.getSelectedItem();
        String supCode = suppliers.getCode();
        Items dto = new Items(itemCode, itemName, supCode, itemUnit, Float.parseFloat(itemPrice), itemSuppling, suppliers);
        Pattern p = Pattern.compile(VALID_PRiCE);

        String valid = "";
        if (txtItemCode.getText().isEmpty()) {
            valid += "Code is not blank!\n";
        }
        if (txtItemName.getText().isEmpty()) {
            valid += "Name is not blank!\n";
        }
        if (cbSuppliers.getSelectedItem().equals("Choose")) {
            valid += "Please choose suppliers!\n";
        }
        if (txtUnit.getText().isEmpty()) {
            valid += "Unit is not blank!\n";
        }
        if (txtPrice.getText().isEmpty()) {
            valid += "Price is not blank!\n";
        }
        if (!p.matcher(txtPrice.getText()).find()) {
            valid += "Price is number and has to greater than 0\n";
        }

        try {
            if (valid.isEmpty()) {
                if (addNewItem == true) {
                    if (showDialog()) {
                        if (itemDAO.insert(itemCode, itemName, itemUnit, itemPrice, itemSuppling, supCode)) {
                            JOptionPane.showMessageDialog(this, "Add new successfully.");
                            tblModelItems.addRow(dto.toVector());
                        }
                    }
                } else {
                    if (showDialog()) {
                        if (itemDAO.update(itemCode, itemName, itemUnit, itemPrice, itemSuppling, supCode)) {
                            JOptionPane.showMessageDialog(this, "Update successfully.");
                            tblModelItems.setValueAt(dto.getName(), row, 1);
                            tblModelItems.setValueAt(dto.getSupplierCode(), row, 2);
                            tblModelItems.setValueAt(dto.getUnit(), row, 3);
                            tblModelItems.setValueAt(dto.getPrice(), row, 4);
                            tblModelItems.setValueAt(dto.isSupplying(), row, 5);
                        }
                    }
                }
            } else {
                JOptionPane.showMessageDialog(this, valid);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                JOptionPane.showMessageDialog(this, dto.getCode() + " code is existed");
            }
        }
        addNewItem = false;
    }//GEN-LAST:event_btnSaveItemActionPerformed

    private void btnDeleteItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteItemActionPerformed
        // TODO add your handling code here:
        int row = tblViewItem.getSelectedRow();
        String code = (String) tblModelItems.getValueAt(row, 0);
        try {
            if (showDialog()) {
                if (itemDAO.delete(code)) {
                    JOptionPane.showMessageDialog(this, "Delete successfully.");
                    tblModelItems.removeRow(row);
                    btnAddNewItemActionPerformed(evt);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }//GEN-LAST:event_btnDeleteItemActionPerformed

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
            java.util.logging.Logger.getLogger(ManagementJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ManagementJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ManagementJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ManagementJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ManagementJFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAddNewItem;
    private javax.swing.JButton btnAddNewSupplier;
    private javax.swing.JButton btnDeleteItem;
    private javax.swing.JButton btnDeleteSupplier;
    private javax.swing.JButton btnSaveItem;
    private javax.swing.JButton btnSaveSupplier;
    private javax.swing.JComboBox<Object> cbSuppliers;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPanel;
    private javax.swing.JCheckBox jcbCollaborating;
    private javax.swing.JCheckBox jcbSypplying;
    private javax.swing.JPanel jpnItem;
    private javax.swing.JPanel jpnSupplier;
    private javax.swing.JTable tblViewItem;
    private javax.swing.JTable tblViewSupplier;
    private javax.swing.JTextField txtAddress;
    private javax.swing.JTextField txtCode;
    private javax.swing.JTextField txtItemCode;
    private javax.swing.JTextField txtItemName;
    private javax.swing.JTextField txtName;
    private javax.swing.JTextField txtPrice;
    private javax.swing.JTextField txtUnit;
    // End of variables declaration//GEN-END:variables
}
