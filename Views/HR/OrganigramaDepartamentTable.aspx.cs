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
        
        Preparare(Request.QueryString["Departament"]);

         }
    private List<string> CapoSqList = new List<string>() { "1","2","3"};
    private List<string> CapoLinea = new List<string>() { "1","2","3"};
  
    private void Preparare(string Departament)
    {
        
        string angajatibydep = " select c.Prenume as Cognome,c.Nume as Nome,a.Linie as Linea,a.PostDeLucru as Mansione from (select distinct e.Id,e.Linie,IdDepartament,Departament,PostDeLucru,IdPostDeLucru from AngajatiViewLastMonth as b join Linii as e on b.IdDepartament=e.DepartamentId) as a join (SELECT DisplayNumber,Organigramma.LineGroupId,PostDeLucruId,Linii.DepartamentId,Linii.Linie,Linii.Id as IdLinie, s_index = ROW_NUMBER() OVER(PARTITION BY PostDeLucruId,Linii.Id ORDER BY Organigramma.Id) FROM Organigramma join Linii on Organigramma.LineGroupId=Linii.LineGroupId) as o on a.IdPostDeLucru=o.PostDeLucruId and a.Id=o.IdLinie and a.IdDepartament= o.DepartamentId left join (SELECT Prenume,Nume,IdPostDeLucru,IdLinie,Linie,PostDeLucru,Departament, s_index = ROW_NUMBER() OVER(PARTITION BY IdPostDeLucru,IdLinie ORDER BY Id) FROM AngajatiViewLastMonth) as c on c.IdPostDeLucru=o.PostDeLucruId and c.IdLinie=o.IdLinie and o.s_index=c.s_index  where a.Departament='"+Departament+ "' order by a.Linie,o.DisplayNumber";
       
        string structura = string.Empty;
        string maxbyDep = string.Empty;
        //lOrganigramaDepartament.Text = "Organigramma " + Departament;
        List<int> lineListValue = new List<int>();
       // DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
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
        string querymaternita = "select Cognome,Nome, Mansione from OrganigramaDepartamentListViewByDep where Departament='"+Departament+"' and Linea like 'MA%'" ;
        DataTable maternita = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(querymaternita, conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(maternita);
                }
            }
        }


        DataTable queryAngajat = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            
            using (SqlCommand cmd = new SqlCommand(angajatibydep, conn))
            {
                
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(queryAngajat);
                }
            }
        }
        string queryCS = "select Cognome,Nome,Linea from OrganigramaDepartamentListViewByDep where Departament='Stiro' and Mansione='CAPO SQUADRA' order by Linea";
        DataTable caposquadra = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {

            using (SqlCommand cmd = new SqlCommand(queryCS, conn))
            {

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(caposquadra);
                }
            }
        }
        if (Departament == "STIRO")
        {
            foreach (DataRow cs in caposquadra.Rows)
            {

                string name = "CAPO SQUADRA: " + cs["Cognome"].ToString() + " " + cs["Nome"].ToString();
                if (cs["LINEA"].ToString().EndsWith("2")) capo1.Text = name;
                else if (cs["LINEA"].ToString().EndsWith("5")) capo2.Text = name;
                else if (cs["LINEA"].ToString().EndsWith("8")) capo3.Text = name;
            }
        }
        string queryCL = "select Cognome,Nome,Linea from OrganigramaDepartamentListViewByDep where Departament='Stiro' and Mansione='CAPO LINEA' order by Linea";
        DataTable capoLinea = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {

            using (SqlCommand cmd = new SqlCommand(queryCL, conn))
            {

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(capoLinea);
                }
            }
        }
        if (Departament == "STIRO")
        {
            foreach (DataRow cs in capoLinea.Rows)
            {
                string name = "CAPO LINEA: " + cs["Cognome"].ToString() + " " + cs["Nome"].ToString();

                if (cs["LINEA"].ToString().EndsWith("1")) cl1.Text = name;
                else if (cs["LINEA"].ToString().EndsWith("4")) cl2.Text = name;
                else if (cs["LINEA"].ToString().EndsWith("7")) cl3.Text = name;
            }
        }
        //DataTable MaxMansione = new DataTable();
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        //{
        //    using (SqlCommand cmd = new SqlCommand(maxbyDep, conn))
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
                    //capoSquadra
                    HtmlTableCell tch = new HtmlTableCell();
                    tch.Attributes.Add("class", "capoSquadra");
                    tch.InnerHtml = "Squadra " + NumarRanduri;
                    thPrincipal.Cells.Add(tch);
                    tch = new HtmlTableCell();
                    tch.Attributes.Add("id", "capoSquadraT" + NumarRanduri);
                    tch.InnerHtml = "test";
                    thPrincipal.Cells.Add(tch);
                    //capo linea
                    tch.Attributes.Add("class", "capoSquadra");
                    tch.InnerHtml = "Squadra " + NumarRanduri;
                    thPrincipal.Cells.Add(tch);
                    tch = new HtmlTableCell();
                    tch.Attributes.Add("id", "capoLinea" + NumarRanduri);
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
            
                var listang = queryAngajat.AsEnumerable().Where(a => a["Linea"].ToString() == LinieName).ToList();
            //var maxlist = MaxMansione.AsEnumerable().GroupBy(t => t["Mansione"]).Select(g => g.OrderByDescending(t => t["Maxim"]).First()).ToList();

            //OVO U ENABLE
            foreach (DataRow mansion in listang)
            {
                string nume = mansion["Nome"].ToString() + " " + mansion["Cognome"].ToString();
                string mansione = mansion["Mansione"].ToString();
                   
                        tr = new HtmlTableRow();
                        tc = new HtmlTableCell();
                        tc.Attributes.Add("class", "rAntetSecundAlb");
                        tc.InnerHtml = nume;
                        tr.Cells.Add(tc);

                        tc = new HtmlTableCell();
                        tc.Attributes.Add("class", "rAntetSecundAlb");
                        tc.InnerHtml = mansione;
                        tr.Cells.Add(tc);
                        tLinie.Rows.Add(tr);
                    
            }

            foreach (DataRow ang in maternita.Rows)
            {
               string nume = ang["Nome"].ToString() + " " + ang["Cognome"].ToString();
               string mansione = ang["Mansione"].ToString();
                tr = new HtmlTableRow();
                tc = new HtmlTableCell();
                tc.Attributes.Add("class", "rAntetSecundAlb");
                tc.InnerHtml = nume;
                tr.Cells.Add(tc);

                tc = new HtmlTableCell();
                tc.Attributes.Add("class", "rAntetSecundAlb");
                tc.InnerHtml = mansione;
                tr.Cells.Add(tc);
                tLinie.Rows.Add(tr);
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
                //capo1.Text = CapoSqList[0];
                //capo2.Text = CapoSqList[1];
                //capo3.Text = CapoSqList[2];

                //cl1.Text = CapoLinea[0];
                //cl2.Text = CapoLinea[1];
                //cl3.Text = CapoLinea[2];
           
        }
       
    }
    private static bool RemoveEmpty(String s)
    {
        return s.ToLower().Contains("&nbsp;");
    }



}