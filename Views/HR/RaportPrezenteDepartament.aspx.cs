using System;

public partial class RaportPrezenteDepartament : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //    if (Session["IdUtilizator"] != null)
        //    {
        //        if (!GlobalClass.VerificareAcces("Raport numar angajati", Session["IdUtilizator"].ToString()))
        //            Response.Redirect("AccesInterzis.aspx");
        //        else
        //        {
        tbFiltruData.Text = DateTime.Now.AddMonths(-1).ToString("dd/MM/yyyy");
        tbFiltruDepartament.Text = Request.QueryString["Departament"];
        //        }
        //    }
        //    else
        //        Response.Redirect("AccesInterzis.aspx");
        //}"
    }

}