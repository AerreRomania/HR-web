using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_schieda_upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void fub_Click(object sender, EventArgs e)
    {
        var rcode = Request.QueryString["rcode"];

        if (fu.HasFile)
        {
            string fileExtension = fu.FileName.Substring(fu.FileName.LastIndexOf(".") + 1);
            string filePath = "../../Images/Upload/Images/" + rcode + "." + fileExtension + "";
            fu.SaveAs(MapPath(filePath)); 

            string query = "IF EXISTS (select Rcode FROM Attachments WHERE Rcode=@Rcode) BEGIN UPDATE Attachments SET ImageUrl=@ImageUrl WHERE Rcode=@Rcode END ELSE INSERT INTO Attachments (ImageUrl, Rcode) VALUES (@ImageUrl, @Rcode)";
            using (SqlConnection connection = new SqlConnection("Data Source=KNSQL2014;Initial Catalog=WbmOlimpiasHR;User=sa;Password=onlyouolimpias"))
            {

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ImageUrl", filePath);
                    command.Parameters.AddWithValue("@Rcode", rcode);

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                }

            }

            txt_fu.Attributes.Add("style", "color:green");
            txt_fu.Text = "Upload status: Done!";
        }
        else
        {
            txt_fu.Attributes.Add("style", "color:red");
            txt_fu.Text = "You must select file!";
        }
    }

    protected void fuc_Click(object sender, EventArgs e)
    {
        var rcode = Request.QueryString["rcode"];

        if (fc.HasFile)
        {
            string fileExtension = fc.FileName.Substring(fc.FileName.LastIndexOf(".") + 1);
            string filePath = "../../Images/Upload/CV/" + rcode + "." + fileExtension + "";
            fc.SaveAs(MapPath(filePath));

            string query = "IF EXISTS (select Rcode FROM Attachments WHERE Rcode = @Rcode) BEGIN UPDATE Attachments SET CvUrl=@CvUrl WHERE Rcode=@Rcode END ELSE INSERT INTO Attachments (CvUrl, Rcode) VALUES (@CvUrl, @Rcode)";
            using (SqlConnection connection = new SqlConnection("Data Source=KNSQL2014;Initial Catalog=WbmOlimpiasHR;User=sa;Password=onlyouolimpias"))
            {

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CvUrl", filePath);
                    command.Parameters.AddWithValue("@Rcode", rcode);

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                }

            }
            txt_fc.Attributes.Add("style", "color:green");
            txt_fc.Text = "Upload status: Done!";
        }
        else
        {
            txt_fc.Attributes.Add("style", "color:red");
            txt_fc.Text = "You must select file!";
        } 
    }

    protected void btn_remove_img_Click(object sender, EventArgs e)
    {
        var rcode = Request.QueryString["rcode"];

        string query = "Update Attachments SET ImageUrl=@ImageUrl Where Rcode = @Rcode";

        try
        {
            using (SqlConnection connection = new SqlConnection("Data Source=KNSQL2014;Initial Catalog=WbmOlimpiasHR;User=sa;Password=onlyouolimpias"))
            {

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Rcode", rcode);
                    command.Parameters.AddWithValue("@ImageUrl", "");

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result < 0)
                        Console.WriteLine("Error deleting data into Database! File not exist");
                }

            }

            Response.Write("<script>alert('Image deleted successfully!');</script>");


        }
        catch (Exception)
        {
            Response.Write("<script>alert('Image not Exist!');</script>");
        }
    }

    protected void btn_remove_cv_Click(object sender, EventArgs e)
    {
        var rcode = Request.QueryString["rcode"];

        string query = "Update Attachments SET CvUrl=@CvUrl Where Rcode = @Rcode";
        try
        {
            using (SqlConnection connection = new SqlConnection("Data Source=KNSQL2014;Initial Catalog=WbmOlimpiasHR;User=sa;Password=onlyouolimpias"))
            {

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Rcode", rcode);
                    command.Parameters.AddWithValue("@CvUrl", "");

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result < 0)
                        Console.WriteLine("Error deleting data into Database! File not exist");
                }

            }
            Response.Write("<script>alert('CV deleted successfully!');</script>");

        }
        catch (Exception)
        {
            Response.Write("<script>alert('Image not Exist!');</script>");
        }
    }
}