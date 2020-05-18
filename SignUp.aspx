<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SingUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SimplexWEB SignUp - Olimpias group</title>
    <link runat="server" rel="shortcut icon" href="./images/favicon.ico" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="./images/favicon.ico" type="Images/Image/ico" />
    <link href="css/Content/bootstrap.css" rel="stylesheet" />
    <link href="css/Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="js/Scripts/bootstrap.min.js"></script>
   
    <style type="text/css">

        .auto-style2 {
            font-family: Arial;
            font-style: italic;
            font-size: x-small;
        }

        .auto-style3 {
            margin-right: 0px;
        }

        .auto-style4 {
            text-decoration: line-through;
             -webkit-touch-callout: none;
             -webkit-user-select: none;
             -moz-user-select: none;
             -ms-user-select: none;
             user-select: none;
            font-family: "Segoe UI";
            color: #000080;
            }

        .auto-style6 {
            font-family: "Segoe UI";
            font-size: 11pt;
        }

        .auto-style7 {
            font-family: "Segoe UI";
            font-style: italic;
            font-size: medium;
        }
        .auto-style8 {
            text-align: center;
        }

        .jumbotron {

             max-width: 480px;
             margin: 0px auto;
             vertical-align:middle;
             text-align: center;
             background: #ddd;
             padding: 30px 0;
             border-radius: 5px;
             background-color:rgba(255,255,255,.9)!important;
             font: 13px/1.55 'Open Sans', Helvetica, Arial, sans-serif;
             font-style: normal;
             font-variant: normal;
             font-weight: normal;
             font-stretch: normal;
             font-size: 13px;
             line-height: 1.55;
             font-family: "Open Sans", Helvetica, Arial, sans-serif;
      }

     .form {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
       display: block;
       padding: 20px 30px;
       border-bottom: 1px solid rgba(0,0,0,.1);
       border-top: 1px solid rgba(0,0,0,.1);
       background: rgba(248,248,248,.9);
       font-size: 25px;
       font-weight: 300;
       font-style: normal;
       font-variant: normal;
       font-weight: normal;
       color: #232323;
       font-stretch: normal;
        }
             


        h4 {
    float:left;
    display: block;
    font-size: 20px;
    font-weight: 300;
    color: #232323;
       }


 .fieldtext {
    padding: 3px 40px 0px 10px;
    width: 70%;
    border: 1px solid #666;
    color: #666;
    text-align: left;
    outline: none;
    font-size: 18px;
    margin-top: 4%;
    font-weight: 300;
    border-radius: 4px;
    border-color: #d8d8d8;
    font-style: normal;
    font-variant: normal;
    font-weight: normal;
    font-stretch: normal;
    line-height: 1.55;
    font-family: "Open Sans", Helvetica, Arial, sans-serif;
}


body{
             max-width: 480px;
             margin: 0px auto;
             vertical-align:middle;
             text-align: center;
             background-image: url(../images/bg-blue.jpg);
             padding: 30px 0;
             border-radius: 5px;
             background-color:rgba(255,255,255,.9)!important;
             font: 13px/1.55 'Open Sans', Helvetica, Arial, sans-serif;
             font-style: normal;
             font-variant: normal;
             font-weight: normal;
             font-stretch: normal;
             font-size: 13px;
             line-height: 1.55;
             font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

table { 
  border-collapse: collapse; 
  margin: 0 auto;
}
tr:nth-of-type(odd) { 
}

td, th { 
  padding: 6px; 
  text-align: left; 
}

	
  .auto-style5  {
             margin-top: -30px!important;
             max-width: 480px;
             margin: 0px auto;
             vertical-align:middle;
             text-align: center;
             background: #ddd;
             padding: 30px 0;
             border-radius: 5px;
             background-color:rgba(255,255,255,.9)!important;
             font: 13px/1.55 'Open Sans', Helvetica, Arial, sans-serif;
             font-style: normal;
             font-variant: normal;
             font-weight: normal;
             font-stretch: normal;
             font-size: 13px;
             line-height: 1.55;
             font-family: "Open Sans", Helvetica, Arial, sans-serif;
             
            }



        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {

            /* Force table to not be like tables anymore */
            table, thead, tbody, th, td, tr {
                display: block;
                width: 200px;
            }

                /* Hide table headers (but not display: none;, for accessibility) */
                thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

            /*tr { border: 1px solid #ccc; }*/

            td {
                /* Behave  like a "row" */
                border: none;
                /*border-bottom: 1px solid #eee;*/
                position: relative;
                /*padding-left: 50%;*/
            }

                td:before {
                    /* Now like a table header */
                    position: absolute;
                    /* Top/left values mimic padding */
                    top: 6px;
                    left: 6px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                }
        }

        #footer{
    border-bottom: 1px solid rgba(0,0,0,.1);
    padding-top:50px;
    padding-bottom:30px;
}



.button {
            width:200px;
            background-color: #2da5da;
            opacity: 0.8;
            transition: opacity 0.2s;
            -o-transition: opacity 0.2s;
            -moz-transition: opacity 0.2s;
            -webkit-transition: opacity 0.2s;
             margin-bottom: -10px!important;
            height: 39px;
            overflow: hidden;
            margin: 0 auto;
            padding: 0 41px;
            outline: none;
            border: 0;
            font: 300 15px/39px 'Open Sans', Helvetica, Arial, sans-serif;
            text-decoration: none;
            color: #fff;
            cursor: pointer;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
             -moz-box-sizing: border-box;    /* Firefox, other Gecko */
            box-sizing: border-box;         /* Opera/IE 8+ */
        }




.button-secundary{
    width:200px;
    background-color: #b3b3b3;
    height: 39px;
    overflow: hidden;
    margin-top: -40px!important;
    margin: 0 auto;
    padding: 0 36px;
    padding-right: 35px!important;
    outline: none;
    border: 0;
    font: 300 15px/39px 'Open Sans', Helvetica, Arial, sans-serif;
    text-decoration: none;
    color: #fff;
    cursor: pointer;
    -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
    -moz-box-sizing: border-box;    /* Firefox, other Gecko */
    box-sizing: border-box;         /* Opera/IE 8+ */
        }

h3 {

    display: block;
    font-size: 20px;
    font-weight: 300;
    color: #232323;

   }


    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />

    <!-- SIGN UP -->      
             <div class="container-fluid">             
               <div class="auto-style5" style="background-color: white; -webkit-box-shadow: 0px 4px 7px #ccc; z-index: auto; position: relative;" aria-atomic="False">
                    <h2>Registration page</h2>
                   
                     <br /><br />
                     <asp:UpdatePanel runat="server" ID="updatePn" >
                         <ContentTemplate>
                             <div class="auto-style8">
                                 <asp:Label ID="lblAlert" runat="server" CssClass="auto-style7" Font-Size="12px" ForeColor="Red" />
                                 <br/>
                             </div>



  <table class="table1">
  <tr>
    <th class="tg-yw4l"><h4>Username:</h4></th>
    <th class="tg-yw5l"><asp:TextBox runat="server" id="txtUser" style="width:200px;" CssClass="fieldtext" /></th>
  </tr>

  <tr>
    <th class="tg-yw4l"><h4>Password:</h4></th>
    <th class="tg-yw5l"> <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" style="width:200px;" CssClass="fieldtext"/></th>
  </tr>
  <tr>
    <td class="tg-yw4l"><h4>Full Name:</h4></td>
    <td class="tg-yw5l"><asp:TextBox ID="txtName" runat="server"  style="width:200px;" CssClass="fieldtext"/></td></tr>

      <tr>
    <td class="tg-yw4l"><h4>Re-Password:</h4></td>
    <td class="tg-yw5l"><asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" style="width:200px;" CssClass="fieldtext"/></td>
  </tr>
  <tr>
    <td class="tg-yw4l"><h4>Work Place:</h4></td>
    <td class="tg-yw4l"> <asp:DropDownList runat="server" id="ddlJobs" style="width:200px; height:35px!important;" CssClass="fieldtext"/></td></tr>

      <tr>
    <td class="tg-yw4l"><h4>Enter Code:</h4></td>
    <td class="tg-yw4l"><asp:TextBox ID="txtEnterSCode" runat="server" style="width:200px; text-align:center!important;" CssClass="fieldtext" /></td>
  </tr>

      <tr>
          <td> <asp:Button ID="btnGetCode" runat="server" CssClass="auto-style6" Height="30px" OnClick="GetSecurityCode" Text="Get code" Width="100" /></td>
          <td> <asp:Label ID="lblSecurityCode" runat="server" CssClass="auto-style4" Font-Bold="False" Font-Size="20px" ForeColor="Crimson" BackColor="#CCFFCC">Get code before start</asp:Label></td>
      </tr>
      </br></br>
          
</table>                       
                        <div id="footer">        
                       <asp:Button ID="btnCheck" runat="server" CssClass="button"  OnClick="CreateAccount" style="margin:0 auto!important;" text="Create account"/>
                            <br />
                       <asp:Button ID="btnGoBack" runat="server" CssClass="button-secundary" OnClick="CreateAccount" style="margin:0 auto!important; margin-top: 2px!important; margin-right: 3px!important;" text="Go back"/>          
                           
                        </div>
  
                             





                             <br />
                             <br />
                              <p>&copy; 2016 Olimpias Knitting Serbia<p> 
                         </ContentTemplate>
                          
                     </asp:UpdatePanel>
                 </div>
            </div>
    </form>
</body>
</html>
