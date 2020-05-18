<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogInInformator.aspx.cs" Inherits="LogInInformator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>SimplexWEB - LogIn Error</title>
    <link runat="server" rel="shortcut icon" href="./images/favicon.ico" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="./images/favicon.ico" type="Images/Image/ico" />
        <script src="js/jquery-2.1.1.js"></script>

    <link href="css/Content/bootstrap.css" rel="stylesheet" />
    <link href="css/Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="js/Scripts/bootstrap.min.js"></script>
    <link href="css/Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="js/Scripts/bootstrap.min.js"></script>
    <script src="js/angular.js"></script>
    <script src="js/ui-bootstrap-tpls-0.11.0.js"></script>    


    <style>
        .jumbotron {

             color: inherit;
            background-size: 100%;
            height: 100%;
            text-align: center;
            margin-bottom: 30px;
            padding-top: 48px;
            padding-bottom: 48px;
            background-color: silver;
            background-repeat: no-repeat;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container-fluid">
        <div class="jumbotron" style="-webkit-box-shadow: 0px 4px 7px #ccc">
          
            <asp:label ID="lblOlimpTit1" runat="server" ForeColor="MidnightBlue" Text="Olimpias group" style="top: 11px; left: 64px; bottom: 789px; font-family: Arial; font-weight: bold; font-size: xx-large; right: -195px;"></asp:label>    
            <br />

            <h4>You are not logged in. Please go back to log in page.</h4>
            
            <br /><br />

            <asp:Button runat="server" ID="btnGoBack" OnClick="btnGoBack_Click" text="Go back" Height="33px" Width="146px" style="margin-left:20px; margin-right:20px"/>

        </div>
    </div>
    </div>
    </form>
</body>
</html>
