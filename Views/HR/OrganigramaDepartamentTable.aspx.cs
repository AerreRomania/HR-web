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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class OrganigramaDepartament : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");
        Preparare(Request.QueryString["Departament"]);

        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script type='text/javascript' src='./js/jquery-3.1.1.min.js'></script>", false);
        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>$(document).ready(function() {$('#tOrganigramaDepartament td').wrapInner('<span></span>');})</script>", false);
    }

    private void Preparare(string Departament)
    {
        //lOrganigramaDepartament.Text = "Organigramma " + Departament;
        List<int> lineListValue = new List<int>();

        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        //var query = from tAngajati in dcWbmOlimpias.AngajatiViews
        //            where tAngajati.Departament.Equals(Departament) && tAngajati.DataLichidarii.Equals("0001-01-01")
        //            select new { tAngajati.Echipa, tAngajati.Linie, tAngajati.Nume, tAngajati.Prenume, tAngajati.PostDeLucru, tAngajati.Departament };


        DataTable query = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Linea, COUNT(Linea), SortHelper from OrganigramaDepartamentListViewByDep WHERE Departament='" + Departament + "' Group by Linea, SortHelper", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(query);
                }
            }
        }

        DataTable queryAngajat = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='" + Departament + "' ORDER BY Mansione", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(queryAngajat);
                }
            }
        }

        Int32 total = 0;
        foreach (DataRow dt in query.Rows)
        {
            total += Convert.ToInt32(dt[1]);
        }

        lTotal.Text = "TOTALE DIPENDENTI: " + total.ToString();
        //var queryLinie = query.GroupBy(x => x.Linie);
        HtmlTableRow trPrincipal = new HtmlTableRow();
        tOrganigramaDepartament.Rows.Add(trPrincipal);
        HtmlTableCell tcPrincipal;
        /*tcPrincipal = new HtmlTableCell();
        tcPrincipal.Text = query.Count().ToString();
        trPrincipal.Cells.Add(tcPrincipal);*/
        /*if (queryLinie.Count() > 0)
            tOrganigramaDepartament.Width = (510 * queryLinie.Count()).ToString();*/
        int TabelePeUnRand = 3;
        int NumarRanduri = 0;
        /*if (Departament == "TESSITURA")
            TabelePeUnRand = 4;*/
        int i = 0;
        int MaxLinii = 0;
        foreach (DataRow linie in query.Rows)
        {
            string LinieName = linie[0].ToString();
            if (i >= NumarRanduri * TabelePeUnRand)
            {
                NumarRanduri++;
                trPrincipal = new HtmlTableRow();
                tOrganigramaDepartament.Rows.Add(trPrincipal);
            }
            i++;

            tcPrincipal = new HtmlTableCell();
            tcPrincipal.VAlign = "top";
            HtmlTable tLinie = new HtmlTable();
            tLinie.Style.Add("border", "1px solid #800080");
            tLinie.Style.Add("border-collapse", "collapse");
            tLinie.Width = "450";
            HtmlTableRow tr = new HtmlTableRow();
            HtmlTableCell tc = new HtmlTableCell();
            tc.InnerHtml = "Totale: " + linie[1].ToString();
            lineListValue.Add(Convert.ToInt32(linie[1]));
            tc.Attributes.Add("class", "rAntet");
            tr.Cells.Add(tc);

            tc = new HtmlTableCell();
            tc.InnerHtml = linie[0].ToString();
            //if (linie.Key == "") {
            //    tc.InnerHtml = "ALTRI";
            //}
            //else { 
            //    tc.InnerHtml = linie.Key;
            //}

            tc.Align = "center";
            tc.Attributes.Add("class", "rAntet");
            tr.Cells.Add(tc);

            tLinie.Rows.Add(tr);

            tr = new HtmlTableRow();
            tc = new HtmlTableCell();
            tc.InnerText = "Nome e cognome";
            tc.Attributes.Add("class", "rAntetSecund");
            tr.Cells.Add(tc);

            tc = new HtmlTableCell();
            tc.InnerText = "Mansione";
            tc.Attributes.Add("class", "rAntetSecund");
            tr.Cells.Add(tc);

            tLinie.Rows.Add(tr);


            //if (queryAngajati.Count() > MaxLinii) { 
            //    MaxLinii = queryAngajati.Count();
            //}
            //else { 
            //    MaxLinii = 22;
            //}

            //OVO U ENABLE
            foreach (DataRow angajat in queryAngajat.Rows)
            {
                if (LinieName == angajat[3].ToString()) { 
                    tr = new HtmlTableRow();

                    tc = new HtmlTableCell();
                    tc.Attributes.Add("class", "rAntetSecundAlb");
                    tc.InnerText = angajat[0].ToString() + " " + angajat[1].ToString();
                    tr.Cells.Add(tc);

                    tc = new HtmlTableCell();
                    tc.Attributes.Add("class", "rAntetSecundAlb");
                    tc.InnerText = angajat[2].ToString();
                    tr.Cells.Add(tc);

                    tLinie.Rows.Add(tr);
                }
            }
            tcPrincipal.Controls.Add(tLinie);
            trPrincipal.Cells.Add(tcPrincipal);
        }


        
        foreach (HtmlTableRow htr in tOrganigramaDepartament.Rows)
        {
            foreach (HtmlTableCell htc in htr.Cells)
            {
                HtmlTable ht = (HtmlTable)htc.Controls[0];
                var vNumarLinii = ht.Rows.Count;
                 

                MaxLinii = lineListValue.Max();
                //MaxLinii = 24;
                //if (vNumarLinii <= MaxLinii)
                //{
                    for (int j = 0; j < MaxLinii - vNumarLinii +2 ; j++)
                    {
                        var vHtr = new HtmlTableRow();
                        for (int k = 0; k < 2; k++)
                        {
                            var vHtc = new HtmlTableCell();
                            vHtc.Attributes.Add("class", "rAntetSecundAlb");
                            vHtc.InnerHtml = "&nbsp;";
                            vHtr.Cells.Add(vHtc);
                        }
                        ht.Rows.Add(vHtr);
                    }
                //}
            }
        }
            
        
    }
}