using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_HR_effDipendente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridView.DataSource = GetFilesAndFolders("../../Upload/EffDipendenti");
            GridView.DataBind();
        }
    }

    private DataTable GetFilesAndFolders(string virtualDirPath)
    {
        DataTable filesAndFolders = new DataTable();
        filesAndFolders.Columns.Add("Name");
        filesAndFolders.Columns.Add("Path");


        string rootPath = Server.MapPath(virtualDirPath);
        if (Directory.Exists(rootPath))
        {

            string[] files = Directory.GetFiles(rootPath);
            for (int i = 0; i < files.Length; i++)
            {
                FileInfo fInfo = new FileInfo(files[i]);
                DataRow dr = filesAndFolders.NewRow();
                dr["Name"] = fInfo.Name;
                dr["Path"] = fInfo.FullName;
                filesAndFolders.Rows.Add(dr);
            }
            return filesAndFolders;
        }
        return null;
    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {

        if (file_upload.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in file_upload.PostedFiles)
            {
                string fileExtension = file_upload.FileName.Substring(file_upload.FileName.LastIndexOf(".") + 1);
                if (txt_name.Text.Length < 1)
                {
                    txt_status.Attributes.Add("style", "color:red");
                    txt_status.Text = "You must enter the name of file!";
                }
                else
                {
                    string filePath = "../../Upload/EffDipendenti/" + ddp_dep.SelectedItem.Text + "_" + txt_name.Text + "." + fileExtension + "";
                    file_upload.SaveAs(MapPath(filePath));
                    txt_status.Attributes.Add("style", "color:green");
                    txt_status.Text = "Upload status - Done!";

                    GridView.DataSource = GetFilesAndFolders("../../Upload/EffDipendenti");
                    GridView.DataBind();
                }
            }
        }
        else
        {
            txt_status.Attributes.Add("style", "color:red");
            txt_status.Text = "You must select file!";
        }
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string name = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Name"));
            ImageButton button = (ImageButton)e.Row.FindControl("btn_del");
            button.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this file?');");

            System.Web.UI.HtmlControls.HtmlAnchor buttonselect = (System.Web.UI.HtmlControls.HtmlAnchor)e.Row.FindControl("btn_select");
            buttonselect.Attributes.Add("href", "../../Upload/EffDipendenti/" + name);
            buttonselect.Attributes.Add("target", "_blank");
            buttonselect.Attributes.Add("style", "display: inline-flex;");
        }
    }

    protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string path = Convert.ToString(GridView.DataKeys[e.RowIndex].Value.ToString());
        File.Delete(path);
        GridView.DataSource = GetFilesAndFolders("../../Upload/EffDipendenti");
        GridView.DataBind();
    }
}