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

public partial class RaportAbsenteLuna : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        //    {
        ListaAni();
        ListaLuni();
        tbFiltruDepartament.Text = Request.QueryString["Departament"];
        //    }
        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");
    }

    private void ListaAni()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        DateTime Inceput = dcWbmOlimpias.Angajatis.Min(x => x.DataAngajarii);
        DateTime Curent = DateTime.Now.AddYears(1);
        string An;
        while(Curent >= Inceput)
        {
            Curent = Curent.AddYears(-1);
            An = Curent.Year.ToString();
            ddlFiltruAn.Items.Add(new ListItem(An, An));
        }
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
        ddlFiltruLuna.SelectedValue = DateTime.Now.Month.ToString();
        ddlFiltruLuna.Attributes.Add("onChange", "Lista();");
    }
}