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
                                string idbadge = Convert.ToString(row["BGSUO"]).Remove(0, 1);
                                string idrnum = Convert.ToString(row["PAMAT"]);

                                using (SqlCommand cmd = new SqlCommand("TimbraturaAngajatImport", conn))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.Add("@IdBadge", SqlDbType.Int).Value = Convert.ToInt32(idbadge);
                                    cmd.Parameters.Add("@IdRnum", SqlDbType.VarChar).Value = idrnum;
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