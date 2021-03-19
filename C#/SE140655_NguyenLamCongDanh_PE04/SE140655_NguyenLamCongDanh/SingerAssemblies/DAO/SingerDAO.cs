using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using SingerAssemblies.DB;
using SingerAssemblies.DTO;

namespace SingerAssemblies.DAO
{
    public class SingerDAO
    {
        public DataTable GetAll()
        {
            DataTable result = new DataTable();
            string sql = "Select SingerID, FullName, Age, Email, Phone From Singer";
            SqlConnection conn = DBConnection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            conn.Open();
            da.Fill(result);
            conn.Close();
            return result;
        }
        public DataTable FindByName(string search)
        {
            DataTable result = new DataTable();
            string sql = "Select SingerID, FullName, Age, Email, Phone From Singer Where FullName Like @fullname";
            SqlConnection conn = DBConnection.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@fullname", "%" + search + "%");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            conn.Open();
            da.Fill(result);
            conn.Close();
            return result;
        }
        public bool AddNew(SingerDTO dto)
        {
            bool check = false;
            string sql = "Insert Singer(SingerID,FullName,Age,Email,Phone) Values(@id,@fullname,@age,@email,@phone)";
            SqlConnection conn = DBConnection.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", dto.SingerID);
            cmd.Parameters.AddWithValue("@fullname", dto.FullName);
            cmd.Parameters.AddWithValue("@age", dto.Age);
            cmd.Parameters.AddWithValue("@email", dto.Email);
            cmd.Parameters.AddWithValue("@phone", dto.Phone);
            conn.Open();
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }
        public bool Delete(int id)
        {
            bool check = false;
            string sql = "Delete Singer Where SingerID = @id";
            SqlConnection conn = DBConnection.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }
    }
}
