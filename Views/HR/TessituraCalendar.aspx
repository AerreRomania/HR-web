<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TessituraCalendar.aspx.cs" Inherits="TessituraCalendar" %>

<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <style>
        a {
            text-decoration: none;
        }

        * {
            font-family: Exo !important;
        }

        .header {
            color: #4CAF50;
        }

        input[type='checkbox'] {
            display: none;
        }

        table{
                box-shadow: 0px 0px 5px 0px #717171;
        }

        html{
                height: 910px;
        }

        th {
            padding:5px;
            text-align: center!important;
            font-size:13px;
        }
        td {
            text-align: center;
            font-size:12px;
        }
        table {
            margin-bottom:20px;
        }

        .hvr:hover{ cursor: pointer;background-color:#cddc39;}

        .hover {
            /*background-color:#f5ff90;*/
            font-weight:600;
            text-decoration: underline;
        }
    </style>
    
    <link rel="stylesheet" href="../../css/bootstrap.css"/>
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function () {

            //hvr on hover
            $('#gv_caposquadra1ppl .hvr, #gv_caposquadra2ppl .hvr, #gv_caposquadra3ppl .hvr ').hover(function() {
                var value = $(this).text();

                $('#gv_caposquadra1 > tbody  > tr, #gv_caposquadra2 > tbody  > tr, #gv_caposquadra3 > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }  
                    } 
                }); 
            });


            $('#gv_capoturnoppl .hvr ').hover(function () {
                var value = $(this).text();

                $('#gv_capoturno > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }
                    }
                });
            });


            $('#gv_operatoremachina1ppl .hvr, #gv_operatoremachina2ppl .hvr, #gv_operatoremachina3ppl .hvr ').hover(function () {
                var value = $(this).text();

                $('#gv_operatoremachina1 > tbody  > tr, #gv_operatoremachina2 > tbody  > tr, #gv_operatoremachina3 > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }
                    }
                });
            });

            $('#gv_meccanicoppl .hvr ').hover(function () {
                var value = $(this).text();

                $('#gv_meccanico > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }
                    }
                });
            });
             
            $('#gv_cqppl .hvr ').hover(function () {
                var value = $(this).text();

                $('#gv_cq > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }
                    }
                });
            });

            $('#gv_pulitorippl .hvr ').hover(function () {
                var value = $(this).text();

                $('#gv_pulitori > tbody  > tr').each(function () {
                    var i = 0;
                    for (i = 0; i < 8; i++) {
                        if ($(this).find('td').eq(i).text() == value) {
                            $(this).toggleClass('hover');
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server"  >
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:ScriptManager runat="server" ></asp:ScriptManager>

                <div   style="padding:20px;">
                    <div>
                        <h3>CAPO SQUADRA</h3>
                        <hr /> 

                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_caposquadra1" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                                <asp:GridView runat="server" ID="gv_caposquadra2" OnRowDataBound="GridView_RowDataBound"></asp:GridView> 
                                <asp:GridView runat="server" ID="gv_caposquadra3" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12"><asp:GridView runat="server" ID="gv_caposquadra1ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView></div>
                            <div class="col-md-2 col-xs-12"><asp:GridView runat="server" ID="gv_caposquadra2ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView> </div>
                            <div class="col-md-2 col-xs-12"><asp:GridView runat="server" ID="gv_caposquadra3ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView> </div>
                        </div> 

                    </div>

                    <br />
                    <br />

                    <div >
                        <h3>CAPO TURNO</h3>
                        <hr />
                        
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_capoturno" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_capoturnoppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                            
                        </div> 
                    </div>
                    <br />
                    <br />

                    <div >
                        <h3>OPERATORE MACCHINE</h3>
                        <hr />
                        
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_operatoremachina1" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                                <asp:GridView runat="server" ID="gv_operatoremachina2" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                                <asp:GridView runat="server" ID="gv_operatoremachina3" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_operatoremachina1ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_operatoremachina2ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_operatoremachina3ppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                        </div> 
                        
                       
                    </div>
                    <br />
                    <br />

                    <div >
                        <h3>MECCANICO</h3>
                        <hr />
                        
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_meccanico" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_meccanicoppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                             
                        </div>

                       
                       
                    </div>
                    <br />
                    <br />

                    <div >
                        <h3>CONTROLLO QUALITA'</h3>
                        <hr />
                        
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_cq" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_cqppl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                            
                        </div>

                       
                       
                    </div>
                    <br />
                    <br />

                    <div >
                        <h3>PULITORI</h3>
                        <hr />
                        
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <asp:GridView runat="server" ID="gv_pulitori" OnRowDataBound="GridView_RowDataBound"></asp:GridView>
                            </div>
                            <div class="col-md-2 col-xs-12">
                                <asp:GridView runat="server" ID="gv_pulitorippl" OnRowDataBound="GridViewPPL_RowDataBound"></asp:GridView>
                            </div>
                          
                        </div>

                        
                        
                    </div>
                    
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
