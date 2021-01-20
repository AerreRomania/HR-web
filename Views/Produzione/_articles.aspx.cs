using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_articles :  System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string departament = Request.QueryString["Departament"];
        if (departament.Contains("1"))
        {
            txt_dep.Text = "Confezione";
        }
        else if (departament.Contains("2"))
        {
            txt_dep.Text = "Stiro";
        }
        else if (departament.Contains("7"))
        {
            txt_dep.Text = "Tessitura";
        }
        else if (departament.Contains("8"))
        {
            txt_dep.Text = "Sartoria";
        }

        string query = "SELECT ROW_NUMBER() OVER(ORDER BY Articol ASC) AS [N°], Articol as Articolo,Descriere as Descrizione, '" + txt_dep.Text + "' as Fase, " +
            "Centes as [Capi/Maccina], '' as [Centesimi],Prezzo,CostProductie as [Cost.Productie]," +
            "Note as Note FROM Articole WHERE IdSector = '" + Request.QueryString["Departament"] + "' AND IsDeleted = '0'";
        dt = helper.PkSelect(query, "NOYConnectionString");


        article_grid.DataSource = dt;
        article_grid.DataBind();
        article_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
}