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
using ProductLibrary;
using ProductLibrary.BLL;

namespace ProductManagement
{
    public partial class frmMain : Form
    {
        ProductAPI manager;
        DataSet set;
        string flag = "";
        int index;

        public frmMain()
        {
            InitializeComponent();
            manager = new ProductAPI();
            UnControllBlock();
            GetAll();
        }

        private void GetAll()
        {
            set = manager.GetAll();
            DataView dv = set.Tables["Products"].DefaultView;
            dgvProducts.DataSource = dv;
        }

        private void UnControllBlock()
        {
            btnAdd.Enabled = true;
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;

            txtProductID.Enabled = false;
            txtProductName.Enabled = false;
            txtPrice.Enabled = false;
            txtQuantity.Enabled = false;
        }

        private void ControllBlock()
        {
            btnAdd.Enabled = false;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;

            txtProductID.Enabled = false;
            txtProductName.Enabled = true;
            txtPrice.Enabled = true;
            txtQuantity.Enabled = true;

        }

        private void ClearData()
        {
            txtProductID.Text = "";
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
        }

        private bool CheckData()
        {
            if (string.IsNullOrEmpty(txtProductName.Text.Trim()))
            {
                MessageBox.Show("Product Name is a required field.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtProductName.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtPrice.Text.Trim()))
            {
                MessageBox.Show("Unit Price is a required field.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtPrice.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtQuantity.Text.Trim()))
            {
                MessageBox.Show("Quantity is a required field.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtQuantity.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtPrice.Text, @"^[1-9]+\.?\d+$"))
            {
                MessageBox.Show("Unit Price only contains number characters and (.) ", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtPrice.Focus();
                return false;
            }
            if (!Regex.IsMatch(txtQuantity.Text, @"^[0-9]+$"))
            {
                MessageBox.Show("Quantity only contains number characters ", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtQuantity.Focus();
                return false;
            }
            return true;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            ControllBlock();
            flag = "add";
            ClearData();
            txtProductName.Focus();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            ControllBlock();
            flag = "update";
            txtProductName.Focus();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtProductID.Text == "")
            {
                MessageBox.Show("Please choose product you want to remove. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Do you want to delete ?", "Announce", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
            {
                int id = int.Parse(txtProductID.Text);
                manager.Delete(id);
                GetAll();
                ClearData();
                MessageBox.Show("Delete successfully. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }


        private void btnSave_Click(object sender, EventArgs e)
        {
            if (flag == "add")
            {
                if (CheckData())
                {
                    Product product = new Product(0, txtProductName.Text,
                   float.Parse(txtPrice.Text), int.Parse(txtQuantity.Text));
                    manager.Insert(product);
                    GetAll();
                    dgvProducts.RefreshEdit();
                    UnControllBlock();
                    MessageBox.Show("Insert successfully.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else if (flag == "update")
            {
                if (CheckData())
                {
                    Product product = new Product(int.Parse(txtProductID.Text), txtProductName.Text,
                   float.Parse(txtPrice.Text), int.Parse(txtQuantity.Text));
                    manager.Update(product);
                    dgvProducts.RefreshEdit();
                    UnControllBlock();
                    GetAll();
                    MessageBox.Show("Update successfully.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            UnControllBlock();
            ClearData();
        }

       

        private void btnFind_Click(object sender, EventArgs e)
        {
            popup popup = new popup();
            popup.Visible = true;
        }

        private void dgvProducts_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            index = dgvProducts.CurrentCell == null ? -1 : dgvProducts.CurrentCell.RowIndex;
            if (index > -1 && dgvProducts.Rows.Count > 0)
            {
                txtProductID.Text = dgvProducts.Rows[index].Cells[0].Value.ToString();
                txtProductName.Text = dgvProducts.Rows[index].Cells[1].Value.ToString();
                txtPrice.Text = dgvProducts.Rows[index].Cells[2].Value.ToString();
                txtQuantity.Text = dgvProducts.Rows[index].Cells[3].Value.ToString();
            }
        }
    }
}
