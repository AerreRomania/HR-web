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

    }

    private void Preparare(string Departament)
    {
        lOrganigramaDepartament.Text = "Organigramma " + Departament;
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        var query = from tAngajati in dcWbmOlimpias.AngajatiViews
                    where tAngajati.Departament.Equals(Departament)
                    select new { tAngajati.Echipa, tAngajati.Linie, tAngajati.Nume, tAngajati.Prenume, tAngajati.PostDeLucru, tAngajati.Departament };

        if (Departament == "STRUTTURA")
        {
            query = from tAngajati in dcWbmOlimpias.AngajatiViews
                    where !tAngajati.Departament.Equals("TESSITURA") && !tAngajati.Departament.Equals("CONFEZIONE") && !tAngajati.Departament.Equals("STIRO")
                    select new { tAngajati.Echipa, tAngajati.Linie, tAngajati.Nume, tAngajati.Prenume, tAngajati.PostDeLucru, tAngajati.Departament };
        }



        lTotal.Text = "Totale: " + query.Count().ToString();
        var queryLinie = query.GroupBy(x => x.Linie);
        HtmlTableRow trPrincipal = new HtmlTableRow();
        tOrganigramaDepartament.Rows.Add(trPrincipal);
        HtmlTableCell tcPrincipal;
        /*tcPrincipal = new HtmlTableCell();
        tcPrincipal.Text = query.Count().ToString();
        trPrincipal.Cells.Add(tcPrincipal);*/
        /*if (queryLinie.Count() > 0)
            tOrganigramaDepartament.Width = (510 * queryLinie.Count()).ToString();*/
        int TabelePeUnRand = 3;
        int NumarRanduri = 1;
        /*if (Departament == "TESSITURA")
            TabelePeUnRand = 4;*/
        int i = 0;
        int MaxLinii = 0;
        foreach(var linie in queryLinie)
        {
            var queryAngajati = query.Where(x => x.Linie.Equals(linie.Key)).OrderBy(x=>x.PostDeLucru);

            if (i >= NumarRanduri * TabelePeUnRand)
            {
                NumarRanduri++;
                trPrincipal = new HtmlTableRow();
                tOrganigramaDepartament.Rows.Add(trPrincipal);
            }
            i++;
            tcPrincipal = new HtmlTableCell();
            //tcPrincipal.Width = "510";
            tcPrincipal.VAlign = "top";

            HtmlTable tLinie = new HtmlTable();
            tLinie.Style.Add("border","1px solid #800080");
            tLinie.Style.Add("border-collapse","collapse");
            //tLinie.Attributes.Add("border","1");
            tLinie.Width = "500";
            //tLinie.Attributes.Add("class", "raport");
            HtmlTableRow tr = new HtmlTableRow();
            HtmlTableCell tc = new HtmlTableCell();
            tc.InnerHtml = queryAngajati.Count().ToString();
            tc.Attributes.Add("class", "rAntet");
            tr.Cells.Add(tc);

            tc = new HtmlTableCell();
            if (linie.Key == "")
                tc.InnerHtml = "ALTRI";
            else
                tc.InnerHtml = linie.Key;
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

            
            if (queryAngajati.Count() > MaxLinii)
                MaxLinii = queryAngajati.Count();
            foreach(var angajat in queryAngajati)
            {
                tr = new HtmlTableRow();

                tc = new HtmlTableCell();
                tc.Attributes.Add("class", "rAntetSecundAlb");
                tc.InnerText = angajat.Prenume + " " + angajat.Nume;
                tr.Cells.Add(tc);

                tc = new HtmlTableCell();
                tc.Attributes.Add("class", "rAntetSecundAlb");
                tc.InnerText = angajat.PostDeLucru;
                tr.Cells.Add(tc);

                tLinie.Rows.Add(tr);
            }
            tcPrincipal.Controls.Add(tLinie);
            trPrincipal.Cells.Add(tcPrincipal);
        }

        foreach(HtmlTableRow htr in tOrganigramaDepartament.Rows)
        {
            foreach(HtmlTableCell htc in htr.Cells)
            {
                HtmlTable ht = (HtmlTable)htc.Controls[0];
                var vNumarLinii = ht.Rows.Count;
                if(vNumarLinii<MaxLinii)
                {
                    for (int j = -1; j <= MaxLinii - vNumarLinii; j++)
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
                }
            }
        }
            
        
    }
}