using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ProductLibrary.DB;

namespace ProductLibrary.DAL
{
    class ProductDAO
    {
        public DataSet GetAll()
        {
            DataSet result = null;
            String sql = "Select ProductID, ProductName, UnitPrice, Quantity, (UnitPrice*Quantity) as SubTotal From Products";
            SqlConnection conn = DBConnection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            conn.Open();
            DataSet dt = new DataSet();
            da.Fill(dt, "Products");
            result = dt;
            conn.Close();
            return result;
        }

        public DataSet FindByName(string name)
        {
            DataSet result = null;
            String sql = "Select ProductID, ProductName, UnitPrice, Quantity From Products Where ProductName Like @Name";
            SqlConnection conn = DBConnection.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", "%" + name + "%");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            conn.Open();
            DataSet dt = new DataSet();
            da.Fill(dt, "Products");
            result = dt;
            conn.Close();
            return result;
        }


        public bool Insert(Product product)
        {
            bool check = false;
            String sql = "Insert Products(ProductName, UnitPrice, Quantity) Values(@Name, @Price, @Quantity)";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", product.ProductName);
            cmd.Parameters.AddWithValue("@Price", product.UnitPrice);
            cmd.Parameters.AddWithValue("@Quantity", product.Quantity);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }

        public bool Update(Product product)
        {
            bool check = false;
            String sql = "Update Products Set ProductName=@Name, UnitPrice=@Price, Quantity=@Quantity Where ProductID=@ID";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", product.ProductID);
            cmd.Parameters.AddWithValue("@Name", product.ProductName);
            cmd.Parameters.AddWithValue("@Price", product.UnitPrice);
            cmd.Parameters.AddWithValue("@Quantity", product.Quantity);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }

        public bool Delete(int id)
        {
            bool check = false;
            String sql = "Delete Products Where ProductID=@ID";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", id);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }
    }
}
