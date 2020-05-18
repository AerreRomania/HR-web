using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_AssenteismoMensilePerReparto :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDep.Text = Request.QueryString["Departament"] + " 2020";


        DataGrid1.DataSource = GetData(Request.QueryString["Departament"]);
        DataGrid1.DataBind();
    }
     
    DataTable dt = new DataTable();
     
    public DataTable GetData(string Departament)
    {
        //if (Departament == "CONFEZIONE%20A")
        //{
        //    Departament = "Confezione A";
        //}
        //if (Departament == "CONFEZIONE%20B")
        //{
        //    Departament = "Confezione B";
        //}
        
        var dt = new DataTable();
        dt.Columns.Add("IDs:");
        dt.Columns.Add("Linie:");
        dt.Columns.Add("Code:");
        dt.Columns.Add("Cognome e Nome:");
        dt.Columns.Add("Data Assunzione:");
        dt.Columns.Add("Mansione:");  //5
        for (var i = 1; i <= 12; i++) dt.Columns.Add(i.ToString());
 


        dt.Columns.Add("Total", typeof(decimal));
        dt.Columns.Add("Days", typeof(Int32));
        dt.Columns.Add("Media", typeof(Int32));
        var sqlTbl = new DataTable();

        using (var conn = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {

            var cmd = new SqlCommand(
                "SELECT * FROM [AssenteismoMensilePerReparto] WHERE Departament='" + Departament + "'", conn);

            conn.Open();
            var dr = cmd.ExecuteReader();
            sqlTbl.Load(dr);
            conn.Close();
            dr.Close();
        }

        var totRow = dt.NewRow();
        //totRow[1] = "TOTAL";
        dt.Rows.Add(totRow);

        var htbl = new System.Collections.Hashtable();
        var idx = 1;

        decimal bigTotal = 0;
        foreach (DataRow row in sqlTbl.Rows)
        {
            var ids = row.ItemArray.GetValue(0).ToString();
            var line = row.ItemArray.GetValue(1).ToString();
            var marca = row.ItemArray.GetValue(2).ToString();
            var nominat = row.ItemArray.GetValue(3).ToString();
            var data = DateTime.MinValue;
            DateTime.TryParse(row.ItemArray.GetValue(4).ToString(), out data);
            var postde = row.ItemArray.GetValue(5).ToString();
            decimal hr;
            decimal.TryParse(row.ItemArray.GetValue(6).ToString(), out hr);
            var year = row.ItemArray.GetValue(7).ToString();
            var month = row.ItemArray.GetValue(8).ToString();

            var hKey = line + marca + nominat + data + postde;

            bigTotal += hr;
     
            if (htbl.ContainsKey(hKey))
            {
                var h = Convert.ToInt32(htbl[hKey]);
                decimal tot;
                decimal keyHour;
                decimal.TryParse(dt.Rows[h]["Total"].ToString(), out tot);
                decimal.TryParse(dt.Rows[h][month].ToString(), out keyHour);
                dt.Rows[h][month] = keyHour + hr;
                dt.Rows[h]["Total"] = tot + hr;

                decimal totFirst;
                decimal.TryParse(totRow[month].ToString(), out totFirst);
                totRow[month] = totFirst + hr; //ovde :D
            }
            else
            {
                var newRow = dt.NewRow();
                newRow[0] = idx.ToString();
                newRow[1] = line;
                newRow[2] = marca;
                newRow[3] = nominat;
                newRow[4] = data.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                newRow[5] = postde;
                newRow[month] = hr; 
                newRow["Total"] = hr; 
                dt.Rows.Add(newRow);

                decimal totFirst;
                decimal.TryParse(totRow[month].ToString(), out totFirst);
                totRow[month] = totFirst + hr;
                htbl.Add(hKey, idx);
                idx++;
            }

            totRow["Total"] = bigTotal;
        }

        return dt;
    }
}