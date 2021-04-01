using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_ferie : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

        }
        this.BindGrid();
    }

    private void BindGrid()
    {
        string month = DateTime.Now.Month.ToString();
        DataTable dtFerie = helper.PkSelect("SELECT AngajatiViewLastMonth.Marca, MONTH(OreFerieView.Data) AS Month," +
            " YEAR(OreFerieView.Data) AS Year, SUM(OreFerieView.Ore) / 8 AS Sum FROM  AngajatiViewLastMonth INNER JOIN  " +
            "OreFerieView ON AngajatiViewLastMonth.CodAngajat = OreFerieView.IdAngajat " +
            "WHERE (OreFerieView.Ore > 1) AND (YEAR(OreFerieView.Data) = '"+ddlFiltruAn.SelectedValue+"') GROUP BY MONTH(OreFerieView.Data), " +
            "YEAR(OreFerieView.Data), AngajatiViewLastMonth.Marca", "WbmOlimpiasConnectionString");
        DataTable dt = helper.PkSelect("SELECT [Marca] as [R-CODE], CONCAT([Prenume],' ',[Nume]) as [NOMINATIVO], [PostDeLucru] as [MANSIONE]," +
            "CONVERT(VARCHAR(10), [DataNasterii], 103) as [DATA ASS.], [Departament] as [REPARTO], [Linie] as [LINE] FROM [AngajatiViewLastMonth]", "WbmOlimpiasConnectionString");
        DataTable dtLastY = helper.PkSelect("SELECT * FROM FerieTotYY", "WbmOlimpiasConnectionString");
        DataTable LastMonth = helper.PkSelect("SELECT * FROM [LastLoadedData]", "WbmOlimpiasConnectionString");
        string sMonth = LastMonth.Rows[0].ItemArray[0].ToString();
        string lastY = (int.Parse(ddlFiltruAn.SelectedValue)-1).ToString();
        DateTime lastdayOfLastYear = new DateTime(Convert.ToInt32( lastY), 12, 31);
       
        dt.Columns.AddRange(new DataColumn[] 
        { 
          new DataColumn("SIT. FINE " + lastY,typeof(string)),
          new DataColumn("MATT. " + int.Parse(ddlFiltruAn.SelectedValue) % 100,typeof(string))
        });

        for (int i = 1; i <= 12; i++)
        {
            dt.Columns.Add(CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i).Substring(0,3) + "-" + int.Parse(ddlFiltruAn.SelectedValue) % 100, typeof(string));
        }
            dt.Columns.Add("RESIDUO " + int.Parse(ddlFiltruAn.SelectedValue) % 100, typeof(string));

        var mattcol = dt.Columns["MATT. " + int.Parse(ddlFiltruAn.SelectedValue) % 100];
        var sitcol = dt.Columns["SIT. FINE " + lastY];
        var total = dt.Columns["RESIDUO " + int.Parse(ddlFiltruAn.SelectedValue) % 100];

        foreach (DataRow dtRow in dt.Rows)
        {
            string iDate = dtRow[3].ToString();
            //DateTime oDate = Convert.ToDateTime(iDate);
            DateTime oDate = DateTime.ParseExact(iDate, "dd/MM/yyyy", null);

            int lastMonth = Convert.ToInt32(sMonth);
            int vMonth = 0;

            if (oDate.Year == int.Parse(ddlFiltruAn.SelectedValue))
            {
                //if (oDate.Day > 1 && lastMonth >= oDate.Month) {
                //    dtRow[mattcol] = 0;
                //    vMonth = 0;
                //} else
                //{
                    dtRow[mattcol] = (lastMonth - oDate.Month) * 1.66;
                    vMonth = (int)((lastMonth - oDate.Month) * 1.66);
               // }

            } else if(oDate.Year==2020)
            {
                dtRow[mattcol] = (lastdayOfLastYear.Month - oDate.Month) * 1.66;
                vMonth = (int)((lastdayOfLastYear.Month - oDate.Month) * 1.66);
            }
                else
            {
                dtRow[mattcol] = 12 * 1.66;
                vMonth = (int)(12 * 1.66);
            }

            int SumTotal = 0;

            foreach (DataRow dtLRow in dtLastY.Rows)
            {
                if (dtRow.ItemArray.Contains(dtLRow.ItemArray[1]))
                {
                    dtRow[sitcol] = dtLRow[3].ToString();
                }
            }

            foreach (DataRow dtfRow in dtFerie.Rows) {
                
                if (dtRow.ItemArray.Contains(dtfRow.ItemArray[0]))
                {
                    SumTotal += Convert.ToInt32(dtfRow["Sum"]);

                    for (int i = 1; i < 13; i++)
                    {
                        int fmonth = Convert.ToInt32(dtfRow["Month"]);
                        var sum = dtfRow["Sum"].ToString().Substring(0,4);
                        if (i == fmonth) {
                            for (int n = 8; n < 20; n++)
                            {
                                switch (i)
                                {
                                    case 1:
                                        dtRow[8] = sum; 
                                        break;
                                    case 2:
                                        dtRow[9] = sum; 
                                        break;
                                    case 3:
                                        dtRow[10] = sum; 
                                        break;
                                    case 4:
                                        dtRow[11] = sum; 
                                        break;
                                    case 5:
                                        dtRow[12] = sum; 
                                        break;
                                    case 6:
                                        dtRow[13] = sum; 
                                        break;
                                    case 7:
                                        dtRow[14] = sum; 
                                        break;
                                    case 8:
                                        dtRow[15] = sum; 
                                        break;
                                    case 9:
                                        dtRow[16] = sum; 
                                        break;
                                    case 10:
                                        dtRow[17] = sum; 
                                        break;
                                    case 11:
                                        dtRow[18] = sum; 
                                        break;
                                    case 12:
                                        dtRow[19] = sum; 
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

            var vmatt = vMonth;
            int vsitt;
            try
            {
                vsitt = Convert.ToInt32(dtRow[sitcol]);
            }
            catch (Exception)
            {

                vsitt = 0;
            } 

            var vttot = vmatt + vsitt - SumTotal;
            dtRow[total] = vttot; //.ToString().Substring(0,4);
        }
        GridView.DataSource = dt;
        GridView.DataBind();
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[20].Text.Contains("-"))
            {
                e.Row.Cells[20].Attributes.Add("style", "color:red");
            }
        }
        else
        {
            //e.Row.Cells[20].Attributes.Add("style", "color: #922cd2;");
        }
    }

    protected void ddlFiltruAn_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        this.BindGrid();
    }
}