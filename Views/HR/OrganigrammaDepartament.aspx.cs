using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class OrganigrammaDepartamentNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_Data(Request.QueryString["Departament"]);
        //if (!IsPostBack)
        //{
        //    GridSortExpression sortExpr = new GridSortExpression();
        //    sortExpr.FieldName = "Continent";
        //    sortExpr.SortOrder = GridSortOrder.Ascending;
        //    //Add sort expression, which will sort against first column
        //    RadGrid1.MasterTableView.SortExpressions.AddSortExpression(sortExpr);
        //}
    }

    DataTable dt = new DataTable();
    DataTable dst;
    DataTable dstl;

    private void Load_Data(string Departament)
    {
        Int32 IdDepartament = 0;
        if (Departament == "STIRO")
        {
            IdDepartament = 1;
        }
        else if (Departament == "CONFEZIONE A")
        {
            IdDepartament = 2;
        }
        else if (Departament == "CONFEZIONE B")
        {
            IdDepartament = 14;
        }
        else if (Departament == "TESSITURA")
        {
            IdDepartament = 3;
        }
        else if (Departament == "AMMINISTRAZIONE")
        {
            IdDepartament = 5;
        }


        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT dbo.Angajati.ID AS [Id], dbo.Angajati.Prenume AS [Cognome], dbo.Angajati.Nume AS [Nome], CONVERT(VARCHAR(10), dbo.Angajati.DataAngajarii, 103) AS [Data Nascita],  dbo.PosturiDeLucru.PostDeLucru AS [Mansione],dbo.Linii.Linie AS [Linea], dbo.Angajati.Note FROM dbo.Angajati " +
                "INNER JOIN dbo.Departamente ON dbo.Angajati.IdDepartament = dbo.Departamente.Id " +
                "INNER JOIN dbo.Linii ON dbo.Angajati.IdLinie = dbo.Linii.Id " +
                "INNER JOIN dbo.PosturiDeLucru ON dbo.Angajati.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                "WHERE dbo.Angajati.IdDepartament='" + IdDepartament + "'", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        RadGrid1.DataSource = dt;
        RadGrid1.DataBind();
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>$('#shade').show();$('#tbl_grid').hide();</script>", false);
    }


    protected void cmbProductName_DataBinding_Mansione(object sender, EventArgs e)
    {
        dst = dt.Copy();
        dst.Columns.Remove("Cognome");
        dst.Columns.Remove("Nome");
        dst.Columns.Remove("Data Nascita");
        dst.Columns.Remove("Linea");
        dst.Columns.Remove("Note");

        RemoveDuplicateRows(dst, "Mansione");

        DataView view = dst.DefaultView;
        view.Sort = "Mansione ASC";
        DataTable sortedTable = view.ToTable();

        RadComboBox combo = sender as RadComboBox;
        combo.DataSource = sortedTable;
    }

    protected void cmbProductName_DataBinding_Linea(object sender, EventArgs e)
    {
        dstl = dt.Copy();
        dstl.Columns.Remove("Cognome");
        dstl.Columns.Remove("Nome");
        dstl.Columns.Remove("Data Nascita");
        dstl.Columns.Remove("Mansione");
        dstl.Columns.Remove("Note");

        RemoveDuplicateRows(dstl, "Linea");

        DataView view = dstl.DefaultView;
        view.Sort = "Linea ASC";
        DataTable sortedTable = view.ToTable();


        RadComboBox combo = sender as RadComboBox;
        combo.DataSource = sortedTable;
    }


    //REMOVE DUPLICATES
    public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    {
        Hashtable hTable = new Hashtable();
        ArrayList duplicateList = new ArrayList();

        foreach (DataRow drow in dTable.Rows)
        {
            if (hTable.Contains(drow[colName]))
                duplicateList.Add(drow);
            else
                hTable.Add(drow[colName], string.Empty);
        }

        foreach (DataRow dRow in duplicateList)
            dTable.Rows.Remove(dRow);
        return dTable;
    }

    protected void RadGrid1_PreRender(object sender, EventArgs e)
    {
        GridFilteringItem filterItem = RadGrid1.MasterTableView.GetItems(GridItemType.FilteringItem)[0] as GridFilteringItem;
        RadComboBox combo = filterItem["Mansione"].FindControl("cmbMansione") as RadComboBox;
        combo.Items.Add(new RadComboBoxItem("Text", "Value"));

        GridFilteringItem filterItem1 = RadGrid1.MasterTableView.GetItems(GridItemType.FilteringItem)[0] as GridFilteringItem;
        RadComboBox combo1 = filterItem1["Mansione"].FindControl("cmbLinea") as RadComboBox;
        combo1.Items.Add(new RadComboBoxItem("Text", "Value"));
    }
    protected void ComboLinea_DataBound(object sender, EventArgs e)
    {
        var combo = (RadComboBox)sender;
        combo.Items.Insert(0, new RadComboBoxItem("Select a Linea", "Select a Linea"));
    }
    protected void ComboMansione_DataBound(object sender, EventArgs e)
    {
        var combo = (RadComboBox)sender;
        combo.Items.Insert(0, new RadComboBoxItem("Select a Mansione", "Select a Mansione"));
    }


    protected void RadGrid1_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        //Default sort order Descending
    
            if (!e.Item.OwnerTableView.SortExpressions.ContainsExpression(e.SortExpression))
            {
                GridSortExpression sortExpr = new GridSortExpression();
                sortExpr.FieldName = e.SortExpression;
                sortExpr.SortOrder = GridSortOrder.Ascending;

                e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
            e.Item.OwnerTableView.Rebind();
                //RadGrid1.Rebind();
                //this.RadGrid1.MasterTableView.Rebind();

        }

    }

  

}