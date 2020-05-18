<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-machine-stiro.aspx.vb" Inherits="form_machine_stiro" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Machines</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/matrix-style.css" />
    <link rel="stylesheet" href="../../css/matrix-media.css" />
    <link rel="stylesheet" href="../../css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
    <script src="../../js/jquery-1.12.4.min.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet"/>
    <style>
        *:not(.icon-th):not(.icon) {
            font-family: 'Exo', sans-serif!important;
        }
        .header-fixed{
            position:fixed;
        }

            .results tr[visible='false'],.no-result{
              display:none;
            }

            .results tr[visible='true']{
              display:table-row;
            }

             body{
            height:750px;
        }
    </style>

</head>
<body>
   

   <form action="#" method="get" class="form-horizontal" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <asp:UpdatePanel runat="server">
          <ContentTemplate>

            <div id="content">
            <div id="content-header">
            <br /><br />
              <h1>Machines managment system - Tablets</h1>
            </div>
            <div class="container-fluid">
              <div class="row-fluid">
   <%--             <div class="span3">
                  <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                      <h5>Add New Machine</h5>
                    </div>

                          <label class="control-label col-xs-4">Machine Code:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_machine_suf" CssClass=" col-xs-2" value="2" Enabled="false" ></asp:TextBox>
                            <asp:TextBox runat="server" ID="txt_machine_code" CssClass=" col-xs-6" Enabled="false"></asp:TextBox>

                               <asp:Label runat="server" ID="lbl_state"></asp:Label>
                                <asp:RangeValidator runat="server" Type="Integer" 
                                    MinimumValue="1" MaximumValue="999" ControlToValidate="txt_machine_code" 
                                    ErrorMessage="Value must be a whole number between 1 and 999" />
                          </div>

                          <label class="control-label col-xs-4">Lavoro:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_lavoro" CssClass="col-xs-8" ></asp:TextBox>
                        </div>
                      

                          <label class="control-label col-xs-4">Click Value:</label>
                          <div class="controls ">
                            <asp:TextBox runat="server" ID="txt_ang1_code" CssClass="col-xs-8" value="1"></asp:TextBox>
                            <asp:RangeValidator runat="server" Type="Integer" 
                                    MinimumValue="1" MaximumValue="10" ControlToValidate="txt_ang1_code" 
                                    ErrorMessage="Value must be a whole number between 1 and 10" />
                          </div>
                      
                          <label class="control-label col-xs-4">Line:</label>
                          <div class="controls ">
                              <asp:DropDownList runat="server" ID="ddl_Line" CssClass="col-xs-8"  style="max-width: 92%;">
                                <asp:listitem>LINEA1</asp:listitem>
                                <asp:listitem>LINEA2</asp:listitem>
                                <asp:listitem>LINEA3</asp:listitem>
                                <asp:listitem>LINEA4</asp:listitem>
                                <asp:listitem>LINEA5</asp:listitem>
                                <asp:listitem>LINEA6</asp:listitem>
                                <asp:listitem>LINEA7</asp:listitem>
                                <asp:listitem>LINEA8</asp:listitem>
                                <asp:listitem>LINEA9</asp:listitem>
                                <asp:listitem>LINEA10</asp:listitem>
                                <asp:listitem>LINEA11</asp:listitem>
                                <asp:listitem>LINEA12</asp:listitem>
                                <asp:listitem>LINEA13</asp:listitem>
                                <asp:listitem>LINEA14</asp:listitem>
                                <asp:listitem>LINEA15</asp:listitem>
                                <asp:listitem>LINEA16</asp:listitem>
                                <asp:listitem>LINEA17</asp:listitem>
                                <asp:listitem>LINEA18</asp:listitem>
                              </asp:DropDownList>

                          </div>

                             <br />
                           <br />

                        <div class="form-actions">
                          <asp:button type="submit" runat="server" ID="btn_addmachine" class="btn btn-success col-xs-12" Text="Add Machine"></asp:button>
                      
                        </div>
          
                    </div>
                  </div>
                  --%>
                <div class="span11">
                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>List of Machine codes</h5>
                        <input type="text" class="search form-control" placeholder="Search:">
                      </div>
                   
                    <div class="widget-content" style="height: 65vh; overflow: auto">
            
                          <asp:gridview
                              runat="server" 
                              CssClass="table table-bordered data-table results" 
                              datasourceid="CustomersSqlDataSourceArticle" 
                              autogeneratecolumns="true" 
                              autogenerateeditbutton="false" 
                              AutoGenerateDeleteButton="false" 
                              allowpaging="false"
                              AllowSorting="false" 
                              datakeynames="Id" 
                              OnRowDataBound="Conf_Grid_DataBound"
                              OnRowUpdating="TaskGridView_RowUpdating" 
                              OnRowDeleting="TaskGridView_RowDeleteing"
                              id="ConfA_Grid">
                          </asp:gridview>

                        <asp:sqldatasource id="CustomersSqlDataSourceArticle"  
                        Selectcommand="Select [Id], [CodMasina] As Code, [Adresa], [Descriere] as Lavoro, [Linie], [Grup], [Active] From [Masini] Where IdSector=2 ORDER BY [CodMasina] DESC"
                        Updatecommand="Update Masini SET CodMasina=@Code, [Adresa]=@Adresa, Descriere=@Lavoro, Linie=@Linie, Grup=@Grup, Active=@Active WHERE Id=@Id"
                        DeleteCommand="DELETE FROM [Masini] WHERE [Id] = @Id"
                        connectionstring="<%$ ConnectionStrings:DefaultConnection%>"
                        runat="server">
                        </asp:sqldatasource>
                      </div> 
                    </div>
                </div>
            </div>
 
        </ContentTemplate>
      </asp:UpdatePanel>
    </form>

                       <%-- SEARCH --%>
                <script>

                    Sys.Application.add_load(initSomething);
                    function initSomething() {

                        $(".search").keyup(function () {
                            var searchTerm = $(".search").val();
                            var listItem = $('.results tbody').children('tr');
                            var searchSplit = searchTerm.replace(/ /g, "'):containsi('");

                            $.extend($.expr[':'], {
                                'containsi': function (elem, i, match, array) {
                                    return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                                }
                            });

                            $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function (e) {
                                $(this).attr('visible', 'false');
                            });

                            $(".results tbody tr:containsi('" + searchSplit + "')").each(function (e) {
                                $(this).attr('visible', 'true');
                            });

                        });

                    }

                </script>

<%--<script src="./js/jquery-1.12.4.min.js"></script>--%>


</body>
</html>
