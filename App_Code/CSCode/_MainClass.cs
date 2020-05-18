using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for _MainClass
/// </summary>
public class _MainClass
{
    public _MainClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataTable PkSelect(string query, string webconf_connstring)
    {
      
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["" + webconf_connstring + ""].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
        }
        return dt;
    }
}