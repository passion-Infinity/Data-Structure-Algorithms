using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SingerAssemblies.DB
{
    class DBConnection
    {
        public static SqlConnection GetConnection()
        {
            string strConnection = @"server=SE140655\SQLEXPRESS;database=PE04;uid=sa;pwd=danh123";
            SqlConnection conn = new SqlConnection(strConnection);
            return conn;
        }
    }
}
