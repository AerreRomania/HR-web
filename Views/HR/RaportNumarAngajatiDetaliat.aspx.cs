using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RaportNumarAngajatiDetaliat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        ddlFiltruMansione.Items.Insert(0, new ListItem("ALL", "ALL"));

        ListaAni();

    }

    private void ListaAni()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        DateTime Inceput = dcWbmOlimpias.Angajatis.Min(x => x.DataAngajarii);
        //OVO OTKOMENTARISATI
        //DateTime Curent = DateTime.Now.AddYears(1);

        //OVO OBRISATI
        DateTime Curent = DateTime.Now.AddYears(-1);
        string An;

        //OVO OTKOMENTARISATI
        //while(Curent >= Inceput)
        //{
        //    //Curent = Curent.AddYears(-1);

        //    //An = Curent.Year.ToString();
        //    //ddlFiltruAn.Items.Add(new ListItem(An, An));
        //}

        An = Curent.Year.ToString();
        ddlFiltruAn.Items.Add(new ListItem(An, An));

        ddlFiltruAn.Attributes.Add("onChange", "Lista();");
        ddlFiltruDep.Attributes.Add("onChange", "Lista();");
        ddlFiltruMansione.Attributes.Add("onChange", "Lista();");
    }
}