using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookStore.DB;
using BookStore.DTO;
using System.Data;
using System.Data.SqlClient;

namespace BookStore.DAL
{
    class EmployeeDAL
    {
        public EmployeeDTO CheckLogin(string username, string password)
        {
            EmployeeDTO dto = null;
            string sql = "Select EmpID, EmpPassword, EmpRole From Employee Where EmpID=@ID And EmpPassword=@Password";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", username);
            cmd.Parameters.AddWithValue("@Password", password);
            SqlDataReader reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                dto = new EmployeeDTO();
                dto.EmpID = username;
                dto.EmpPassword = password;
                dto.EmpRole = Convert.ToBoolean(reader["EmpRole"]);
            }
            conn.Close();
            return dto;
        }

        public bool update(EmployeeDTO employee) 
        {
            bool check = false;
            string sql = "Update Employee Set EmpPassword = @Pass, EmpRole = @Role Where EmpID = @ID";
            SqlConnection conn = DBConnection.GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", employee.EmpID);
            cmd.Parameters.AddWithValue("@Pass", employee.EmpPassword);
            cmd.Parameters.AddWithValue("@Role", employee.EmpRole);
            check = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return check;
        }
    }
}
