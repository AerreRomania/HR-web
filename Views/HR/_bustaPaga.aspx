<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_bustaPaga.aspx.cs" Inherits="Views_HR_bustaPaga" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../libs/bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/datatables.min.css"/>
    <link href="../../css/_schieda.css" rel="stylesheet"/>
    <script src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/pdfmake.min.js"></script>
    <script type="text/javascript" src="../../js/vfs_fonts.js"></script>
    <script type="text/javascript" src="../../js/datatables-a.min.js"></script>
    <style>
        table.dataTable td, table.dataTable th {
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
            border-color: #4343430d;
            font-size: 11pt;
        }

        thead tr{
                height: 45px;
        }

        th, td{
                padding-left: 10px;
                padding-right: 10px;
        }

        .grd {
            border:none;
        }

        #btn_upload{
                height: 25px;
        }

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

    </style>
</head>
<body style="height:800px">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                    <asp:FileUpload runat="server" ID="file_upload" AllowMultiple="false"  />
                    <asp:TextBox runat="server" ID="txt_name" placeholder="Name of file"  ></asp:TextBox>
                    <asp:Button runat="server" ID="btn_upload" OnClick="btn_upload_Click" Text="Upload files" /> 
                        <hr style="border-bottom: 1px solid white; width:100%;" />
                        <br />
                    <asp:Label runat="server" ID="txt_status"></asp:Label>
                        <br /><br />
                </div>

            <asp:ScriptManager runat="server" ID="sc"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                       <div class="row">
                    <asp:GridView runat="server"  ID="GridView" CssClass="grd" Width="1100px" OnRowDataBound="GridView_RowDataBound" DataKeyNames="Path"  OnRowDeleting="GridView_RowDeleting"   >
                        <Columns>  
                                            <asp:TemplateField>  
                                                <ItemTemplate>
                                                    <a href="#!" title="View" class="btn-view" runat="server" id="btn_select"><img src="../../img/view_btnn.svg" style="height: 20px;"/></a>
                                                    <a href="#!" title="Delete" class="btn-delete"><asp:ImageButton runat="server" CommandName="Delete" ID="btn_del"  ImageUrl="../../img/delete_btnn.svg" style="height: 20px;" /></a>
                                                </ItemTemplate>   
                                            </asp:TemplateField> 
                                              </Columns> 
                    </asp:GridView> 
                </div>


                </ContentTemplate>
            </asp:UpdatePanel>
             
                      <script type="text/javascript"> 
                          function pageLoad(sender, args) {
                              InitialiseSettings();
                          }

                          function InitialiseSettings() {

                              $(".grd tbody").before("<thead><tr></tr></thead>");
                              $(".grd thead tr").append($(".grd th"));
                              $(".grd tbody tr:first").remove();

                              //$(".grd").tablesorter({ sortList: [[1, 0]] });

                              $('.grd').dataTable({
                                  "lengthChange": true,
                                  "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
                              })
                          }


                        </script>
        </div>


      
    </form>
</body>
</html>
