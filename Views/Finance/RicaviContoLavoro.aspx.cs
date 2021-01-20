using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Finance_RicaviContoLavoro : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        helper.ExcelToJSON("D:/Finance_Files/invio.xlsx", "5.1", "B4", "R31", grdReport);

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (PasswordTextBox.Text == "Olimpias2k21")
        {
            MainDiv.Visible = true;
            LoginDiv.Visible = false;
        }
    }
}