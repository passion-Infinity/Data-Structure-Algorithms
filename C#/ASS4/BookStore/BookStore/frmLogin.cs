using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using BookStore.BLL;
using BookStore.DTO;

namespace BookStore
{
    public partial class frmLogin : Form
    {
        EmployeeBLL employeeBLL;
        public static string setValueEmpID;
        public static string setValueEmpPass;
        public static bool setvalureEmpRole;

        public frmLogin()
        {
            InitializeComponent();
            employeeBLL = new EmployeeBLL();
        }

        private bool CheckData()
        {
            if (string.IsNullOrEmpty(txtEmpID.Text))
            {
                MessageBox.Show("Username is a required field.");
                txtEmpID.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                MessageBox.Show("Password is a required field.");
                txtPassword.Focus();
                return false;
            }

            string regex = @"\s+";
            if (Regex.IsMatch(txtEmpID.Text, regex) || Regex.IsMatch(txtPassword.Text, regex))
            {
                MessageBox.Show("Data is incorrect");
                return false;
            }
            return true;
        }

        private void Login()
        {
            if (CheckData())
            {
                EmployeeDTO dto = employeeBLL.CheckLogin(txtEmpID.Text, txtPassword.Text);
                if (dto != null)
                {
                    if (dto.EmpRole)
                    {
                        this.Hide();
                        frmMain frmMain = new frmMain();
                        frmMain.ShowDialog();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Your account need to be actived.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        setValueEmpID = dto.EmpID;
                        setValueEmpPass = dto.EmpPassword;
                        setvalureEmpRole = dto.EmpRole;
                        this.Hide();
                        frmChangeAccount changeAccount = new frmChangeAccount();
                        changeAccount.ShowDialog();
                        this.Close();
                    }
                }
                else
                {
                    MessageBox.Show("Employee ID or Password is incorrect.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Login();
        }

        private void txtPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar.Equals(Convert.ToChar(13)))
            {
                btnLogin_Click(sender, e);
            }
        }

        private void txtEmpID_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar.Equals(Convert.ToChar(13)))
            {
                btnLogin_Click(sender, e);
            }
        }
    }
}
