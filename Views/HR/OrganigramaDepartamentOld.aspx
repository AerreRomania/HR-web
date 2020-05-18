<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganigramaDepartamentOld.aspx.cs" Inherits="OrganigramaDepartament" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hOrganigramaDepartament" runat="server">
    <title>Organigramma</title>
    <link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body{
            height:1000px;
        }
    </style>
</head>
<body>
    <form id="fOrganigramaDepartament" runat="server">
        <table cellpadding="0" cellspacing="0">
            <tr>
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
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lTotal" runat="server" Text="Totale: "></asp:Label>
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