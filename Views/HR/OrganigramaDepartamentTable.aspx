<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganigramaDepartamentTable.aspx.cs" Inherits="OrganigramaDepartament" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hOrganigramaDepartament" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Organigramma</title>
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body{
            /*height:1000px;*/
        }

        td.rAntetSecund{
            text-transform:uppercase;
        }
        td.rAntet {
    background-color: #FFC107;
    color: black;
    font: 11px/17px Arial, Helvetica, sans-serif;
    border: 1px solid #ffffff;
    /*font-weight: 600;*/
    text-align: center;
    padding-left: 10px;
    padding-right: 10px;
    font-weight:600;

}
        td.rAntetSecundAlb {
    background-color: #e2e2e2;
    font: 11px/17px Arial, Helvetica, sans-serif;
    /* color: #294460; */
    color: black;
    border: 1px solid #ffffff;
    /*font-weight: 600;*/
        padding-left: 10px;
    padding-right: 10px;
    text-align: left;
}

        .rAntet{
            width:225px!important;
        }
    </style>
</head>
<body>
    <form id="fOrganigramaDepartament" runat="server">
        <table cellpadding="0" cellspacing="0">
          <%--  <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td style="width: 100px;">
                                <asp:HyperLink ID="hlOrganigrama" runat="server" CssClass="meniuMain" NavigateUrl="Organigrama.aspx" Width="120px">&lt;Main&gt;</asp:HyperLink>
                           </td>
                           <td align="center">
                                <asp:Label ID="lOrganigramaDepartament" runat="server" CssClass="principal" Text="Organigramma"></asp:Label>
                           </td> 
                        </tr>
                    </table>
                </td>
            </tr>--%>
            <tr>
                <td align="left">
                    <asp:Label ID="lTotal" runat="server" Text="TOTALE DIPENDENTI: " style="font-size:13pt;padding-left:5px;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="5" runat="server" id="tOrganigramaDepartament">
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>