using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TessituraCalendar : System.Web.UI.Page
{

    DataTable CQ1 = new DataTable();
    DataTable CQ1ppl = new DataTable();
    DataTable CQ2 = new DataTable();
    DataTable CQ2ppl = new DataTable();
    DataTable CQ3 = new DataTable();
    DataTable CQ3ppl = new DataTable();
    DataTable Capo = new DataTable();
    DataTable Capoppl = new DataTable();
    DataTable OP1 = new DataTable();
    DataTable OP1ppl = new DataTable();
    DataTable OP2 = new DataTable();
    DataTable OP2ppl = new DataTable();
    DataTable OP3 = new DataTable();
    DataTable OP3ppl = new DataTable();
    DataTable MCQ = new DataTable();
    DataTable MCQppl = new DataTable();
    DataTable PUL = new DataTable();
    DataTable PULppl = new DataTable();

    protected void Page_Load(object sender, System.EventArgs e)
    {
        LoadData();

        gv_caposquadra1.DataSource = CQ1;
        gv_caposquadra1ppl.DataSource = CQ1ppl;
        gv_caposquadra2.DataSource = CQ2;
        gv_caposquadra2ppl.DataSource = CQ2ppl;
        gv_caposquadra3.DataSource = CQ3;
        gv_caposquadra3ppl.DataSource = CQ3ppl;
        gv_capoturno.DataSource = Capo;
        gv_capoturnoppl.DataSource = Capoppl;

        gv_operatoremachina1.DataSource = OP1;
        gv_operatoremachina1ppl.DataSource = OP1ppl;
        gv_operatoremachina2.DataSource = OP2;
        gv_operatoremachina2ppl.DataSource = OP2ppl;
        gv_operatoremachina3.DataSource = OP3;
        gv_operatoremachina3ppl.DataSource = OP3ppl;
        gv_cq.DataSource = MCQ;
        gv_cqppl.DataSource = MCQppl;
        gv_meccanico.DataSource = MCQ;
        gv_meccanicoppl.DataSource = MCQppl;
        gv_pulitori.DataSource = PUL;
        gv_pulitorippl.DataSource = PULppl;

        gv_caposquadra1.DataBind();
        gv_caposquadra1ppl.DataBind();
        gv_caposquadra2.DataBind();
        gv_caposquadra2ppl.DataBind();
        gv_caposquadra3.DataBind();
        gv_caposquadra3ppl.DataBind();
        gv_capoturno.DataBind();
        gv_capoturnoppl.DataBind();
        gv_operatoremachina1.DataBind();
        gv_operatoremachina1ppl.DataBind();
        gv_operatoremachina2.DataBind();
        gv_operatoremachina2ppl.DataBind();
        gv_operatoremachina3.DataBind();
        gv_operatoremachina3ppl.DataBind();
        gv_cq.DataBind();
        gv_cqppl.DataBind();
        gv_meccanico.DataBind();
        gv_meccanicoppl.DataBind();
        gv_pulitori.DataBind();
        gv_pulitorippl.DataBind();
    }

    private void LoadData()
    {
        //Capo Squadra 1 -> 3
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricscs1", connection);
            adapter.Fill(CQ1);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Capi Squadra' AND Groupe LIKE '%A%'",
                    connection);
            adapter.Fill(CQ1ppl);
        }

        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricscs2", connection);
            adapter.Fill(CQ2);
        }

        //PPL 
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Capi Squadra' AND Groupe LIKE '%B%'",
                    connection);
            adapter.Fill(CQ2ppl);
        }

        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricscs3", connection);
            adapter.Fill(CQ3);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Capi Squadra' AND Groupe LIKE '%C%'",
                    connection);
            adapter.Fill(CQ3ppl);
        }


        //Capo Turno
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricscpt", connection);
            adapter.Fill(Capo);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand("Select Groupe,FullName FROM matrics_users WHERE JobType='Capi Turno'", connection);
            adapter.Fill(Capoppl);
        }

        //Operatore Macchina 1 ->
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricsop1", connection);
            adapter.Fill(OP1);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Operatori Macchine' AND Groupe LIKE '%A%'",
                    connection);
            adapter.Fill(OP1ppl);
        }

        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricsop2", connection);
            adapter.Fill(OP2);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Operatori Macchine' AND Groupe LIKE '%B%'",
                    connection);
            adapter.Fill(OP2ppl);
        }

        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricsop3", connection);
            adapter.Fill(OP3);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand(
                    "Select Groupe,FullName FROM matrics_users WHERE JobType='Operatori Macchine' AND Groupe LIKE '%C%'",
                    connection);
            adapter.Fill(OP3ppl);
        }

        //Meccanico And CQ
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricsmeccq", connection);
            adapter.Fill(MCQ);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand =
                new SqlCommand("Select Groupe,FullName FROM matrics_users WHERE JobType='Meccanici'", connection);
            adapter.Fill(MCQppl);
        }

        //Pulitori
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select * FROM matricspul", connection);
            adapter.Fill(PUL);
        }

        //PPL
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand("Select Groupe,FullName FROM matrics_users WHERE JobType='Pulitori'",
                connection);
            adapter.Fill(PULppl);
        }

    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[1].Text = "Lunedì";
            e.Row.Cells[2].Text = "Martedì";
            e.Row.Cells[3].Text = "Mercoledì";
            e.Row.Cells[4].Text = "Giovedì";
            e.Row.Cells[5].Text = "Venerdì";
            e.Row.Cells[6].Text = "Sabato";
            e.Row.Cells[7].Text = "Domenica";
            e.Row.Cells[8].Text = "Turno";
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[8].Text == "1")
            {
                e.Row.Cells[8].Text = "23:00 - 07:00";
            }

            if (e.Row.Cells[8].Text == "2")
            {
                e.Row.Cells[8].Text = "07:00 - 15:00";
            }

            if (e.Row.Cells[8].Text == "3")
            {
                e.Row.Cells[8].Text = "15:00 - 23:00";
            }

            if (e.Row.Cells[1].Text.Contains("F"))
            {
                e.Row.Cells[1].Attributes.Add("style", "background: #cddc39;");
            }

            if (e.Row.Cells[2].Text.Contains("F"))
            {
                e.Row.Cells[2].Attributes.Add("style", "background: #cddc39;");
            }

            if (e.Row.Cells[3].Text.Contains("F"))
            {
                e.Row.Cells[3].Attributes.Add("style", "background: #cddc39;");
            }

            if (e.Row.Cells[4].Text.Contains("F"))
            {
                e.Row.Cells[4].Attributes.Add("style", "background: #cddc39;");
            }

            if (e.Row.Cells[5].Text.Contains("F"))
            {
                e.Row.Cells[5].Attributes.Add("style", "background: #cddc39;");
            }

            if (e.Row.Cells[6].Text.Contains("F"))
            {
                e.Row.Cells[6].Attributes.Add("style", "background:#cddc39;");
            }

            if (e.Row.Cells[7].Text.Contains("F"))
            {
                e.Row.Cells[7].Attributes.Add("style", "background: #cddc39;");
            }
        }
    }

    protected void GridViewPPL_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "Group";
            e.Row.Cells[1].Text = "Cognome e Nome";
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Attributes.Add("class", "hvr");
        }
    }
}