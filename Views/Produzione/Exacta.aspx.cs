using System;
using System.Data;

namespace Views.Produzione
{
    public partial class Exacta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dt = new DataTable();
            dt.Columns.Add("ID");
            var nRow = dt.NewRow();
            nRow[0] = "0";
            dt.Rows.Add(nRow);
            produzioneGrid.DataSource = dt;
            produzioneGrid.DataBind();
        }
    }
}