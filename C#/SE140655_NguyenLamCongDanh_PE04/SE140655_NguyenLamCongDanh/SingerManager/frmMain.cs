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
using SingerAssemblies.DAO;
using SingerAssemblies.DTO;

namespace SingerManager
{
    public partial class frmMain : Form
    {
        DataTable dt;
        SingerDAO dao = new SingerDAO();
        int index;

        public frmMain()
        {
            InitializeComponent();
        }

        private bool CheckData()
        {
            if (string.IsNullOrEmpty(txtID.Text.Trim()))
            {
                MessageBox.Show("Singer ID is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtID.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtID.Text, @"^[1-9](\d+)?$"))
            {
                MessageBox.Show("Singer ID is only number characteristic", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtID.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtFullName.Text.Trim()))
            {
                MessageBox.Show("Full Name is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtFullName.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtAge.Text.Trim()))
            {
                MessageBox.Show("Age is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtAge.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtAge.Text, @"^[1-9](\d+)?$"))
            {
                MessageBox.Show("Age is not available", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtAge.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
            {
                MessageBox.Show("Email is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtEmail.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtEmail.Text, @"^\w+[@][a-z]{3,7}\.[a-z]{3,7}$"))
            {
                MessageBox.Show("Email is not available", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtEmail.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtPhone.Text.Trim()))
            {
                MessageBox.Show("Phone is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtPhone.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtPhone.Text, @"^\d{9,10}$"))
            {
                MessageBox.Show("Phone is not available", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtPhone.Focus();
                return false;
            }
            return true;
        }

        private void ClearData()
        {
            txtID.Text = "";
            txtFullName.Text = "";
            txtAge.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtID.Focus();
        }

        private void GetAll()
        {
            try
            {
                dt = dao.GetAll();
                dgvSingers.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            GetAll();
            statusBar.Text = "Ready";
        }

        private void dgvSingers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            index = dgvSingers.CurrentCell == null ? -1 : dgvSingers.CurrentCell.RowIndex;
            if (index > -1 && dgvSingers.RowCount > 0)
            {
                txtID.Text = dgvSingers.Rows[index].Cells[0].Value.ToString();
                txtFullName.Text = dgvSingers.Rows[index].Cells[1].Value.ToString();
                txtAge.Text = dgvSingers.Rows[index].Cells[2].Value.ToString();
                txtEmail.Text = dgvSingers.Rows[index].Cells[3].Value.ToString();
                txtPhone.Text = dgvSingers.Rows[index].Cells[4].Value.ToString();

                txtID.Enabled = false;
                txtFullName.Enabled = false;
                txtAge.Enabled = false;
                txtEmail.Enabled = false;
                txtPhone.Enabled = false;
                btnAdd.Enabled = false;

                statusBar.Text = "Click";
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckData())
                {
                    SingerDTO dto = new SingerDTO
                    {
                        SingerID = int.Parse(txtID.Text.Trim().ToString()),
                        FullName = txtFullName.Text.Trim(),
                        Age = int.Parse(txtAge.Text.Trim().ToString()),
                        Email = txtEmail.Text.Trim(),
                        Phone = txtPhone.Text.Trim()
                    };
                    if (dao.AddNew(dto))
                    {
                        MessageBox.Show("Insert successfully", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        GetAll();
                        statusBar.Text = "Add";
                        ClearData();
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("duplicate"))
                {
                    MessageBox.Show("Singer ID '" + txtID.Text + "' existed.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    MessageBox.Show(ex.Message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtID.Text == "")
                {
                    MessageBox.Show("Please choose Singer you want to remove. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                if (MessageBox.Show("Do you want to delete ?", "Announce", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    int id = int.Parse(txtID.Text);
                    dao.Delete(id);
                    statusBar.Text = "Delete";
                    GetAll();
                    ClearData();
                    MessageBox.Show("Delete successfully. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            txtID.Enabled = true;
            txtFullName.Enabled = true;
            txtAge.Enabled = true;
            txtEmail.Enabled = true;
            txtPhone.Enabled = true;
            btnAdd.Enabled = true;
            ClearData();
            statusBar.Text = "Ready";
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == "")
                {
                    statusBar.Text = "Ready";
                }
                else
                {
                    statusBar.Text = "Search";
                }
                dt = dao.FindByName(txtSearch.Text);
                dgvSingers.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
