using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class RaportAbsentaSuplimentar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        //        Preparare(Request.QueryString["IdAngajat"]);
        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");
        Preparare(Request.QueryString["IdAngajat"]);
    }

    private void Preparare(string IdAngajat)
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        var query = from tCategoriiOreAn in dcWbmOlimpias.CategoriiOreAnViews
                        where tCategoriiOreAn.IdAngajat.Equals(IdAngajat)
                        select tCategoriiOreAn;

        var queryAni = query.GroupBy(x => x.An);
        DataTable dt = new DataTable();
        dt.Columns.Add("Anno");
        foreach(var rezultat in queryAni)
        {
            dt.Columns.Add(rezultat.Key.ToString());
        }

        List<string> categorii = new List<string> { "Ore lavorabili", "Ore lavorate", "Assenza non retribuita", "% Assenza", "Ore straordinarie" };
        foreach(var categorie in categorii)
        {
            DataRow dr = dt.NewRow();
            dr["Anno"] = categorie;
            foreach (DataColumn dc in dt.Columns)
            {
                if (dc.ColumnName != "Anno")
                {
                    var queryOre = query.Where(x => x.An.Equals(dc.ColumnName) && x.Categorie.Equals(categorie));
                    if (queryOre.Count() > 0)
                        if (queryOre.First().Ore.HasValue)
                            dr[dc.ColumnName] = queryOre.First().Ore.Value.ToString();
                }
            }
            dt.Rows.Add(dr);
        }

        foreach(DataColumn dc in dt.Columns)
        {
            Decimal OreLucratoare = 0;
            Decimal OreAbsente = 0;
            if (dc.ColumnName != "Anno")
            {
                foreach(DataRow dr in dt.Rows)
                {
                    switch(dr[0].ToString())
                    {
                        case "Ore lavorabili":
                            OreLucratoare = Convert.ToDecimal(dr[dc.ColumnName]);
                            break;
                        case "Assenza non retribuita":
                            OreAbsente = Convert.ToDecimal(dr[dc.ColumnName]);
                            break;
                        case "% Assenza":
                            if(OreLucratoare>0)
                            {
                                dr.BeginEdit();
                                dr[dc.ColumnName] = (100 * OreAbsente / OreLucratoare).ToString("N1");
                                dr.EndEdit();
                            }
                            break;
                    }
                }
            }
        }

        TableRow tr = new TableRow();
        TableCell tc;
        foreach (DataColumn dc in dt.Columns)
        {
            tc = new TableCell();
            tc.Text = dc.ColumnName;
            tc.CssClass = "secund";
            tc.CssClass = "rAntet";
            if (dc.ColumnName == "Anno")
                tc.Width = 130;
            else
            {
                tc.Width = 50;
                tc.HorizontalAlign = HorizontalAlign.Center;
            }
            tr.Cells.Add(tc);
        }
        tRaportAbsentaSuplimentar.Rows.Add(tr);

        tr = new TableRow();
        tc = new TableCell();
        tc.Text = "&nbsp;";
        tc.ColumnSpan = dt.Columns.Count;
        tr.Cells.Add(tc);
        tRaportAbsentaSuplimentar.Rows.Add(tr);

        foreach (DataRow dr in dt.Rows)
        {
            string stil = "rAntetSecund";
            TableRow trSecund = new TableRow();
            if (dr[0].ToString() == "% Assenza")
                stil = "rAntetSecundGalben";
            foreach (DataColumn dc in dt.Columns)
            {
                tc = new TableCell();
                tc.CssClass = stil;
                if (dc.ColumnName != "Anno")
                {
                    tc.HorizontalAlign = HorizontalAlign.Right;
                    tc.Text = dr[dc.ColumnName].ToString();
                }
                else
                {
                    switch(dr[dc.ColumnName].ToString())
                    {
                        case "Ore lavorabili":
                            tc.Text = "Ore Lavorabili";
                            break;
                        case "Ore lavorate":
                            tc.Text = "Ore Presenza";
                            break;
                        case "Assenza non retribuita":
                            tc.Text = "Ore Assenza";
                            break;
                        case "% Assenza":
                            tc.Text = "% Assenza";
                            break;
                        case "Ore straordinarie":
                            tc.Text = "Ore Straordinario";
                            break;
                    }
                }
                trSecund.Cells.Add(tc);
            }
            tRaportAbsentaSuplimentar.Rows.Add(trSecund);
        }
    }
}