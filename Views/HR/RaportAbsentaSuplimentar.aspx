<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportAbsentaSuplimentar.aspx.cs" Inherits="RaportAbsentaSuplimentar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportAbsentaSuplimentar" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Ore assenza / Straordinario</title>
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body{
            height:1000px;
                zoom: 82%;
                -ms-zoom: 82%;
                -moz-zoom: 82%;
                -webkit-zoom:82%;
        }
    </style>
</head>
<body>
    <form id="fRaportAbsentaSuplimentar" runat="server">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td>
                                <asp:Label ID="lRaportAbsentaSuplimentar" runat="server" CssClass="principal" Text="Ore assenza / Straordinario"></asp:Label>
                           </td> 
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Table ID="tRaportAbsentaSuplimentar" runat="server" CellPadding="0" CellSpacing="0" BorderWidth="1px"></asp:Table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>