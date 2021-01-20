using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_clients : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string departament = Request.QueryString["Departament"];
        //if (departament.Contains("1"))
        //{
        //    txt_dep.Text = "Confezione";
        //}
        //else if (departament.Contains("2"))
        //{
        //    txt_dep.Text = "Stiro";
        //}
        //else if (departament.Contains("7"))
        //{
        //    txt_dep.Text = "Tessitura";
        //}
        //else if (departament.Contains("8"))
        //{
        //    txt_dep.Text = "Sartoria";
        //}


        string query = "SELECT ROW_NUMBER() OVER(ORDER BY Client ASC)  AS [N°], Client,Adresa,Tara,Provincia,CAP,CodiceFiscale as [Cod.Fiscale],PartitaIva as [Partita Iva],Telefon,Email,Persona FROM Clienti";

        dt = helper.PkSelect(query, "NOYConnectionString");
        clients_grid.DataSource = dt;
        clients_grid.DataBind();
        clients_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
}