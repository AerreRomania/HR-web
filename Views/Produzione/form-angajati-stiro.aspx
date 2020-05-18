<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Views/Produzione/form-angajati-stiro.aspx.vb" Inherits="form_angajati_stiro" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Add Person - Tablet</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/matrix-style.css" />
    <link rel="stylesheet" href="../../css/matrix-media.css" />
    <link rel="stylesheet" href="../../css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
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
              <h1>Employee managment system - Tablets</h1>
            </div>
            <div class="container-fluid">
              <div class="row-fluid">
              <%--  <div class="span3">
                  <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                      <h5>Add New Person</h5>
                    </div>

                     <div class="widget-content nopadding">
                          <label class="control-label col-xs-4">Last Name:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_ang1_lastname" CssClass="col-xs-8" ></asp:TextBox>
                          </div>
                         <br />
                          <label class="control-label col-xs-4">First Name:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_ang1_name" CssClass="col-xs-8" ></asp:TextBox>
                          </div>
                         <br />
                          <label class="control-label col-xs-4">Code:</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_ang1_code" CssClass="col-xs-8" Enabled="false" ></asp:TextBox>
                         
                        </div>
                         <br />

                          <label class="control-label col-xs-4">Sex:</label>
                          <div class="controls">
                              <asp:TextBox runat="server" ID="txt_ang1_sex" CssClass="col-xs-8" placeholder="M/F"></asp:TextBox>
                                                       
                          </div>
                         <br />
                          <label class="control-label col-xs-4">Sector :</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Sector" CssClass="col-xs-8" style="max-width: 92%;">
                                <asp:listitem Value="1">Confezione A</asp:listitem>
                                <asp:listitem Value="1">Confezione B</asp:listitem>
                              </asp:DropDownList>
                          </div>
                         <br />
                         
                          <label class="control-label col-xs-4">Line :</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Line" CssClass="col-xs-8" style="max-width: 92%;">
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

                        <div class="control-group">
                          <label class="control-label col-xs-4">Date assegnato:</label>
                          <div class="controls">
                              <asp:TextBox runat="server"  CssClass="col-xs-8" ID="cal_date_assign"></asp:TextBox>
                          </div>
                        </div>

                         <br />
                         <br />
                        <div class="form-actions">
                          <asp:button type="submit" runat="server" ID="btn_adduser" class="btn btn-success col-xs-12" Text="Add employee"></asp:button>
                      
                        </div>
                        
                    </div>
                  </div>
                    <br />
                </div>--%>
                <div class="span11">
                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>List of Tablet users</h5>
                        <input type="text" class="search form-control" placeholder="Search:">
                      </div>
                   
                    <div class="widget-content" style="height: 65vh; overflow: auto">
            
                          <asp:GridView
                              runat="server" 
                              CssClass="table table-bordered data-table results" 
                              datasourceid="CustomersSqlDataSourceArticle" 
                              autogeneratecolumns="true" 
                              autogenerateeditbutton="false" 
                              AutoGenerateDeleteButton="false" 
                              allowpaging="false"
                              AllowSorting="true" 
                              datakeynames="Id" 
                              OnRowDataBound="ConfA_Grid_DataBound"
                       
                              id="ConfA_Grid">
                          </asp:GridView>

                        <asp:SqlDataSource id="CustomersSqlDataSourceArticle"  
                        Selectcommand="Select [Id], [CodAngajat], [Angajat], [Sex], [DataNasterii], [DataAngajarii], [status], [Linie], [IdSector] From [Angajati] Where IdSector=2 ORDER BY [CodAngajat] DESC"
                        Updatecommand="Update Angajati SET CodAngajat=@CodAngajat, Angajat=@Angajat, Sex=@Sex, DataNasterii=@DataNasterii, DataAngajarii=@DataAngajarii, status=@status, Linie=@Linie, IdSector=@IdSector WHERE (Id = @Id)"
                        DeleteCommand="DELETE FROM [Angajati] WHERE Id = @Id"
                        connectionstring="<%$ ConnectionStrings:DefaultConnection%>"
                        runat="server">
                        </asp:SqlDataSource>
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


<script src="../../js/jquery-1.12.4.min.js"></script>

</body>
</html>
