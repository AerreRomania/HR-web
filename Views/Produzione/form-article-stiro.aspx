<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-article-stiro.aspx.vb" Inherits="form_article_stiro" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Article</title>
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

            .results tr[visible='false'],
            .no-result{
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
   

   <form action="#"  class="form-horizontal" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <asp:UpdatePanel runat="server">
          <ContentTemplate>

            <div id="content">
            <div id="content-header">
              <div id="breadcrumb"> <a href="dashboard.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Production Managment</a> <a href="#" class="current">Article</a> </div>
              <h1>Article managment system</h1>
            </div>
            <div class="container-fluid">
              <hr/>
              <div class="row-fluid">
               <%-- <div class="span3">
                  <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                      <h5>Add New Article</h5>
                    </div>

                    <div class="widget-content nopadding">
                          <label class="control-label col-xs-4">Articolo:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_art_name" CssClass="col-xs-8" placeholder="2.20031554E1D"></asp:TextBox>
                          </div>
                        <br />

                          <label class="control-label col-xs-4">Descrozopme:</label>
                          <div class="controls">
                              <asp:TextBox runat="server" ID="txt_art_descript" CssClass="col-xs-8" placeholder="Maglia"></asp:TextBox>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Sector:</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Sector" CssClass="col-xs-8">
                                <asp:listitem Value="2">Stiro</asp:listitem>
                              </asp:DropDownList>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Costio di produzione:</label>
                          <div class="controls">
                              <asp:TextBox runat="server" ID="txt_art_cost"  CssClass="col-xs-8"></asp:TextBox>

                          </div>
                        <br />
                          <label class="control-label col-xs-4">IdStagione:</label>
                          <div class="controls">
                            <asp:TextBox runat="server"  ID="txt_art_idstag" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Finezza:</label>
                          <div class="controls">
                            <asp:TextBox runat="server"  ID="txt_art_finete" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Prezzo:</label>
                          <div class="controls">
                            <asp:TextBox runat="server"  ID="txt_art_prezzo" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Capi/Ora:</label>
                          <div class="controls">
                            <asp:TextBox runat="server"  ID="txt_art_centes" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                        <br />
                          <label class="control-label col-xs-4">Stagione:</label>
                          <div class="controls">
                            <asp:TextBox runat="server"  ID="txt_art_stagione" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                        <br />
                        <br />
                        <div class="form-actions">
                          <asp:button type="submit" runat="server" ID="btn_adduser" class="btn btn-success col-xs-12" Text="Add new article"></asp:button>
                            <br />
                            <br />
                        </div>
          
                    </div>
                  </div>

                </div>--%>

                <div class="span11">
                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>Gestione arhivio articol</h5>
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
                              AllowSorting="true" 
                              datakeynames="Id" 
                              onrowupdating="TaskGridView_RowUpdating" 
                              OnRowDataBound="ConfA_Grid_DataBound"  
                              id="ConfA_Grid">
                                
                          </asp:gridview>

                          <asp:sqldatasource id="CustomersSqlDataSourceArticle"  
                            Selectcommand="Select [Id], [Articol], [Descriere], [CostProductie], [IdStagiune], [Finete], [Prezzo], [IdSector], [Centes], [Stagione] From [Articole] Where IdSector = 2"
                            Updatecommand="Update Articole SET Articol=@Articol, Descriere=@Descriere, CostProductie=@CostProductie, IdStagiune=@IdStagiune, Finete=@Finete, Prezzo=@Prezzo, IdSector=@IdSector, Centes=@Centes, Stagione=@Stagione WHERE (Id = @Id)"
                            DeleteCommand="DELETE FROM [Articole] WHERE Id = @Id"
                            Connectionstring="<%$ ConnectionStrings:DefaultConnection%>"
                            runat="server">
                          </asp:sqldatasource>
                      </div> 
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




</body>
</html>
