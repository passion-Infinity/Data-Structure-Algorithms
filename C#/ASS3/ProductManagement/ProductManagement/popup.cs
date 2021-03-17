using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProductLibrary;
using ProductLibrary.BLL;

namespace ProductManagement
{
    public partial class popup : Form
    {
        ProductAPI manager;
        DataSet set;
        public popup()
        {
            InitializeComponent();
            manager = new ProductAPI();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtSearch.Text == "")
            {
                MessageBox.Show("Please input data to search", "Announce", MessageBoxButtons.OK, MessageBoxIcon.Information);
            } else
            {
                set = manager.FindBySearch(txtSearch.Text);
                DataView dv = set.Tables["Products"].DefaultView;
                dgvSearchProducts.DataSource = dv;
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
