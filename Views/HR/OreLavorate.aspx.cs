using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_OreLavorate :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {

        }
        GetData();
    }

    

    public string FindString(string month, string param)
    {
        var str = "";

        return str;
    }


   // DataTable dt = new DataTable();
    DataTable sqlTbl = new DataTable();
   

    public void CopyTable(DataTable dt)
    {
        
        DataTable finalcopy = new DataTable();
        finalcopy.Columns.Add("Reparto:");
        finalcopy.Columns.Add("Mansione:");
        DataRow newrow = finalcopy.NewRow();
        for (int i=0;i<dt.Rows.Count;i++)
        {
            newrow = finalcopy.NewRow();
            var x = dt.Rows[i];
            newrow[0] = x[0];
            newrow[1] = x[1];
            finalcopy.Rows.Add(newrow);
        }
        DataGrid2.DataSource = finalcopy;
        DataGrid2.DataBind();
    }
    public void GetData()
    {
        DataTable dt = new DataTable();
        using (var conn = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        { 
            var cmd = new SqlCommand(
                "SELECT dbo.Departamente.Departament, dbo.PosturiDeLucru.PostDeLucru, SUM(dbo.Prezente.R1TOT) AS Ore, dbo.TipuriOre.Categorie, DATEPART(YEAR, dbo.Prezente.Data) AS Yyear, DATEPART(MONTH, dbo.Prezente.Data) AS Mmonth FROM dbo.Departamente INNER JOIN dbo.Prezente ON dbo.Departamente.Id = dbo.Prezente.IdDepartament INNER JOIN dbo.PosturiDeLucru ON dbo.Prezente.IdPostDeLucru = dbo.PosturiDeLucru.Id INNER JOIN dbo.TipuriOre ON dbo.Prezente.IdTipOra = dbo.TipuriOre.Id WHERE (dbo.TipuriOre.Categorie = 'Ore straordinarie') AND  DATEPART(YEAR, dbo.Prezente.Data)='"+ddlFiltruAn.SelectedValue+"' OR (dbo.TipuriOre.Categorie = 'Ore lavorate') AND  DATEPART(YEAR, dbo.Prezente.Data)='"+ddlFiltruAn.SelectedValue+"' GROUP BY  dbo.Departamente.Departament, dbo.PosturiDeLucru.PostDeLucru,dbo.TipuriOre.Categorie, DATEPART(YEAR, dbo.Prezente.Data), DATEPART(MONTH, dbo.Prezente.Data)  ORDER BY dbo.Departamente.Departament,PosturiDeLucru.postdelucru, TipuriOre.Categorie", conn);

            conn.Open();
            var dr = cmd.ExecuteReader();
            sqlTbl.Load(dr);
            conn.Close();
            dr.Close();
        }

        dt.Columns.Add("Reparto:");
        dt.Columns.Add("Mansione:");


        for (var i = 1; i <= 12; i++)
        {
            dt.Columns.Add(i.ToString() + "_Ore lavorate");
            dt.Columns.Add(i.ToString() + "_Ore straordinarie");
            dt.Columns.Add(i.ToString() + "_Tot");
        }

        dt.Columns.Add("Total", typeof(decimal));
        
        DataRow deptRow = dt.NewRow(); 
        DataRow totRow = dt.NewRow();
         
        totRow[0] = "TOTAL";
        dt.Rows.Add(totRow);
         
        var htbl = new System.Collections.Hashtable();
        var idx = 1;

        decimal bigTotal = 0;
        var lastDepart = default(string);
        //var firstRead = true;
        foreach (DataRow row in sqlTbl.Rows)
        {
            
            decimal hr; 
            var departament = row.ItemArray.GetValue(0).ToString();
            var postdelucru = row.ItemArray.GetValue(1).ToString();
            decimal.TryParse(row.ItemArray.GetValue(2).ToString(), out hr);
            var categorie = row.ItemArray.GetValue(3).ToString();
            var year = row.ItemArray.GetValue(4).ToString();
            var month = row.ItemArray.GetValue(5).ToString();
            var hKey = departament + postdelucru;
            bigTotal += hr;             
            if (htbl.ContainsKey(hKey))
            { 
                var h = Convert.ToInt32(htbl[hKey]);
                decimal tot;
                decimal keyHour;
                decimal totCateg;
                decimal.TryParse(dt.Rows[h]["Total"].ToString(), out tot);
                decimal.TryParse(dt.Rows[h][month + "_" + categorie].ToString(), out keyHour);
                decimal.TryParse(dt.Rows[h][month + "_Tot"].ToString(), out totCateg);
                dt.Rows[h][month + "_Tot"] = totCateg + hr;
                dt.Rows[h][month+"_"+categorie] = keyHour + hr;
                dt.Rows[h]["Total"] = tot + hr; 
            }
            else
            {
                DataRow newRow = dt.NewRow();
                if (lastDepart != departament)
                {
                    newRow = dt.NewRow();
                    newRow[0] = departament;
                    dt.Rows.Add(newRow);
                    idx++;
                }
                newRow = dt.NewRow();
                newRow[1] = postdelucru;
                newRow[month + "_" + categorie] = hr;
                newRow[month + "_Tot"] = hr;
                newRow["Total"] = hr;
                dt.Rows.Add(newRow);
                htbl.Add(hKey, idx);
                //if (lastDepart != departament) 
                //{
                    
                //}
                //else
                //{
                //    var 
                //}
                idx++;
                lastDepart = departament;
            }
            decimal kkk;
            decimal.TryParse(totRow[month + "_" + categorie].ToString(), out kkk);
            totRow[month + "_" + categorie] = kkk + Convert.ToDecimal(hr);
           
        }

        //////decimal depTot;
        //////decimal.TryParse(totDepRow[month + "_" + categorie].ToString(), out depTot);
        //////totDepRow[month + "_" + categorie] = 2; //depTot + hr;

        totRow["Total"] = bigTotal;

        //totSubRow = dt.NewRow();
        //totSubRow[0] = "TOTAL " + lastDepart;
        //dt.Rows.Add(totSubRow);

        DataGrid1.DataSource=dt;
        DataGrid1.DataBind();
        CopyTable(dt);
    }


    protected void DataGrid1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].CssClass = "tDepartament"; 
            e.Row.Cells[1].CssClass = "tPostDeLucru";
            
            if (e.Row.Cells[0].Text == "AMMINISTRAZIONE ")
            {
                e.Row.CssClass = "totAmmin";
                

            } else if (e.Row.Cells[0].Text == "CONFEZIONE A")
            {
                e.Row.CssClass = "totConfa";
                
            }
            else if (e.Row.Cells[0].Text == "CONFEZIONE B")
            {
                e.Row.CssClass = "totConfb";

            }
            else if (e.Row.Cells[0].Text == "STIRO")
            {
                e.Row.CssClass = "totStiro";

            }
            else if (e.Row.Cells[0].Text == "TESSITURA  ")
            {
                e.Row.CssClass = "totTess";

            }
        }

        

    }

    protected void DataGrid2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].CssClass = "tDepartament";
            e.Row.Cells[1].CssClass = "tPostDeLucru1";

            if (e.Row.Cells[0].Text == "AMMINISTRAZIONE ")
            {
                e.Row.CssClass = "totAmmin";


            }
            else if (e.Row.Cells[0].Text == "CONFEZIONE A")
            {
                e.Row.CssClass = "totConfa";

            }
            else if (e.Row.Cells[0].Text == "CONFEZIONE B")
            {
                e.Row.CssClass = "totConfb";

            }
            else if (e.Row.Cells[0].Text == "STIRO")
            {
                e.Row.CssClass = "totStiro";

            }
            else if (e.Row.Cells[0].Text == "TESSITURA  ")
            {
                e.Row.CssClass = "totTess";

            }
        }
    }

    protected void ddlFiltruAn_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetData();
    }
}