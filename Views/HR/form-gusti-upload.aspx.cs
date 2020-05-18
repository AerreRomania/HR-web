using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using OfficeOpenXml;

namespace Views.HR
{
    public partial class form_timbrature : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetData();
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Upload.HasFile)
            {
                if (Path.GetExtension(Upload.FileName).Equals(".xlsx"))
                {
                    informer.Text = "Uploading... Please wait! Do not shut down this window!";
                    Button1.Enabled = false;
                    Button1.Attributes.Add("onclick", "this.style.display='none';");
                    Upload.Enabled = false;

                    var excel = new ExcelPackage(Upload.FileContent);
                    var dt = excel.ToDataTable();

                    using (var conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        foreach (DataRow row in dt.Rows)
                            try
                            {
                                string departament = Convert.ToString(row["R1DEA"]);
                                int iddepartament = 0;

                                if (departament == "STIRO")
                                {
                                    iddepartament = 1;
                                } else if (departament == "CONFEZIONE")
                                {
                                    iddepartament = 2;
                                } else if (departament == "NIS CONFEZIONE B")
                                {
                                    iddepartament = 14;
                                } else if (departament == "TESSITURA")
                                {
                                    iddepartament = 3;
                                } else if (departament == "AMMINISTRAZIONE")
                                {
                                    iddepartament = 5;
                                }



                                int codAngajat = Convert.ToInt32(row["R1KEY"]);
                                int dan = Convert.ToInt32(row["R1GGE"]);
                                int mesec = Convert.ToInt32(row["R1MME"]);
                                int godina = Convert.ToInt32(row["R1AAE"]);
                                string sve = new DateTime(godina, mesec, dan).ToShortDateString();
                                string codTipOra = Convert.ToString(row["R1COD"]);
                                decimal dal = Convert.ToDecimal(row["R1DAL"]);
                                decimal all = Convert.ToDecimal(row["R1ALL"]);
                                decimal tot = Convert.ToDecimal(row["R1TOT"]);
                                int glupiid = Convert.ToInt32(row["R1KEY"]);

                                using (SqlCommand cmd = new SqlCommand("PrezentaImport2", conn))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.Add("@CodAngajat", SqlDbType.Int).Value = codAngajat;
                                    cmd.Parameters.Add("@Data", SqlDbType.Date).Value = sve;
                                    cmd.Parameters.Add("@CodTipOra", SqlDbType.VarChar).Value = codTipOra;
                                    cmd.Parameters.Add("@Dep", SqlDbType.Int).Value = iddepartament;
                                    cmd.Parameters.Add("@R1DAL", SqlDbType.Decimal).Value = dal;
                                    cmd.Parameters.Add("@R1ALL", SqlDbType.Decimal).Value = all;
                                    cmd.Parameters.Add("@R1TOT", SqlDbType.Decimal).Value = tot;
                                    cmd.Parameters.Add("@IdUtilizatorAdaugare", SqlDbType.Int).Value = 1;
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            catch (Exception ex)
                            {
                                String query = "INSERT INTO dbo.Exception (Application,Exception,Time) VALUES (@application, @exception,@time)";
                                SqlCommand cmd = new SqlCommand(query, conn);
                                cmd.Parameters.Add("@application", SqlDbType.NVarChar).Value = "Anagrafiche Upload";
                                cmd.Parameters.Add("@exception", SqlDbType.NVarChar).Value = ex.ToString();
                                cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Now;

                                cmd.ExecuteNonQuery();
                                continue;
                            }
                        {
                        }
                
                        conn.Close();
                    }
                    informer.Text = "Done!" + "<br />" + dt.Rows.Count + " rows uploaded.";
                    Button1.Enabled = true;
                    Button1.Attributes.Add("onclick", "this.style.display='block';");
                    Upload.Enabled = true;
                }
            }
        }

        public DataTable ConvertToDataTable<T>(IEnumerable<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;
        }

        DataTable dtdb = new DataTable();
        public DataTable GetData()
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT [IdAngajat],[IdTipPostDeLucru],[IdPostDeLucru],[IdDepartament],[IdEchipa],[IdLinie],[Data],[IdTipOra],[R1DAL],[R1ALL] ,[R1TOT],[IdUtilizatorAdaugare],[DataAdaugare] ,[IdUtilizatorModificare],[DataModificare],[IdUtilizatorStergere],[DataStergere] FROM Prezente";
            SqlCommand cmd = new SqlCommand(query, conn);

            dtdb.Load(cmd.ExecuteReader());
            conn.Close();
            return dtdb;
        }

    }
}