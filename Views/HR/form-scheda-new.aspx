<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-scheda-new.aspx.vb" Inherits="Views.HR.form_timbrature_new" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes" />

    <meta charset="utf-8" />
    <title>Scheda Dipedenti</title> 
    <link rel="stylesheet" href="~/css/scheda-dipedenti.css" /> 

<style type="text/css">
     
body {
    height: 750px;
}

.crud_panel {
    display: none;
}

#lblTotRows {
    display: none;
}

.form-control {
    width: 200px;
    border: 1px solid #03A9F4;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px #03A9F4;
    box-shadow: inset 0 1px 1px #03A9F4;
    height: 30px;
    margin-top: 3px;
}

span.principal {
    color: #ffffff;
    font-size: 36px;
    margin-left: 5px;
    text-transform: uppercase;
}

.principal {
    height: 50px;
    background: #c23749;
    color: yellow;
}

.labeltxt {
    font-size: 13px;
    border-bottom: 1px dotted #888888;
}

.RadGrid .rgClipCells .rgHeader, .RadGrid .rgClipCells .rgFilterRow > td, .RadGrid .rgClipCells .rgRow > td, .RadGrid .rgClipCells .rgAltRow > td, .RadGrid .rgClipCells .rgEditRow > td, .RadGrid .rgClipCells .rgFooter > td {
    font-size: 11px !important;
    padding-left: 5px !important;
    padding-right: 5px !important;
}

.inputtxt {
    margin-right: 20px;
    width: 158px;
    font-size: 12px;
}

*:not(.icon-th):not(.icon) {
    /*font-family: Arial, sans-serif !important;*/
    font-family: "Calibri", "Candara", "Segoe", "Segoe UI", Optima, Arial, sans-serif;
    font-weight: normal;
}

.header-fixed {
    position: fixed;
}

.results tr[visible='false'], .no-result {
    display: none;
}

.results tr[visible='true'] {
    display: table-row;
}

.RadGrid_Default .rgHeader a {
    font-weight: 600;
}

.RadGrid_Default .rgSelectedRow > td {
    border-bottom-color: #dc1d1d !important;
}

.RadGrid_Default .rgMasterTable .rgSelectedCell, .RadGrid_Default .rgSelectedRow {
    background: #c23749 !important;
    color: black;
}

#lblTotRows {
    padding-right: 10px;
    font-weight: 600;
}

.c_header {
    font-size: 14px;
    text-decoration: underline;
    color: darkblue;
    font-weight: 600 !important;
}

.c_big_header {
    text-align: center;
    background-color: #ff581a;
    color: white;
    padding-top: 5px;
    padding-bottom: 5px;
    font-weight: 600 !important;
}

.c_gray_header {
    text-align: center;
    background-color: silver;
    font-weight: 600 !important;
    color: black;
}

.c_yellow_header {
    text-align: center;
    background-color: #ffff006e;
    font-weight: 600 !important;
    color: black;
}

.c_normal_label {
    font-size: 12px;
    color: darkblue;
    padding-right: 5px;
    width: 100px;
    display: -webkit-inline-box;
    font-weight: 600 !important;
}

.c_normal_text {
    border: 1px solid #ccc;
    font-size: 12px;
    padding-left: 5px;
    padding-right: 5px;
}

.c_nome_prenome {
    width: 360px;
    display: -webkit-inline-box;
}

.a4_main {
    width: 100%;
    height: 100%;
    position: absolute;
    /*visibility:hidden;*/
    display: none;
    background: #c0c0c026;
    top: 0px;
    /*padding-top: 50px;*/
    overflow: hidden;
}

.a4 .row {
    margin-right: 0px;
    margin-left: 0px;
}

.a4 {
    background: white;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin: 0 auto;
    height: 800px;
    width: 777px;
    position: relative;
    z-index: 41;
    /*top: 25%;*/
    /*padding: 30px;*/
    padding-top: 20px;
    -webkit-box-shadow: 0 0 10px rgba(0,0,0,0.4);
    -moz-box-shadow: 0 0 10px rgba(0,0,0,0.4);
    box-shadow: 0 0 10px rgba(0,0,0,0.4);
}

.a4_close {
    right: 10px;
    top: 0px;
    font-size: 20px;
    font-weight: 600 !important;
    cursor: pointer;
    position: absolute;
}

.btn-primary {
    width: 80px;
    margin-top: 3px;
    margin-left: 5px;
    padding-left: 10px;
    padding-right: 10px;
    border-radius: 5px;
    background-color: #c23749;
}

#pnl_insert_close {
    font-weight: 800;
    font-size: 24px;
    right: 50px;
    top: 30px;
    position: absolute;
    cursor: pointer;
}

#pnl_insert span {
    width: 135px;
    display: inline-block;
    padding: 0px;
    text-align: left;
    margin-top: 7px;
}

#pnl_insert input {
    border-radius: 5px;
    border-radius: 5px;
    /* border-width: 1px; */
    border-color: #e0e0e0;
    border-style: groove;
}

.button {
    border: none;
    color: black;
    padding: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    background: none;
    margin-left: 10px;
}

    .button:hover {
        color: darkorange;
        transition-delay: 0.1s;
    }


    .button .span {
        float: left;
        width: 20px;
        height: 20px;
        margin-right: 0px;
    }

#img_profile {
    width: 64px;
    position: absolute;
    right: 10px;
    height: 64px;
}

#cv_profile {
    position: absolute;
    z-index: 99999;
    top: 90px;
    right: 0;
}

.disabled {
    pointer-events: none;
    cursor: default;
    color: darkgray;
}

    </style>
</head>
<body>
    <form id="form1" runat="server" novalidate="novalidate">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                <asp:ScriptReference Path="~/js/default-passive-events.js" />
                <asp:ScriptReference Path="~/js/html2canvas.min.js" />
                <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/printThis.js" /> 
            </Scripts>
            
        </telerik:RadScriptManager>
    

        <asp:UpdatePanel runat="server">
 
            <ContentTemplate>
                <script type="text/javascript">

                    var prm = Sys.WebForms.PageRequestManager.getInstance();

                    prm.add_endRequest(function () {
                        createDataTable();
                    });

                    createDataTable();

                    function createDataTable() {
                        $('#<%= RadGrid1.ClientID %>').DataTable();
                    }
                    </script>
         <%--   <Triggers>
                <asp:PostBackTrigger ControlID="btnCertificateUpload" />
            </Triggers>--%>

                <div class="container-fluid main_grid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div style="margin-bottom: 10px; margin-top: 10px;">
                                <input type="text" class="search form-control col-xs-4 col-lg-2" placeholder="Search:" />

                                <a class="button" id="btn_edit" href="#" ><span class="icon_edit">
                                    <img src="../../Images/icons/edit.png" style="float: left; width: 20px; height: 20px; margin-right: 5px" /></span>Edit</a>
                                <a class="button" id="btn_add" href="#"><span class="icon_new">
                                    <img src="../../Images/icons/add1.png" style="float: left; width: 20px; height: 20px; margin-right: 5px" /></span>Add New</a>
                                <a class="button" id="btn_change" href="#"><span class="icon_change">
                                    <img src="../../Images/icons/reload.png" style="float: left; width: 20px; height: 20px; margin-right: 5px" /></span>Show In-Active</a>
                                <a class="button" id="btn_change_inactive" href="#" style="display: none;"><span class="icon_change">
                                    <img src="../../Images/icons/reload.png" style="float: left; width: 20px; height: 20px; margin-right: 5px" /></span>Show Active</a>
                            </div>
                            <asp:Label runat="server" ID="lblTotRows" ClientIDMode="static" Style="float: right;"></asp:Label>

                                 <div id="rdg1">
                            <h4>Active Persons:</h4>
                            <telerik:RadGrid ID="RadGrid1" Style="overflow: auto; max-width: 1560px; height:600px;" CssClass="results" OnPreRender="gvCktMap_PreRender" EnableAriaSupport="True" DataSourceID="AngajatiView" runat="server" AllowSorting="True" ShowGroupPanel="True">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowDragToGroup="True">
                                    <ClientEvents OnRowSelected="RowSelected" />
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="true" SaveScrollPosition="true" ScrollHeight="550px" UseStaticHeaders="True" />
                                </ClientSettings>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="CodAngajat" DataSourceID="AngajatiView">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Marca" FilterControlAltText="Filter Marca column" HeaderText="R-num:" SortExpression="Marca" UniqueName="Marca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Nume" FilterControlAltText="Filter Nume column" HeaderText="Nome:" SortExpression="Nume" UniqueName="Nume">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Prenume" FilterControlAltText="Filter Prenume column" HeaderText="Cognome:" SortExpression="Prenume" UniqueName="Prenume">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NumarIdentificarePersonala" FilterControlAltText="Filter NumarIdentificarePersonala column" HeaderText="N. Identificazione:" SortExpression="NumarIdentificarePersonala" UniqueName="NumarIdentificarePersonala">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Departament" FilterControlAltText="Filter Departament column" HeaderText="Reparto:" SortExpression="Departament" UniqueName="Departament">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Linie" FilterControlAltText="Filter Linie column" HeaderText="Linie:" SortExpression="Linie" UniqueName="Linie" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Incadrare" FilterControlAltText="Filter Incadrare column" HeaderText="Incadrare:" SortExpression="Incadrare" UniqueName="Incadrare">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id" DataType="System.Int32" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Strada" FilterControlAltText="Filter Strada column" HeaderText="Strada" SortExpression="Strada" UniqueName="Strada">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLocalitate" FilterControlAltText="Filter IdLocalitate column" HeaderText="IdLocalitate" SortExpression="IdLocalitate" UniqueName="IdLocalitate" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataNasterii" FilterControlAltText="Filter DataNasterii column" HeaderText="DataNasterii" SortExpression="DataNasterii" UniqueName="DataNasterii" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Somaj" FilterControlAltText="Filter Somaj column" HeaderText="Somaj" SortExpression="Somaj" UniqueName="Somaj">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataAngajarii" FilterControlAltText="Filter DataAngajarii column" HeaderText="DataAngajarii" SortExpression="DataAngajarii" UniqueName="DataAngajarii" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataNedeterminat" FilterControlAltText="Filter DataNedeterminat column" HeaderText="DataNedeterminat" SortExpression="DataNedeterminat" UniqueName="DataNedeterminat" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdTipPostDeLucru" FilterControlAltText="Filter IdTipPostDeLucru column" HeaderText="IdTipPostDeLucru" SortExpression="IdTipPostDeLucru" UniqueName="IdTipPostDeLucru" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataExpirareContract" DataType="System.DateTime" FilterControlAltText="Filter DataExpirareContract column" HeaderText="DataExpirareContract" SortExpression="DataExpirareContract" UniqueName="DataExpirareContract">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataExpirareProba" FilterControlAltText="Filter DataExpirareProba column" HeaderText="DataExpirareProba" SortExpression="DataExpirareProba" UniqueName="DataExpirareProba" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdIntervalDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdIntervalDeLucru column" HeaderText="IdIntervalDeLucru" SortExpression="IdIntervalDeLucru" UniqueName="IdIntervalDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdPostDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdPostDeLucru column" HeaderText="IdPostDeLucru" SortExpression="IdPostDeLucru" UniqueName="IdPostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Sex" FilterControlAltText="Filter Sex column" HeaderText="Sex" SortExpression="Sex" UniqueName="Sex">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLoculNasterii" FilterControlAltText="Filter IdLoculNasterii column" HeaderText="IdLoculNasterii" SortExpression="IdLoculNasterii" UniqueName="IdLoculNasterii" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdIncadrare" FilterControlAltText="Filter IdIncadrare column" HeaderText="IdIncadrare" SortExpression="IdIncadrare" UniqueName="IdIncadrare" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdNivelStudiu" FilterControlAltText="Filter IdNivelStudiu column" HeaderText="IdNivelStudiu" SortExpression="IdNivelStudiu" UniqueName="IdNivelStudiu" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdBanca" DataType="System.Int32" FilterControlAltText="Filter IdBanca column" HeaderText="IdBanca" SortExpression="IdBanca" UniqueName="IdBanca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StareCivila" FilterControlAltText="Filter StareCivila column" HeaderText="StareCivila" SortExpression="StareCivila" UniqueName="StareCivila">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NumarTelefon" FilterControlAltText="Filter NumarTelefon column" HeaderText="NumarTelefon" SortExpression="NumarTelefon" UniqueName="NumarTelefon">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CC" FilterControlAltText="Filter CC column" HeaderText="CC" SortExpression="CC" UniqueName="CC">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdDepartament" FilterControlAltText="Filter IdDepartament column" HeaderText="IdDepartament" SortExpression="IdDepartament" UniqueName="IdDepartament" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdEchipa" FilterControlAltText="Filter IdEchipa column" HeaderText="IdEchipa" SortExpression="IdEchipa" UniqueName="IdEchipa" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AdresaEmail" FilterControlAltText="Filter AdresaEmail column" HeaderText="AdresaEmail" SortExpression="AdresaEmail" UniqueName="AdresaEmail">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLinie" FilterControlAltText="Filter IdLinie column" HeaderText="IdLinie" SortExpression="IdLinie" UniqueName="IdLinie" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        
                                        <telerik:GridBoundColumn DataField="DeteIndete" FilterControlAltText="Filter DeteIndete column" HeaderText="DeteIndete" SortExpression="IdLinie" UniqueName="DeteIndete" DataType="System.Int32">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Banca" FilterControlAltText="Filter Banca column" HeaderText="Banca" SortExpression="Banca" UniqueName="Banca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Echipa" FilterControlAltText="Filter Echipa column" HeaderText="Echipa" ReadOnly="True" SortExpression="Echipa" UniqueName="Echipa">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IntervalDeLucru" FilterControlAltText="Filter IntervalDeLucru column" HeaderText="IntervalDeLucru" SortExpression="IntervalDeLucru" UniqueName="IntervalDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Localitate" FilterControlAltText="Filter Localitate column" HeaderText="Localitate" SortExpression="Localitate" UniqueName="Localitate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NivelStudiu" FilterControlAltText="Filter NivelStudiu column" HeaderText="NivelStudiu" SortExpression="NivelStudiu" UniqueName="NivelStudiu">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PostDeLucru" FilterControlAltText="Filter PostDeLucru column" HeaderText="PostDeLucru" SortExpression="PostDeLucru" UniqueName="PostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TipPostDeLucru" FilterControlAltText="Filter TipPostDeLucru column" HeaderText="TipPostDeLucru" SortExpression="TipPostDeLucru" UniqueName="TipPostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LoculNasterii" FilterControlAltText="Filter LoculNasterii column" HeaderText="LoculNasterii" SortExpression="LoculNasterii" UniqueName="LoculNasterii">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CodAngajat" FilterControlAltText="Filter CodAngajat column" HeaderText="CodAngajat" SortExpression="CodAngajat" UniqueName="CodAngajat" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CodSistem" FilterControlAltText="Filter CodSistem column" HeaderText="CodSistem" SortExpression="CodSistem" UniqueName="CodSistem" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataLichidarii" DataType="System.DateTime" FilterControlAltText="Filter DataLichidarii column" HeaderText="DataLichidarii" SortExpression="DataLichidarii" UniqueName="DataLichidarii">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataMaternitate" DataType="System.DateTime" FilterControlAltText="Filter DataMaternitate column" HeaderText="DataMaternitate" SortExpression="DataMaternitate" UniqueName="DataMaternitate">
                                        </telerik:GridBoundColumn>
                                        
                                        <telerik:GridBoundColumn DataField="ImageUrl" FilterControlAltText="Filter ImageUrl column" HeaderText="ImageUrl" SortExpression="ImageUrl" UniqueName="ImageUrl" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CvUrl" FilterControlAltText="Filter CvUrl column" HeaderText="CvUrl" SortExpression="CvUrl" UniqueName="CvUrl" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        
                                        <telerik:GridBoundColumn DataField="IdBadge" FilterControlAltText="Filter IdBadge column" HeaderText="IdBadge" SortExpression="IdBadge" UniqueName="IdBadge" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StartShift" FilterControlAltText="Filter StartShift column" HeaderText="StartShift" SortExpression="StartShift" UniqueName="StartShift" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EndShift" FilterControlAltText="Filter EndShift column" HeaderText="EndShift" SortExpression="EndShift" UniqueName="EndShift" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>

                                 <div id="rdg2" style="display: none;">
                            <h4>In-Active Persons:</h4>
                            <telerik:RadGrid ID="RadGrid2" Style="overflow: auto; max-width: 1560px; height:600px;" CssClass="results" OnPreRender="gvCktMap_PreRenderQ" EnableAriaSupport="True" DataSourceID="AngajatiOdpusteni" runat="server" AllowSorting="True" ShowGroupPanel="True">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowDragToGroup="True">
                                    <ClientEvents OnRowSelected="RowSelected" />
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="true" SaveScrollPosition="true" ScrollHeight="550px" UseStaticHeaders="True" />
                                </ClientSettings>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="CodAngajat" DataSourceID="AngajatiOdpusteni">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Marca" FilterControlAltText="Filter Marca column" HeaderText="R-num:" SortExpression="Marca" UniqueName="Marca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn  DataField="Nume" FilterControlAltText="Filter Nume column" HeaderText="Nome:" SortExpression="Nume" UniqueName="Nume">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Prenume" FilterControlAltText="Filter Prenume column" HeaderText="Cognome:" SortExpression="Prenume" UniqueName="Prenume">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NumarIdentificarePersonala" FilterControlAltText="Filter NumarIdentificarePersonala column" HeaderText="N. Identificazione:" SortExpression="NumarIdentificarePersonala" UniqueName="NumarIdentificarePersonala">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Departament" FilterControlAltText="Filter Departament column" HeaderText="Reparto:" SortExpression="Departament" UniqueName="Departament">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Linie" FilterControlAltText="Filter Linie column" HeaderText="Linie:" SortExpression="Linie" UniqueName="Linie" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Incadrare" FilterControlAltText="Filter Incadrare column" HeaderText="Incadrare:" SortExpression="Incadrare" UniqueName="Incadrare">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id" DataType="System.Int32" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Strada" FilterControlAltText="Filter Strada column" HeaderText="Strada" SortExpression="Strada" UniqueName="Strada">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLocalitate" FilterControlAltText="Filter IdLocalitate column" HeaderText="IdLocalitate" SortExpression="IdLocalitate" UniqueName="IdLocalitate" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataNasterii" FilterControlAltText="Filter DataNasterii column" HeaderText="DataNasterii" SortExpression="DataNasterii" UniqueName="DataNasterii" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Somaj" FilterControlAltText="Filter Somaj column" HeaderText="Somaj" SortExpression="Somaj" UniqueName="Somaj">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataAngajarii" FilterControlAltText="Filter DataAngajarii column" HeaderText="DataAngajarii" SortExpression="DataAngajarii" UniqueName="DataAngajarii" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataNedeterminat" FilterControlAltText="Filter DataNedeterminat column" HeaderText="DataNedeterminat" SortExpression="DataNedeterminat" UniqueName="DataNedeterminat" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdTipPostDeLucru" FilterControlAltText="Filter IdTipPostDeLucru column" HeaderText="IdTipPostDeLucru" SortExpression="IdTipPostDeLucru" UniqueName="IdTipPostDeLucru" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataExpirareContract" DataType="System.DateTime" FilterControlAltText="Filter DataExpirareContract column" HeaderText="DataExpirareContract" SortExpression="DataExpirareContract" UniqueName="DataExpirareContract">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataExpirareProba" FilterControlAltText="Filter DataExpirareProba column" HeaderText="DataExpirareProba" SortExpression="DataExpirareProba" UniqueName="DataExpirareProba" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdIntervalDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdIntervalDeLucru column" HeaderText="IdIntervalDeLucru" SortExpression="IdIntervalDeLucru" UniqueName="IdIntervalDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdPostDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdPostDeLucru column" HeaderText="IdPostDeLucru" SortExpression="IdPostDeLucru" UniqueName="IdPostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Sex" FilterControlAltText="Filter Sex column" HeaderText="Sex" SortExpression="Sex" UniqueName="Sex">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLoculNasterii" FilterControlAltText="Filter IdLoculNasterii column" HeaderText="IdLoculNasterii" SortExpression="IdLoculNasterii" UniqueName="IdLoculNasterii" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdIncadrare" FilterControlAltText="Filter IdIncadrare column" HeaderText="IdIncadrare" SortExpression="IdIncadrare" UniqueName="IdIncadrare" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdNivelStudiu" FilterControlAltText="Filter IdNivelStudiu column" HeaderText="IdNivelStudiu" SortExpression="IdNivelStudiu" UniqueName="IdNivelStudiu" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdBanca" DataType="System.Int32" FilterControlAltText="Filter IdBanca column" HeaderText="IdBanca" SortExpression="IdBanca" UniqueName="IdBanca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StareCivila" FilterControlAltText="Filter StareCivila column" HeaderText="StareCivila" SortExpression="StareCivila" UniqueName="StareCivila">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NumarTelefon" FilterControlAltText="Filter NumarTelefon column" HeaderText="NumarTelefon" SortExpression="NumarTelefon" UniqueName="NumarTelefon">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CC" FilterControlAltText="Filter CC column" HeaderText="CC" SortExpression="CC" UniqueName="CC">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdDepartament" FilterControlAltText="Filter IdDepartament column" HeaderText="IdDepartament" SortExpression="IdDepartament" UniqueName="IdDepartament" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdEchipa" FilterControlAltText="Filter IdEchipa column" HeaderText="IdEchipa" SortExpression="IdEchipa" UniqueName="IdEchipa" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AdresaEmail" FilterControlAltText="Filter AdresaEmail column" HeaderText="AdresaEmail" SortExpression="AdresaEmail" UniqueName="AdresaEmail">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdLinie" FilterControlAltText="Filter IdLinie column" HeaderText="IdLinie" SortExpression="IdLinie" UniqueName="IdLinie" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        
                                        <telerik:GridBoundColumn DataField="DeteIndete" FilterControlAltText="Filter DeteIndete column" HeaderText="DeteIndete" SortExpression="IdLinie" UniqueName="DeteIndete" DataType="System.Int32">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Banca" FilterControlAltText="Filter Banca column" HeaderText="Banca" SortExpression="Banca" UniqueName="Banca">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Echipa" FilterControlAltText="Filter Echipa column" HeaderText="Echipa" ReadOnly="True" SortExpression="Echipa" UniqueName="Echipa">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IntervalDeLucru" FilterControlAltText="Filter IntervalDeLucru column" HeaderText="IntervalDeLucru" SortExpression="IntervalDeLucru" UniqueName="IntervalDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Localitate" FilterControlAltText="Filter Localitate column" HeaderText="Localitate" SortExpression="Localitate" UniqueName="Localitate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NivelStudiu" FilterControlAltText="Filter NivelStudiu column" HeaderText="NivelStudiu" SortExpression="NivelStudiu" UniqueName="NivelStudiu">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PostDeLucru" FilterControlAltText="Filter PostDeLucru column" HeaderText="PostDeLucru" SortExpression="PostDeLucru" UniqueName="PostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TipPostDeLucru" FilterControlAltText="Filter TipPostDeLucru column" HeaderText="TipPostDeLucru" SortExpression="TipPostDeLucru" UniqueName="TipPostDeLucru">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LoculNasterii" FilterControlAltText="Filter LoculNasterii column" HeaderText="LoculNasterii" SortExpression="LoculNasterii" UniqueName="LoculNasterii">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CodAngajat" FilterControlAltText="Filter CodAngajat column" HeaderText="CodAngajat" SortExpression="CodAngajat" UniqueName="CodAngajat" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CodSistem" FilterControlAltText="Filter CodSistem column" HeaderText="CodSistem" SortExpression="CodSistem" UniqueName="CodSistem" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataLichidarii" DataType="System.DateTime" FilterControlAltText="Filter DataLichidarii column" HeaderText="DataLichidarii" SortExpression="DataLichidarii" UniqueName="DataLichidarii">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DataMaternitate" DataType="System.DateTime" FilterControlAltText="Filter DataMaternitate column" HeaderText="DataMaternitate" SortExpression="DataMaternitate" UniqueName="DataMaternitate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ImageUrl" FilterControlAltText="Filter ImageUrl column" HeaderText="ImageUrl" SortExpression="ImageUrl" UniqueName="ImageUrl" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CvUrl" FilterControlAltText="Filter CvUrl column" HeaderText="CvUrl" SortExpression="CvUrl" UniqueName="CvUrl" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IdBadge" FilterControlAltText="Filter IdBadge column" HeaderText="IdBadge" SortExpression="IdBadge" UniqueName="IdBadge" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StartShift" FilterControlAltText="Filter StartShift column" HeaderText="StartShift" SortExpression="StartShift" UniqueName="StartShift" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EndShift" FilterControlAltText="Filter EndShift column" HeaderText="EndShift" SortExpression="EndShift" UniqueName="EndShift" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </div>
                        

                            <asp:SqlDataSource ID="AngajatiView" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Marca], [Nume], [Prenume], [NumarIdentificarePersonala], [Departament], [Linie], [Incadrare], [Id], [Strada], [IdLocalitate], [DataNasterii], [Somaj], [DataAngajarii], [DataNedeterminat], [IdTipPostDeLucru], [DataExpirareContract], [DataExpirareProba], [IdIntervalDeLucru], [IdPostDeLucru], [Sex], [IdLoculNasterii], [IdIncadrare], [IdNivelStudiu], [IdBanca], [StareCivila], [NumarTelefon], [CC], [IdDepartament], [IdEchipa], [AdresaEmail], [IdLinie], [Banca], [Echipa], [IntervalDeLucru], [Localitate], [NivelStudiu], [PostDeLucru], [TipPostDeLucru], [LoculNasterii], [CodAngajat], [CodSistem], [DataLichidarii], [DataMaternitate], [DeteIndete], [ImageUrl],[CvUrl],[IdBadge],[StartShift],[EndShift] FROM [AngajatiView]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="AngajatiOdpusteni" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Marca], [Nume], [Prenume], [NumarIdentificarePersonala], [Departament], [Linie], [Incadrare], [Id], [Strada], [IdLocalitate], [DataNasterii], [Somaj], [DataAngajarii], [DataNedeterminat], [IdTipPostDeLucru], [DataExpirareContract], [DataExpirareProba], [IdIntervalDeLucru], [IdPostDeLucru], [Sex], [IdLoculNasterii], [IdIncadrare], [IdNivelStudiu], [IdBanca], [StareCivila], [NumarTelefon], [CC], [IdDepartament], [IdEchipa], [AdresaEmail], [IdLinie], [Banca], [Echipa], [IntervalDeLucru], [Localitate], [NivelStudiu], [PostDeLucru], [TipPostDeLucru], [LoculNasterii], [CodAngajat], [CodSistem], [DataLichidarii], [DataMaternitate], [DeteIndete],[ImageUrl],[CvUrl],[IdBadge],[StartShift],[EndShift] FROM [AngajatiOdpusteni]"></asp:SqlDataSource>
                             
                            <asp:SqlDataSource ID="CustomersSqlDataSourceArticle"
                                ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>"
                                runat="server"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>


                <div class="crud">
                    <asp:Panel ID="Panel1" CssClass="crud_panel" runat="server" Height="124px" Style="margin: 0 auto; width: 1300px; padding-top: 20px;">
                        <div class="row">
                            <div class="col-lg-10"><span id="lblinfo" style="font-weight: 800; font-size: 14px;"></span></div>
                            <div class="col-lg-1"><span id="btn_close_info" style="font-weight: 800; cursor: pointer; font-size: 14px;">X</span></div>
                        </div>

                        <table>

                            <tr>
                                <td class="labletxt">Badge:</td> 
                                <td>
                                    <asp:TextBox runat="server" ID="txtBadge" CssClass="inputtxt" ClientIDMode="Static" Enabled="True"></asp:TextBox>
                                </td>

                                <td class="labeltxt">R-num:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtMarca" CssClass="inputtxt" ClientIDMode="Static" Enabled="false"></asp:TextBox></td>
                                <td class="labeltxt">Nome:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtName" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                                <td class="labeltxt">Cognome:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtPrenume" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>

                                <td class="labeltxt">Cd dipendente:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtEmployeeCode" Enabled="false" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td class="labeltxt">Data assunzione:</td>
                                <td>
                                    <telerik:RadDatePicker runat="server" ID="txtDateZapos" CssClass="inputtxt" Culture="en-US"></telerik:RadDatePicker>
                                </td>
                                
                                <td class="labeltxt">Scadenza contratto:</td>
                                <td>
                                    <telerik:RadDatePicker runat="server" ID="txtDateExpirare" CssClass="inputtxt" Culture="en-US"></telerik:RadDatePicker>
                                </td>
                                <td class="labeltxt">Terine contratto:</td>
                                <td>
                                    <telerik:RadDatePicker runat="server" ID="txtDateIstek" CssClass="inputtxt" Culture="en-US"></telerik:RadDatePicker>
                                </td>

                                <td class="labeltxt">N. Identificazione personale:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtJmbg" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td> 
                            </tr>

                            <tr>
                                <td class="labeltxt">Sesso:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtPol" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                                <td class="labeltxt">Telefono:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtTelephone" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                                <td class="labeltxt">Mansione:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboIncadrare" runat="server" DataSourceID="IncadrareLookback" DataTextField="Incadrare" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="IncadrareLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Incadrare] FROM [Incadrari]"></asp:SqlDataSource>
                                </td>

                                <td class="labeltxt">Adress:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtStreatAddres" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                            </tr>
                            <tr>

                                <td class="labeltxt">Linie:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboLine" runat="server" DataSourceID="LinieLookup" DataTextField="Linie" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="LinieLookup" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Linie] FROM [Linii]"></asp:SqlDataSource>
                                </td>
                                <td class="labeltxt">Reparto:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboDepartament" runat="server" DataSourceID="DepartementLookback" DataTextField="Departament" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="DepartementLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Departament] FROM [Departamente]"></asp:SqlDataSource>
                                </td>

                                <td class="labeltxt">Titolo di studio:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboNivel" runat="server" DataSourceID="NivelStudiLookback" DataTextField="NivelStudiu" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="NivelStudiLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [NivelStudiu] FROM [NiveleStudii]"></asp:SqlDataSource>
                                </td>

                                <td class="labeltxt">Faze:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboJobType" runat="server" DataSourceID="JobTypeLookback" DataTextField="PostDeLucru" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="JobTypeLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [PostDeLucru] FROM [PosturiDeLucru]"></asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr>

                                <td class="labeltxt">Diretti/Indiretti:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboTipPost" runat="server" DataSourceID="TipPostLookback" DataTextField="TipPostDeLucru" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="TipPostLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [TipPostDeLucru] FROM [TipuriPostDeLucru]"></asp:SqlDataSource>
                                </td>
                                <td class="labeltxt">Luogo di nascita:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboLocalitate" runat="server" DataSourceID="LoculNasteriLookback" DataTextField="Localitate" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="LoculNasteriLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Localitate] FROM [Localitati]"></asp:SqlDataSource>
                                </td>


                                <%--                                <td class="labeltxt">Comune di emissione:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtOpstina" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>--%>
                                <td class="labeltxt">Orario:</td>
                                <td>
                                    <telerik:RadComboBox ID="ComboWorkHours" runat="server" DataSourceID="IntervalDeLookback" DataTextField="IntervalDeLucru" DataValueField="Id">
                                    </telerik:RadComboBox>
                                    <asp:SqlDataSource ID="IntervalDeLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [IntervalDeLucru] FROM [IntervaleDeLucru]"></asp:SqlDataSource>
                                </td>
                                
                                <td class="labeltxt">N. Conto corrente:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtBank" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>
                            </tr>
                            <tr>
                            </tr>

                            <tr>

                                <td class="labeltxt">E-Mail:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>

                                <td class="labeltxt">TGroup:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtTgroup" CssClass="inputtxt" ClientIDMode="Static"></asp:TextBox></td>

                                <td colspan="8">
                                    <asp:UpdateProgress runat="server">
                                        <ProgressTemplate>
                                            <span style="float: right;">Updating...Please wait...</span>
                                            <img src="../../Images/img/spinner.gif" style="float: right; padding: 5px;" />
                                            <script type="text/javascript">
                                                Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(
                                                    function () {
                                                        $("#btnUpdate").hide();
                                                    }
                                                )
                                            </script>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <asp:Button runat="server" ID="btnUpdate" ClientIDMode="static" Text="Update" Style="margin: 0 auto; width: 80px; float: right; border: 4px #ffffff double; background: #c23749; margin-right: 22px; color: white;" />

                                </td>
                            </tr>

                            <tr>
                            </tr>

                            <tr>
                            </tr>
                            <tr>
                            </tr>

                            <tr>
                                <td colspan="12" class="frame_accordion">
                                    <%--<embed src="./form-anagrafiche.aspx" runat="server" frameborder="0" width="100%" height="400px;" />--%>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>

                <div id="pnl_insert" style="display: none">
                    <span id="pnl_insert_close">X</span>
                    <br />
                    <br />
                    <div class="container">
                        <div class="row">
                            <h4>Agungi nuovo dipendente:</h4>
                            <hr />
                            <div class="col-lg-4">

                                <span>R-num: </span>
                                <asp:TextBox runat="server" ID="ins_r_num" placeholder="R1234" required="true"></asp:TextBox>
                                <br />
                                <span>Nome:</span><asp:TextBox runat="server" ID="ins_nome" placeholder="Petar" required="true"></asp:TextBox>
                                <br />
                                <span>Cognome:</span><asp:TextBox runat="server" ID="ins_cognome" placeholder="Petrovic" required="true"></asp:TextBox>
                                <br />

                                <span>Sesso:</span>
                                <telerik:RadComboBox ID="ins_sesso" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Value="M" Text="M" />
                                        <telerik:RadComboBoxItem Value="F" Text="F" />
                                    </Items>
                                </telerik:RadComboBox>
                                <br />

                                <span>N.ID personale(JMBG):</span><asp:TextBox runat="server" ID="ins_n_identifi" placeholder="0203994750487" required="true"></asp:TextBox>
                                <br />
                                <span>Data di nascita:</span><telerik:RadDatePicker runat="server" ID="ins_data_rodj" CssClass="inputtxt" Culture="en-US" required="true"></telerik:RadDatePicker>
                                <br />
                                <span>Luogo di nascita:</span><telerik:RadComboBox ID="ins_luogo" runat="server" DataSourceID="LoculNasteriLookback" DataTextField="Localitate" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Adress:</span><asp:TextBox runat="server" ID="ins_adress" placeholder="Pantelejska 58" required="true"></asp:TextBox>
                                <br />
                                <span>Telefono:</span><asp:TextBox runat="server" ID="ins_tel" placeholder="069666999" TextMode="Phone" required="true"></asp:TextBox>
                                <br />
                                <span>E-Mail:</span><asp:TextBox runat="server" ID="ins_email" placeholder="mail@mail.com" TextMode="Email" ValidateRequestMode="Enabled" CausesValidation="true" required="false"></asp:TextBox>

                                <br />

                            </div>

                            <div class="col-lg-4">
                                <span>Data assunzione:</span><telerik:RadDatePicker runat="server" ID="ins_dt_assunzione" CssClass="inputtxt" Culture="en-US" required="required" ValidateRequestMode="Enabled"></telerik:RadDatePicker>
                                <br />
                                <span style="display: none;"><span>Termine contratto:</span><telerik:RadDatePicker runat="server" ID="ins_dt_termine_contratto" CssClass="inputtxt" Culture="en-US"></telerik:RadDatePicker>
                                </span>
                                <br />
                                <span>Determinato:</span><telerik:RadDatePicker runat="server" ID="ins_data_na_odredjeno" CssClass="inputtxt" Culture="en-US"></telerik:RadDatePicker>
                                <br />
                                <span>Reparto:</span><telerik:RadComboBox ID="ins_reparto" runat="server" DataSourceID="DepartementLookback" DataTextField="Departament" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Linie:</span><telerik:RadComboBox ID="ins_linie" runat="server" DataSourceID="LinieLookup" DataTextField="Linie" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Faze:</span><telerik:RadComboBox ID="ins_faze" runat="server" DataSourceID="JobTypeLookback" DataTextField="PostDeLucru" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Mansione:</span><telerik:RadComboBox ID="ins_mansione" runat="server" DataSourceID="IncadrareLookback" DataTextField="Incadrare" DataValueField="Id"></telerik:RadComboBox>


                            </div>

                            <div class="col-lg-4">
                                <span>Orario:</span><telerik:RadComboBox ID="ins_orario" runat="server" DataSourceID="IntervalDeLookback" DataTextField="IntervalDeLucru" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Diretti/Indiretti:</span><telerik:RadComboBox ID="ins_diretti" runat="server" DataSourceID="TipPostLookback" DataTextField="TipPostDeLucru" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>Titolo di studio:</span><telerik:RadComboBox ID="ins_titolo" runat="server" DataSourceID="NivelStudiLookback" DataTextField="NivelStudiu" DataValueField="Id"></telerik:RadComboBox>
                                <br />
                                <span>N.Conto corrente:</span><asp:TextBox runat="server" ID="ins_bank" placeholder="160-55315649-189" required="true"></asp:TextBox>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Button runat="server" ID="btnInsert" ClientIDMode="static" Text="Insert" Style="margin: 0 auto; width: 80px; float: right; border: 4px #ffffff double; background: #c23749; margin-right: 22px; color: white;" />

                            </div>

                        </div>
                    </div>
                </div>

                <div class="a4_main">
                    <div class="row">
                        <div class="">
                            <div class="a4" id="a4a">
                                <span class="a4_close">X</span>
                               
                                <div id="editor"></div>
                                <div class="row">
                                    <span class="c_header col-lg-6">Modulo - Scheda anagrafica Dipendente</span>
                                    <span class="c_header col-lg-4" style="text-align: right;" id="a_r_badge" runat="server"></span>
                                    <span class="c_header col-lg-2" style="text-align: right;" id="a_r_num" runat="server"></span>
                                </div>
                                <div class="row">
                                    <span class="c_big_header col-lg-12">Dati Dipendente</span>
                                </div>
                                <div class="row">
                                    <span class="c_gray_header col-lg-12">Dati Personali</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <span class="c_normal_label">nr identificazione</span><span class="c_normal_text" id="a_nr_ident"></span>
                                    </div>
                                    <div class="col-lg-3" style="float: right;">
                                        <span class="c_normal_label" style="width: 30px;">sesso</span><span class="c_normal_text" id="a_sex"></span>
                                        <br />
                                        <img src="../../Images/man.png" id="img_profile"  runat="server" />
                                        <br />
                                        <a id="cv_profile" href="#" target="_blanko">Curiculum Vitae</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label">cognome</span><span class="c_normal_text c_nome_prenome" id="a_cognome"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label">nome</span><span class="c_normal_text c_nome_prenome" id="a_nome"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 250px;">comune o in alternativa stato straniero di nascita</span><span class="c_normal_text" id="a_city"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-7" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label">cittadinanza</span><span class="c_normal_text" id="a_state"></span>
                                        </div>
                                        <div class="col-lg-5" style="padding-right: 0px!important; padding-left: 0px!important; display: none;">
                                            <span class="c_normal_label" style="width: 80px;">data di nascita</span><span class="c_normal_text" id="a_bdate"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="c_gray_header col-lg-12">Residenza o domicilio</span>
                                </div>
                                <div class="row">
                                    <span class="c_yellow_header col-lg-12">Sezione - Residenza</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-4" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 110px;">comune di residenza</span><span class="c_normal_text" id="a_opstina"></span>
                                        </div>
                                        <div class="col-lg-6" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 30px;">CAP</span><span class="c_normal_text" id="a_postanski_broj"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 110px;">indirizzo di residenza</span><span class="c_normal_text c_nome_prenome" id="a_adressa"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 110px;">località</span><span class="c_normal_text c_nome_prenome" id="a_cityy"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="c_yellow_header col-lg-12">Sezione - Recapiti</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-6" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 150px;">numero di telefono domicilio</span><span class="c_normal_text" id="a_tel1"></span>
                                        </div>
                                        <div class="col-lg-6" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 130px;">numero di telefono altro</span><span class="c_normal_text" id="a_tel2"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 150px;">numero di telefono cellulare</span><span class="c_normal_text" id="a_tel3"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 150px;">indirizzo di posta elettronica</span><span class="c_normal_text" id="a_email"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="c_big_header col-lg-12">Dati Amministrativi</span>
                                </div>
                                <div class="row">
                                    <span class="c_gray_header col-lg-12">Dati di lavoro</span>
                                </div>
                                <div class="row">
                                    <span class="c_yellow_header col-lg-12">Sezione - Dati generali di Reparto</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-6" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 90px;">Reparto</span><span class="c_normal_text" id="a_reparto"></span>
                                        </div>
                                        <div class="col-lg-6" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 30px;">Fase</span><span class="c_normal_text" id="a_fase" style="width: 155px!important; display: -webkit-inline-box;"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 90px;">Linea</span><span class="c_normal_text c_nome_prenome" id="a_line"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 90px;">Mansione</span><span class="c_normal_text c_nome_prenome" id="a_mansione"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 90px;">Diretti / Indiretti</span><span class="c_normal_text" id="a_diretti"></span>
                                    </div>
                                </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <span class="c_normal_label" style="width: 90px;">Orarrio:</span><span class="c_normal_text" id="a_orario"></span>
                                </div>
                            </div>
                                <div class="row">
                                    <span class="c_yellow_header col-lg-12">Sezione - Tipo rapporto</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 90px;">tipo di contratto</span><span class="c_normal_text" id="a_tip_contract"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-4" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 100px;">inizio contratto </span><span class="c_normal_text" style="width:150px" id="a_data_assenzuione"></span>
                                        </div>
                                        <div class="col-lg-4" style="padding-right: 0px!important; padding-left: 0px!important;">
                                            <span class="c_normal_label" style="width: 100px;">scadenza contratto </span><span class="c_normal_text" id="a_cat_di_scadenza_contrato"></span>
                                        </div>
                                        
                                        <div class="col-lg-4" style="padding-right: 0px!important; padding-left: 0px!important; display:none; ">
                                            <span class="c_normal_label" style="width: 100px;">(termine contrato)</span><span class="c_normal_text" id="a_data_scadenza"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="c_yellow_header col-lg-12">Sezione - Cessazione</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-lg-4"></div>
                                        <div class="col-lg-8">
                                            <span class="c_normal_label" style="width: 90px;">data cessazione</span><span class="c_normal_text" id="a_data_cessazione"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <span class="c_big_header col-lg-12">Sezione - Titolo di studio</span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span class="c_normal_label" style="width: 120px;">livello scolarizzazione</span><span class="c_normal_text" id="a_livello"></span>
                                    </div>
                                </div>
                                
                                 <br />
                                
                                <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_save" />
                                    </Triggers>
                                    <ContentTemplate>

                                <div class="row" id="btns">

                                <div class="col-md-1"> 
                                        <button id="savePDFbutton" onclick="savePDF();">PDF</button>  
                                    </div>
                                <div class="col-md-1">
                                    <button id="savePDFbutton" onclick="printData();">Print</button>
                                </div>


                                    <div class="col-md-4">
                                        <asp:FileUpload runat="server"  ID="upl_img"  ToolTip="Upload Image" /> 
                                        
                                    </div>

                                    <div class="col-md-4">
                                        <asp:FileUpload runat="server" ID="upl_cv" ToolTip="Upload CV" />
                                    </div>

                                    <div class="col-md-2">
                                        <asp:Button runat="server" ID="btn_save" CssClass="btn-success" OnClick="btn_save_Click" Text="Upload Files" />
                                    </div>
                                </div>
                                     </ContentTemplate>
                                </asp:UpdatePanel>
                            


                            </div>
                        </div>
                    </div>
                </div>
                
                <script type="text/javascript">

                    Sys.Application.add_load(function () {
                        $('#btn_edit').show();
                        $('#btn_add').show();
                        $('.search').show(); 
                        $("#btn_change").click(function() {
                            $('#rdg2').show();
                            $('#btn_change').hide();
                            $('#btn_change_inactive').show();
                            $('#rdg1').hide();
                        });

                        $('#btn_change_inactive').click(function() {
                            $('#rdg2').hide();
                            $('#btn_change').show();
                            $('#btn_change_inactive').hide();
                            $('#rdg1').show();
                        });

                        //CLOSE EDIT
                        $("#btn_close_info").click(function () {
                            $(".crud_panel").hide();
                            $('#btn_edit').show();
                            $('#RadGrid1').show();
                            $('#RadGrid2').show();
                            $('#btn_add').show();
                            $('.search').show();
                        });
                        //EDIT
                        $("#btn_edit").click(function () {
                            if ($("#txtMarca").val().length < 5) {
                                alert('You must select the row');
                            } else {
                                $("#lblinfo").html('Edit Options');
                                $(".crud_panel").show();
                                $(".frame_accordion").hide();
                                $("#btnUpdate").show();
                                $("#btnInsert").hide();

                                $('#txtMarca').prop("disabled", true);
                                $('#txtEmployeeCode').prop("disabled", true);

                                $('#pnl_insert').hide();
                            };
                        });
                        //INSERT
                        $("#btn_add").click(function () {
                            $("#lblinfo").html('Please insert the following fields');
                            $(".crud_panel").hide();
                            $(".frame_accordion").show();
                            $("#btnUpdate").hide();
                            $("#btnInsert").show();

                            $('#txtMarca').prop("disabled", false);
                            $('#txtEmployeeCode').prop("disabled", false);

                            $('#btn_edit').hide();
                            $('#btn_add').hide();
                            $('#RadGrid1').hide();
                            $('#RadGrid2').hide();
                            $('.search').hide();
                            $('#pnl_insert').show();
                        });
                        //CLOSE INSERT
                        $('#pnl_insert_close').click(function () {
                            $('#pnl_insert').hide();
                            $(".crud_panel").hide();
                            $('#btn_edit').show();
                            $('#RadGrid1').show();
                            $('#RadGrid2').show();
                            $('#btn_add').show();
                            $('.search').show();
                        });

                        $(".rgRow").addClass("context-menu-one");
                        $(".rgAltRow").addClass("context-menu-one");
                        $(".rgRow").dblclick(function (event) {
                            event.stopPropagation();
                            $(".a4_main").show();
                            $(".main_grid").hide();
                            $(".crud").hide();
                        });

                        $(".rgAltRow").dblclick(function (event) {
                            event.stopPropagation();
                            $(".a4_main").show();
                            $(".main_grid").hide();
                            $(".crud").hide();
                        });

                        $(".a4_close").on("click", function () {
                            $(".a4_main").hide();
                            $(".main_grid").show();
                            $(".crud").show();
                        });

                        $(document).mouseup(function (e) {
                            var container = $(".a4");
                            if (!container.is(e.target) && container.has(e.target).length === 0) {
                                $(".a4_main").hide();
                                $(".main_grid").show();
                                $(".crud").show();
                            }
                        });
                    });
                </script>

                <script type="text/javascript">

                    function savePDF() {
                        $('#updPanel').hide();
                        $('#cv_profile').hide();

                        var imgData;
                        html2canvas($("#a4a")[0],
                            {
                                allowTaint: true,
                                useCORS: true,
                                onrendered: function (canvas) {
                                    imgData = canvas.toDataURL(
                                        'Images/Image/png');
                                    var doc = new jsPDF('p', 'pt', 'a4');
                                    doc.addImage(imgData, 'PNG', 0, 0);
                                    doc.webkitImageSmoothingEnabled = false;
                                    doc.mozImageSmoothingEnabled = false;
                                    doc.imageSmoothingEnabled = false;
                                    doc.save('sample-file.pdf');
                                    window.open(imgData);
                                } 
                            });

                        $('#updPanel').show();
                        $('#cv_profile').show();
                    }

                    function printData() { 
                        setTimeout(hideElements, 100);
                        $('#a4a').printThis({
                                pageTitle: "",
                                importCSS: true,
                                ImportStyle: true,
                                copyTagClasses: true,
                                loadCSS: "../css/scheda-dipedenti.css"
                        });
                        setTimeout(showElements, 5000);
                    }

                    function hideElements() {
                        $('#updPanel').hide();
                        $('#cv_profile').hide();
                        $('.a4_close').hide();
                    }
                    function showElements() {
                        $('#updPanel').show();
                        $('#cv_profile').show();
                        $('.a4_close').show();
                    }
                </script> 

                <script type="text/javascript">
                    function RowSelected(sender, eventArgs) {
                        var grid = sender;
                        var MasterTable = grid.get_masterTableView();
                        var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                        
                        

                        var ImageSrc = MasterTable.getCellByColumnUniqueName(row, "ImageUrl");
                        document.getElementById("img_profile").src = ImageSrc.innerHTML; 

                        if (ImageSrc.innerHTML == '&nbsp;') {
                            document.getElementById("img_profile").src = '../../Images/man.png';
                        }


                        var CvSrc = MasterTable.getCellByColumnUniqueName(row, "CvUrl");
                        document.getElementById("cv_profile").href = CvSrc.innerHTML;

                        console.log('van: ' + CvSrc.innerHTML);
                        if (CvSrc.innerHTML == '&nbsp;') { 
                            document.getElementById("cv_profile").classList.add("disabled");
                            console.log('if: ' + CvSrc.innerHTML);
                        } else {
                            document.getElementById("cv_profile").href = CvSrc.innerHTML; 
                            document.getElementById("cv_profile").classList.remove("disabled");
                            console.log('else: ' + CvSrc.innerHTML);
                        }


                        var nume = MasterTable.getCellByColumnUniqueName(row, "Nume");
                        document.getElementById("txtName").value = nume.innerHTML;
                        document.getElementById("a_nome").innerHTML = nume.innerHTML;

                        var prenume = MasterTable.getCellByColumnUniqueName(row, "Prenume");
                        document.getElementById("txtPrenume").value = prenume.innerHTML;
                        document.getElementById("a_cognome").innerHTML = prenume.innerHTML;


                        var marca = MasterTable.getCellByColumnUniqueName(row, "Marca");
                        document.getElementById("txtMarca").value = marca.innerHTML;
                        document.getElementById("a_r_num").innerHTML = marca.innerHTML;
                         window.history.pushState('page2', 'Title', '?uid='+marca.innerHTML+'');

                        //a_r_badge
                        var badge = MasterTable.getCellByColumnUniqueName(row, "IdBadge");
                        document.getElementById("txtBadge").value = badge.innerHTML;
                        document.getElementById("a_r_badge").innerHTML = badge.innerHTML; 



                        //Tipo di CONTRATO
                        var tipo = MasterTable.getCellByColumnUniqueName(row, "DeteIndete");
                        //document.getElementById("txtMarca").value = tipo.innerHTML;
                        if (tipo.innerHTML == '1') {
                            document.getElementById("a_tip_contract").innerHTML = 'I';
                            //console.log('1');
                        } else {
                            document.getElementById("a_tip_contract").innerHTML = 'D';

                            //DataExpirareContract
                            var DataExpirare = MasterTable.getCellByColumnUniqueName(row, "DataExpirareContract");
                            //console.log(DataExpirare);
                            var X = document.getElementById("txtDateExpirare_dateInput_ClientState").value;
                            X = JSON.parse(X);
                            X.lastSetTextBoxValue = DataExpirare.innerHTML;
                            X.validationText = DataExpirare.innerHTML;
                            X.valueAsString = DataExpirare.innerHTML;
                            document.getElementById("txtDateExpirare_dateInput_ClientState").value = (JSON.stringify(X));
                            document.getElementById("txtDateExpirare_dateInput").value = X.lastSetTextBoxValue;
                            document.getElementById("a_cat_di_scadenza_contrato").innerHTML = X.lastSetTextBoxValue.substring(0, 10);


                            var datumexpire = document.getElementById("a_cat_di_scadenza_contrato").innerHTML;
                            console(")
                            if (datumexpire == '01/01/0001' || datumexpire == '01/01/2001') {
                                document.getElementById("a_cat_di_scadenza_contrato").innerHTML = ' ';
                            } else { 

                                var dt = DataExpirare.innerHTML.substring(0, 10);
                                var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                                var str = new String(date);
                                document.getElementById("a_cat_di_scadenza_contrato").innerHTML = str.substring(0, 15); 

                                if (document.getElementById("a_cat_di_scadenza_contrato").innerHTML == 'Invalid Date') {
                                    var dt = DataExpirare.innerHTML.substring(0, 9);
                                    var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                                    var str = new String(date);
                                    document.getElementById("a_cat_di_scadenza_contrato").innerHTML =
                                        str.substring(0, 15);
                                } else {
                                    var dt = DataExpirare.innerHTML.substring(0, 10);
                                    var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                                    var str = new String(date);
                                    document.getElementById("a_cat_di_scadenza_contrato").innerHTML =
                                        str.substring(0, 15);
                                }


                            }

                           



                        }

                        var DataAngajarii = MasterTable.getCellByColumnUniqueName(row, "DataAngajarii");
                        var X = document.getElementById("txtDateZapos_dateInput_ClientState").value;
                        X = JSON.parse(X);
                        X.lastSetTextBoxValue = DataAngajarii.innerHTML;
                        X.validationText = DataAngajarii.innerHTML;
                        X.valueAsString = DataAngajarii.innerHTML;
                        document.getElementById("txtDateZapos_dateInput_ClientState").value = (JSON.stringify(X));
                        document.getElementById("txtDateZapos_dateInput").value = X.lastSetTextBoxValue;

                        
                        var dt = X.lastSetTextBoxValue.substring(0, 10);
                        console.log('novidt:' + dt);
                        var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                        var str = new String(date); 
                        document.getElementById("a_data_assenzuione").innerHTML = str.substring(0, 15); 

                        if (document.getElementById("a_data_assenzuione").innerHTML == 'Invalid Date') {
                            var dt = X.lastSetTextBoxValue.substring(0, 9);
                            console.log('novidt:' + dt);
                            var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                            var str = new String(date);
                            document.getElementById("a_data_assenzuione").innerHTML = str.substring(0, 15);
                        } else {
                            var dt = X.lastSetTextBoxValue.substring(0, 10);
                            console.log('novidt:' + dt);
                            var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                            var str = new String(date);
                            document.getElementById("a_data_assenzuione").innerHTML = str.substring(0, 15); 
                        }

                        //Termine contrato
                        var DataNedeterminat = MasterTable.getCellByColumnUniqueName(row, "DataNedeterminat");
                        var X = document.getElementById("txtDateIstek_dateInput_ClientState").value;
                        X = JSON.parse(X);
                        X.lastSetTextBoxValue = DataNedeterminat.innerHTML;
                        X.validationText = DataNedeterminat.innerHTML;
                        X.valueAsString = DataNedeterminat.innerHTML;
                        document.getElementById("txtDateIstek_dateInput_ClientState").value = (JSON.stringify(X));
                        document.getElementById("txtDateIstek_dateInput").value = X.lastSetTextBoxValue;
                        document.getElementById("a_data_scadenza").innerHTML = X.lastSetTextBoxValue.substring(0, 10);

              


                        var DataLinchedrari = MasterTable.getCellByColumnUniqueName(row, "DataLichidarii");
                        var datumprestanka = DataLinchedrari.innerHTML.substring(0, 8);
                        console.log('ovako'+datumprestanka);
                        if (datumprestanka == '1/1/0001' || datumprestanka == '01/01/2001' || datumprestanka == '01/01/0001') {
                            document.getElementById("a_data_cessazione").innerHTML = ' ';
                        } else { 
                            var dt = DataLinchedrari.innerHTML.substring(0, 10);
                            var date = new Date(dt.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
                            var str = new String(date);
                            document.getElementById("a_data_cessazione").innerHTML = str.substring(0, 15); 
                        }
                        

                        var Sex = MasterTable.getCellByColumnUniqueName(row, "Sex");
                        document.getElementById("txtPol").value = Sex.innerHTML;
                        document.getElementById("a_sex").innerHTML = Sex.innerHTML;

                        var NumarIdentificarePersonala = MasterTable.getCellByColumnUniqueName(row, "NumarIdentificarePersonala");
                        document.getElementById("txtJmbg").value = NumarIdentificarePersonala.innerHTML;
                        document.getElementById("a_nr_ident").innerHTML = NumarIdentificarePersonala.innerHTML;
                         
                        var orarioStart = MasterTable.getCellByColumnUniqueName(row, "StartShift");
                        var orarioEnd = MasterTable.getCellByColumnUniqueName(row, "EndShift");
                        document.getElementById("a_orario").innerHTML = orarioStart.innerHTML + ' -> ' +orarioEnd.innerHTML;

                        document.getElementById("txtJmbg").value = NumarIdentificarePersonala.innerHTML;
                        document.getElementById("a_nr_ident").innerHTML = NumarIdentificarePersonala.innerHTML;



                        var NumarTelefon = MasterTable.getCellByColumnUniqueName(row, "NumarTelefon");
                        document.getElementById("txtTelephone").value = NumarTelefon.innerHTML;
                        document.getElementById("a_tel3").innerHTML = NumarTelefon.innerHTML;


                        var cc = MasterTable.getCellByColumnUniqueName(row, "CC");
                        document.getElementById("txtBank").value = cc.innerHTML;

                        var Incadrare = MasterTable.getCellByColumnUniqueName(row, "Incadrare");
                        document.getElementById("a_mansione").innerHTML = Incadrare.innerHTML;

                        var combo = $find("<%= ComboIncadrare.ClientID %>");
                        var itm = combo.findItemByText(Incadrare.innerHTML);
                        itm.select();

                        var TipPostDeLucru = MasterTable.getCellByColumnUniqueName(row, "TipPostDeLucru");
                        document.getElementById("a_diretti").innerHTML = TipPostDeLucru.innerHTML;
                        var combo = $find("<%= ComboTipPost.ClientID %>");
                        var itm = combo.findItemByText(TipPostDeLucru.innerHTML);
                        itm.select();

                        var Linie = MasterTable.getCellByColumnUniqueName(row, "Linie");
                        document.getElementById("a_line").innerHTML = Linie.innerHTML;
                        var combo = $find("<%= ComboLine.ClientID %>");
                        var itm = combo.findItemByText(Linie.innerHTML);
                        itm.select();

                        var Departament = MasterTable.getCellByColumnUniqueName(row, "Departament");
                        document.getElementById("a_reparto").innerHTML = Departament.innerHTML;
                        var combo = $find("<%= ComboDepartament.ClientID %>");
                        var itm = combo.findItemByText(Departament.innerHTML);
                        itm.select();

                        //txtStreatAddres Strada
                        var StreatAddress = MasterTable.getCellByColumnUniqueName(row, "Strada");
                        document.getElementById("txtStreatAddres").value = StreatAddress.innerHTML;
                        document.getElementById("a_adressa").innerHTML = StreatAddress.innerHTML;

                        //txtEmployeeCode  CodAngajat
                        var CodAngajat = MasterTable.getCellByColumnUniqueName(row, "CodAngajat");
                        document.getElementById("txtEmployeeCode").value = CodAngajat.innerHTML;

                        //txtLvlStudy [NivelStudiu]
                        var LevelOfStudy = MasterTable.getCellByColumnUniqueName(row, "NivelStudiu");
                        document.getElementById("a_livello").innerHTML = LevelOfStudy.innerHTML;
                        var combo = $find("<%= ComboNivel.ClientID %>");
                        var itm = combo.findItemByText(LevelOfStudy.innerHTML);
                        itm.select();

                        // txtJobType [Faze]
                        var JobType = MasterTable.getCellByColumnUniqueName(row, "PostDeLucru");
                        document.getElementById("a_fase").innerHTML = JobType.innerHTML;
                        var combo = $find("<%= ComboJobType.ClientID %>");
                        var itm = combo.findItemByText(JobType.innerHTML);
                        itm.select();

                        //txtOpstina [Localitate]
                        //var CityRegion = MasterTable.getCellByColumnUniqueName(row, "Localitate");
                        //document.getElementById("txtOpstina").value = CityRegion.innerHTML;
                        //document.getElementById("a_opstina").innerHTML = CityRegion.innerHTML;
                        //txtEmail [AdresaEmail]
                        var EmailAdress = MasterTable.getCellByColumnUniqueName(row, "AdresaEmail");
                        document.getElementById("txtEmail").value = EmailAdress.innerHTML;
                        document.getElementById("a_email").innerHTML = EmailAdress.innerHTML;

                        //txtBirthPlace [][LoculNasterii]
                        var BirthPlace = MasterTable.getCellByColumnUniqueName(row, "LoculNasterii");
                        document.getElementById("a_cityy").innerHTML = BirthPlace.innerHTML;
                        document.getElementById("a_city").innerHTML = BirthPlace.innerHTML;

                        var combo = $find("<%= ComboLocalitate.ClientID %>");
                        var itm = combo.findItemByText(BirthPlace.innerHTML);
                        itm.select();


                        //txtWorkHours [[IntervalDeLucru]]
                        var WorkingTime = MasterTable.getCellByColumnUniqueName(row, "IntervalDeLucru");

                        var combo = $find("<%= ComboWorkHours.ClientID %>");
                        var itm = combo.findItemByText(WorkingTime.innerHTML);
                        itm.select();
                    }
                </script>

                <script>
                    Sys.Application.add_load(initSomething);
                    function initSomething() {

                         //var rowCount = 'Totale:' + ' ' + $('.rgMasterTable tbody tr').length;
                        //$("#lblTotRows").text(rowCount);

                        $(".search").keyup(function () {
                            var searchTerm = $(".search").val();
                            var listItem = $('.rgMasterTable tbody').children('tr');
                            var searchSplit = searchTerm.replace(/ /g, "'):containsi('")

                            $.extend($.expr[':'], {
                                'containsi': function (elem, i, match, array) {
                                    return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                                }
                            });

                            $(".rgMasterTable tbody tr").not(":containsi('" + searchSplit + "')").each(function (e) {
                                $(this).attr('visible', 'false');
                            });

                            $(".rgMasterTable tbody tr:containsi('" + searchSplit + "')").each(function (e) {
                                $(this).attr('visible', 'true');
                            });
                        });
                    }
                </script>
             
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
