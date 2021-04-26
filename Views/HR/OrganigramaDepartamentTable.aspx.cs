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
    private List<string> TessituraNames = new List<string>() { "PROGRAMMAZIONE", "RESP.MAGAZZINO", "MAGAZZINO FILATO", "ROCCATURA", "RESP.CONTROLLO QUALITÀ", "CONTROLLO QUALITA'", "ADDETTO AL CONTROLLO TAVOLO", "PROGRAMMATORE SHIMA", "CAPO MECCANICO", "MECCANICO", "MANUTENZIONE", "PULITORE", "CAPO SQUADRA - NIS TESSITURA", "CAPOTURNO", "OPERATORE MACCHINA", "RAMMENDO", "PACCHI", "ADDETTO ALLE PULIZIE GENERALI" };
    private List<string> StiroNames = new List<string>() { "RESPONSABILE STIRO", "ANALISTA TEMPI E METODI", "RESP.CONTROLLO QUALITÀ", "CAPO LINEA", "APPLICAZIONE ETICHETTE", "DIVISIONE TAGLIE", "CONTROLLO MANICHINO", "RAMMENDO", "STIRO PRESSA", "ADDETTO AI CARTELLINI", "PIEGO/IMBUSTO", "ADDETTO ABACO", "CONTROLLO QUALITA'", "MAGAZZINIERE", "MECCANICO", "CALDAISTA CON PATENTE"};
    private List<string> ConfeNames = new List<string>() { "RESPONSABILE CONFEZIONE", "ANALISTA TEMPI E METODI", "RESONSABILE CAPOLINEA CONFEZ", "CONTROLLO QUALITA'", "CAPO LINEA", "CONTROLLORE DI LAVORO IN LINEA", "TC","RIMAGLIO","OV","TRAVETTA","RAMMENDO","FINISSAGGIO","CONTROLLO MANICHINO","MECCANICO","RESP.MAGAZZINO", "MAGAZZINIERE", "ADDETTO ALLE PULIZIE GENERALI"};
    private List<string> CurrentDepNames = new List<string>();
    private void Preparare(string Departament)
    {

        string TESSITURA = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='TESSITURA' ORDER BY case when Mansione = 'PROGRAMMAZIONE' then 1 when Mansione = 'RESP.MAGAZZINO' then 2 when Mansione = 'MAGAZZINO FILATO' then 3 when Mansione='SFILATURA TELI' then 4 when Mansione = 'ROCCATURA' then 5 when Mansione = 'RESP.CONTROLLO QUALITÀ'  then 6 when Mansione='SVILUPPO SCHEDE/TAGLIE' then 7 when Mansione='CONTROLLO QUALITA''' then 8 when Mansione = 'ADDETTO AL CONTROLLO TAVOLO' then 9 when Mansione = 'PROGRAMMATORE SHIMA' then 10 when Mansione='CAPO MECCANICO' then 10 when Mansione = 'MECCANICO' then 11 when Mansione = 'PULITORE' then 12 when Mansione = 'CAPOTURNO' then 13 when Mansione='CAPO SQUADRA - NIS TESSITURA' then 14 when Mansione = 'OPERATORE MACCHINA' then 15 when Mansione='MANUTENZIONE' then 16 when Mansione='CONTROLLO QUALITA'' RAMMENDO' then 17 when Mansione = 'RAMMENDO' then 18 when Mansione='PACCHI' then 19 else 20 end asc;";
        string STIRO = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='STIRO' ORDER BY case when Mansione = 'RESPONSABILE STIRO' then 1 when Mansione = 'ANALISTA TEMPI E METODI' then 2 when Mansione = 'RESP.CONTROLLO QUALITÀ' then 3 when Mansione = 'CAPO LINEA' then 4 when Mansione = 'APPLICAZIONE ETICHETTE' then 5 when Mansione = 'DIVISIONE TAGLIE' then 6when Mansione = 'CONTROLLO MANICHINO' then 7when Mansione = 'RAMMENDO' then 8 when Mansione = 'STIRO PRESSA' then 9  when Mansione = 'ADDETTO AI CARTELLINI' then 10 when Mansione = 'PIEGO/IMBUSTO' then 11when Mansione = 'ADDETTO ABACO' then 12when Mansione = 'CONTROLLO QUALITA''' then 13 when Mansione = 'MAGAZZINIERE' then 14 when Mansione = 'MECCANICO' then 15 else 16 end asc;";
        string CONFFEZIONE = "SELECT Cognome, Nome, Mansione, Linea from OrganigramaDepartamentListViewByDep WHERE Departament='" + Departament + "' ORDER BY case when Mansione = 'RESPONSABILE CONFEZIONE' then 1 when Mansione = 'ANALISTA TEMPI E METODI' then 2 when Mansione = 'RESPONSABILE CAPOLINEA CONFEZ.' then 3 when Mansione = 'CONTROLLO QUALITA''' then 4 when Mansione = 'CAPO LINEA' then 5 when Mansione = 'CONTROLLORE DI LAVORO IN LINEA' then 6 when Mansione = 'TC' then 7 when Mansione = 'RIMAGLIO' then 8 when Mansione = 'OV' then 9 when Mansione = 'TRAVETTA' then 10 when Mansione = 'RAMMENDO' then 11 when Mansione = 'FINISSAGGIO' then 12 when Mansione = 'CONTROLLO MANICHINO' then 13 when Mansione = 'MECCANICO' then 14 when Mansione = 'RESP.MAGAZZINO' then 15 when Mansione = 'MAGAZZINIERE' then 16 when Mansione = 'ADDETTO ALLE PULIZIE GENERALI' then 17 else 18 end asc;";
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
                CurrentDepNames = TessituraNames;
                break;
            case "STIRO":
                structura = STIRO;
                CurrentDepNames = StiroNames;
                break;
            case "CONFEZIONE A":
                structura = CONFFEZIONE;
                CurrentDepNames = ConfeNames;
                break;
            case "CONFEZIONE B":
                structura = CONFFEZIONE;
                CurrentDepNames = ConfeNames;
                break;
            case "CONFEZIONE C":
                structura = CONFFEZIONE;
                CurrentDepNames = ConfeNames;
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

        DataTable MaxMansione = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Linea,Mansione,Count(Mansione) AS Maxim FROM OrganigramaDepartamentListViewByDep where Departament = '" + Departament + "' and Linea Not like 'MA %' GROUP BY  Linea, Mansione", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(MaxMansione);
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

                    else
                    {
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
                                if (LinieName != "MA TESS." && LinieName!= "MA STIRO" && LinieName != "NIS STRUT" )
                                {

                                    while (mansioneC < max)
                                    {
                                        tr = new HtmlTableRow();
                                        tc = new HtmlTableCell();
                                        tc.Attributes.Add("class", "rAntetSecundAlb");
                                        tc.Style.Add("height", "17px;");
                                        tc.InnerText = " ";
                                        tr.Cells.Add(tc);
                                        tc = new HtmlTableCell();
                                        tc.Attributes.Add("class", "rAntetSecundAlb");
                                        tc.Style.Add("height", "17px;");
                                        tc.InnerText = " ";

                                        tr.Cells.Add(tc);
                                        tLinie.Rows.Add(tr);
                                        mansioneC++;
                                    }
                                }
                            
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
                        max = (from row in MaxMansione.AsEnumerable() where row.Field<string>("Mansione") == MansioneLast select row.Field<int>("Maxim")).Max();

                    }
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
        if (Departament == "STIRO")
        {
            capo1.Text = CapoSqList[0];
            capo2.Text = CapoSqList[1];
            capo3.Text = CapoSqList[2];
        }
    }



    
}