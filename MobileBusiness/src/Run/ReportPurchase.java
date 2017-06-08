/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Run;

import GetConnect.MyConnect;
import static Run.EmployeeDetail.employeeModel;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author monki
 */
public class ReportPurchase extends javax.swing.JFrame {

    static DefaultTableModel purchaseModel;
    private String purchaseID;
    public static Home home;

    /**
     * Creates new form ReportPurchase
     */
    public ReportPurchase() {
        initComponents();
        purchaseModel = (DefaultTableModel) tblReport.getModel();
        loadData();
    }

    public static void loadData() {
        purchaseModel.setRowCount(0);
        try {
            Connection conn = MyConnect.getConnection();
            CallableStatement callSt = conn.prepareCall("{call getPurchaseList()}");
            //PreparedStatement ps = conn.prepareStatement("select * from Purchase"); 
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("purchaseID");
                String customerName = rs.getString("CustomerName");
                String employeeName = rs.getString("employeeName");
                String buydate = rs.getString("buydate");
                String totalPrice = rs.getString("totalPrice");
                Object[] row = {id, customerName, employeeName, buydate, totalPrice};
                purchaseModel.addRow(row);
            }
            tblReport.setModel(purchaseModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        btnHome = new javax.swing.JButton();
        btnSearch = new javax.swing.JButton();
        txtSearchReport = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblReport = new javax.swing.JTable();
        btnView = new javax.swing.JButton();
        btnOrder = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        jLabel1.setText("Purchase Report");

        btnHome.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnHome.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/home.png"))); // NOI18N
        btnHome.setText("Home");
        btnHome.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHomeActionPerformed(evt);
            }
        });

        btnSearch.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/search.png"))); // NOI18N
        btnSearch.setText("Search");
        btnSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchActionPerformed(evt);
            }
        });

        txtSearchReport.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtSearchReportKeyReleased(evt);
            }
        });

        tblReport.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Purchase ID", "Customer", "Employee Name", "Buy Date", "Total Price"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblReport.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblReportMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblReport);

        btnView.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnView.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/show.png"))); // NOI18N
        btnView.setText("View Detail Order");
        btnView.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnViewActionPerformed(evt);
            }
        });

        btnOrder.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnOrder.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/create.png"))); // NOI18N
        btnOrder.setText("Create Order");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 782, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addGap(31, 31, 31)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnSearch)
                        .addGap(18, 18, 18)
                        .addComponent(txtSearchReport, javax.swing.GroupLayout.PREFERRED_SIZE, 257, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addComponent(btnView)
                        .addGap(162, 162, 162)
                        .addComponent(btnHome)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnOrder)))
                .addGap(33, 33, 33))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtSearchReport, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSearch))
                .addGap(21, 21, 21)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnHome)
                    .addComponent(btnView)
                    .addComponent(btnOrder))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnHomeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHomeActionPerformed
        // TODO add your handling code here:
        home.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnHomeActionPerformed

    private void txtSearchReportKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSearchReportKeyReleased
       
    }//GEN-LAST:event_txtSearchReportKeyReleased

    private void tblReportMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblReportMouseClicked
        int index = tblReport.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel) tblReport.getModel();
        purchaseID = model.getValueAt(index, 0).toString();
    }//GEN-LAST:event_tblReportMouseClicked

    private void btnViewActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnViewActionPerformed
        PurchaseDetail pd = new PurchaseDetail(); 
        try { 
            if (purchaseID == null) { 
                JOptionPane.showMessageDialog(null, "You must select a purchase to view detail"); 
            } else { 
                Connection conn = MyConnect.getConnection(); 
                CallableStatement callSt = conn.prepareCall("{call getPurchaseDetail(?)}"); 
                callSt.setString(1, purchaseID); 
                ResultSet rs = callSt.executeQuery(); 
                if (rs.next()) { 
                    pd.txtPurchaseID.setText(rs.getString("purchaseID")); 
                    pd.txtCusName.setText(rs.getString("CustomerName")); 
                    pd.txtEmpName.setText(rs.getString("employeeName")); 
                    pd.txtBuyDate.setText(rs.getString("buydate")); 
                    pd.txtTotalPrice.setText(rs.getString("totalPrice") + " $"); 
                } 
                try { 
                    CallableStatement callSt1 = conn.prepareCall("{call getPurchaseDetailItemList(?)}"); 
                    callSt1.setString(1, purchaseID); 
                    ResultSet rs1 = callSt1.executeQuery(); 
                    DefaultTableModel itemListModel = (DefaultTableModel) pd.tblPurchaseInfo.getModel(); 
                    while (rs1.next()) { 
                        String itemName = rs1.getString("mobiName"); 
                        int quantity = rs1.getInt("quantity"); 
                        int unitPrice = rs1.getInt("unitPrice");
                        int totalunitPrice = quantity * unitPrice;
                        Object[] row = {itemName, quantity, unitPrice + " $", totalunitPrice  + " $"}; 
                        itemListModel.addRow(row); 
                    } 
                    pd.tblPurchaseInfo.setModel(itemListModel); 
                } catch (Exception e) { 
                    e.printStackTrace(); 
                } 
                pd.setVisible(true); 
                this.dispose(); 
            } 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
    }//GEN-LAST:event_btnViewActionPerformed

    private void btnSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchActionPerformed
        String searchText = txtSearchReport.getText(); 
        purchaseModel.setRowCount(0); 
        try { 
            Connection conn = MyConnect.getConnection(); 
            CallableStatement callSt = conn.prepareCall("{call searchPurchaseList(?)}"); 
            callSt.setString(1, searchText); 
            //PreparedStatement ps = conn.prepareStatement("select * from Employee"); 
            ResultSet rs = callSt.executeQuery(); 
            while (rs.next()) { 
                String id = rs.getString("purchaseID"); 
                String customerName = rs.getString("CustomerName"); 
                String employeeName = rs.getString("employeeName"); 
                String buydate = rs.getString("buydate"); 
                String totalPrice = rs.getString("totalPrice"); 
                Object[] row = {id, customerName, employeeName, buydate, totalPrice}; 
                purchaseModel.addRow(row); 
            } 
            tblReport.setModel(purchaseModel); 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
    }//GEN-LAST:event_btnSearchActionPerformed

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
            java.util.logging.Logger.getLogger(ReportPurchase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ReportPurchase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ReportPurchase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ReportPurchase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ReportPurchase().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnHome;
    private javax.swing.JButton btnOrder;
    private javax.swing.JButton btnSearch;
    private javax.swing.JButton btnView;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private static javax.swing.JTable tblReport;
    private javax.swing.JTextField txtSearchReport;
    // End of variables declaration//GEN-END:variables
}
