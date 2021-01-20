using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
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
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[""+webconf_connstring+""].ConnectionString);

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        return dt;
    }


    public void ExcelToJSON(string filePath,string sheetName,string fromCell, string toCell, GridView gridName)
    {
        string filepath = filePath;
        string sqlquery = "Select * From ["+sheetName+"$"+fromCell+":"+toCell+"] ";
        DataSet ds = new DataSet();
        string constring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=\"Excel 12.0;HDR=YES;\"";
        OleDbConnection con = new OleDbConnection(constring + "");
        OleDbDataAdapter da = new OleDbDataAdapter(sqlquery, con);
        da.Fill(ds);
        DataTable dt = ds.Tables[0];
        string JSONresult;
        JSONresult = JsonConvert.SerializeObject(dt);

        //Using DataTable with JsonConvert.DeserializeObject, here you need to import using System.Data;  
        DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(JSONresult);
        foreach (DataRow drRow in myObjectDT.Rows)


        {
            for (int i = 0; i < myObjectDT.Columns.Count; i++)
            {
                double rowValue;

                if (double.TryParse(drRow[i].ToString(), out rowValue))
                {
                    drRow[i] = Math.Round(rowValue);
                }
            }
        }
        //Binding gridview from dynamic object   
        gridName.DataSource = myObjectDT;
        gridName.DataBind();
    }


}