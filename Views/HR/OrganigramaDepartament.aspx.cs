using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using Telerik.Web.UI;
public partial class OrganigrammaDepartamentNew : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Load_Data(Request.QueryString["Departament"]);
        link.Text = "./OrganigramaDepartamentTable.aspx?Departament="+ Request.QueryString["Departament"];
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

        lbl_Deparament_Name.Text = "Organigramma " + Departament;
        DataTable dtLastMonth = helper.PkSelect("SELECT [Month],[Year] FROM [LastLoadedData]", "WbmOlimpiasConnectionString");
        string year = dtLastMonth.Rows[0].ItemArray[1].ToString();
        string month = dtLastMonth.Rows[0].ItemArray[0].ToString();
        txt_loaded.Text = "Latest loaded data from: "+month+"/"+year+"";

        dt = helper.PkSelect("SELECT ROW_NUMBER() OVER (ORDER BY dbo.AngajatiMY.CodAngajat) AS [IDs] ,dbo.AngajatiMY.CodAngajat AS [Id], dbo.AngajatiMY.Prenume AS [Cognome], " +
                "dbo.AngajatiMY.Nume AS [Nome], dbo.AngajatiMY.DYear, dbo.AngajatiMY.DMonth, CONVERT(VARCHAR(10), dbo.AngajatiMY.DataAngajarii, 103) AS [Data Nascita],  dbo.PosturiDeLucru.PostDeLucru AS [Mansione],dbo.Linii.Linie AS [Linea], dbo.AngajatiMY.Note FROM dbo.AngajatiMY " +
                "INNER JOIN dbo.Departamente ON dbo.AngajatiMY.IdDepartament = dbo.Departamente.Id " +
                "INNER JOIN dbo.Linii ON dbo.AngajatiMY.IdLinie = dbo.Linii.Id " +
                "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiMY.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                "WHERE dbo.AngajatiMY.IdDepartament=" + IdDepartament + " and dbo.AngajatiMY.DataLichidarii = '0001-01-01'  and dbo.AngajatiMY.DYear = '" + year + "' and dbo.AngajatiMY.DMonth = '" + month + "'", "WbmOlimpiasConnectionString");

   

        RadGrid1.DataSource = dt;
        RadGrid1.MasterTableView.DataSource = dt;
        RadGrid1.DataBind();
        RadGrid1.MasterTableView.DataBind();
        
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script type='text/javascript' src='../../js/jquery-3.1.1.min.js'></script>", false);
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script type='text/javascript'>applySearch();</script>", false);
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>$('#shade').show();$('#tbl_grid').hide();$('#tOrganigramaDepartament td').wrapInner('<span></span>');</script>", false);
    }
    
    protected void btnExcel(object sender, EventArgs e)
    {
        RadGrid1.MasterTableView.ExportToExcel();
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
            if (!e.Item.OwnerTableView.SortExpressions.ContainsExpression(e.SortExpression))
            {
                GridSortExpression sortExpr = new GridSortExpression();
                sortExpr.FieldName = e.SortExpression;
                sortExpr.SortOrder = GridSortOrder.Ascending;

                e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                e.Item.OwnerTableView.Rebind();
            }
    }
}