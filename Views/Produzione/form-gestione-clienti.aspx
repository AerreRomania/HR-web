<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-gestione-clienti.aspx.vb" Inherits="form_gestione_clienti" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Gestione ordini clienti</title>
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
        .header-fixed {
            position: fixed;
        }

        .results tr[visible='false'], .no-result {
            display: none;
        }

        .results tr[visible='true'] {
            display: table-row;
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
                
                <br />
                <br />
                <div id="content">
                    <div id="content-header">
                       
                        <h1>Gestione ordini clienti</h1>
                    </div>
                    <div class="container-fluid">
                        <div class="row-fluid">
                         <%--   <div class="span3">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-align-justify"></i></span>
                                        <h5>Add New Client</h5>
                                    </div>

                                            <label class="control-label col-xs-4">Client:</label>
                                            <div class="controls">
                                                <asp:TextBox runat="server" ID="txt_client" CssClass="col-xs-8"></asp:TextBox>
                                                <asp:Label runat="server" ID="lbl_status"></asp:Label>
                                            </div>
                                    
                                    <br />


                                            <label class="control-label col-xs-4">Nr.Reg.Comert:</label>
                                            <div class="controls">
                                                <asp:TextBox runat="server" ID="txt_reg" CssClass="col-xs-8"></asp:TextBox>
                                            </div>
                                    <br />
                                                <label class="control-label col-xs-4">Adresa:</label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="txt_adresa" CssClass="col-xs-8"></asp:TextBox>
                                                </div>
                                    <br />
                                                    <label class="control-label col-xs-4">Tara:</label>
                                                    <div class="controls">
                                                        <asp:TextBox runat="server" ID="txt_tara" CssClass="col-xs-8"></asp:TextBox>
                                                    </div>
                                    <br />
                                                        <label class="control-label col-xs-4">Telefon:</label>
                                                        <div class="controls">
                                                            <asp:TextBox runat="server" ID="txt_telefon" CssClass="col-xs-8"></asp:TextBox>
                                                        </div>
                                    <br />
                                                            <label class="control-label col-xs-4">E-Mail:</label>
                                                            <div class="controls">
                                                                <asp:TextBox runat="server" ID="txt_email" CssClass="col-xs-8"></asp:TextBox>
                                                            </div>
                                    <br />
                                    <br />
                                                        <div class="form-actions">
                                                            <asp:Button type="submit" runat="server" ID="btn_adduser" class="btn btn-success col-xs-12" Text="Add Client"></asp:Button>

                                                        </div>
                                    <br />
                                    <br />
                                                    </div>
                                                </div>--%>

                                 
                            <div class="span11">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-th"></i></span>
                                        <h5>List of ordini clienti</h5>
                                        <input type="text" class="search form-control" placeholder="Search:">
                                    </div>

                                    <div class="widget-content" style="height: 65vh; overflow: auto">

                                        <asp:GridView
                                            runat="server"
                                            CssClass="table table-bordered data-table results"
                                            DataSourceID="CustomersSqlDataSourceArticle"
                                            AutoGenerateColumns="true"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateDeleteButton="false"
                                            AllowPaging="false"
                                            AllowSorting="true"
                                            DataKeyNames="Id"
                                            OnRowDataBound="ConfA_Grid_DataBound"
                                            OnRowUpdating="TaskGridView_RowUpdating"
                                            OnRowDeleting="TaskGridView_RowDeleteing"
                                            ID="ConfA_Grid">
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="CustomersSqlDataSourceArticle"
                                            SelectCommand="Select [Id], [Client], [NrRegComert] , [Adresa], [Tara], [Telefon], [Email] From [Clienti] ORDER BY [Id] Asc"
                                            UpdateCommand="Update Clienti SET Client=@Client, NrRegComert=@NrRegComert, Adresa=@Adresa, Tara=@Tara, Telefon=@Telefon, Email=@Email WHERE (Id = @Id)"
                                            DeleteCommand="DELETE FROM [Clienti] WHERE Id = @Id"
                                            ConnectionString="<%$ ConnectionStrings:DefaultConnection%>"
                                            runat="server"></asp:SqlDataSource>
                                    </div>
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


<%--<script src="./js/jquery-1.12.4.min.js"></script>--%>


</body>
</html>
