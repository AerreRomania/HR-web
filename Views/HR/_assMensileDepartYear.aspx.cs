using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_assMensileDepartYear : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        //lblDep.Text = Request.QueryString["Departament"] + " 2020";

        BindGrid(Request.QueryString["Departament"]);
        //GridView.DataSource = GetData(Request.QueryString["Departament"]);
        //GridView.DataBind();
    }

    DataTable dt = new DataTable();

    private void BindGrid(string Departament)
    {
        string month = DateTime.Now.Month.ToString();
        DateTime currentMonth = DateTime.Now.AddMonths(-1);
        string sMonth = currentMonth.ToString("MM");
        string lastY = "";
        DateTime lastYeardt = DateTime.Now.AddYears(-1);
        lastY = lastYeardt.ToString("yy");

        DataTable dtFerie = helper.PkSelect("SELECT dbo.AngajatiViewLastMonth.Marca, SUM(dbo.Prezente.R1TOT) AS Ore, YEAR(dbo.Prezente.Data) AS An, MONTH(dbo.Prezente.Data) AS Luna,  " +
            "dbo.Departamente.Departament FROM dbo.Prezente INNER JOIN dbo.AngajatiViewLastMonth ON dbo.Prezente.IdAngajat = dbo.AngajatiViewLastMonth.CodAngajat " +
            "INNER JOIN dbo.TipuriOre ON dbo.Prezente.IdTipOra = dbo.TipuriOre.Id INNER JOIN dbo.Departamente ON dbo.Prezente.IdDepartament = dbo.Departamente.Id " +
            "INNER JOIN dbo.Linii ON dbo.Prezente.IdLinie = dbo.Linii.Id INNER JOIN dbo.PosturiDeLucru ON dbo.Prezente.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
            "WHERE (dbo.TipuriOre.Categorie = 'Malatia') AND (YEAR(dbo.Prezente.Data) = '"+ddlFiltruAn.SelectedValue+"') AND dbo.Departamente.Departament='" + Departament + "' AND dbo.Prezente.R1TOT > 0 " +
            "OR (dbo.TipuriOre.Categorie = 'Infortuni') AND (YEAR(dbo.Prezente.Data) = '" + ddlFiltruAn.SelectedValue + "') AND dbo.Departamente.Departament='" + Departament + "' AND dbo.Prezente.R1TOT > 0" +
            "GROUP BY dbo.AngajatiViewLastMonth.Marca, MONTH(dbo.Prezente.Data), YEAR(dbo.Prezente.Data), dbo.Departamente.Departament", "WbmOlimpiasConnectionString");
        DataTable dt = helper.PkSelect("SELECT [Marca] as [R-CODE], CONCAT([Prenume],' ',[Nume]) as [NOMINATIVO], [PostDeLucru] as [MANSIONE]," +
            "CONVERT(VARCHAR(10), [DataNasterii], 103) as [DATA ASS.], [Departament] as [REPARTO], [Linie] as [LINE] FROM [AngajatiViewLastMonth] WHERE [Departament]= '" + Departament+"'", "WbmOlimpiasConnectionString");

        DataTable dtLastMonth = helper.PkSelect("SELECT [Month],[Year] FROM [LastLoadedData]", "WbmOlimpiasConnectionString");

        txt_year.Text = dtLastMonth.Rows[0].ItemArray[1].ToString();
        txt_month.Text = dtLastMonth.Rows[0].ItemArray[0].ToString();

        for (int i = 1; i <= 12; i++)
        {
            dt.Columns.Add(CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i).Substring(0, 3) + "-" + int.Parse(ddlFiltruAn.SelectedValue) % 100, typeof(string));
        }
        dt.Columns.Add("Total", typeof(string));
        dt.Columns.Add("Days", typeof(string));
        dt.Columns.Add("Media", typeof(string));

        foreach (DataRow dtRow in dt.Rows)
        {
            double SumTotal = 0;

            foreach (DataRow dtfRow in dtFerie.Rows)
            {
                if (dtRow.ItemArray[0].ToString().Equals(dtfRow.ItemArray[0].ToString()))
                {
                    if (Convert.ToDouble(dtfRow.ItemArray[1]) > 0)
                    {
                        SumTotal += Convert.ToDouble(dtfRow["Ore"]);

                    for (int i = 1; i < 13; i++)
                    {
                        int fmonth = Convert.ToInt32(dtfRow["Luna"]);
                        var sum = dtfRow["Ore"];
                        if (i == fmonth)
                        {
                            for (int n = 6; n < 18; n++)
                            {
                                switch (i)
                                {
                                    case 1:
                                        dtRow[6] = sum;
                                        break;
                                    case 2:
                                        dtRow[7] = sum;
                                        break;
                                    case 3:
                                        dtRow[8] = sum;
                                        break;
                                    case 4:
                                        dtRow[9] = sum;
                                        break;
                                    case 5:
                                        dtRow[10] = sum;
                                        break;
                                    case 6:
                                        dtRow[11] = sum;
                                        break;
                                    case 7:
                                        dtRow[12] = sum;
                                        break;
                                    case 8:
                                        dtRow[13] = sum;
                                        break;
                                    case 9:
                                        dtRow[14] = sum;
                                        break;
                                    case 10:
                                        dtRow[15] = sum;
                                        break;
                                    case 11:
                                        dtRow[16] = sum;
                                        break;
                                    case 12:
                                        dtRow[17] = sum;
                                        break;
                                    default:
                                        Console.WriteLine("Default case");
                                        break;
                                }

                            }
                        }
                    }

                    }
                }
            }

            dtRow["Total"] = Math.Round(SumTotal,2);
            dtRow["Days"] = Math.Round((SumTotal / 8),2);
            dtRow["Media"] = Math.Round((SumTotal / 8 / Convert.ToInt32(dtLastMonth.Rows[0].ItemArray[0])), 2);
        }
        GridView.DataSource = dt;
        GridView.DataBind();


    }

    protected void ddlFiltruAn_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid(Request.QueryString["Departament"]);
    }
}