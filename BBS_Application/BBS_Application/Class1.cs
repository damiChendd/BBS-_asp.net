using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BBS_Application
{
    public class Class1
    {
        static public bool ExecuteSql(string sqlStr)
        {
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            try
            {
                SqlCommand com = new SqlCommand(sqlStr, conn);
                conn.Open();
                com.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception ee)
            {
                conn.Close();
                return false;
            }
        }
        static public DataSet GetDsFromSql(string sqlStr)
        {
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            DataSet ds = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sqlStr, conn);
                conn.Open();
                da.Fill(ds);
            }
            catch (Exception)
            {
                ds.Tables.Add("TempTable");
            }

            conn.Close();
            return ds;
        }
    }
}