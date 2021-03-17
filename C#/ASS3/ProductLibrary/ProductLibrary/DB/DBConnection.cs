using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ProductLibrary.DB
{
    class DBConnection
    {
        public static SqlConnection GetConnection()
        {
            string conStr = @"Data Source=SE140655\SQLEXPRESS;Initial Catalog=SaleDB;Persist Security Info=True;User ID=sa; Password= danh123";
            SqlConnection conn = new SqlConnection(conStr);
            return conn;
        }
    }
}
