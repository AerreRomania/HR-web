<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Views/Produzione/form-addemployee.aspx.vb" Inherits="form_addemployee" MaintainScrollPositionOnPostback="true"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Add Employee</title>
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

               body{
            height:750px;
        }

            .results tr[visible='false'],
            .no-result{
              display:none;
            }

            .results tr[visible='true']{
              display:table-row;
            }

    </style>



</head>
<body>
   

   <form action="#" class="form-horizontal" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <asp:UpdatePanel runat="server">
          <ContentTemplate>

            <div id="content">
            <div id="content-header">
                <br /><br />
                <h1>Persons - Organigramma Confezione</h1>
            </div>
            <div class="container-fluid">
              <div class="row-fluid">
                 <%--<div class="span3">
                  <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                      <h5>Person Information</h5>
                    </div>
                      <div class="widget-content nopadding">

                          <label class="control-label col-xs-4">Last Name :</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_usr_surname" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                      
                      <br />

                          <label class="control-label col-xs-4">First Name :</label>
                          <div class="controls">
                            <asp:TextBox runat="server" ID="txt_usr_name" CssClass="col-xs-8"></asp:TextBox>
                          </div>

                        <br />
                        

                          <label class="control-label col-xs-4">Sector :</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Sector" CssClass="col-xs-8">
                                <asp:listitem Value="2">Stiro</asp:listitem>
                              </asp:DropDownList>
                          </div>
                          
                          <br />

                          <label class="control-label col-xs-4">Line :</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Line" CssClass="col-xs-8">
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

                          <label class="control-label col-xs-4">Lavoro :</label>
                          <div class="controls">
                              <asp:DropDownList runat="server" ID="ddl_Lavoro" CssClass="col-xs-8">
                                <asp:listitem>Capolinea</asp:listitem>
                                <asp:listitem>Cartellini</asp:listitem>
                                <asp:listitem>Controllo colli</asp:listitem>
                                <asp:listitem>CQ</asp:listitem>
                                <asp:listitem>Divisione Taglie</asp:listitem>
                                <asp:listitem>Et. Comp</asp:listitem>
                                <asp:listitem>Et. Copp</asp:listitem>
                                <asp:listitem>Magazzioneri</asp:listitem>
                                <asp:listitem>Manichino</asp:listitem>
                                <asp:listitem>Meccanico</asp:listitem>
                                <asp:listitem>O/V</asp:listitem>
                                <asp:listitem>O/V fianchi</asp:listitem>
                                <asp:listitem>Piego</asp:listitem>
                                <asp:listitem>Prep. Cart</asp:listitem>
                                <asp:listitem>Pressa</asp:listitem>
                                <asp:listitem>Programmatori</asp:listitem>
                                <asp:listitem>Punti persi</asp:listitem>
                                <asp:listitem>Raglan</asp:listitem>
                                <asp:listitem>Rammendo</asp:listitem>
                                <asp:listitem>Rifinitura manuale</asp:listitem>
                                <asp:listitem>Rimaglio collo</asp:listitem>
                                <asp:listitem>Rimaglio maniche</asp:listitem>
                                <asp:listitem>Rimaglio spalle</asp:listitem>
                                <asp:listitem>Travetta</asp:listitem>
                                <asp:listitem>T-Fili</asp:listitem>
                                <asp:listitem>T/C</asp:listitem>
                                <asp:listitem>Tecchnice</asp:listitem>
                                <asp:listitem>Tempi e metodi</asp:listitem>
                              </asp:DropDownList>

                          </div>
                          
                          <br />

                          <label class="control-label col-xs-4">Date assegnato:</label>
                          <div class="controls">
                              <asp:TextBox runat="server"  CssClass="col-xs-8" ID="cal_date_assign"></asp:TextBox>
                          </div>
                          
                          <br />
                          <label class="control-label col-xs-4">Other :</label>
                          <div class="controls">
                                <asp:TextBox runat="server" ID="txt_usr_other" CssClass="col-xs-8"></asp:TextBox>
                          </div>
                          
                          <br />
                          <label class="control-label col-xs-4">Turno :</label>
                          <div class="controls">
                                <asp:TextBox runat="server" ID="txt_usr_turno"  CssClass="col-xs-8"></asp:TextBox>

                              <asp:RangeValidator runat="server" Type="Integer" 
                                    MinimumValue="1" MaximumValue="2" ControlToValidate="txt_usr_turno" 
                                    ErrorMessage="Value must be a whole number between 1 and 2" />
                          </div>
                          <br />
           
                        <div class="form-actions">
                          <asp:button type="submit" runat="server" ID="btn_adduser" class="btn btn-success col-xs-12" Text="Add employee"></asp:button>
                        </div>
                        <br />
                          <br />
                    </div>
                  </div>

                </div>--%>

                <div class="span11">
                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>Confezione A</h5>
                        <input type="text" class="search form-control" placeholder="Search:">
                      </div>
                   
                    <div class="widget-content" style="height: 350px; overflow: auto">
            
                          <asp:GridView CssClass="table table-bordered data-table results" 
                                datasourceid="CustomersSqlDataSourceConfA" 
                                autogeneratecolumns="true"
                                autogenerateeditbutton="false"
                                allowpaging="false" 
                                AllowSorting="true"
                                datakeynames="Id"
                                OnRowDataBound="ConfA_Grid_DataBound"
                                AutoGenerateDeleteButton="false" 
                                runat="server"
                                id="ConfA_Grid">
                                
                              
                          </asp:GridView>

                          <asp:SqlDataSource id="CustomersSqlDataSourceConfA"  
                            selectcommand="Select [Id], [Line], [Name], [Lavoro], [Active], [IdSector] From [Organizator] Where [Organizator].Line in ('LINEA13','LINEA14','LINEA15','LINEA16','LINEA17','LINEA18') AND [Organizator].IdSector=1 "
                            updatecommand="Update Organizator SET Line=@Line, Name=@Name, Lavoro=@Lavoro, Active=@Active, IdSector=@IdSector WHERE (Id = @Id);"
                            DeleteCommand="DELETE FROM [Organizator] WHERE Id = @Id"
                            connectionstring="<%$ ConnectionStrings:DefaultConnection%>"
                            runat="server">
                          </asp:SqlDataSource>

                 

                      </div> 
                    </div>
       

                    <div class="widget-box">
                      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>Confezione B</h5>

                      </div>
                      <div class="widget-content" style="height: 350px; overflow: auto">
                        <asp:GridView CssClass="table table-bordered data-table results" 
                            datasourceid="CustomersSqlDataSourceConfB" 
                            autogeneratecolumns="true"
                            autogenerateeditbutton="false"
                            allowpaging="false" 
                            AllowSorting="true"
                            datakeynames="Id"
                            onrowupdating="TaskGridView_RowUpdating"
                             OnRowDataBound="ConfA_Grid_DataBound"
                            AutoGenerateDeleteButton="false" 
                           DeleteCommand="DELETE FROM [Organizator] WHERE Id = @Id"
                            runat="server"
                            id="ConfB_Grid">
                        </asp:GridView>

                        <asp:SqlDataSource id="CustomersSqlDataSourceConfB"  
                        selectcommand="Select [Id], [Line], [Name], [Lavoro], [Active], [IdSector] From [Organizator] Where Line in ('LINEA1','LINEA2','LINEA3','LINEA4','LINEA5','LINEA6','LINEA7','LINEA8','LINEA9','LINEA10','LINEA11','LINEA12') AND IdSector=1"
                        updatecommand="Update Organizator SET Line=@Line, Name=@Name, Lavoro=@Lavoro, Active=@Active, IdSector=@IdSector WHERE (Id = @Id)"
                        DeleteCommand="DELETE FROM [Organizator] WHERE Id = @Id"
                        connectionstring="<%$ ConnectionStrings:DefaultConnection%>"
                        runat="server">
                        </asp:SqlDataSource>
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
