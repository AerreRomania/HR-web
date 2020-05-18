<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profil.aspx.vb" Inherits="profil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Machines</title>
    <meta charset="UTF-8" />
            <link rel="stylesheet" href="css/Content/profile.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/colorpicker.css" />
    <link rel="stylesheet" href="css/datepicker.css" />
    <link rel="stylesheet" href="css/uniform.css" />
    <link rel="stylesheet" href="css/select2.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fonts/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.1.19/css/materialdesignicons.min.css"/>
        <link rel="stylesheet" href="css/sectors.css"/>

    <script src="./js/jquery-1.12.4.min.js"></script>


    <style>
        .header-fixed {
            position: fixed;
        }

        .results tr[visible='false'], .no-result {
            display: none;
        }

        .results tr[visible='true'] {
            display: table-row;
        }

        .search {
            right: 35px;
            top: 6px;
            height: 15px;
            position: absolute;
        }

        span {
            font-size: 12pt;
        }

        .form-horizontal .controls {
            margin-left: 50px;
        }

        .controls_online{
            margin-left:0px;
        }


        .labelpadding {
            /*margin-left: 50px;*/
        }

       #user_details td {
            padding: 5px;
        }

       #OnlineUsers_Grid td{
           text-align:center;
       }
    </style>

</head>
<body>


        


    <form action="#" method="get" class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                         <%-- HEADER START--%>
        <div id="header">
            <a class="navbar-brand" href="./Dashboard.aspx">
                <img alt="logo" class="logo" src="images/logo.svg" />
            </a>
            <div class="container">
                <div class="half">
                    <label for="profile2" class="profile-dropdown">
                        <input type="checkbox" id="profile2">
                        <img src="https://cdn0.iconfinder.com/data/Images/icons/avatars-3/512/avatar_hipster_guy-512.png">
                        <span>
                            <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" style="color: white;" />
                        </span>
                        <label for="profile2"><i class="mdi mdi-menu" style="color: white;"></i></label>
                        <ul>
                            <li><a href="#"><i class="mdi mdi-email-outline"></i>Messages</a></li>
                            <li><a href="./profil.aspx"><i class="mdi mdi-account"></i>Account</a></li>
                            <li><a href="#"><i class="mdi mdi-settings"></i>Settings</a></li>
                            <li><a href="javascript:document.getElementById('LoginStatus1').click();" id="logout" ><i class="mdi mdi-logout"></i>Logout</a></li>
                        </ul>
                        <asp:LoginStatus ID="LoginStatus1" ClientIDMode="static" runat="server" CssClass="" style="color: silver;display:none;" />                           
                    </label>
                </div>
            </div>
                
            <br />
        </div>


                <div id="content">

                    <div class="container-fluid">
                        <hr />
                        <div class="row-fluid">
                            <div class="span2"></div>
                            <div class="span3">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-align-justify"></i></span>
                                        <h5>Profile Details</h5>
                                    </div>
                                    <%-- NAME --%>

                                    <div class="widget-content nopadding">
                                        <div class="control-group">
                                            <div class="controls">

                                                <asp:Table runat="server" ID="user_details">
                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Username:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_username"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>

                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Full Name:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_fullname"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>

                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Type of Job:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_job"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>

                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Account Created:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_createddate"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>

                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Last Login:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_lastlogin"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>

                                                    <asp:TableRow>
                                                        <asp:TableCell><span>Telephone:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_telephone"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell><span>E-mail:</span></asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label runat="server" CssClass="labelpadding" ID="profil_email"></asp:Label></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>


                                                <br />
                                                <br />
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                                <br />
                                                <asp:Label ID="lblMessage" CssClass="labelpadding" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>

                            <div class="span2">

                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-align-justify"></i></span>
                                        <h5>Permissions:</h5>
                                    </div>

                                    <div class="widget-content nopadding">
                                        <div class="control-group">
                                            <div class="controls">
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>

                            <div class="span2">

                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-align-justify"></i></span>
                                        <h5>Online Users:</h5>
                                    </div>

                                    <div class="widget-content nopadding">
                                        <div class="control-group">
                                            <div class="">

                                                <asp:GridView
                                                    runat="server"
                                                    CssClass="table table-bordered data-table results"
                                                    DataSourceID="CustomersSqlDataSourceArticle"
                                                    AutoGenerateColumns="true"
                                                    AllowPaging="false"
                                                    AllowSorting="false"
                                                    ID="OnlineUsers_Grid"
                                                    ShowHeader="false">
                                                </asp:GridView>

                                                <asp:SqlDataSource ID="CustomersSqlDataSourceArticle"
                                                    SelectCommand="Select [FullName],[OnlineStatus] From [Users] Where OnlineStatus='True'"
                                                    ConnectionString="<%$ ConnectionStrings:DefaultConnection%>"
                                                    runat="server"></asp:SqlDataSource>

                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>



    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-colorpicker.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.toggle.buttons.js"></script>
    <script src="js/masked.js"></script>
    <script src="js/jquery.uniform.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/matrix.js"></script>
    <script src="js/matrix.form_common.js"></script>
    <script src="js/wysihtml5-0.3.0.js"></script>
    <script src="js/jquery.peity.min.js"></script>
    <script src="js/bootstrap-wysihtml5.js"></script>

    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/matrix.tables.js"></script>
    <script>
        $('.textarea_editor').wysihtml5();
    </script>
</body>
</html>
