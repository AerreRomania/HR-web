<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_schieda.aspx.cs" Inherits="_schieda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schieda Dipendenti</title>

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
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
         <asp:ScriptManager runat="server"></asp:ScriptManager>

        <div class="container-fluid">
            <div class="">
                <div class="">
                     <section class="d-flex justify-content-center" >
                         <div class="table-responsive" style="margin:50px;">

                             <asp:GridView runat="server" ID="GridView1"  CssClass="gvv table tbl table-striped" DataSourceID="AngajatiView"  OnPreRender="GridView1_PreRender"  AutoGenerateColumns="true" Width="100%" OnRowDataBound="GridView_RowDataBound">
                                 <Columns>  
                                <asp:TemplateField>  
                                    <ItemTemplate>
                                        <a href="#!" title="View" class="btn-view"><img src="../../img/binoculars.svg" style="height: 15px;"/></a>
                                        <a href="#!" title="Edit" class="btn-edit"><img src="../../img/binocularsedit.svg" style="height: 15px;"/></a>
                                    </ItemTemplate>   
                                </asp:TemplateField> 
                                  </Columns> 
                             </asp:GridView>

                            <asp:GridView runat="server" ID="GridView2" CssClass="gvv2 table tbl table-striped" DataSourceID="AngajatiOdpusteni"  OnPreRender="GridView2_PreRender"  AutoGenerateColumns="true" Width="100%" OnRowDataBound="GridView_RowDataBound">
                                 <Columns>  
                                <asp:TemplateField>  
                                    <ItemTemplate>
                                        <a href="#!" title="View" class="btn-view"><img src="../../img/binoculars.svg" style="height: 15px;"/></a>
                                        <a href="#!" title="Edit" class="btn-edit"><img src="../../img/binocularsedit.svg" style="height: 15px;"/></a>
                                    </ItemTemplate>   
                                </asp:TemplateField> 
                                  </Columns> 
                             </asp:GridView>

                         </div>
                              <script type="text/javascript">
                                  $(function () {
                                      gridView('.gvv');
                                      gridViewClickFirstCell('.gvv');

                                      gridView('.gvv2');
                                      gridViewClickFirstCell('.gvv2');
                                      $('#GridView2_wrapper').hide();

                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-inactive buttons-html5" onclick="inactive()">Inactive</a> ');
                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-inactive buttons-html5 reload" onclick="location.reload();">Reload</a> ');
  
                                      $('#close').click(function () {
                                          $('.overlay').hide();
                                      })
                                      $('.dframe').hide(); 
                                  });

                                  

                                  function gridView(className) {
                                      $(className).dataTable({
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
                                          "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                                          "columnDefs": [
                                              {
                                                  "targets": [8, 11, 13, 14, 20, 26, 27, 37, 38, 10, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29, 30, 31, 32, 33, 35, 36, 39, 40, 41, 42, 43, 9, 34, 44, 45, 46],
                                                  "visible": false,
                                                  "searchable": false
                                              }]
                                      });
                                       
                                  }
                                  function gridViewClickFirstCell(className) {
                                      $(className).on('click', '.btn-view', function (e) {
                                          e.preventDefault();

                                          var currentRow = $(this).closest("tr");
                                          var data = $(className).DataTable().row(currentRow).data();
                                          console.log('DATA: ', data);
                                          $('#nrid').text(data[4]);
                                          $('#nrcode').text(data[1]);
                                          $('#nrbadge').text(data[47]);
                                          $('#nseso').text(data[20]);
                                          $('#nimg').attr('src', data[45]);
                                          $('#ncognome').text(data[3]);
                                          $('#nnome').text(data[2]);
                                          $('#ncitta').text(data[9]);
                                          $('#nteldom').text(data[25]);
                                          $('#nreparto').text(data[5]);
                                          $('#nlinea').text(data[6]);
                                          $('#nfase').text(data[37]);
                                          $('#nemail').text(data[30]);
                                          $('#nmansione').text(data[7]);
                                          $('#nlivelo').text(data[36]);
                                          $('#ndiretti').text(data[38]);
                                          $('#nnascita').text(data[35]);
                                          $('#norarrio').text(data[48] + '->' + data[49]);
                                          $('#ntipodi').text(data[44]);
                                          $('#ninizio').text(formatDateTest2(data[13]));
                                          $('#nscadenza').text(formatDateTest2(data[42]));
                                          $('.overlay').show();
                                           
                                          if ($('#nimg').attr('src').length < 7) {
                                              $('#nimg').attr("src", '../../Images/user_profil.jpg');
                                          }

                                          $('#cv_profile').attr('href', data[46]);

                                          if ($('#cv_profile').attr('href') == "&nbsp;") {
                                              $('#cv_profile').attr('title', 'CV not exists');  
                                              $('#cv_profile').removeAttr('href');
                                          } else { 
                                              $('#cv_profile').attr('href', data[46]);
                                          }

                                          if ($('#nscadenza').text() == '01/01/2001') {
                                              $('#nscadenza').text('');
                                          }

                                          if ($('#nscadenza').text() == '01/01/0001') {
                                              $('#nscadenza').text('');
                                          }

                                          if ($('#ntipodi').text() == '1') {
                                              $('#ntipodi').text('I');
                                          } else {
                                              $('#ntipodi').text('D');
                                          } 
                                      });

                                      $(className).on('click', '.btn-edit', function (e) {
                                          e.preventDefault();

                                          var currentRow = $(this).closest("tr");
                                          var data = $(className).DataTable().row(currentRow).data();
                                          console.log('DATA2: ', data);

                                          $('.fframe').show(); 
                                          $('.close_fframe').click(function () {
                                              $('.fframe').hide();
                                          });

                                          $("#btn_att").click(function () {
                                              var rcode = $('.nrcode').val();
                                              $('.dframe').show();
                                              $("#frame").attr("src", "./_schieda_upload.aspx/?rcode=" + rcode + "");
                                          });

                                          $('.close_frame').click(function () {
                                              $('.dframe').hide();
                                          });

                                          $('.nrcode').val($('#nrcode').text());


                                          //FILL DATA
                                          $('.nrid').val(data[4]);
                                          $('.nrcode').val(data[1]);
                                          $('.nrbadge').val(data[47]);
                                          $('.nseso').val(data[20]);
                                          $('.ncognome').val(data[3]);
                                          $('.nnome').val(data[2]);
                                          $('.ncitta').val(data[9]);
                                          $('.nteldom').val(data[25]); 
                                          $('.nemail').val(data[30]);
                                          //$('.nlivelo').val(data[36]); 
                                          //$('.nnascita').val(data[39]);
                                          $('.norarrio').val(data[48] + '->' + data[49]);
                                          $('.ntipodi').val(data[44]);
                                          $('.ninizio').val(formatDateTest(data[13]));
                                          $('.nscadenza').val(formatDateTest(data[42]));
                                          $('.ncc').val(data[27]);
                                           

                                          //SET DEFAULT VALUES OF DDPs 
                                          $("#ddp_mansione option").each(function () {
                                              if ($(this).text() == data[7]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });
                                          $("#ddp_fase option").each(function () {
                                              if ($(this).text() == data[37]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });
                                          $("#ddp_dirr option").each(function () {
                                              if ($(this).text() == data[38]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });
                                          $("#ddp_line option").each(function () {
                                              if ($(this).text() == data[6]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });

                                          //ODJE
                                          $("#ddp_dep option").each(function () {
                                              if (~$(this).text().indexOf(data[5])) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });
                                          $("#ddp_city option").each(function () {
                                              if ($(this).text() == data[39]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });

                                          $("#ddp_local option").each(function () {
                                              if ($(this).text() == data[36]) {
                                                  $(this).attr('selected', 'selected');
                                              }
                                          });

                                          //UPDATE CLICK
                                          $('.update_data').click(function () {
                                              var dataToLog = {
                                                nrid : $('.nrid').val(),
                                                  nrcode: $('.nrcode').val(),
                                                  badge: $('.nrbadge').val(),
                                                nses : $('.nseso').val(),
                                                ncognome : $('.ncognome').val(),
                                                nnome : $('.nnome').val(),
                                                ncitta : $('.ncitta').val(),
                                                nteldom : $('.nteldom').val(),
                                                nreparto: $('#ddp_dep option:selected').text(),
                                                nlinea: $('#ddp_line option:selected').text(),
                                                nfase: $('#ddp_fase option:selected').text(),
                                                nemail :  $('.nemail').val(),
                                                nmansione: $('#ddp_mansione option:selected').text(),
                                                nlivelo: $('#ddp_local option:selected').text(),
                                                ndiretti: $('#ddp_dirr option:selected').text(),
                                                nnascita: $('#ddp_city option:selected').text(),
                                                ntipodi : $('.ntipodi').val(),
                                                ninizio : $('.ninizio').val(),
                                                nscadenza: $('.nscadenza').val(),
                                                  IdTipPostDeLucru: $('#ddp_dirr option:selected').val(),
                                                  IdPostDeLucru: $('#ddp_fase option:selected').val(),
                                                  IdEchipa: 1,
                                                  IdLinie: $('#ddp_line option:selected').val(),
                                                  IdDepartament: $('#ddp_dep option:selected').val(),
                                                  IdIncadrare: $('#ddp_mansione option:selected').val(),
                                                  IdLoculNasterii: $('#ddp_city option:selected').val(),
                                                  IdLocalitate: $('#ddp_city option:selected').val(),
                                                  IdNivelStudiu: $('#ddp_local option:selected').val(),                                                   
                                                  cc: $('.ncc').val()
                                              };
                                               
                                              $.ajax({
                                                  type: "POST",
                                                  dataType: "json",
                                                  contentType: "application/json; charset=utf-8",
                                                  data: JSON.stringify(dataToLog),
                                                  url: "../../WebServiceHR.asmx/EditUser",
                                                  success: function (data) {
                                                      alert('Update succsessful! Reload page to view updated table!');
                                                      $('.fframe').hide();
                                                  },
                                                  error: function (error) {
                                                      alert('Update Error! Msg:' + error);
                                                  }
                                              });

                                              e.preventDefault();
                                          });
                                      })
                                  }

                                  function inactive() { 
                                      $('.buttons-inactive').remove();
                                      $('.buttons-active').remove();
                                      $('#GridView1_wrapper').hide();
                                      $('#GridView2_wrapper').show(); 
                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-active buttons-html5" onclick="active()">Active</a> ');
                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-inactive buttons-html5 reload" onclick="location.reload();">Reload</a> ');

                                  }
                                  function active() {
                                      $('.buttons-active').remove();
                                      $('.buttons-inactive').remove();
                                      $('#GridView2_wrapper').hide();
                                      $('#GridView1_wrapper').show(); 

                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-inactive buttons-html5" onclick="inactive()">Inactive</a> ');
                                      $('.dt-buttons').prepend('<a href="#!" class="btn btn-secondary buttons-inactive buttons-html5 reload" onclick="location.reload();">Reload</a> ');

                                  }
                                  function formatDate(date) {
                                      var d = new Date(date),
                                          month = '' + (d.getMonth() + 1),
                                          day = '' + d.getDate(),
                                          year = d.getFullYear();

                                      if (month.length < 2) month = '0' + month;
                                      if (day.length < 2) day = '0' + day;

                                      return date.substring(0, 11) //[day, month, year].join('/');
                                  }
                                  function formatDateTest(date) {
                                      var d = new Date(date),
                                          month = '' + (d.getMonth() + 1),
                                          day = '' + d.getDate(),
                                          year = d.getFullYear();

                                      if (month.length < 2) month = '0' + month;
                                      if (day.length < 2) day = '0' + day;

                                      return year + '-' + month + '-' + day; //[day, month, year].join('/');
                                  }
                                  function formatDateTest2(date) {
                                      var d = new Date(date),
                                          month = '' + (d.getMonth() + 1),
                                          day = '' + d.getDate(),
                                          year = d.getFullYear();

                                      if (month.length < 2) month = '0' + month;
                                      if (day.length < 2) day = '0' + day;

                                      return day + '/' + month + '/' + year; //[day, month, year].join('/');
                                  }
                                  function printThis() {
                                      $('#ovr').printThis({
                                          pageTitle: "Schieda Dipendenti",
                                          importCSS: true,
                                          ImportStyle: true,
                                          copyTagClasses: true,
                                      });
                                  }
                                  function uploadFile() {
                                      //var rcode = $('#nrcode').text()
                                      //window.open("./_schieda_upload.aspx/?rcode="+rcode+""); 
                                  }
                              </script>
                      </section>
                </div>
            </div>
        </div>
     <asp:SqlDataSource ID="AngajatiView" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Marca] as [R-nume], [Nume], [Prenume], [NumarIdentificarePersonala] as [N.Identificare], [Departament] as [Reparto], [Linie], [Incadrare] as [Mansione],'null',  [Strada], [IdLocalitate], [DataNasterii], [Somaj], [DataAngajarii], [DataNedeterminat], [IdTipPostDeLucru], [DataExpirareContract], [DataExpirareProba], [IdIntervalDeLucru], [IdPostDeLucru], [Sex], [IdLoculNasterii], [IdIncadrare], [IdNivelStudiu], [IdBanca], [StareCivila], [NumarTelefon], [CC], [IdDepartament], [IdEchipa], [AdresaEmail], [IdLinie], [Banca], [Echipa], [IntervalDeLucru], [Localitate], [NivelStudiu], [PostDeLucru], [TipPostDeLucru], [LoculNasterii], [CodAngajat], [CodSistem], [DataLichidarii], [DataMaternitate], [DeteIndete], [ImageUrl],[CvUrl],[IdBadge] as [Badge],[StartShift] as [Start Shift], [EndShift] as [End Shift] FROM [AngajatiView]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="AngajatiOdpusteni" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Marca]  as [R-nume], [Nume], [Prenume], [NumarIdentificarePersonala] as [N.Identificare], [Departament] as [Reparto], [Linie], [Incadrare] as [Mansione], [Id], [Strada], [IdLocalitate], [DataNasterii], [Somaj], [DataAngajarii], [DataNedeterminat], [IdTipPostDeLucru], [DataExpirareContract], [DataExpirareProba], [IdIntervalDeLucru], [IdPostDeLucru], [Sex], [IdLoculNasterii], [IdIncadrare], [IdNivelStudiu], [IdBanca], [StareCivila], [NumarTelefon], [CC], [IdDepartament], [IdEchipa], [AdresaEmail], [IdLinie], [Banca], [Echipa], [IntervalDeLucru], [Localitate], [NivelStudiu], [PostDeLucru], [TipPostDeLucru], [LoculNasterii], [CodAngajat], [CodSistem], [DataLichidarii], [DataMaternitate], [DeteIndete],[ImageUrl],[CvUrl],[IdBadge] as [Badge],[StartShift] as [Start Shift], [EndShift] as [End Shift] FROM [AngajatiOdpusteni]"></asp:SqlDataSource>
    
        <%-- UPDATE START --%>
        <section class="fframe">
            
            <div class="tfoot btns">
            </div>

                <div class="container" style="background:white;padding-top: 5px;">
                    <div class="foot">
                <div class="row">
                    <div class="col-md-12">
                    
                                <div class="btns">                                   
                                    <a class="close_fframe">X</a> 
                                    <a class="update_data">Update user</a>
                                    <a href="#!" id="btn_att" >Add Attachments</a>

                                    <asp:HiddenField runat="server" ID="hidden_rcode" /> 
                                </div>  
                    </div>
                </div>

               

            </div>
                     <div class="dframe">
                    <span class="close_frame">Close upload frame</span>
                    <iframe id="frame" src="" width="100%" height="300" style="border:none;"></iframe>
                </div>

                     <p style="text-decoration:underline;color:darkslateblue;">Modulo - Edit Scheda anagrafica Dipendente</p>
                <h4>Dati Dipendente</h4> 
                         <h6>Dati Personali</h6>  
                <div class="row">
                    <div class="col-md-3">
                        <span>R-Code:<input class="nrcode" /></span>
                    </div>
                    <div class="col-md-3"><span class="firstpad" >Nr.id:</span><input  class="nrid" type="number"/></div>
                    <div class="col-md-3"><span class="firstpad">Sesso:</span><input class="nseso"/></div>

                </div>
                <div class="row">
                    <div class="col-md-3"><span class="firstpad">Cognome:</span><input  class="ncognome"/></div>
                    <div class="col-md-3"><span class="firstpad">Nome:</span><input  class="nnome"/></div>
                    <div class="col-md-3"><span class="firstpad">Badge Code:</span><input  class="nrbadge"/></div>

                    </div>
                <div class="row">
                    <div class="col-md-3"><span class="firstpad">Strada:</span><input class="ncitta"/></div>
                    <div class="col-md-3"><span class="firstpad">Città / Comune:</span> 
                      	<asp:SqlDataSource ID="LoculNasteriLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Localitate] FROM [Localitati]"></asp:SqlDataSource>
                        <asp:DropDownList runat="server" ID="ddp_city" DataSourceID="LoculNasteriLookback" DataTextField="Localitate" DataValueField="Id" ></asp:DropDownList>
                    </div>
                    <%--<div class="col-md-3"><span class="firstpad">Comune o in alternativa stato straniero di nascita:</span><input class="ncitta"/></div>--%>

                </div>
                <br />
                <h6>Sezione - Recapiti</h6> 
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <span class="firstpad">Numero di telefono domicilio:<input class="nteldom"/></span>
                    </div>
                    <div class="col-md-4 col-xs-12" style="display:none;">
                        <span class="firstpad">Numero di telefono altro:<input class="ntelalt"/></span>
                    </div>
                   <%-- <div class="col-md-3 col-xs-6">
                        <input class="firstpad">Numero di telefono cellulare:<input class="inputs" id="ntelcell"></input></input>
                    </div>--%>
                    <div class="col-md-3 col-xs-6">
                        <span class="firstpad">Idirizzo di posta elettronica:<input  class="nemail"/></span>
                    </div>
                </div> 
                <br />
                <h4 class="mt-3">Dati Amministrativi</h4>
                <h6>Dati di lavoro</h6> 
                <h6>Sezione - Dati generali di Reparto</h6> 
                <div class="row">
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Reparto:</span> 
                     	<asp:SqlDataSource ID="DepartementLook" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Departament] FROM [Departamente]"></asp:SqlDataSource>
                        <asp:DropDownList runat="server" ID="ddp_dep" DataSourceID="DepartementLook" DataTextField="Departament" DataValueField="Id" ></asp:DropDownList>
                    </div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Linea:</span> 
                        	<asp:SqlDataSource ID="LinieLook" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Linie] FROM [Linii]"></asp:SqlDataSource>
                            <asp:DropDownList runat="server" ID="ddp_line" DataSourceID="LinieLook" DataTextField="Linie" DataValueField="Id" ></asp:DropDownList>
                     </div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Mansione:</span>
                         <asp:SqlDataSource ID="MansioneLook" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [Incadrare] FROM [Incadrari]"></asp:SqlDataSource>
                         <asp:DropDownList runat="server" ID="ddp_mansione" DataSourceID="MansioneLook" DataTextField="Incadrare" DataValueField="Id" ></asp:DropDownList>
                     </div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Fase:</span>
                        <asp:SqlDataSource ID="FaseLook" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [PostDeLucru] FROM [PosturiDeLucru]"></asp:SqlDataSource>
                        <asp:DropDownList runat="server" ID="ddp_fase" DataSourceID="FaseLook" DataTextField="PostDeLucru" DataValueField="Id" ></asp:DropDownList>
                     </div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Diretti / Indiretti:</span>
                         <asp:SqlDataSource ID="TipPostLook" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [TipPostDeLucru] FROM [TipuriPostDeLucru]"></asp:SqlDataSource>
                         <asp:DropDownList runat="server" ID="ddp_dirr" DataSourceID="TipPostLook" DataTextField="TipPostDeLucru" DataValueField="Id" ></asp:DropDownList>
                     </div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Orarrio:</span><input class="norarrio"/></div>
                </div>
                <br />
                <h6>Sezione - Tipo rapporto</h6>
                <div class="row">
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Tipo di contratto:</span><input class="ntipodi"/></div>
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Inizio contratto:</span><input class="ninizio" type="date"/></div>
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Scadenza contratto:</span><input class="nscadenza" type="date"/></div>
                </div>
                <br />
                <h6>Sezione - Cessazione</h6>
                <div class="row">
                       <div class="col-md-3 col-xs-6"><span class="firstpad">Data cessazione:</span><input class="ndatacessa" type="date"/></div>
                </div>
                <br />
                <h6>Sezione - Titolo di studio</h6>
                <div class="row">
                        <div class="col-md-3 col-xs-6"><span class="firstpad" >Livello scolarizzazione:</span>
                           	<asp:SqlDataSource ID="NivelStudiLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [NivelStudiu] FROM [NiveleStudii]"></asp:SqlDataSource>
                            <asp:DropDownList runat="server" ID="ddp_local" DataSourceID="NivelStudiLookback" DataTextField="NivelStudiu" DataValueField="Id" ></asp:DropDownList>
                        </div>
                     

                    <div class="col-md-3 col-xs-6"><span class="firstpad" >Bank aconto:</span>
                        <input class="ncc" />
                    </div>

                </div>  
                </div>

        </section>
        <%-- UPDATE END --%>
        <section class="overlay" id="ovr">
            <div class="container" style="background:white;padding-top: 5px;">

             <div class="foot">
                <div class="row">
                    <div class="col-md-12">
                    
                                <div class="btns">
                                <a href="#!" id="close">X</a>

                                <a href="#!" id="btn_print" onclick="printThis()">Print Page</a>
                    
                    
                            
                                    
                                </div>  
                    </div>
                </div>
            </div>

             

          
                
                <p style="text-decoration:underline;color:darkslateblue;">Modulo - Scheda anagrafica Dipendente</p>
                <h4>Dati Dipendente</h4>
                <h6>Dati Personali </h6>
                
                    
                    
                  <div class="row">
                      <span class="col-md-2 offset-6">Badge:<span id="nrbadge"></span></span>
                      <span class="col-md-2">R-Code: <span id="nrcode"></span></span>
                      <a class="col-md-2" id="cv_profile" href="#" target="_blanko">View CV</a>
                </div>
                <div class="row">
                    <div class="col-md-3"><span class="firstpad" >Nr.id:</span><span class="inputs" id="nrid"></span></div>
                    <div class="col-md-3"><span class="firstpad">Sesso:</span><span class="inputs" id="nseso"></span></div>
                    <div class="col-md-2 offset-4" >
                        <img class="inputs" src="" id="nimg" style="position: absolute; right: 45px; top: 5px; border-bottom: none; height: 100px;" /> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3"><span class="firstpad">Cognome:</span><span class="inputs" id="ncognome"></span></div>
                    <div class="col-md-3"><span class="firstpad">Nome:</span><span class="inputs" id="nnome"></span></div>
                    </div>
                <div class="row">
                    <div class="col-md-3"><span class="firstpad">Cittadinanza:</span><span class="inputs" id="ncitta"></span></div>
                    <div class="col-md-5"><span class="firstpad">Comune o in alternativa stato straniero di nascita:</span><span class="inputs" id="nnascita"></span></div>
                </div>
                <br />
                <h6>Sezione - Recapiti</h6> 
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <span class="firstpad">Numero di telefono domicilio:<span class="inputs" id="nteldom"></span></span>
                    </div>
                    <div class="col-md-4 col-xs-12" style="display:none;">
                        <span class="firstpad">Numero di telefono altro:<span class="inputs" id="ntelalt"></span></span>
                    </div>
                  <%--  <div class="col-md-3 col-xs-6">
                        <span class="firstpad">Numero di telefono cellulare:<span class="inputs" id="ntelcell"></span></span>
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <span class="firstpad">Idirizzo di posta elettronica:<span class="inputs" id="nemail"></span></span>
                    </div>--%>
                </div> 
                <br />
                <h4 class="mt-3">Dati Amministrativi</h4>
                <h6>Dati di lavoro</h6> 
                <h6>Sezione - Dati generali di Reparto</h6> 
                <div class="row">
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Reparto:</span><span class="inputs" id="nreparto"></span></div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Linea:</span><span class="inputs" id="nlinea"></span></div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Mansione:</span><span class="inputs" id="nmansione"></span></div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Fase:</span><span class="inputs" id="nfase"></span></div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Diretti / Indiretti:</span><span class="inputs" id="ndiretti"></span></div>
                     <div class="col-md-3 col-xs-6"><span class="firstpad">Orarrio:</span><span class="inputs" id="norarrio"></span></div>
                </div>
                <br />
                <h6>Sezione - Tipo rapporto</h6>
                <div class="row">
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Tipo di contratto:</span><span class="inputs" id="ntipodi"></span></div>
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Inizio contratto:</span><span class="inputs" id="ninizio"></span></div>
                    <div class="col-md-3 col-xs-6"><span class="firstpad">Scadenza contratto:</span><span class="inputs" id="nscadenza"></span></div>
                </div>
                <br />
                <h6>Sezione - Cessazione</h6>
                <div class="row">
                       <div class="col-md-3 col-xs-6"><span class="firstpad">Data cessazione:</span><span class="inputs" id="ndatacessa"></span></div>
                </div>
                <br />
                <h6>Sezione - Titolo di studio</h6>
                <div class="row">
                        <div class="col-md-5 col-xs-6"><span class="firstpad" >Livello scolarizzazione:</span><span style="white-space:nowrap" class="inputs" id="nlivelo"></span></div>
                </div>  
               
            </div>
         
        </section>
    </form>

</body>
</html>
