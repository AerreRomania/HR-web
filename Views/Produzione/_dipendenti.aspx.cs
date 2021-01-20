using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Views_Produzione_dipendenti : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string departament = Request.QueryString["Departament"];
        string query = "";
        if (departament.Contains("1"))
        {
            txt_dep.Text = "Confezione";
            query = "SELECT ROW_NUMBER() OVER(ORDER BY CodAngajat ASC) AS [N°], " +
          "CodAngajat as [Codice Operatore],Angajat as Operatore," +
          "CONVERT(varchar, [DataAngajarii], 103) as [Data Assunzione]," +
          "CONVERT(varchar, [DataNasterii], 103) as [Data Nascita],Adresa as [Indirizzo-Citta],Linie as Linea,Telefon as Telefono,Sex FROM Angajati WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        }
        else if (departament.Contains("2"))
        {
            txt_dep.Text = "Stiro";
            query = "SELECT ROW_NUMBER() OVER(ORDER BY CodAngajat ASC) AS [N°], " +
          "CodAngajat as [Codice Operatore],Angajat as Operatore," +
          "CONVERT(varchar, [DataAngajarii], 103) as [Data Assunzione]," +
          "CONVERT(varchar, [DataNasterii], 103) as [Data Nascita],Adresa as [Indirizzo-Citta],Linie as Linea,Telefon as Telefono,Sex FROM Angajati WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        }
        else if (departament.Contains("7"))
        {
            txt_dep.Text = "Tessitura";
            query = "SELECT ROW_NUMBER() OVER(ORDER BY CodAngajat ASC) AS [N°], " +
            "CodAngajat as [Codice Operatore],Angajat as Operatore," +
            "CONVERT(varchar, [DataAngajarii], 103) as [Data Assunzione]," +
            "CONVERT(varchar, [DataNasterii], 103) as [Data Nascita],Adresa as [Indirizzo-Citta],Linie as Linea,Telefon as Telefono,Sex, Mansione FROM Angajati WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        }
        else if (departament.Contains("8"))
        {
            txt_dep.Text = "Sartoria";
            query = "SELECT ROW_NUMBER() OVER(ORDER BY CodAngajat ASC) AS [N°], " +
          "CodAngajat as [Codice Operatore],Angajat as Operatore," +
          "CONVERT(varchar, [DataAngajarii], 103) as [Data Assunzione]," +
          "CONVERT(varchar, [DataNasterii], 103) as [Data Nascita],Adresa as [Indirizzo-Citta],Linie as Linea,Telefon as Telefono,Sex FROM Angajati WHERE IdSector = '" + Request.QueryString["Departament"] + "'";

        }


        dt = helper.PkSelect(query, "NOYConnectionString");
        dipendenti_grid.DataSource = dt;
        dipendenti_grid.DataBind();
        dipendenti_grid.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
}