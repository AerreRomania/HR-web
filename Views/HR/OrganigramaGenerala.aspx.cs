using System;
using System.Linq;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using Telerik.Web.UI;
using System.Web.Configuration;

public partial class OrganigramaGenerala : System.Web.UI.Page
{
    _MainClass helper = new _MainClass();
    int month;
    int year;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable LastMonth = helper.PkSelect("SELECT * FROM [LastLoadedData]", "WbmOlimpiasConnectionString");
        string sMonth = LastMonth.Rows[0].ItemArray[0].ToString();
        string lastY = LastMonth.Rows[0].ItemArray[1].ToString();

        month = Convert.ToInt32(sMonth);
        year = Convert.ToInt32(lastY);

        lbl_LastDate.InnerText = "Loaded data from: " + sMonth + "/" + lastY;
        PreparaOrganigrama();

        if (Page.IsPostBack)
        {
            load_grid_Click(sender, e);

          
        }
    }

    

    private void PreparaOrganigrama()
    {
        tOrganigrama.Rows.Clear();
        tOrganigrama.CellPadding = 0;
        tOrganigrama.CellSpacing = 0;
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        int NumarColoane = dcWbmOlimpias.Departamentes.Count();
        TableRow tr = new TableRow();

        TableCell tc = new TableCell();
        tc.ColumnSpan = Convert.ToInt32((NumarColoane / 3) * 2.5);
        tc.Text = "";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.ColumnSpan = 5;


        int dt_total_generale = 0;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) from EsteAngajatUnionDefault WHERE Luna='" + month + "' and An='"+year+"'", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    conn.Open();
                    dt_total_generale = (int)cmd.ExecuteScalar();
                    conn.Close();
                }
            }
        }

        tc.Controls.Add(PreparaDetaliu("GENERALE", dt_total_generale.ToString(), "#D99694"));
        tr.Cells.Add(tc);

        //tc = new TableCell();
        ////tc.ColumnSpan = (NumarColoane / 3) * 2;
        //tc.Text = "";
        //tr.Cells.Add(tc);

        tOrganigrama.Rows.Add(tr);

        // linia de sub GENERALE
        tr = new TableRow();
        tc = new TableCell();
        tc.Style.Add("height", "20px");
        tc.ColumnSpan = (NumarColoane / 2) * 2 ;
        tc.Text = "";
        tr.Cells.Add(tc);

        tc = new TableCell();
        tc.Style.Add("border-left", "1px solid black");
        tc.ColumnSpan = (NumarColoane - NumarColoane / 2 - 1) * 2;
        tc.Text = "";
        tr.Cells.Add(tc);

        tOrganigrama.Rows.Add(tr);

        // liniile catre departamente
        tr = new TableRow();
        for (int i = 1; i <= NumarColoane; i++)
        {
            tc = new TableCell();
            tc.Style.Add("height", "20px");
            if (i > 1)
                tc.Style.Add("border-top", "1px solid black");
            tc.Text = "";
            tr.Cells.Add(tc);

            tc = new TableCell();
            if (i < NumarColoane)
                tc.Style.Add("border-top", "1px solid black");
            tc.Style.Add("border-left", "1px solid black");
            tc.Text = "";
            tr.Cells.Add(tc);
        }
        tOrganigrama.Rows.Add(tr);

        string previousMonth = DateTime.Now.AddMonths(-1).ToString("MMMM");
        //int month = DateTime.ParseExact(previousMonth, "MMMM", CultureInfo.CurrentCulture).Month;
        //int year = Convert.ToInt32(DateTime.Now.Year);



        //var vDepartamente = dcWbmOlimpias.Angajatis
        //    .Join(dcWbmOlimpias.Departamentes, tAngajati => tAngajati.IdDepartament, tDepartamente => tDepartamente.Id,
        //        (tAngajati, tDepartamente) => new {tAngajati, tDepartamente})
        //    .Where(@t1 => t1.tAngajati.DYear.Equals(year) && t1.tAngajati.DMonth.Equals(month))
        //    .GroupBy(@t1 => new { @t1.tDepartamente.SortHelper, @t1.tDepartamente.Id, @t1.tDepartamente.Departament}, @t1 => @t1.tDepartamente)
        //    .Select(t => new {t.Key.SortHelper, t.Key.Id, t.Key.Departament, NumarAngajati = t.Count()})
        //    .OrderBy(t => t.SortHelper);

        DataTable vDepartamente = new DataTable();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT SortHelper, Departament, COUNT(*) from EsteAngajatUnionDefault WHERE Luna='" + month + "' and An='" + year + "' GROUP BY SortHelper, Departament ORDER BY SortHelper", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(vDepartamente);
                }
            }
        }

        tr = new TableRow();
        int r = 0x79, g = 0x96, b = 0x94;
        foreach (DataRow vDepartament in vDepartamente.Rows)
        {
            tc = new TableCell();
            tc.ColumnSpan = 2;
            b = b + 8;
            g = g + 2;
            r = r + 1;
            if (b > 255)
            {
                b = b - 255;
                g++;
            }
            if (g > 255)
            {
                g = 0;
                r = r + 1;
            }
            tc.Controls.Add(PreparaDetaliu(vDepartament[1].ToString(), vDepartament[2].ToString(), "#4db9d3"));
            //tc.Controls.Add.ClientID(vDepartament.Departament);
            tr.Cells.Add(tc);
        }
        tOrganigrama.Rows.Add(tr);


        //// afisare linii/echipe si altele
        tr = new TableRow();
        foreach (DataRow vDepartament in vDepartamente.Rows)
        {
            tc = new TableCell();
            tc.VerticalAlign = VerticalAlign.Top;
            tc.HorizontalAlign = HorizontalAlign.Center;
            tc.ColumnSpan = 2;
            tr.Cells.Add(tc);

            DataTable vEchipeLinii = new DataTable();
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Linie, COUNT(Linie) from EsteAngajatUnionDefault WHERE Luna='"+month+"' and An='"+year+"' and Departament='" + vDepartament[1] + "' Group by Linie", conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(vEchipeLinii);
                    }
                }
            }

            //var vEchipeLinii = from tAngajati in dcWbmOlimpias.Angajatis
            //                   where tAngajati.IdDepartament.Equals(vDepartament.Id) 
            //                   group tAngajati by new { tAngajati.Linie  } into t
            //                   select new { t.Key.Linie,   NumarAngajati = t.Count() };
            HtmlTable ht = new HtmlTable();
            ht.Width = "140px";/*140**/

            HtmlTableRow htr = new HtmlTableRow();
            HtmlTableCell htc = new HtmlTableCell();
            htc.Height = "20px";
            htc.ColSpan = 3;
            htc.Style.Add("border-left", "1px solid black");
            htr.Cells.Add(htc);
            ht.Rows.Add(htr);

            int i = 0;
            foreach (DataRow vEchipaLinie in vEchipeLinii.Rows)
            {
                i++;
                htr = new HtmlTableRow();

                htc = new HtmlTableCell();
                htc.Height = "15px";
                htc.Width = "10px";
                htc.Style.Add("border-left", "1px solid black");
                htc.Style.Add("border-bottom", "1px solid black");

                htr.Cells.Add(htc);

                htc = new HtmlTableCell();
                htc.RowSpan = 2;
                htc.Style.Add("border", "1px solid black");
                if (!String.IsNullOrEmpty(vEchipaLinie[0].ToString()))
                    htc.InnerText = vEchipaLinie[0].ToString();
          
                else
                    htc.InnerText = "ADDETTI";
                htr.Cells.Add(htc);

                htc = new HtmlTableCell();
                htc.RowSpan = 2;
                htc.Attributes.Add("style", "background-color:lightgray;text-align:center;");

                htc.Style.Add("border-top", "1px solid black");
                htc.Style.Add("border-right", "1px solid black");
                htc.Style.Add("border-bottom", "1px solid black");
                htc.InnerText = vEchipaLinie[1].ToString();
                htr.Cells.Add(htc);

                ht.Rows.Add(htr);

                htr = new HtmlTableRow();

                htc = new HtmlTableCell();
                if (i < vEchipeLinii.Rows.Count)
                    htc.Style.Add("border-left", "1px solid black");
                htc.Height = "15px";
                htr.Cells.Add(htc);

                ht.Rows.Add(htr);
            }
            tc.Controls.Add(ht);
        }
        tOrganigrama.Rows.Add(tr);
    }
    private HtmlTable PreparaDetaliu(string Valoare, string Numar, string Culoare)
    {
        var ht = new HtmlTable();
        ht.Width = "180px";

        var htr = new HtmlTableRow();

        var htc = new HtmlTableCell();
        htc.Style.Add("border", "1px solid black");
        htc.Style.Add("background-color", Culoare);
        htc.Style.Add("color", "#FFFFFF");
        htc.Style.Add("font-weight", "bold");
        htc.Style.Add("height", "40px");
        htc.Style.Add("width", "110px");
        htc.Style.Add("cursor", "pointer");
        htc.Align = "center";
        htc.InnerText = Valoare;

        if (Valoare == "CONFEZIONE A")
        {
            Valoare = "CONFEZIONEA";
        }

        if (Valoare == "CONFEZIONE B")
        {
            Valoare = "CONFEZIONEB";
        }


        htc.Attributes.Add("class", Valoare.Trim());
        htr.Cells.Add(htc);
        htr.Attributes.Add("class", Valoare.Trim() + "Class");
        //MALI Delic na midu
        htc = new HtmlTableCell();
        htc.Style.Add("border-top", "1px solid black");
        htc.Style.Add("border-bottom", "1px solid black");
        htc.Style.Add("border-right", "1px solid black");
        htc.Style.Add("width", "40px");
        htc.Style.Add("background-color", "gray");
        htc.Style.Add("color", "#FFFFFF");
        htc.Style.Add("font-weight", "bold");
        htc.Style.Add("cursor", "pointer");
        htc.Align = "center";

        if (Valoare == "CONFEZIONE A")
        {
            Valoare = "CONFEZIONEA";
        }

        if (Valoare == "CONFEZIONE B")
        {
            Valoare = "CONFEZIONEB";
        }

        htc.Attributes.Add("class", Valoare.Trim());
        htc.InnerText = Numar;
        htr.Cells.Add(htc);

        htc = new HtmlTableCell();
        htc.InnerText = " ";
        htr.Cells.Add(htc);
        ht.Attributes.Add("class", Valoare.Trim() + "Class");
        ht.Rows.Add(htr);

        return ht;
    }

    DataTable dt = new DataTable();

    protected void load_grid_Click(object sender, EventArgs e)
    {
        string strLabelVal = lbl_selected_dep.Value;

        dt.Clear();

        if (strLabelVal == "1")
        {
            lbl_Deparament_Name.Text = "Organigramma Stiro";

        }
        else if (strLabelVal == "2")
        {
            lbl_Deparament_Name.Text = "Organigramma Confezione A";
        }
        else if (strLabelVal == "14")
        {
            lbl_Deparament_Name.Text = "Organigramma Confezione B";
        }
        else if (strLabelVal == "3")
        {
            lbl_Deparament_Name.Text = "Organigramma Tessitura";

        }
        else if (strLabelVal == "5")
        {
            lbl_Deparament_Name.Text = "Organigramma Amministrazione";

        }

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY dbo.AngajatiViewLastMonth.CodAngajat) AS [IDs] ,dbo.AngajatiViewLastMonth.CodAngajat AS [Id], dbo.AngajatiViewLastMonth.Prenume AS [Cognome], dbo.AngajatiViewLastMonth.Nume AS [Nome], CONVERT(VARCHAR(10), dbo.AngajatiViewLastMonth.DataAngajarii, 103) AS [Data Nascita], dbo.AngajatiViewLastMonth.DYear,dbo.AngajatiViewLastMonth.DMonth, dbo.PosturiDeLucru.PostDeLucru AS [Mansione],dbo.Linii.Linie AS [Linea], dbo.AngajatiViewLastMonth.Note FROM dbo.AngajatiViewLastMonth INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id WHERE dbo.AngajatiViewLastMonth.IdDepartament='" + strLabelVal + "'", conn))
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

    DataTable dst;
    DataTable dstl;
    protected void cmbProductName_DataBinding_Mansione(object sender, EventArgs e)
    {
        try
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
        catch (Exception)
        {

            
        }
      
    }

    protected void cmbProductName_DataBinding_Linea(object sender, EventArgs e)
    {
        try
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
        catch (Exception)
        {

            
        }
       
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

    protected void onSortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>$('#shade').show();$('#tbl_grid').hide();</script>", false);
    }


}