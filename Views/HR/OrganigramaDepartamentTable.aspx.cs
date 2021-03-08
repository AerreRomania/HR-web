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
    private List<string> CapoSqList = new List<string>();
    private void Preparare(string Departament)
    {
        
    string TESSITURA = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='TESSITURA' ORDER BY case when Mansione = 'PROGRAMMAZIONE' then 1 when Mansione = 'MAGAZZINO FILATO' then 2 when Mansione = 'ROCCATURA' then 3 when Mansione = 'RESP.CONTROLLO QUALITÀ' then 4 when Mansione = 'ADDETTO AL CONTROLLO TAVOLO' then 5 when Mansione = 'PROGRAMMATORE SHIMA' then 6 when Mansione = 'MECCANICO' then 7 when Mansione = 'PULITORE' then 8 when Mansione = 'CAPOTURNO' then 9 when Mansione = 'OPERATORE MACCHINA' then 10 when Mansione = 'RAMMENDO' then 11 else 12 end asc";
    string STIRO = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='STIRO' ORDER BY case When Linea between '1' and '9' then case when Mansione = 'APPLICAZIONE ETICHETTE' then 1 when Mansione = 'DIVISIONE TAGLIE' then 2 when Mansione = 'CONTROLLO MANICHINO' then 3 when Mansione = 'RAMMENDO' then 4 when Mansione = 'STIRO PRESSA' then 5 when Mansione = 'ADDETTO AI CARTELLINI' then 6 when Mansione = 'PIEGO/IMBUSTO' then 7 when Mansione = 'ADDETTO ABACO' then 8 when Mansione = 'CONTROLLO QUALITA' then 9 else 10 end else case when Linea = 'NIS STIRO' then case when Mansione = 'RESPONSABILE STIRO' then 1 when Mansione = 'ANALISTA TEMPI E METODI' then 2 when Mansione = 'RESP.CONTROLLO QUALITÀ' then 3 when Mansione = 'MAGAZZINIERE' then 4 when Mansione = 'MECCANICO' then 5 when Mansione = 'CALDAISTA CON PATENTE' then 6 when Mansione = 'PIEGO/IMBUSTO' then 7 else 8 end end end asc";
    string CONFFEZIONE = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='"+Departament+"' ORDER BY case when Mansione = 'CAPO LINEA' then 1 when Mansione = 'TC' then 2 when Mansione = 'RIMAGLIO' then 3 when Mansione = 'OV' then 4 when Mansione = 'TRAVETTA' then 5 when Mansione = 'FINISSAGGIO' then 6 else 7 end asc";
        string structura = string.Empty;
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
        

        switch (Departament)
        {
            case "TESSITURA":
                structura = TESSITURA;
                break;
            case "STIRO":
                structura = STIRO;
                break;
            case "CONFEZIONE A":
                structura = CONFFEZIONE;
                break;
            case "CONFEZIONE B":
                structura = CONFFEZIONE;
                break;
            case "CONFEZIONE C":
                structura = CONFFEZIONE;
                break;
        }

        DataTable queryAngajat = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            
            using (SqlCommand cmd = new SqlCommand(structura, conn))
            {
                
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(queryAngajat);
                }
            }
        }

        //DataTable MaxMansione = new DataTable();
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        //{
        //    using (SqlCommand cmd = new SqlCommand("SELECT Linea,Mansione,Count(Mansione) AS Maxim FROM OrganigramaDepartamentListViewByDep where Departament = '"+Departament+"' GROUP BY  Linea, Mansione", conn))
        //    {
        //        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //        {
        //            da.Fill(MaxMansione);
        //        }
        //    }
        //}

        Int32 total = 0;
        foreach (DataRow dt in query.Rows)
        {
            total += Convert.ToInt32(dt[1]);
        }

        lTotal.Text = "TOTALE DIPENDENTI: " + total.ToString();
        //var queryLinie = query.GroupBy(x => x.Linie);
        HtmlTableRow trPrincipal = new HtmlTableRow();
        HtmlTableRow thPrincipal = new HtmlTableRow();
       
       // tOrganigramaDepartament.Rows.Add(trPrincipal);
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
        int j = 0;
        int MaxLinii = 0;
        int mansioneC = 0;
        int max = 0;
        foreach (DataRow linie in query.Rows)
        {
            
            string LinieName = linie[0].ToString();
            if (Departament == "STIRO")
            {
                if (i >= NumarRanduri * TabelePeUnRand)
                {
                    NumarRanduri++;
                    trPrincipal = new HtmlTableRow();
                    thPrincipal = new HtmlTableRow();

                    tOrganigramaDepartament.Rows.Add(thPrincipal);
                    thPrincipal.Attributes.Add("id", "sq" + NumarRanduri);
                    HtmlTableCell tch = new HtmlTableCell();
                    tch.Attributes.Add("class", "capoSquadra");
                    tch.InnerHtml = "Squadra " + NumarRanduri;
                    thPrincipal.Cells.Add(tch);
                    tch = new HtmlTableCell();
                    tch.Attributes.Add("id", "capoSquadraT"+NumarRanduri);
                    tch.InnerHtml = "test";
                    thPrincipal.Cells.Add(tch);
                    tOrganigramaDepartament.Rows.Add(trPrincipal);
                }
                i++;
            }
            else
            {
                if (i >= NumarRanduri * TabelePeUnRand)
                {
                    NumarRanduri++;
                    trPrincipal = new HtmlTableRow();
                    tOrganigramaDepartament.Rows.Add(trPrincipal);
                }
                i++;
            }
            





            tcPrincipal = new HtmlTableCell();
            tcPrincipal.VAlign = "top";
           
            HtmlTable tLinie = new HtmlTable();
            tLinie.Style.Add("border", "1px solid #800080");
            tLinie.Style.Add("border-collapse", "collapse");
            tLinie.Width = "400";
            tLinie.Style.Add("table-layout", "auto !important");
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
            //    
            //}
            //else { 
            //    MaxLinii = 22;
            //}

            //OVO U ENABLE
            string MansioneLast = string.Empty;
            foreach (DataRow angajat in queryAngajat.Rows)
            {


                if (LinieName == angajat[3].ToString())
                {
                    if (angajat[2].ToString() == "CAPO SQUADRA")
                    {

                        CapoSqList.Add(angajat[0].ToString() + " " + angajat[1].ToString());
                    }


                    if (MansioneLast == angajat[2].ToString() || MansioneLast == string.Empty)
                    {

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

                        mansioneC++;
                    }
                    else
                    {

                        mansioneC++;
                        //while(mansioneC<max)
                        //{
                        //    tr = new HtmlTableRow();
                        //    tc = new HtmlTableCell();
                        //    tc.Attributes.Add("class", "rAntetSecundAlb");
                        //    tc.Style.Add("height", "17px;");
                        //    tc.InnerText = " ";
                        //    tr.Cells.Add(tc);

                        //    tc = new HtmlTableCell();
                        //    tc.Attributes.Add("class", "rAntetSecundAlb");
                        //    tc.Style.Add("height", "17px;");
                        //    tc.InnerText = " ";

                        //    tr.Cells.Add(tc);
                        //    tLinie.Rows.Add(tr);
                        //    mansioneC++;
                        //}
                        tr = new HtmlTableRow();
                        tc = new HtmlTableCell();
                        tc.Attributes.Add("class", "empty");
                        tc.InnerText = " ";
                        tr.Cells.Add(tc);

                        tc = new HtmlTableCell();
                        tc.Attributes.Add("class", "empty");
                        tc.InnerText = " ";
                        tr.Cells.Add(tc);


                        tLinie.Rows.Add(tr);
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
                        mansioneC = 0;

                    }

                    MansioneLast = angajat[2].ToString();
                    //max = (from row in MaxMansione.AsEnumerable() where row.Field<string>("Mansione") == MansioneLast select row.Field<int>("Maxim")).Max();

                }
            }
            tcPrincipal.Controls.Add(tLinie);
            trPrincipal.Cells.Add(tcPrincipal);
        }



        foreach (HtmlTableRow htr in tOrganigramaDepartament.Rows)
        {
            int sq = 0;
            foreach (HtmlTableCell htc in htr.Cells)
            {
                //HtmlTable ht = (HtmlTable)htc.Controls[0];
                //var vNumarLinii = ht.Rows.Count;

                //MaxLinii = lineListValue.Max();
                //MaxLinii = 24;
                //if (vNumarLinii <= MaxLinii)
                //{
                //    for (int j = 0; j < MaxLinii - vNumarLinii + 2; j++)
                //    {
                //        var vHtr = new HtmlTableRow();
                //        for (int k = 0; k < 2; k++)
                //        {
                //            var vHtc = new HtmlTableCell();
                //            vHtc.Attributes.Add("class", "rAntetSecundAlb");
                //            vHtc.InnerHtml = "&nbsp;";
                //            vHtr.Cells.Add(vHtc);
                //        }
                //        ht.Rows.Add(vHtr);
                //    }
            }
        }
        capo1.Text = CapoSqList[0];
        capo2.Text = CapoSqList[1];
        capo3.Text = CapoSqList[2];
    }



    
}