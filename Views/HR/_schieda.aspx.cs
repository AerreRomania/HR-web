using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _schieda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);
    }
    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Cells[8].Visible = false;
        //e.Row.Cells[11].Visible = false;
        //e.Row.Cells[13].Visible = false;
        //e.Row.Cells[14].Visible = false;
        //e.Row.Cells[20].Visible = false;
        //e.Row.Cells[26].Visible = false;
        //e.Row.Cells[27].Visible = false;
        //e.Row.Cells[37].Visible = false;
        //e.Row.Cells[38].Visible = false;
        //e.Row.Cells[10].Visible = false;
        //e.Row.Cells[12].Visible = false;
        //e.Row.Cells[15].Visible = false;
        //e.Row.Cells[16].Visible = false;
        //e.Row.Cells[17].Visible = false;
        //e.Row.Cells[18].Visible = false;
        //e.Row.Cells[19].Visible = false;
        //e.Row.Cells[21].Visible = false;
        //e.Row.Cells[22].Visible = false;
        //e.Row.Cells[23].Visible = false;
        //e.Row.Cells[24].Visible = false;
        //e.Row.Cells[25].Visible = false;
        //e.Row.Cells[28].Visible = false;
        //e.Row.Cells[29].Visible = false;
        //e.Row.Cells[30].Visible = false;
        //e.Row.Cells[31].Visible = false;
        //e.Row.Cells[32].Visible = false;
        //e.Row.Cells[33].Visible = false;
        //e.Row.Cells[35].Visible = false;
        //e.Row.Cells[36].Visible = false;
        //e.Row.Cells[39].Visible = false;
        //e.Row.Cells[40].Visible = false;
        //e.Row.Cells[41].Visible = false;
        //e.Row.Cells[42].Visible = false;
        //e.Row.Cells[43].Visible = false;
        //e.Row.Cells[9].Visible = false;
        //e.Row.Cells[34].Visible = false;
        //e.Row.Cells[44].Visible = false;
        //e.Row.Cells[45].Visible = false;
        //e.Row.Cells[46].Visible = false;

    }


    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        // You only need the following 2 lines of code if you are not 
        // using an ObjectDataSource of SqlDataSource
        //GridView1.DataSource = AngajatiView.DataBind();
        //GridView1.DataBind();

        if (GridView1.Rows.Count > 0)
        {
            //This replaces <td> with <th> and adds the scope attribute
            GridView1.UseAccessibleHeader = true;

            //This will add the <thead> and <tbody> elements
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //This adds the <tfoot> element. 
            //Remove if you don't have a footer row
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }
    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        // You only need the following 2 lines of code if you are not 
        // using an ObjectDataSource of SqlDataSource
        //GridView1.DataSource = AngajatiView.DataBind();
        //GridView1.DataBind();

        if (GridView2.Rows.Count > 0)
        {
            //This replaces <td> with <th> and adds the scope attribute
            GridView2.UseAccessibleHeader = true;

            //This will add the <thead> and <tbody> elements
            GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;

            //This adds the <tfoot> element. 
            //Remove if you don't have a footer row
            GridView2.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }
    //  SELECT 
    //1[Marca], 
    //2[Nume], 
    //3[Prenume], 
    //4[NumarIdentificarePersonala], 
    //5[Departament], 
    //6[Linie], 
    //7[Incadrare], 
    //8[Id], 
    //9[Strada], 
    //10[IdLocalitate], 
    //11[DataNasterii], 
    //12[Somaj], 
    //13[DataAngajarii], 
    //14[DataNedeterminat], 
    //15[IdTipPostDeLucru], 
    //16[DataExpirareContract], 
    //17[DataExpirareProba], 
    //18[IdIntervalDeLucru], 
    //19[IdPostDeLucru], 
    //20[Sex], 
    //21[IdLoculNasterii], 
    //22[IdIncadrare], 
    //23[IdNivelStudiu], 
    //24[IdBanca], 
    //25[StareCivila], 
    //26[NumarTelefon], 
    //27[CC], 
    //28[IdDepartament], 
    //29[IdEchipa], 
    //30[AdresaEmail], 
    //31[IdLinie], 
    //32[Banca], 
    //33[Echipa], 
    //34[IntervalDeLucru],
    //35[Localitate], 
    //36[NivelStudiu], 
    //37[PostDeLucru], 
    //38[TipPostDeLucru], 
    //39[LoculNasterii], 
    //40[CodAngajat], 
    //41[CodSistem], 
    //42[DataLichidarii], 
    //43[DataMaternitate], 
    //44[DeteIndete], 
    //45[ImageUrl],
    //46[CvUrl],
    //47[IdBadge],
    //48[StartShift],
    //49[EndShift] FROM [AngajatiView]"></asp:SqlDataSource>

    //protected void gvCktMap_PreRender(object sender, EventArgs e)
    //{

    //    RadGrid1.MasterTableView.GetColumn("Strada").Display = false;
    //    RadGrid1.MasterTableView.GetColumn("IntervalDeLucru").Display = false;
    //    RadGrid1.MasterTableView.GetColumn("DeteIndete").Display = false;
    //    RadGrid1.MasterTableView.GetColumn("ImageUrl").Display = false;
    //    RadGrid1.MasterTableView.GetColumn("CvUrl").Display = false;

    //    RadGrid1.Rebind();
    //}



    //protected void btn_save_Click(object sender, EventArgs e)
    //{ 
    //    string RCode = "";
    //    RCode = hidden_rcode.Value;

    //    //if (upl_img.HasFile)
    //    //{ 
    //    //    string fileExtension = upl_img.FileName.Substring(upl_img.FileName.LastIndexOf(".") + 1);
    //    //    string filePath = "../../Images/Upload/Images/" + RCode + "." + fileExtension + "";
    //    //    upl_img.SaveAs(MapPath(filePath));



    //    //    string query = "IF EXISTS (select Rcode FROM Attachments WHERE Rcode=@Rcode) BEGIN UPDATE Attachments SET ImageUrl=@ImageUrl WHERE Rcode=@Rcode END ELSE INSERT INTO Attachments (ImageUrl, Rcode) VALUES (@ImageUrl, @Rcode)";

    //    //    using (SqlConnection connection = new SqlConnection("Data Source=KNSQL2014;Initial Catalog=WbmOlimpiasHR;User=sa;Password=onlyouolimpias")) 
    //    //    { 

    //    //            using (SqlCommand command = new SqlCommand(query, connection))
    //    //            {
    //    //                command.Parameters.AddWithValue("@ImageUrl", filePath);
    //    //                command.Parameters.AddWithValue("@Rcode", RCode);

    //    //                connection.Open();
    //    //                int result = command.ExecuteNonQuery();

    //    //                if (result < 0)
    //    //                    Console.WriteLine("Error inserting data into Database!");
    //    //            }

    //    //            } 
    //    //}
    //}
} 