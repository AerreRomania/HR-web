using System;
using System.Linq;
using System.Web.UI.WebControls;
public partial class RaportSuplimentareDepartament : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListaAni();
        ListaLuni();
        tbFiltruDepartament.Text = Request.QueryString["Departament"];
        //lbl_dep.Text = Request.QueryString["Departament"];
        lbl_dep.Text = Request.QueryString["Departament"];


        lRaportSuplimentareDepartament.Text = "Analisi straordinario " + Request.QueryString["Departament"];
        ListaEchipeLinii();
        ListOfMansione();

        //shade_generale.Attributes.Add("src", "./form-straordinario.aspx?Departament=" + Request.QueryString["Departament"] + "");

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
        for (int i = 1; i <= 12; i++)
            ddlFiltruLuna.Items.Add(new ListItem(GlobalClass.ConversieNumarInLuna(i), i.ToString()));
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
                    select new { t.Key.PostDeLucru };



        foreach (var rez in query)
        {
            ddlFiltruMansione.Items.Add(new ListItem(rez.PostDeLucru, rez.PostDeLucru));
        }
        ddlFiltruMansione.Attributes.Add("onChange", "Lista();");
    }
}