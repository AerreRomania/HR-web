using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Views.HR
{
    public partial class form_straordinario :  System.Web.UI.Page
    {
        String Departament;
        DataSet dt_jan = new DataSet();
        DataSet dt_feb = new DataSet();
        DataSet dt_mar = new DataSet();
        DataSet dt_apr = new DataSet();
        DataSet dt_may = new DataSet();
        DataSet dt_jun = new DataSet();
        DataSet dt_jul = new DataSet();
        DataSet dt_avg = new DataSet();
        DataSet dt_sep = new DataSet();
        DataSet dt_oct = new DataSet();
        DataSet dt_nov = new DataSet();
        DataSet dt_dec = new DataSet();
        DataSet dt_test = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            dt_jan.Clear();
            dt_feb.Clear();
            dt_mar.Clear();
            dt_apr.Clear();
            dt_may.Clear();
            dt_jun.Clear();
            dt_jul.Clear();
            dt_avg.Clear();
            dt_sep.Clear();
            dt_oct.Clear();
            dt_nov.Clear();
            dt_dec.Clear();
            dt_test.Clear();

            Departament = Request.QueryString["Departament"];
            lblDepName.Text = Departament;

            SetDefaultTotals();
            LoadData(sender, e);
            CheckingData();
        
        }

        private void SetDefaultTotals()
        {
            dt_jan.Dispose();
            dt_feb.Dispose();
            dt_mar.Dispose();
            dt_apr.Dispose();
            dt_may.Dispose();
            dt_jun.Dispose();
            dt_jul.Dispose();
            dt_avg.Dispose();
            dt_sep.Dispose();
            dt_oct.Dispose();
            dt_nov.Dispose();
            dt_dec.Dispose();
            dt_test.Dispose();

            tot_jan.Text = "&nbsp;";
            tot_feb.Text = "&nbsp;";
            tot_mar.Text = "&nbsp;";
            tot_apr.Text = "&nbsp;";
            tot_may.Text = "&nbsp;";
            tot_jun.Text = "&nbsp;";
            tot_jul.Text = "&nbsp;";
            tot_avg.Text = "&nbsp;";
            tot_sep.Text = "&nbsp;";
            tot_oct.Text = "&nbsp;";
            tot_nov.Text = "&nbsp;";
            tot_dec.Text = "&nbsp;";
            tot_jan_val.Text = "&nbsp;";
            tot_feb_val.Text = "&nbsp;";
            tot_mar_val.Text = "&nbsp;";
            tot_apr_val.Text = "&nbsp;";
            tot_may_val.Text = "&nbsp;";
            tot_jun_val.Text = "&nbsp;";
            tot_jul_val.Text = "&nbsp;";
            tot_avg_val.Text = "&nbsp;";
            tot_sep_val.Text = "&nbsp;";
            tot_oct_val.Text = "&nbsp;";
            tot_nov_val.Text = "&nbsp;";
            tot_dec_val.Text = "&nbsp;";
        }
        private void CheckingData()
        {

            if (String.IsNullOrEmpty(tot_jan.Text))
            {
                tot_jan.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_feb.Text))
            {
                tot_feb.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_mar.Text))
            {
                tot_mar.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_apr.Text))
            {
                tot_apr.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_may.Text))
            {
                tot_may.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_jun.Text))
            {
                tot_jun.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_jul.Text))
            {
                tot_jul.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_avg.Text))
            {
                tot_avg.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_sep.Text))
            {
                tot_sep.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_oct.Text))
            {
                tot_oct.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_nov.Text))
            {
                tot_nov.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_dec.Text))
            {
                tot_dec.Text = "&nbsp;";
            }


            if (String.IsNullOrEmpty(tot_jan_val.Text))
            {
                tot_jan_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_feb_val.Text))
            {
                tot_feb_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_mar_val.Text))
            {
                tot_mar_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_apr_val.Text))
            {
                tot_apr_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_may_val.Text))
            {
                tot_may_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_jun_val.Text))
            {
                tot_jun_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_jul_val.Text))
            {
                tot_jul_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_avg_val.Text))
            {
                tot_avg_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_sep_val.Text))
            {
                tot_sep_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_oct_val.Text))
            {
                tot_oct_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_nov_val.Text))
            {
                tot_nov_val.Text = "&nbsp;";
            }
            if (String.IsNullOrEmpty(tot_dec_val.Text))
            {
                tot_dec_val.Text = "&nbsp;";
            }

        }
        protected void LoadData(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='1'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_jan);
                        }
                    }

                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='2'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_feb);
                        }
                    }

                }
                catch (Exception)
                {
                }
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='3'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_mar);
                        }
                    }

                }
                catch (Exception)
                {
                }
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='4'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_apr);
                        }
                    }

                }
                catch (Exception)
                {
                }
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='5'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_may);
                        }
                    }

                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='6'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_jun);
                        }
                    }

                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='7'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_jul);
                        }
                    }

                }
                catch (Exception)
                {
                }
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='8'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_avg);
                        }
                    }

                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='9'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_sep);
                        }
                    }

                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='10'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_oct);
                        }
                    }
                }
                catch (Exception)
                {
                }

                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='11'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_nov);
                        }
                    }
                }
                catch (Exception)
                {
                }
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TipPostDeLucru,Ore,Value from [OreSuplimatoreIndirettiDiretti] where Departament='" + Departament + "' and An='" + ddlYearPicker.SelectedValue + "' and Luna='12'", conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt_dec);
                        }
                    }
                }
                catch (Exception)
                {
                }
            }

            try
            {           
                grid_jan.DataSource = dt_jan;
                if (dt_jan.Tables[0].Rows.Count != 0)
                {
                    grid_jan.DataSource = dt_jan;
                    grid_jan.DataBind();
                }
                else
                {
                    //Other wise add a emtpy "New Row" to the datatable and then hide it after binding.

                    dt_jan.Tables[0].Rows.Add(dt_jan.Tables[0].NewRow());
                    dt_jan.Tables[1].Rows.Add(dt_jan.Tables[1].NewRow());

                    grid_jan.DataSource = dt_jan;
                    grid_jan.DataBind();
                    //grid_jan.Rows[0].Visible = false;
                }
                //grid_jan.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_feb.DataSource = dt_feb;
                grid_feb.DataBind();
            }
            catch (Exception)
            {   
            }

            try
            {
                grid_mar.DataSource = dt_mar;
                grid_mar.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_apr.DataSource = dt_apr;
                grid_apr.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_may.DataSource = dt_may;
                grid_may.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_jun.DataSource = dt_jun;
                grid_jun.DataBind();
            }
            catch (Exception)
            {   
            }

            try
            {
                grid_jul.DataSource = dt_jul;
                grid_jul.DataBind();
            }
            catch (Exception)
            {
            }


            try
            {
                grid_avg.DataSource = dt_avg;
                grid_avg.DataBind();
            }
            catch (Exception)
            {   
            }

            try
            {
                grid_sep.DataSource = dt_sep;
                grid_sep.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_oct.DataSource = dt_oct;
                grid_oct.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_nov.DataSource = dt_nov;
                grid_nov.DataBind();
            }
            catch (Exception)
            {
            }

            try
            {
                grid_dec.DataSource = dt_dec;
                grid_dec.DataBind();
            }
            catch (Exception)
            {
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "drawCharts()", true);
        }
        protected void InsertData(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = conn;            // <== lacking
                    command.CommandType = CommandType.Text;
                    command.CommandText = "INSERT into StraordinarioValue (Year, Month, Departament, Status, Value) VALUES (@year, @month, @departament, @status, @value)";
                    command.Parameters.AddWithValue("@year", Convert.ToInt32(ddp_year.SelectedItem.Text));
                    command.Parameters.AddWithValue("@month", Convert.ToInt32(ddp_month.SelectedItem.Text));
                    command.Parameters.AddWithValue("@departament", ddp_dep.SelectedItem.Text);
                    command.Parameters.AddWithValue("@status", ddp_status.SelectedItem.Text);
                    command.Parameters.AddWithValue("@value", Convert.ToInt32(txt_value.Text));
                    try
                    {
                        conn.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (SqlException)
                    {
                        // error here
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }

        protected void Dg_Source_RowDataBound_jan(object sender, GridViewRowEventArgs e)
        {
            tot_jan.Text = dt_jan.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_jan_val.Text = dt_jan.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;") {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_feb(object sender, GridViewRowEventArgs e)
        {
            tot_feb.Text = dt_feb.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_feb_val.Text = dt_feb.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_mar(object sender, GridViewRowEventArgs e)
        {
            tot_mar.Text = dt_mar.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_mar_val.Text = dt_mar.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_apr(object sender, GridViewRowEventArgs e)
        {
            tot_apr.Text = dt_apr.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_apr_val.Text = dt_apr.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_may(object sender, GridViewRowEventArgs e)
        {
            tot_may.Text = dt_may.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_may_val.Text = dt_may.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_jun(object sender, GridViewRowEventArgs e)
        {
            tot_jun.Text = dt_jun.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_jun_val.Text = dt_jun.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            e.Row.Cells[0].Visible = false;
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
        }
        protected void Dg_Source_RowDataBound_jul(object sender, GridViewRowEventArgs e)
        {
            tot_jul.Text = dt_jul.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_jul_val.Text = dt_jul.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_avg(object sender, GridViewRowEventArgs e)
        {
            tot_avg.Text = dt_avg.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_avg_val.Text = dt_avg.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_sep(object sender, GridViewRowEventArgs e)
        {
            tot_sep.Text = dt_sep.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_sep_val.Text = dt_sep.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_oct(object sender, GridViewRowEventArgs e)
        {
            tot_oct.Text = dt_oct.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_oct_val.Text = dt_oct.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_nov(object sender, GridViewRowEventArgs e)
        {
            tot_nov.Text = dt_nov.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_nov_val.Text = dt_nov.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
        protected void Dg_Source_RowDataBound_dec(object sender, GridViewRowEventArgs e)
        {
            tot_dec.Text = dt_dec.Tables[0].Compute("sum(Ore)", String.Empty).ToString();
            tot_dec_val.Text = dt_dec.Tables[0].Compute("sum(Value)", String.Empty).ToString();
            e.Row.Cells[2].BackColor = Color.FromArgb(1, 255, 235, 59);
            if (e.Row.Cells[2].Text != "&nbsp;")
            {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + " €";
            }
            e.Row.Cells[0].Visible = false;
        }
    }
}