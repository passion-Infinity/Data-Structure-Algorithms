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
    public partial class frmReportBook : Form
    {
        BookBLL book;
        DataSet set;
        public frmReportBook()
        {
            InitializeComponent();
            book = new BookBLL();
            GetAll();
        }
        private void GetAll() {
            set = book.GetAll1();
            DataView dv = set.Tables["Books"].DefaultView;
            dv.Sort = "BookPrice DESC";
            dataGridView1.DataSource = dv;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
