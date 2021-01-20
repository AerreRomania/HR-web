<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_fase.aspx.cs" Inherits="Views_Produzione_fase" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fase</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../../libs/bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/datatables.min.css"/>
    <link href="../../css/_schieda.css" rel="stylesheet"/>
    <script src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/pdfmake.min.js"></script>
    <script type="text/javascript" src="../../js/vfs_fonts.js"></script>
    <script type="text/javascript" src="../../js/datatables-a.min.js"></script>
    <script type="text/javascript" src="../../js/buttons.print.min.js"></script>
    <script type="text/javascript" src="../../js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="../../js/printThis.js"></script> 


    <style type="text/css">
        *:not(.icon-th):not(.icon) {
            font-family: 'Exo', sans-serif!important;
        }
        .results tr[visible='false'],
        .no-result{
            display:none;
        }
        .results tr[visible='true']{
            display:table-row;
        }      
        body{
            height:850px;
        }
        thead{
            background:#fedc6e;
        }
    </style>

</head>
<body>
   <form action="#"  class="form-horizontal" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <asp:UpdatePanel runat="server">
          <ContentTemplate>
            <div id="content">
            <div class="container-fluid">
              <hr/>
              <div class="row-fluid">

                <div class="span11">
                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>Active Fase in <asp:Label runat="server" ID="txt_dep" style="font-size: 15pt;"></asp:Label></h5>
                      </div>
                   
                    <div class="widget-content" style=" overflow: auto">
            
                          <asp:gridview
                              runat="server" 
                              CssClass="gvv table tbl table-striped" 
                              autogeneratecolumns="true"
                              id="fase_grid">
                          </asp:gridview>
                      </div> 
                    </div>
                </div>
              </div>
            </div>

        </ContentTemplate>
      </asp:UpdatePanel>
    </form>
            <script type="text/javascript">
                Sys.Application.add_load(initSomething);
                function initSomething() {
                    $('.gvv').dataTable({
                        dom: 'Blfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            {
                                extend: 'print',
                                text: 'Print',
                                autoPrint: false
                            }
                        ],
                        "lengthChange": true,
                        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
                    });
                        }
            </script>

</body>
</html>

