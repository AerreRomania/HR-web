using System;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class RaportEficiente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        //    {
        //        var data = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
        //        ddlOrdonare.Attributes.Add("onChange", "Lista();");
        //        ddlFiltru.Attributes.Add("onChange", "AfisareFiltru();");

        //        tbFiltruDeLa.Text = data.ToString("dd.MM.yyyy");
        //        data = data.AddMonths(1).AddDays(-1);
        //        tbFiltruPanaLa.Text = data.ToString("dd.MM.yyyy");
        //        tbFiltruDepartament.Text = Request.QueryString["Departament"];

        //        ListaAni();
        //        ListaLuni();
        //    }
        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");

        var data = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
        ddlOrdonare.Attributes.Add("onChange", "Lista();");
        ddlFiltru.Attributes.Add("onChange", "AfisareFiltru();");

        tbFiltruDeLa.Text = data.ToString("dd.MM.yyyy");
        data = data.AddMonths(1).AddDays(-1);
        tbFiltruPanaLa.Text = data.ToString("dd.MM.yyyy");
        tbFiltruDepartament.Text = Request.QueryString["Departament"];

        ListaAni();
        ListaLuni();
    }

    private void ListaAni()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        DateTime Inceput = dcWbmOlimpias.Angajatis.Min(x => x.DataAngajarii);
        DateTime Curent = DateTime.Now.AddYears(-1);
        string An;
        //while(Curent >= Inceput)
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
        ddlFiltruLuna.SelectedValue = DateTime.Now.Month.ToString();
        ddlFiltruLuna.Attributes.Add("onChange", "Lista();");
    }
}