<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-tabletserials-tess.aspx.vb" Inherits="form_tabletserials" %>



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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />
    <script src="../../js/jquery-1.12.4.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
    <style>
        *:not(.icon-th):not(.icon) {
            font-family: 'Exo', sans-serif !important;
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

        body {
            height: 750px;
        }

        .control-group {
            padding-bottom: 10px;
        }

        .totale {
            margin-left: 20px;
            height: 130px;
            font-size: 12pt;
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
                        <br />
         <%--               <br />
                        <h1>Setback Tablets - Employee/Tablet</h1>--%>
                    </div>
                    <div class="container-fluid">
                        <hr />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-th"></i></span>
                                        <h5>Add New Tablet - serial number</h5>
                                    </div>
                                    <%-- NAME --%>

                                    <div class="widget-content nopadding">
                                        <div class="control-group">
                                            <label class="control-label">Full Name:</label>
                                       <%--     <asp:DropDownList runat="server" ID="ddl_name" AutoPostBack="true" AppendDataBoundItems="true" ViewStateMode="Enabled" EnableViewState="true" Style="margin-left: 23px;"></asp:DropDownList>--%>
                                                                                        <asp:TextBox runat="server" style="margin-left:23px;" ID="txtFullName"></asp:TextBox>

                                            <%--<asp:TextBox runat="server" ID="test"></asp:TextBox>--%>

                                            <div style="float: right; margin-right: 20px;">
                                                <label class="control-label">Line:</label>
                                                <asp:DropDownList runat="server" ID="ddl_Line" CssClass="spanl11" Style="max-width: 92%;">
                                                    <asp:ListItem>T1</asp:ListItem>
                                                    <asp:ListItem>T2</asp:ListItem>
                                                    <asp:ListItem>T3</asp:ListItem>
                            <%--                        <asp:ListItem>S4</asp:ListItem>
                                                    <asp:ListItem>S5</asp:ListItem>
                                                    <asp:ListItem>S6</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>


                                        <%-- SERIAL NUMBER --%>
                                        <div class="widget-content nopadding">
                                            <div class="control-group">
                                                <label class="control-label">Tablet Serial:</label>
                                                <asp:TextBox runat="server" ID="txt_serial" Style="margin-left: 11px; width: 195px;"></asp:TextBox>
                                            </div>

                                            <div class="widget-content nopadding">
                                                <div class="control-group">
                                                    <label class="control-label">Tablet Mark:</label>
                                                    <asp:DropDownList runat="server" ID="ddl_tablet_mark" ClientIDMode="static" Style="margin-left: 13px;">
                                                        <asp:ListItem>Denver</asp:ListItem>
                                                        <asp:ListItem>Utok</asp:ListItem>
                                                        <asp:ListItem>E-star</asp:ListItem>
                                                        <asp:ListItem>Viva</asp:ListItem>
                                                        <asp:ListItem>Stark Grove</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                            </div>

                                            <%-- DESCRIPTION --%>
                                            <div class="widget-content nopadding">
                                                <div class="control-group">
                                                    <label class="control-label">Description:</label>
                                                    <asp:TextBox runat="server" ID="txt_description" Style="margin-left: 15px; margin-top: 10px; width: 330px; height: 100px;"></asp:TextBox>
                                                </div>




                                                <div class="form-actions">
                                                    <asp:Button type="submit" runat="server" ID="btn_addtabletserial" class="btn btn-success" Text="Add Serial" Style="width: 100%;"></asp:Button>

                                                </div>

                                            </div>

                                        </div>


                                    </div>

<%--                                    <div class="totale">
                                        <br />

                                        <span>Confezione A:</span><asp:Label runat="server" ID="tot_conf_a"></asp:Label>
                                        <br />
                                        <span>Confezione B:</span><asp:Label runat="server" ID="tot_conf_b"></asp:Label>
                                        <br />

                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-th"></i></span>
                                        <h5>List of setback tablets</h5>
                                        <input type="text" class="search form-control" placeholder="Search:">
                                    </div>


                                    <div class="widget-content" style="height: 84vh; overflow: auto">
                                        <asp:GridView
                                            runat="server"
                                            CssClass="table table-bordered data-table results"
                                            DataSourceID="CustomersSqlDataSourceTabletSerials"
                                            AutoGenerateColumns="true"
                                            AutoGenerateEditButton="true"
                                            AutoGenerateDeleteButton="true"
                                            AllowPaging="false"
                                            AllowSorting="true"
                                            DataKeyNames="Id"
                                            OnRowDataBound="Grid_DataBound"
                                            OnRowUpdating="TaskGridView_RowUpdating"
                                            OnRowDeleting="TaskGridView_RowDeleteing"
                                            ID="gv_all">
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="CustomersSqlDataSourceTabletSerials"
                                            SelectCommand="Select * From TabletInformations WHERE Line IN ('T1','T2','T3') ORDER BY Line, FullName ASC"
                                            UpdateCommand="Update TabletInformations SET [FullName]=@FullName, [Line]=@Line, [SerialNumber]=@SerialNumber, [TabletMark]=@TabletMark, [Description]=@Description WHERE Id=@Id"
                                            DeleteCommand="DELETE FROM [TabletInformations] WHERE [Id] = @Id"
                                            ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString%>"
                                            runat="server"></asp:SqlDataSource>
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
