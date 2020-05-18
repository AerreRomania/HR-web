using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogInSuccess : System.Web.UI.Page
{
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // clear all sessions again and proceed to log in page

        Session["user"] = null;
        Response.Redirect("LogIn.aspx");
    }
}