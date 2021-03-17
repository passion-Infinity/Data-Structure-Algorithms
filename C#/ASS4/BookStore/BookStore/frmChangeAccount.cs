using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BookStore.BLL;
using BookStore.DTO;

namespace BookStore
{
    public partial class frmChangeAccount : Form
    {

        EmployeeBLL employeeBLL;
        public frmChangeAccount()
        {
            InitializeComponent();
            employeeBLL = new EmployeeBLL();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            EmployeeDTO dto = new EmployeeDTO();
            dto.EmpID = txtEmpID.Text;
            dto.EmpPassword = txtPassword.Text;
            dto.EmpRole = chkRole.Checked;
            if(employeeBLL.Update(dto))
            {
                MessageBox.Show("Update account successfully.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
            } else
            {
                MessageBox.Show("FAIL !!!", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmLogin frmLogin = new frmLogin();
            frmLogin.ShowDialog();
            this.Close();
        }

        private void frmChangeAccount_Load(object sender, EventArgs e)
        {
            txtEmpID.Text = frmLogin.setValueEmpID;
            txtPassword.Text = frmLogin.setValueEmpPass;
            chkRole.Checked = frmLogin.setvalureEmpRole;

            txtEmpID.ReadOnly = true;
        }
    }
}
