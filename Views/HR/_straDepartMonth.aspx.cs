using OfficeOpenXml.FormulaParsing.Excel.Functions.DateTime;
using OfficeOpenXml.FormulaParsing.Excel.Functions.RefAndLookup;
using Org.BouncyCastle.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_straDepartMonth : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }

    private void LoadData()
    {
        string request = Request.QueryString["Departament"];
        DataTable _lastestDataInDB = helper.PkSelect("SELECT MONTH(Prezente.Data), YEAR(Prezente.Data) FROM Prezente " +
            "WHERE Prezente.Id = (SELECT MAX(Prezente.Id) FROM prezente); ", "WbmOlimpiasConnectionString");
        DataTable _days = GetDates();
        DataTable _data = new DataTable();
        DataTable _linie = new DataTable();

        if (!Page.IsPostBack)
        {
            ddp_year.SelectedValue = _lastestDataInDB.Rows[0].ItemArray[1].ToString();
            ddp_month.SelectedValue = _lastestDataInDB.Rows[0].ItemArray[0].ToString();
            ddp_linie.Items.Add("All");
            ddp_mansione.Items.Add("All");
        }

        if (ddp_linie.SelectedValue.Equals("All") && ddp_mansione.SelectedValue.Equals("All"))
        {
            _data = helper.PkSelect("SELECT DISTINCT [R-Code], [Dipendente], [Mansione], [Linea]  FROM [_straDeptMonth]" +
           " WHERE Departament='" + request + "' and Month=" + ddp_month.SelectedValue + " and Year=" + ddp_year.SelectedValue + "", "WbmOlimpiasConnectionString");
        }
        else if (!ddp_linie.SelectedValue.Contains("All") && !ddp_mansione.SelectedValue.Contains("All"))
        {
            _data = helper.PkSelect("SELECT DISTINCT [R-Code], [Dipendente], [Mansione], [Linea]  FROM [_straDeptMonth]" +
            " WHERE Departament='" + request + "' and Month=" + ddp_month.SelectedValue + " and Year=" + ddp_year.SelectedValue + "" +
            " and Linea='" + ddp_linie.SelectedValue + "' and Mansione = '" + ddp_mansione.SelectedValue + "'", "WbmOlimpiasConnectionString");
        }
        else if (!ddp_linie.SelectedValue.Contains("All") && ddp_mansione.SelectedValue.Contains("All"))
        {
            _data = helper.PkSelect("SELECT DISTINCT [R-Code], [Dipendente], [Mansione], [Linea]  FROM [_straDeptMonth]" +
                " WHERE Departament='" + request + "' and Month=" + ddp_month.SelectedValue + " and Year=" + ddp_year.SelectedValue + "" +
                " and Linea='" + ddp_linie.SelectedValue + "'", "WbmOlimpiasConnectionString");
        }
        else if (ddp_linie.SelectedValue.Contains("All") && !ddp_mansione.SelectedValue.Contains("All"))
        {
            _data = helper.PkSelect("SELECT DISTINCT [R-Code], [Dipendente], [Mansione], [Linea]  FROM [_straDeptMonth]" +
            " WHERE Departament='" + request + "' and Month=" + ddp_month.SelectedValue + " and Year=" + ddp_year.SelectedValue + "" +
            " and Mansione='" + ddp_mansione.SelectedValue + "'", "WbmOlimpiasConnectionString");
        }

        DataTable _ore = helper.PkSelect("SELECT [R-Code], [Day], [Ore]  FROM [_straDeptMonth] WHERE Departament='" + request + "' and Month=" + ddp_month.SelectedValue + " and Year=" + ddp_year.SelectedValue + "", "WbmOlimpiasConnectionString");
        if (!Page.IsPostBack)
        {
            _linie = _data.Copy();
            _linie.Columns.Remove("R-Code");
            _linie.Columns.Remove("Dipendente");
            _linie.Columns.Remove("Mansione");

            DataTable distinctTable = _linie.DefaultView.ToTable( /*distinct*/ true);

            foreach (DataRow row in distinctTable.Rows)
            {
                ddp_linie.Items.Add(row.ItemArray[0].ToString());
            }

            DataTable _mansione = _data.Copy();
            _mansione.Columns.Remove("R-Code");
            _mansione.Columns.Remove("Dipendente");
            _mansione.Columns.Remove("Linea");
            DataTable distMansione = _mansione.DefaultView.ToTable( /*distinct*/ true);
            foreach (DataRow row in distMansione.Rows)
            {
                ddp_mansione.Items.Add(row.ItemArray[0].ToString());
            }
        }

        for (int i = 1; i <= _days.Rows.Count; i++)
        {
            _data.Columns.Add(i.ToString(), typeof(string));
        }

        _data.Columns.Add("Media", typeof(string));
       

        foreach (DataRow dtRow in _data.Rows)
        {
            int SumTotal = 0;
            foreach (DataRow dtfRow in _ore.Rows)
            {
                if (dtRow[0].Equals(dtfRow[0]))
                {
                    SumTotal += Convert.ToInt32(dtfRow["Ore"]);

                    for (int i = 1; i <= _days.Rows.Count; i++)
                    {
                        int day = Convert.ToInt32(dtfRow[1]);
                        int sum = Convert.ToInt32(dtfRow[2]);
                        if (i == day)
                        {
                            for (int n = 4; n <= _days.Rows.Count + 4; n++)
                            {
                                switch (i)
                                {
                                    case 1:
                                        dtRow[4] = sum;
                                        break;
                                    case 2:
                                        dtRow[5] = sum;
                                        break;
                                    case 3:
                                        dtRow[6] = sum;
                                        break;
                                    case 4:
                                        dtRow[7] = sum;
                                        break;
                                    case 5:
                                        dtRow[8] = sum;
                                        break;
                                    case 6:
                                        dtRow[9] = sum;
                                        break;
                                    case 7:
                                        dtRow[10] = sum;
                                        break;
                                    case 8:
                                        dtRow[11] = sum;
                                        break;
                                    case 9:
                                        dtRow[12] = sum;
                                        break;
                                    case 10:
                                        dtRow[13] = sum;
                                        break;
                                    case 11:
                                        dtRow[14] = sum;
                                        break;
                                    case 12:
                                        dtRow[15] = sum;
                                        break;
                                    case 13:
                                        dtRow[16] = sum;
                                        break;
                                    case 14:
                                        dtRow[17] = sum;
                                        break;
                                    case 15:
                                        dtRow[18] = sum;
                                        break;
                                    case 16:
                                        dtRow[19] = sum;
                                        break;
                                    case 17:
                                        dtRow[20] = sum;
                                        break;
                                    case 18:
                                        dtRow[21] = sum;
                                        break;
                                    case 19:
                                        dtRow[22] = sum;
                                        break;
                                    case 20:
                                        dtRow[23] = sum;
                                        break;
                                    case 21:
                                        dtRow[24] = sum;
                                        break;
                                    case 22:
                                        dtRow[25] = sum;
                                        break;
                                    case 23:
                                        dtRow[26] = sum;
                                        break;
                                    case 24:
                                        dtRow[27] = sum;
                                        break;
                                    case 25:
                                        dtRow[28] = sum;
                                        break;
                                    case 26:
                                        dtRow[29] = sum;
                                        break;
                                    case 27:
                                        dtRow[30] = sum;
                                        break;
                                    case 28:
                                        dtRow[31] = sum;
                                        break;
                                    case 29:
                                        dtRow[32] = sum;
                                        break;
                                    case 30:
                                        dtRow[33] = sum;
                                        break;
                                    case 31:
                                        dtRow[34] = sum;
                                        break;
                                    default:
                                        Console.WriteLine("Default case");
                                        break;
                                }
                            }
                        }
                    }
                    dtRow["Media"] = SumTotal;

                }
            }
        }

        GridView.DataSource = _data;
        GridView.DataBind();
    }

    public DataTable GetDates()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Day", typeof(Int16));

        int year = Convert.ToInt32(ddp_year.SelectedItem.Value);
        int month = Convert.ToInt32(ddp_month.SelectedItem.Value);

        int daysInMonth = DateTime.DaysInMonth(year, month);
        for (int i = 0; i < daysInMonth; i++)
        {
            DataRow dr = dt.NewRow();
            dr["Day"] = i + 1;
            dt.Rows.Add(dr);
        }
        return dt;
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ////if (e.Row.RowType == DataControlRowType.DataRow)
        ////{
        ////    if (e.Row.Cells[20].Text.Contains("-"))
        ////    {
        ////        e.Row.Cells[20].Attributes.Add("style", "color:red");
        ////    }
        ////}
        ////else
        ////{
        ////    //e.Row.Cells[20].Attributes.Add("style", "color: #922cd2;");
        ////}
    }

    protected void ddp_month_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();

    }
}