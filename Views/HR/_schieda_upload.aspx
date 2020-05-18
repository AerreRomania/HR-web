<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_schieda_upload.aspx.cs" Inherits="Views_HR_schieda_upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
        }
        body{
            height:436px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
        <h3>Attach Image:</h3>
        <hr />
        <asp:Label runat="server" ID="txt_fu"></asp:Label>
        <br />
        <asp:FileUpload runat="server" ID="fu" />
        <asp:Button runat="server" ID="fub" OnClick="fub_Click" Text="Upload Image" />

        <br />
        <br />
            <h3>Attach CV:</h3>
            <hr /> 
            <asp:Label runat="server" ID="txt_fc"></asp:Label>
            <br />
            <asp:FileUpload runat="server" ID="fc" />
            <asp:Button runat="server"  ID="fuc" OnClick="fuc_Click" Text="Upload CV"/> 
        <br />
        <br />

        <h3>Remove section:</h3>
        <hr /> 
        <br />
        <asp:Button runat="server" ID="btn_remove_img" OnClick="btn_remove_img_Click" Text="Remove Image" />
        <asp:Button runat="server" ID="btn_remove_cv" OnClick="btn_remove_cv_Click" Text="Remove CV" />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
