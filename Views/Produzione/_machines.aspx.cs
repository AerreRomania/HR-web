using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_machines : System.Web.UI.Page
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


        string query = "SELECT CodMasina as [Codice Macchina],Descriere as Macchina,Description as Finezza,Linie as Linea, Matricola, " +
            "CONVERT(varchar, [DataAcquisto], 103) as [Data Acquisto],Position as Squadra FROM Masini WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        dt = helper.PkSelect(query, "NOYConnectionString");
        machines_grid.DataSource = dt;
        machines_grid.DataBind();
        machines_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
}