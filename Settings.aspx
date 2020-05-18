<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/bootstrap-3.4.1.min.css"/>
    <title></title>
    <style>
        #txt_mesec, #txt_godina,#txt_mesec_gusti, #txt_godina_gusti{width:75px}
        label{ padding-left: 20px;width:72px}
        #path{ width: 60%; margin-right:10px;}
        span{ color: red;}
    </style>
</head>
<body>
<form id="form1" runat="server">
<%--    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>--%>

        <div class="container justify-content-center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Uplaod Path server settings:</h3>
                    <asp:TextBox runat="server" id="path"></asp:TextBox>
                    <asp:Button runat="server" id="save_path" OnClick="save_path_OnClick" CssClass="btn btn-success" Text="Save Path"/>
                    <asp:Button runat="server" id="open_path" OnClick="open_path_OnClick" CssClass="btn btn-success" Text="Open/View Path"/>
                </div>
            </div>
            <br/><br/>
            <div class="row">
                <div class="col-md-6">
                    <asp:Panel DefaultButton="Button1" Runat="Server">
                        <h3>Anagrafiche Upload:</h3>
                    <asp:Label runat="server" ID="informer"></asp:Label>
                    <div style="margin-left:20px; margin-bottom:20px;">
                            <label for="txt_mesec">Month:</label>
                        <asp:TextBox runat="server" ID="txt_mesec" min="1" max="12" ValidationGroup="one" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="txt_mesec"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must enter Month."
                                                    ValidationGroup="one"></asp:RequiredFieldValidator>
                        <br/>
                        <label for="txt_godina">Year:</label>
                        <asp:TextBox runat="server" ID="txt_godina"  ValidationGroup="one" min="2019" max="2025" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="txt_godina"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must enter Year."
                                                    ValidationGroup="one"></asp:RequiredFieldValidator>
                        <br/><br/>
                        <asp:FileUpload ID="Upload" ValidationGroup="one"  runat="server" />
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="Upload"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must put Anagrafiche File."
                                                    ValidationGroup="one"></asp:RequiredFieldValidator>
                        <br/>
                        <asp:Button ID="Button1" ValidationGroup="one" OnClick="btnUpload_Click" CssClass="btn btn-success" runat="server" Text="Upload Anagrafiche" />
                    </div>
                    </asp:Panel>
                </div>
                <div class="col-md-6">
                    <asp:Panel DefaultButton="Button2" Runat="Server">				

                    <h3>Gusti Upload:</h3>
                    <asp:Label runat="server" ID="informer_gusti"></asp:Label>
                    <div style="margin-left: 20px; margin-bottom: 20px;">
                        <label for="txt_mesec_gusti">Month:</label>
                        <asp:TextBox runat="server"  ID="txt_mesec_gusti"  ValidationGroup="two" min="1" max="12" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="txt_mesec_gusti"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must enter Month."
                                                    ValidationGroup="two"></asp:RequiredFieldValidator>
                        <br/>
                        <label for="txt_godina_gusti">Year:</label>
                        <asp:TextBox runat="server"  ID="txt_godina_gusti"  ValidationGroup="two"  min="2019" max="2025" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="txt_godina_gusti"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must enter Year."
                                                    ValidationGroup="two"></asp:RequiredFieldValidator>
                        <br/><br/>
                        <asp:FileUpload ID="FileUpload_Gusti"  ValidationGroup="two" runat="server" />
                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="FileUpload_Gusti"
                                                    Display="Dynamic" EnableClientScript="False" ErrorMessage="You must put Anagrafiche File."
                                                    ValidationGroup="two"></asp:RequiredFieldValidator>
                        <br/>
                        <asp:Button ID="Button2" ValidationGroup="two" OnClick="btnUpload_Gusti_Click" CssClass="btn btn-success" runat="server" Text="Upload Gusti" />
                    </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
                
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>

</body>
</html>
