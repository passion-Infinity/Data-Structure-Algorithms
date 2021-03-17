using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BookStore.DB;
using BookStore.DTO;

namespace BookStore.DAL
{
    class BookStoreDAL
    {
        public DataSet GetAll()
        {
            string sql = "Select BookId, BookName, BookPrice From Books";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet result = new DataSet();
            da.Fill(result, "Books");
            conn.Close();
            return result;
        }

        public DataSet GetAll1()
        {
            string sql = "Select BookName, BookPrice From Books";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet result = new DataSet();
            da.Fill(result, "Books");
            conn.Close();
            return result;
        }

        public DataSet FindByName(string name)
        {
            DataSet result;
            string sql = "Select BookName, BookPrice From Books Where BookName Like " + "'%" + name + "%'";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet dt = new DataSet();
            da.Fill(dt, "Books");
            result = dt;
            conn.Close();
            return result;
        }

        public bool Insert(BookDTO dto)
        {
            bool check = false;
            string sql = "Insert Books(BookName, BookPrice) Values(@Name, @Price)";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", dto.BookName);
            cmd.Parameters.AddWithValue("@Price", dto.BookPrice);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }

        public bool Update(BookDTO dto)
        {
            bool check = false;
            string sql = "Update Books Set BookName = @Name, BookPrice = @Price Where BookID = @ID";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", dto.BookID);
            cmd.Parameters.AddWithValue("@Name", dto.BookName);
            cmd.Parameters.AddWithValue("@Price", dto.BookPrice);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }

        public bool Delete(int id)
        {
            bool check = false;
            string sql = "Delete Books Where BookID = @ID";
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
