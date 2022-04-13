using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DataProvider
    {
        public static string strConStr = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        public static SqlConnection connection;
        public DataProvider()
        {
            if (connection == null)
            {
                connection = new SqlConnection(strConStr);
            }
        }
        public SqlConnection GetConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
                return connection;
            }
            else
            {
                return connection;
            }
        }

        public void excuteCMD(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql,GetConnection());
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public DataTable getDataTable(string sql)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql,GetConnection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            connection.Close();
            return dt;
        }
    }
}