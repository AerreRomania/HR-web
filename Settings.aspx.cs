using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

public partial class Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //FILL PATH
        GetCurrentPath();
    }

    protected void GetCurrentPath()
    {
        using (var conn = new SqlConnection(System.Configuration.ConfigurationManager
            .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT Value FROM Settings WHERE Name = 'path'", conn);
            try
            {
                conn.Open();
                path.Text = (string)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (Upload.HasFile)
        {
            if ((Upload.PostedFile != null) && (Upload.PostedFile.ContentLength > 0))
            {
                string SaveLocation = Server.MapPath("files") + "\\";
                try
                {
                    string extension = Path.GetExtension(Upload.PostedFile.FileName);
                    Upload.SaveAs(SaveLocation + "anagrafiche-" + txt_mesec.Text + "-" + txt_godina.Text + "" + extension);
                    informer.Text = "The file has been uploaded.";
                }
                catch (Exception ex)
                {
                    informer.Text = ("Error: " + ex.Message);
                }
            }
            else
            {
                informer.Text = "Please select a file to upload.";
            }
        }
    }

    protected void btnUpload_Gusti_Click(object sender, EventArgs e)
    {
        if (FileUpload_Gusti.HasFile)
        {
            if ((FileUpload_Gusti.PostedFile != null) && (FileUpload_Gusti.PostedFile.ContentLength > 0))
            {
                string SaveLocation = Server.MapPath("files") + "\\";
                try
                {
                    string extension = Path.GetExtension(FileUpload_Gusti.PostedFile.FileName);
                    FileUpload_Gusti.SaveAs(SaveLocation + "gusti-" + txt_mesec_gusti.Text + "-" + txt_godina_gusti.Text + "" + extension);
                    informer_gusti.Text = "The file has been uploaded.";
                }
                catch (Exception ex)
                {
                    informer_gusti.Text = ("Error: " + ex.Message);
                }
            }
            else
            {
                informer_gusti.Text = "Please select a file to upload.";
            }
        }
    }
    protected void save_path_OnClick(object sender, EventArgs e)
    {
        if (path.Text.Length >0) 
        {
            using (var con = new SqlConnection(System.Configuration.ConfigurationManager
                .ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Settings SET Value = @Value WHERE Name = @Name", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Name", "path");
                    cmd.Parameters.AddWithValue("@Value", this.Context.Request[this.path.ClientID]);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
            //FILL PATH
        GetCurrentPath();
    }

    protected void open_path_OnClick(object sender, EventArgs e)
    {
        Response.Redirect(path.Text);
    }
}