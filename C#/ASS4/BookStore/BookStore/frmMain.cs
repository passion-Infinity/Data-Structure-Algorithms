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
    public partial class frmMain : Form
    {
        BookBLL book;
        DataSet set;
        string flag = "";
        int index = 0;
        public frmMain()
        {
            InitializeComponent();
            book = new BookBLL();
        }

        private bool CheckData()
        {
            if (string.IsNullOrEmpty(txtBookName.Text))
            {
                MessageBox.Show("Book Name is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtBookName.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtBookPrice.Text))
            {
                MessageBox.Show("Book Price is a required field", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtBookPrice.Focus();
                return false;
            }
            string regexName = @"\w+";
            if (!Regex.IsMatch(txtBookName.Text, regexName))
            {
                MessageBox.Show("Book Name is not avaliable.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtBookName.Focus();
                return false;
            }
            string regexPrice = @"[1-9]+\.?[0-9]+";
            if (!Regex.IsMatch(txtBookPrice.Text, regexPrice))
            {
                MessageBox.Show("Book Price only contains number characters and (.)", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtBookPrice.Focus();
                return false;
            }
            return true;
        }

        private void ControlBlock()
        {
            btnAdd.Enabled = false;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
            btnPrevious.Enabled = true;

            txtBookID.Enabled = false;
            txtBookName.Enabled = true;
            txtBookPrice.Enabled = true;

            if(index == 0)
            {
                btnFirst.Enabled = false;
                btnPrevious.Enabled = false;
            }
        }
        private void UncontrolBlock()
        {
            btnAdd.Enabled = true;
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;
            btnPrevious.Enabled = true;

            txtBookID.Enabled = false;
            txtBookName.Enabled = false;
            txtBookPrice.Enabled = false;

            if (index == 0)
            {
                btnFirst.Enabled = false;
                btnPrevious.Enabled = false;
            }
        }

        private void ClearData()
        {
            txtBookID.Text = "";
            txtBookName.Text = "";
            txtBookPrice.Text = "";

            txtBookName.Focus();
        }

        private void GetAll()
        {
            set = book.GetAll();
            DataView dv = set.Tables["Books"].DefaultView;
            dgvBookStore.DataSource = dv;
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            UncontrolBlock();
            GetAll();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            ControlBlock();
            flag = "add";
            ClearData();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            ControlBlock();
            flag = "update";
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtBookID.Text == "")
            {
                MessageBox.Show("Please choose book you want to remove. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Do you want to delete ?", "Announce", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
            {
                int id = int.Parse(txtBookID.Text);
                book.Delete(id);
                GetAll();
                ClearData();
                MessageBox.Show("Delete successfully. ", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (flag.Equals("add"))
            {
                if (CheckData())
                {
                    BookDTO dto = new BookDTO(0, txtBookName.Text, float.Parse(txtBookPrice.Text));
                    if (book.Insert(dto))
                    {
                        MessageBox.Show("Insert successfully.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        GetAll();
                        UncontrolBlock();
                    }
                }
            }
            else if (flag.Equals("update"))
            {
                if (CheckData())
                {
                    BookDTO dto = new BookDTO(int.Parse(txtBookID.Text), txtBookName.Text, float.Parse(txtBookPrice.Text));
                    if(book.Update(dto))
                    {
                        MessageBox.Show("Update successfully.", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        GetAll();
                        UncontrolBlock();
                    }
                }
            }
        }

        private void bntCancel_Click(object sender, EventArgs e)
        {
            UncontrolBlock();
        }

        private void dgvBookStore_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            index = dgvBookStore.CurrentCell == null ? -1 : dgvBookStore.CurrentCell.RowIndex;

            btnPrevious.Enabled = true;
            if(index == 0)
            {
                btnPrevious.Enabled = false;
                btnFirst.Enabled = false;
            }
            if(index == (dgvBookStore.Rows.Count - 2))
            {
                btnLast.Enabled = false;
                btnNext.Enabled = false;
            }

            if (index > -1 && dgvBookStore.Rows.Count > 0)
            {
                int i = 0;
                txtBookID.Text = dgvBookStore.Rows[index].Cells[i].Value.ToString();
                if (txtSearch.Text == "")
                {
                    txtBookName.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                }
                txtBookPrice.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                if (index != 0 && index != (dgvBookStore.Rows.Count - 2))
                {
                    btnFirst.Enabled = true;
                    btnPrevious.Enabled = true;
                    btnLast.Enabled = true;
                    btnNext.Enabled = true;
                }
            }
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            frmReportBook report = new frmReportBook();
            report.ShowDialog();
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                index = 0;
                if(dgvBookStore.Rows.Count <= 2 )
                {
                    btnFirst.Enabled = false;
                    btnPrevious.Enabled = false;
                    btnLast.Enabled = false;
                    btnNext.Enabled = false;
                } else
                {
                    btnLast.Enabled = true;
                    btnNext.Enabled = true;
                }
                float total = 0;
                set = book.Find(txtSearch.Text);
                DataTable table = set.Tables["Books"];
                DataView dv = table.DefaultView;
                dgvBookStore.DataSource = dv;
                foreach (DataRow row in table.Rows)
                {
                    string a = row["BookPrice"].ToString();
                    total += float.Parse(a);
                }
                txtTotal.Text = "Tổng cộng: " + Convert.ToString(total);
                dgvBookStore.DataSource = dv;
            } else
            {
                set.Tables["Books"].Reset();
                GetAll();
                txtTotal.Text = "";
            }
            
        }

        private void btnFirst_Click(object sender, EventArgs e)
        {
            if(dgvBookStore.Rows.Count > 0 )
            {
                dgvBookStore.Rows[index].Selected = false;
                index = 0;
                dgvBookStore.Rows[index].Selected = true;
                int i = 0;
                txtBookID.Text = dgvBookStore.Rows[index].Cells[i].Value.ToString();
                if(txtSearch.Text == "")
                {
                    txtBookName.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                }
                txtBookPrice.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();

                btnFirst.Enabled = false;
                btnPrevious.Enabled = false;
                btnLast.Enabled = true;
                btnNext.Enabled = true;
            }
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            if (dgvBookStore.Rows.Count > 0)
            {
                dgvBookStore.Rows[index].Selected = false;
                index = dgvBookStore.Rows.Count - 2;
                dgvBookStore.Rows[index].Selected = true;
                int i = 0;
                txtBookID.Text = dgvBookStore.Rows[index].Cells[i].Value.ToString();
                if (txtSearch.Text == "")
                {
                    txtBookName.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                }
                txtBookPrice.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();

                btnPrevious.Enabled = true;
                btnFirst.Enabled = true;
                btnLast.Enabled = false;
                btnNext.Enabled = false;
            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            if(index > 0)
            {
                dgvBookStore.Rows[index].Selected = false;
                index = --index;
                dgvBookStore.Rows[index].Selected = true;
                int i = 0;
                txtBookID.Text = dgvBookStore.Rows[index].Cells[i].Value.ToString();
                if (txtSearch.Text == "")
                {
                    txtBookName.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                }
                txtBookPrice.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();

                btnNext.Enabled = true;
                btnPrevious.Enabled = true;
                btnFirst.Enabled = true;
                btnLast.Enabled = true;

                if (index == 0)
                {
                    btnPrevious.Enabled = false;
                    btnFirst.Enabled = false;
                    btnLast.Enabled = true;
                    btnNext.Enabled = true;
                }
            }
            
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            if (index < (dgvBookStore.Rows.Count - 2))
            {
                dgvBookStore.Rows[index].Selected = false;
                index = ++index;
                dgvBookStore.Rows[index].Selected = true;
                int i = 0;
                txtBookID.Text = dgvBookStore.Rows[index].Cells[i].Value.ToString();
                if (txtSearch.Text == "")
                {
                    txtBookName.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();
                }
                txtBookPrice.Text = dgvBookStore.Rows[index].Cells[++i].Value.ToString();

                btnNext.Enabled = true;
                btnPrevious.Enabled = true;
                btnFirst.Enabled = true;
                btnLast.Enabled = true;

                if (index == (dgvBookStore.Rows.Count - 2))
                {
                    btnPrevious.Enabled = true;
                    btnFirst.Enabled = true;
                    btnLast.Enabled = false;
                    btnNext.Enabled = false;
                }
            }
        }
    }
}
