using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RaportAbsenteDepartament : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ListaAni();
        ListaLuni();
        tbFiltruDepartament.Text = Request.QueryString["Departament"];
        lRaportAbsenteDepartament.Text = "Analisi assenze " + Request.QueryString["Departament"];
        ListaEchipeLinii();
        ListOfMansione();
    }

    private void ListaAni()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        DateTime Inceput = dcWbmOlimpias.Angajatis.Min(x => x.DataAngajarii);
        DateTime Curent = DateTime.Now.AddYears(-1);
        string An;
        //while (Curent >= Inceput)
        //{
        //    Curent = Curent.AddYears(-1);
        //    An = Curent.Year.ToString();
        //    ddlFiltruAn.Items.Add(new ListItem(An, An));
        //}

        An = Curent.Year.ToString();
        ddlFiltruAn.Items.Add(new ListItem(An, An));
        ddlFiltruAn.Attributes.Add("onChange", "Lista();");
    }
    private void ListaLuni()
    {
        ddlFiltruLuna.Items.Add(new ListItem("Gennaio", "1"));
        ddlFiltruLuna.Items.Add(new ListItem("Febbraio", "2"));
        ddlFiltruLuna.Items.Add(new ListItem("Marzo", "3"));
        ddlFiltruLuna.Items.Add(new ListItem("Aprile", "4"));
        ddlFiltruLuna.Items.Add(new ListItem("Maggio", "5"));
        ddlFiltruLuna.Items.Add(new ListItem("Giugno", "6"));
        ddlFiltruLuna.Items.Add(new ListItem("Luglio", "7"));
        ddlFiltruLuna.Items.Add(new ListItem("Agosto", "8"));
        ddlFiltruLuna.Items.Add(new ListItem("Settembre", "9"));
        ddlFiltruLuna.Items.Add(new ListItem("Ottobre", "10"));
        ddlFiltruLuna.Items.Add(new ListItem("Novembre", "11"));
        ddlFiltruLuna.Items.Add(new ListItem("Dicembre", "12"));
        ddlFiltruLuna.SelectedValue = (DateTime.Now.Month).ToString();
        ddlFiltruLuna.Attributes.Add("onChange", "Lista();");
    }
    private void ListaEchipeLinii()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        var query = from tAngajati in dcWbmOlimpias.AngajatiViews
                    where !tAngajati.IdEchipa.Equals(null) && tAngajati.Departament.Equals(tbFiltruDepartament.Text) || !tAngajati.IdLinie.Equals(null) && tAngajati.Departament.Equals(tbFiltruDepartament.Text)
                    group tAngajati by new { tAngajati.Echipa, tAngajati.Linie } into t
                    select new { t.Key.Echipa, t.Key.Linie };



        foreach (var rez in query)
        {
            ddlFiltruEchipaLinie.Items.Add(new ListItem(rez.Linie, rez.Linie));
        }
        ddlFiltruEchipaLinie.Attributes.Add("onChange", "Lista();");
    }

    private void ListOfMansione()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        var query = from tAngajati in dcWbmOlimpias.AngajatiViews
                    where tAngajati.Departament.Equals(tbFiltruDepartament.Text)
                    group tAngajati by new { tAngajati.PostDeLucru } into t
                    select new { t.Key.PostDeLucru};



        foreach (var rez in query)
        {
            ddlFiltruMansione.Items.Add(new ListItem(rez.PostDeLucru, rez.PostDeLucru));
        }
        ddlFiltruMansione.Attributes.Add("onChange", "Lista();");
    }
}