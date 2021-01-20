using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_fase : System.Web.UI.Page
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


        string query = "SELECT ROW_NUMBER() OVER(ORDER BY CodOperatie ASC)  AS [N°], CodOperatie as [Codice Fase],Operatie as Fase," +
            "Descrizione FROM Operatii WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        //Optional for query = ,CostoFase,PrezzoFase
        dt = helper.PkSelect(query, "NOYConnectionString");
        fase_grid.DataSource = dt;
        fase_grid.DataBind();
        fase_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
}