using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RaportAbsenteAn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUtilizator"] != null)
        {
            //    if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
            //        Response.Redirect("AccesInterzis.aspx");
            //    else
            //    {
            //        ListaAni();
            //        tbFiltruDepartament.Text = Request.QueryString["Departament"];
            //    }
            //}
            //else
            //    Response.Redirect("AccesInterzis.aspx");
        }
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
}