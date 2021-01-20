using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_commesse :  System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string departament = Request.QueryString["Departament"];
        if (departament.Contains("1"))
        {
            txt_dep.Text = "Confezione";
        } else if (departament.Contains("2"))
        {
            txt_dep.Text = "Stiro";
        } else if (departament.Contains("7"))
        {
            txt_dep.Text = "Tessitura";
        } else if (departament.Contains("8"))
        {
            txt_dep.Text = "Sartoria";
        }

        string query = "SELECT ROW_NUMBER() OVER(ORDER BY NrComanda ASC)  AS [N°], NrComanda as Commessa,Cantitate as [Tot.Comm.]," +
            "CONVERT(varchar, [DataLansare], 103) as [Data Arr.]," +
            "CONVERT(varchar, [DataProduzione], 103) as [Data Inizio]," +
            "CONVERT(varchar, [DataFine], 103) as [Data Fine]," +
            "CONVERT(varchar, [DataLivrare], 103) as [Data Cons.], " +
            "CONVERT(varchar, [RDD], 103) as [RDD],CONVERT(varchar, [DVC], 103) as [DVC] , Note FROM Comenzi WHERE IdSector = '" + Request.QueryString["Departament"] + "' AND IsDeleted = '0'";
        dt = helper.PkSelect(query, "NOYConnectionString");


        commesse_grid.DataSource = dt;
        commesse_grid.DataBind();
        commesse_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        dt.DefaultView.Sort = e.SortExpression + " " + getSortDirectionString();
        commesse_grid.DataSource = dt;
        commesse_grid.DataBind();
    }

    private string getSortDirectionString()
    {
        if (ViewState["sortDirection"] == null)
        {
            ViewState["sortDirection"] = "ASC";
        }
        else
        {
            if (ViewState["sortDirection"].ToString() == "ASC")
            {
                ViewState["sortDirection"] = "DESC";
                return ViewState["sortDirection"].ToString();
            }
            if (ViewState["sortDirection"].ToString() == "DESC")
            {
                ViewState["sortDirection"] = "ASC";
                return ViewState["sortDirection"].ToString();
            }
        }
        return ViewState["sortDirection"].ToString();
    }
}