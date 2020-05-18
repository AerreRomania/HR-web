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
using System.Data.SqlClient;
using System.Data;

public partial class RaportNumarAngajati : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else

        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");
        ListaAni();
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

        //lblyear.Text = "Anno: " + ddlFiltruAn.SelectedValue.ToString();

    }

}