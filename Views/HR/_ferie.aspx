<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_ferie.aspx.cs" Inherits="Views_HR_ferie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../../libs/bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/datatables.min.css"/>
    <link href="../../css/_schieda.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <script src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/pdfmake.min.js"></script>
    <script type="text/javascript" src="../../js/vfs_fonts.js"></script>
    <script type="text/javascript" src="../../js/datatables-a.min.js"></script>
    <script src="https://cdn.datatables.net/fixedcolumns/3.2.4/js/dataTables.fixedColumns.min.js"></script>

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
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin-top:10px;">
       
        <div class="row header">
              <h4 id="total"></h4>
            
        <table cellpadding="0" cellspacing="0" class="principal" style="width:120px; margin-left:195px;margin-bottom:-30px; z-index:1;">
                    
                                    <tr>
                                        <td style="padding-right:0px;">
                                            <asp:Label ID="lFiltruAn" runat="server" CssClass="continut" Text="ANNO"></asp:Label>
                                        </td>
                                        <td style="padding:0px;width:56px;">
                                            <asp:DropDownList ID="ddlFiltruAn" runat="server" OnSelectedIndexChanged="ddlFiltruAn_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem>2021</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>                                        
                                    
                                    </tr>
                                </table>
        </div>
        <div class="container-fluid" style="margin-top:-8px;" >
            <div class="row">
                <div class="col-12">
                    <asp:GridView runat="server" ID="GridView" CssClass="grd stripe hover" OnRowDataBound="GridView_RowDataBound"  HeaderStyle-CssClass="header" Width="100%">
                    </asp:GridView>
                </div>
            </div>
        </div>
         <script type="text/javascript">  
             $(function () {
                 $(".grd tbody").before("<thead><tr></tr></thead>");
                 $(".grd thead tr").append($(".grd th"));
                 $(".grd tbody tr:first").remove();
                 var dropdownListId = document.getElementById("ddlFiltruAn"); 
                 var year = dropdownListId.options[dropdownListId.selectedIndex].value;
                 $('.grd').dataTable({
                     dom: 'Blfrtip',
                     buttons: [
                         'copyHtml5',
                         {
                             extend: 'excel',
                             customize: function () {
                                 //alert('HELLO!');
                                 //$('.tot').remove();
                             },
                             title: 'Ferie',
                             extension: '.xlsx',
                             filename: 'Ferie ' +year,

                         },
                         {
                             extend: 'print',
                             text: 'Print',
                             autoPrint: false
                         }
                     ],
                     scrollX: true,
                     fixedColumns: true,
                     fixedColumns: {
                         leftColumns: 2,
                         rightColumns: 1                         
                     },
                     "lengthChange": true,
                     "pageLength": 25,
                     "lengthMenu": [[25, 50, 10, -1], [25, 50, 10, "All"]]
                 })
             });
              
         </script>
    </form>
</body>
</html>
