<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_assDepartMonth.aspx.cs" Inherits="Views_HR_assDepartMonth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../libs/bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/datatables.min.css"/>
    <link href="../../css/_schieda.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <style type="text/css">
            body{
                height:850px; 
            }
            thead tr{
                height: 45px;
            }
            th, td{ 
                white-space: nowrap;
                font-size: 10pt;
                text-transform: uppercase; 
                padding:10px;               
            } 
            th {
                font-weight:500!important;
            }
            td{
                line-height: 10px;
            }
            .grd {
                border:none;
            }
            .DTFC_RightBodyWrapper { 
                margin-top: -7px;
            }
            .DTFC_RightHeadWrapper,.DTFC_LeftHeadWrapper{    
                background: #ffffff;
                border: none;
                margin: 0;
                padding: 0;
                height: 45px;
            }
            .DTFC_RightBodyWrapper,.DTFC_LeftBodyWrapper{height: 691px;}
            div.dataTables_wrapper div.dataTables_filter {
                text-align: right;
                float: right;
            }
            .page-item.active .page-link {
                z-index: 3;
                color: #6c757d;
                background-color: #e4e4e4;
                border-color: #d6d6d6;
            }
            .thead tr{
                box-shadow: 1px 1px 1px #e0e0e0!important;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button {padding:0px;}
            table.dataTable thead th, table.dataTable thead td {padding: 10px 18px;border-bottom: 1px solid #cecece;}
            .dataTables_wrapper .dataTables_paginate .paginate_button:active{border:none;}
            table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd {background-color: #f3f3f3;}
            .btn-secondary {color: #007bff;background-color: #ffffff;border-color: #e4e4e4;height: 32px;font-size: 14px;}
            .btn-secondary:hover{background:gray}
            table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {background-color: #e8e8e8 !important;}
            .DTFC_RightBodyLiner,.DTFC_LeftBodyLiner{overflow-y: scroll;overflow-x: hidden;}
             .header{
                 padding:10px;
             }
             span{
                 padding-right:10px;
                 padding-left:10px;
             }

             .tot{
                 position: absolute;
                 bottom: 1px;
                 left: 0px;
                 font-size: 11px;
                 color: #007bff;
             }
             #total{
                text-align: right;
                position: absolute;
                top: 5px;
                right: 15px;
                color: #4f7bff;
                text-transform: uppercase;
                font-size: 14pt;
             }
              
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="../../js/jquery-3.4.1.min.js" />
                <asp:ScriptReference Path="../../js/pdfmake.min.js" />
                <asp:ScriptReference Path="../../js/vfs_fonts.js" />
                <asp:ScriptReference Path="../../js/datatables-a.min.js" />
                <asp:ScriptReference Path="../../js/dataTables.fixedColumns.min.js" />

            </Scripts>
        </asp:ScriptManager>
        
        <asp:UpdateProgress id="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <span style="border-width: 0px; position: fixed; padding: 50px; background-color: transparent; color:orange; font-size: 36px; left: 40%; top: 40%;">Loading ...</span>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="container-fluid">
                    <div class="row header">
                        <h4 id="total"></h4>
                        <span>Messe:</span>
                        <asp:DropDownList runat="server" ID ="ddp_month" OnSelectedIndexChanged="ddp_month_SelectedIndexChanged" AutoPostBack="true" Width="100" CssClass="custom-select custom-select-sm form-control form-control-sm">
                            <asp:ListItem Value="1" Text="Gennaio"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Febbraio"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Marzo"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Aprile"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Maggio"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Giugno"></asp:ListItem>
                            <asp:ListItem Value="7" Text="Luglio"></asp:ListItem>
                            <asp:ListItem Value="8" Text="Agosto"></asp:ListItem>
                            <asp:ListItem Value="9" Text="Settembre"></asp:ListItem>
                            <asp:ListItem Value="10" Text="Ottobre"></asp:ListItem>
                            <asp:ListItem Value="11" Text="Novembre"></asp:ListItem>
                            <asp:ListItem Value="12" Text="Dicembre"></asp:ListItem>
                        </asp:DropDownList>

                        <span>Anno:</span>
                        <asp:DropDownList runat="server" id="ddp_year" OnSelectedIndexChanged="ddp_month_SelectedIndexChanged" AutoPostBack="true" Width="100" CssClass="custom-select custom-select-sm form-control form-control-sm">
                            <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                            <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                        </asp:DropDownList>

                        <span>Linie:</span>
                        <asp:DropDownList runat="server" ID="ddp_linie" OnSelectedIndexChanged="ddp_month_SelectedIndexChanged"  AutoPostBack="true" Width="100" CssClass="custom-select custom-select-sm form-control form-control-sm">
                        </asp:DropDownList>
                        <span>Mansione:</span>
                        <asp:DropDownList runat="server" ID="ddp_mansione" OnSelectedIndexChanged="ddp_month_SelectedIndexChanged"  AutoPostBack="true" Width="100" CssClass="custom-select custom-select-sm form-control form-control-sm">
                        </asp:DropDownList>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:GridView runat="server" ID="GridView" CssClass="grd stripe dataTable" OnRowDataBound="GridView_RowDataBound"  HeaderStyle-CssClass="header" Width="100%">
                            </asp:GridView>
                        </div>
                    </div>
                </div> 

                 <script type="text/javascript">  
                     function pageLoad(sender, args) {
                             $(function () {
                                 $(".grd tbody").before("<thead><tr></tr></thead>");
                                 $(".grd thead tr").append($(".grd th"));
                                 $(".grd tbody tr:first").remove();
                                 var lastcol = $('.grd').find('th:last').index();
                                  
                                 $('.grd thead tr').eq(0).each(function () {
                                     var $row = $(this);
                                     for (i = 4; i <= 36; i++) {
                                         var total = 0;
                                         $('.grd tbody tr').each(function () {
                                             total += parseInt($(this).find('td').eq(i).text()) || 0;
                                         })
                                         $row.find('th').eq(i).append('<span style="display:block"  class="tot"> = ' + total + '</span>');
                                     }
                                 })

                                 var getUrlParameter = function getUrlParameter(sParam) {
                                     var sPageURL = window.location.search.substring(1),
                                         sURLVariables = sPageURL.split('&'),
                                         sParameterName,
                                         i;

                                     for (i = 0; i < sURLVariables.length; i++) {
                                         sParameterName = sURLVariables[i].split('=');

                                         if (sParameterName[0] === sParam) {
                                             return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                                         }
                                     }
                                 };

                                 $('.grd').dataTable({
                                     dom: 'Blfrtip',
                                     buttons: [
                                         {
                                             extend: 'pdfHtml5',
                                             orientation: 'landscape',
                                             pageSize: 'LEGAL',
                                             customize: function (doc) {
                                                 //Remove the title created by datatTables
                                                 doc.content.splice(0, 1);
                                                 //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                 var now = new Date();
                                                 var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                 doc.pageMargins = [20, 60, 20, 30]; 
                                                 doc.defaultStyle.fontSize = 7; 
                                                 doc.styles.tableHeader.fontSize = 7; 
                                                 doc['header'] = (function () {
                                                     return {
                                                         columns: [ 
                                                             {
                                                                 alignment: 'right',
                                                                 fontSize: 14,
                                                                 text: 'Assenteismo Departament - ' + getUrlParameter('Departament') + ' ' + $('#ddp_month').val() + '/' + $('#ddp_year').val() +'',
                                                                 filename: 'Assenteismo Departament - ' + getUrlParameter('Departament') + ' ' + $('#ddp_month').val() + '/' + $('#ddp_year').val() + ''
                                                             }
                                                         ],
                                                         margin: 20
                                                     }
                                                 });
                                                 // Create a footer object with 2 columns
                                                 // Left side: report creation date
                                                 // Right side: current page and total pages
                                                 doc['footer'] = (function (page, pages) {
                                                     return {
                                                         columns: [
                                                             {
                                                                 alignment: 'left',
                                                                 text: ['Created on: ', { text: jsDate.toString() }]
                                                             },
                                                             {
                                                                 alignment: 'right',
                                                                 text: ['page ', { text: page.toString() }, ' of ', { text: pages.toString() }]
                                                             }
                                                         ],
                                                         margin: 20
                                                     }
                                                 });
                                                 // Change dataTable layout (Table styling)
                                                 // To use predefined layouts uncomment the line below and comment the custom lines below
                                                 // doc.content[0].layout = 'lightHorizontalLines'; // noBorders , headerLineOnly
                                                 var objLayout = {};
                                                 objLayout['hLineWidth'] = function (i) { return .5; };
                                                 objLayout['vLineWidth'] = function (i) { return .5; };
                                                 objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                 objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                 objLayout['paddingLeft'] = function (i) { return 4; };
                                                 objLayout['paddingRight'] = function (i) { return 4; };
                                                 doc.content[0].layout = objLayout;
                                             },
                                         },
                                        
                                         'copyHtml5',
                                         {
                                             extend: 'print',
                                             text: 'Print',
                                             autoPrint: false
                                         },
                                         {
                                             extend: 'excel',
                                             customize: function () {
                                                 //alert('HELLO!');
                                                 //$('.tot').remove();
                                             },
                                             title: 'Assenteismo Departament', 
                                             extension: '.xlsx',
                                             filename: 'Assenteismo Departament - ' + getUrlParameter('Departament') +'',

                                         }
                                     ], 
                                     scrollX: true,
                                     fixedColumns: true,
                                     fixedColumns: {
                                         leftColumns: 2,
                                         rightColumns: 1
                                     },
                                     "order": [[lastcol, "desc"]],
                                     "lengthChange": true,
                                     "pageLength": 20,
                                     "lengthMenu": [[20, 50, 10, -1], [20, 50, 10, "All"]]
                                 });                                   
                             });
                     }
                 </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
