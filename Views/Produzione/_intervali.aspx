<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_intervali.aspx.cs" Inherits="Views_Produzione_intervali" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Intervali</title>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link href="../../libs/bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
      <link rel="stylesheet" type="text/css" href="../../css/datatables.min.css"/>
      <link href="../../css/_schieda.css" rel="stylesheet"/>
      <link href="../../css/jquery-ui.css" rel="stylesheet" />
       <link href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>

      <script src="../../js/jquery-3.4.1.min.js"></script>

      <script type="text/javascript" src="../../js/pdfmake.min.js"></script>
      <script type="text/javascript" src="../../js/vfs_fonts.js"></script>
      <script type="text/javascript" src="../../js/datatables-a.min.js"></script>
      <script type="text/javascript" src="../../js/buttons.print.min.js"></script>
      <script type="text/javascript" src="../../js/dataTables.buttons.min.js"></script>
      <script type="text/javascript" src="../../js/printThis.js"></script> 
      <script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
  
      <script src="https://code.highcharts.com/highcharts.js"></script>
      <script src="https://code.highcharts.com/modules/data.js"></script>
      <script src="https://code.highcharts.com/modules/exporting.js"></script>
      <script src="https://code.highcharts.com/modules/export-data.js"></script>

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
        .filter-btn {
                font-size: 13px;
                background-color:#7d8da1;
                border-radius:3px;
                border:1px solid #7b828a;
                padding:2px 4px 2px 4px;
                margin: 2px;
                color:white;
        }
        .dt-buttons {
            float: right;
            display: inherit;
        }
        .active{
            color:#fedc6e!important;
        }
        .btn,.btn-secondary{
             font-size: 13px;
                background-color:#7d8da1;
                border-radius:3px;
                border:1px solid #7b828a;
                padding:2px 4px 2px 4px;
                margin: 2px;
                color:white;
        }
        tr:hover{
            cursor:pointer;
        }

        .selected{
            background-color: #607D8B;
        }

        .canvasjs-chart-credit{
            display:none!important;
        }
        .canvasjs-chart-trial{
            display:none!important;
        }

        #dt_select{
            margin-right:10px;
            font-size:14px;
        }
        span,label{
            font-size:14px;
        }
        select{
             line-height: 15px!important;
             height: 25px!important;
        }
        div.dataTables_wrapper div.dataTables_paginate ul.pagination {
            font-size: 14px;
        }
        .page-link { 
             padding: .2rem .75rem; 
        }

        /*table > tr {
                line-height: 10px!important;
        }*/
        table > td {
            font-size:13px!important;
        }

        .highlight{
                /*border-right: 1pt solid white!important;*/
                /*border-left: 1pt solid #795548!important;*/
                font-weight:800;
        }

        .button-wrapper {
  width: 100%;
  text-align: center;
  padding-top: 45px;
}
.arrow-button {
  cursor: pointer;
  width: 47px;
  height: 40px;
  margin: 0;
  border: none;
  background: none;
  position: relative;
}
.arrow-button:focus {
  outline: none;
}
.arrow-button:hover .line-a,
.arrow-button:hover .line-b {
  background: #949494;
}
.line-a {
  display: inline-block;
  width: 30px;
  height: 6px;
  background: #363636;
  position: absolute;
  left: 0;
  top: 13px;
  transform: rotate3d(0, 0, 1, 45deg);
  -webkit-transform: rotate3d(0, 0, 1, 45deg);
  -webkit-transition: background 0.5s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  -o-transition: background 0.3s ease-in-out;
  -ms-transition: background 0.3s ease-in-out;
  transition: background 0.3s ease-in-out;
}
.line-b {
  display: inline-block;
  width: 30px;
  height: 6px;
  background: #363636;
  position: absolute;
  right: 0;
  top: 13px;
  transform: rotate3d(0, 0, 1, -45deg);
  -webkit-transform: rotate3d(0, 0, 1, -45deg);
  -webkit-transition: background 0.5s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  -o-transition: background 0.3s ease-in-out;
  -ms-transition: background 0.3s ease-in-out;
  transition: background 0.3s ease-in-out;
}
.arrow-button.down .line-a {
  position: absolute;
  right: 0;
  top: 10px;
  animation-name: turnAdown;
  -webkit-animation-name: turnAdown;
  animation-duration: 0.5s;
  -webkit-animation-duration: 0.5s;
  -webkit-animation-fill-mode: forwards;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
  -webkit-animation-timing-function: ease-in-out;
  transform: rotate3d(0, 0, 1, 45deg);
  -webkit-transform: rotate3d(0, 0, 1, 45deg);
}
.arrow-button.down .line-b {
  position: absolute;
  right: 0;
  top: 10px;
  animation-name: turnBdown;
  -webkit-animation-name: turnBdown;
  animation-duration: 0.5s;
  -webkit-animation-duration: 0.5s;
  animation-fill-mode: forwards;
  -webkit-animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
  -webkit-animation-timing-function: ease-in-out;
  transform: rotate3d(0, 0, 1, -45deg);
  -webkit-transform: rotate3d(0, 0, 1, -45deg);
}
.arrow-button.up .line-a {
  position: absolute;
  left: 0;
  top: 13px;
  animation-name: turnAup;
  -webkit-animation-name: turnAup;
  animation-duration: 0.5s;
  -webkit-animation-duration: 0.5s;
  animation-fill-mode: forwards;
  -webkit-animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
  -webkit-animation-timing-function: ease-in-out;
  transform: rotate3d(0, 0, 1, -45deg);
  -webkit-transform: rotate3d(0, 0, 1, -45deg);
}
.arrow-button.up .line-b {
  position: absolute;
  right: 0;
  top: 13px;
  animation-name: turnBup;
  -webkit-animation-name: turnBup;
  animation-duration: 0.5s;
  -webkit-animation-duration: 0.5s;
  animation-fill-mode: forwards;
  -webkit-animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
  -webkit-animation-timing-function: ease-in-out;
  transform: rotate3d(0, 0, 1, 45deg);
  -webkit-transform: rotate3d(0, 0, 1, 45deg);
}
/* Turn A down */
@keyframes turnAdown {
  0% {
    transform: rotate3d(0, 0, 1, -45deg);
    top: 10px;
  }
  50% {
    width: 26px;
  }
  100% {
    transform: rotate3d(0, 0, 1, 45deg);
    top: 13px;
  }
}
@-webkit-keyframes turnAdown {
  0% {
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    top: 10px;
  }
  50% {
    width: 26px;
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    top: 13px;
  }
}
/* Turn B down */
@keyframes turnBdown {
  0% {
    transform: rotate3d(0, 0, 1, 45deg);
    top: 10px;
  }
  50% {
    width: 26px;
  }
  100% {
    transform: rotate3d(0, 0, 1, -45deg);
    top: 13px;
  }
}
@-webkit-keyframes turnBdown {
  0% {
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    top: 10px;
  }
  50% {
    width: 26px;
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    top: 13px;
  }
}
/* turnAup */
@keyframes turnAup {
  0% {
    transform: rotate3d(0, 0, 1, 45deg);
    top: 13px;
  }
  50% {
    width: 26px;
  }
  100% {
    transform: rotate3d(0, 0, 1, -45deg);
    top: 10px;
  }
}
@-webkit-keyframes turnAup {
  0% {
    transform: rotate3d(0, 0, 1, 45deg);
    top: 13px;
  }
  50% {
    width: 26px;
  }
  100% {
    transform: rotate3d(0, 0, 1, -45deg);
    top: 10px;
  }
}
/* turnBup */
@keyframes turnBup {
  0% {
    transform: rotate3d(0, 0, 1, -45deg);
    top: 13px;
  }
  50% {
    width: 26px;
  }
  100% {
    transform: rotate3d(0, 0, 1, 45deg);
    top: 10px;
  }
}
@-webkit-keyframes turnBup {
  0% {
    -webkit-transform: rotate3d(0, 0, 1, -45deg);
    top: 13px;
  }
  50% {
    width: 26px;
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 45deg);
    top: 10px;
  }
}

.gvv1{
    width:100%!important;
}
div.dt-buttons {
    position: relative;
    float: right;
}

.head-text{
        font-size: 18px;
        text-transform: uppercase;
        margin-right: 15px;
        
}
#datepicker{
    border-top: 1px solid white;
    border-right: 1px solid white;
    border-left: 1px solid white;
    width: 70px;
}
      

        table.dataTable tr.group td {
            font-weight: bold;
            background-color: #e0e0e0;
            /*text-transform: uppercase;*/
            font-size: 12px;
            /* letter-spacing: 0.4px; */
        }
        .arrow-img{
                height: 15px;
                opacity: 0.4;
        }
        .arrow-img:hover{
            opacity:1;
            transition: ease linear 0.2s;
        }
        .dt-button {
            font-size: 12px!important;
            background: #7d8da1!important;
            border-radius: 3px!important;
            border: 1px solid #7b828a!important;
            padding: 2px 4px 2px 4px!important;
            margin: 2px!important;
            color: white!important;
        }

        td{
                padding-top: 5px!important;
                padding-bottom: 5px!important;
        }

        .percent{
                position: relative;
                font-size: 10px;
                top: -10px;
                right: -15px;
        }
        input[type=search]{
                    width: 132px!important;
                    margin-right: 20px;
        }
         .head-text{
            font-size: 14px;
            text-transform: uppercase;
            margin-right: 15px;
            font-weight: 600;
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="up1" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <span class="head-text"></span>
                    <span id="dt_select"> Seleziona data: <input type="text" id="datepicker"/> </span>

            <asp:Panel runat="server" ID="pnl_prima">
            <asp:Panel runat="server" ID="pnl_filter_btns">
            </asp:Panel>
                <asp:GridView runat="server" ID="newGrid" AutoGenerateColumns="true" CssClass="gvv table tbl table-striped"></asp:GridView>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnl_secondo" style="display:none;">
            <asp:Panel runat="server" ID="pnl_filter_secondo" >
            </asp:Panel>
                    <asp:GridView runat="server" ID="newGrid1" AutoGenerateColumns="true" CssClass="gvv1 table tbl table-striped"></asp:GridView>
            </asp:Panel>
                   <div id="chartContainer" style="height: 270px; width: 100%;"></div>
                        <script src="../../js/canjs.min.js"></script>
                </ContentTemplate>
                </asp:UpdatePanel>
        </div>
         
    </form>

  <script type="text/javascript">
      Sys.Application.add_load(initSomething);
      function initSomething() {
          
          var urlParams = new URLSearchParams(window.location.search); //get all parameters
          var departamentId = urlParams.get('Departament'); //extract the foo parameter - this will return NULL if foo isn't a parameter 
          //Date picker format and set local storadge
          $("#datepicker")
              .datepicker({
                  dateFormat: "dd/mm/yy",
                  onSelect: function (dateText) {
                      $(this).change();
                  }
              })
              .change(function () {
                  if (departamentId == 1) {
                      window.location.href = "_intervali.aspx?Departament=1&date=" + this.value;
                  } else if (departamentId == 2) {
                      window.location.href = "_intervali.aspx?Departament=2&date=" + this.value;
                  }
                  localStorage.setItem('date', this.value);
              });
           
          if (departamentId == 1){
              $('.head-text').text('Intervali Confezione');
          } else {
               $('.head-text').text('Intervali Stiro');
          }
          var dateCookie = localStorage.getItem('date');
          if (dateCookie != null) {
              $("#datepicker").datepicker().datepicker("setDate", dateCookie);
              localStorage.removeItem('date');
          } else {
              $("#datepicker").datepicker().datepicker("setDate", new Date(), { dateFormat: 'dd/mm/yy' });
          }

          $('.turno-prima').click(function () {
              $('.turno-secondo').removeClass('active');
              $('.turno-prima').addClass('active');

              $('#pnl_secondo').hide();
              $('#pnl_prima').show();
          });
          $('.turno-secondo').click(function () {
              $('.turno-prima').removeClass('active');
              $('.turno-secondo').addClass('active');

              $('#pnl_secondo').show();
              $('#pnl_prima').hide();
          });



          GenetarteTables(departamentId);
          $("button.arrow-button").click(function () {
              if (!$(this).hasClass("up") && !$(this).hasClass("down")) {
                  $(this).addClass("up");
              }
              else {
                  $(this).toggleClass("up down");
              }
              return false;
          });
          $(".filter-btn").click(function () {
              if ($(this).attr('data-name') == 'all') {
                  $('input[type=search]').val('').keyup();
              } else {
                  $('input[type=search]').val($(this).attr('data-name')).keyup();
              }
              $('.filter-btn').removeClass('active');
              $(this).addClass('active');
          });
          $('thead').find('th').each(function () {
              if ($(this).text() == 'TotalFirst') {
                  $(this).text('Total');
              } else if ($(this).text() == 'TotalSecond') {
                  $(this).text('Total');
              }

              for (var i = 7; i <= 22; i++) {
                  if ($(this).text() == 'H' + i + '') {
                      $(this).text(i + 'h');
                  }
              }
          });
            $('#dt_select').appendTo('#newGrid_filter');

      }
      function GenetarteTables(departamentId) {
          if (departamentId == 1) {
              filterJsonConf();
              var collapsedGroups = {};
              var table = $('.gvv').DataTable({
                  "bInfo": false,
                  search: {
                      regex: false,
                      smart: false
                  },
                  dom: 'Bfrtlip',
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
                  "lengthMenu": [[-1, 25, 50, -1], ["All", 25, 50, "All"]],
                  "columnDefs": [
                      {
                          "targets": [16, 17, 18, 19, 20, 21, 22, 24, 15, 5, 25, 26, 27, 28, 29, 30, 31, 32, 33,34,35,36,37,38,39,40],
                          "visible": false,
                          "searchable": false
                      }],
                  order: [[4, 'asc']],
                  rowGroup: {
                      startRender: function (rows, group) {

                          var hnorm = rows
                              .data()
                              .pluck(6)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h7 = rows
                              .data()
                              .pluck(14)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var h8 = rows
                              .data()
                              .pluck(15)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h9 = rows
                              .data()
                              .pluck(9)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h10 = rows
                              .data()
                              .pluck(10)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h11 = rows
                              .data()
                              .pluck(11)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h12 = rows
                              .data()
                              .pluck(12)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h13 = rows
                              .data()
                              .pluck(13)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h14 = rows
                              .data()
                              .pluck(14)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var htotfirst = rows
                              .data()
                              .pluck(23)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var collapsed = !!collapsedGroups[group];

                          rows.nodes().each(function (r) {
                              r.style.display = collapsed ? 'none' : '';
                          });

                          var button = '<img src="../../img/down-arrow.svg" class="arrow-img" onClick="toggleIcon()" style="height: 15px;" /> ';


                          return $('<tr/>')
                              .append('<td colspan="5">' + button + group + ' (' + rows.count() + ')</td>')
                              .append('<td>' + hnorm.toFixed() + '</td>')
                              .append('<td>' + h7.toFixed() + '</td>')
                              .append('<td>' + h8.toFixed() + '</td>')
                              .append('<td>' + h9.toFixed() + '</td>')
                              .append('<td>' + h10.toFixed() + '</td>')
                              .append('<td>' + h11.toFixed() + '</td>')
                              .append('<td>' + h12.toFixed() + '</td>')
                              .append('<td>' + h13.toFixed() + '</td>')
                              .append('<td>' + h14.toFixed() + '</td>')
                              .append('<td>' + htotfirst.toFixed() + '</td>')
                              .attr('data-name', group)
                              .toggleClass('collapsed', collapsed);
                      },
                      dataSrc: 4
                  }
              });
              $('.gvv tbody').on('click', 'tr.group-start', function () {
                  var name = $(this).data('name');
                  collapsedGroups[name] = !collapsedGroups[name];
                  table.draw(false);
              });

          } else if (departamentId == 2) {
              filterJsonStiro();
              var collapsedGroups = {};
              var table = $('.gvv').DataTable({
                  "bInfo": false,
                  search: {
                      regex: false,
                      smart: false
                  },
                  dom: 'Bfrtlip',
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
                  "lengthMenu": [[-1, 25, 50, -1], ["All", 25, 50, "All"]],
                  "columnDefs": [
                      {
                          "targets": [16, 17, 18, 19, 20, 21, 22, 24, 15, 5, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40],
                          "visible": false,
                          "searchable": false
                      }],
                  order: [[4, 'asc']],
                  rowGroup: {
                      startRender: function (rows, group) {

                          var hnorm = rows
                              .data()
                              .pluck(6)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h7 = rows
                              .data()
                              .pluck(14)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var h8 = rows
                              .data()
                              .pluck(15)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h9 = rows
                              .data()
                              .pluck(9)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h10 = rows
                              .data()
                              .pluck(10)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h11 = rows
                              .data()
                              .pluck(11)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h12 = rows
                              .data()
                              .pluck(12)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h13 = rows
                              .data()
                              .pluck(13)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h14 = rows
                              .data()
                              .pluck(14)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var htotfirst = rows
                              .data()
                              .pluck(23)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var collapsed = !!collapsedGroups[group];

                          rows.nodes().each(function (r) {
                              r.style.display = collapsed ? 'none' : '';
                          });

                          var button = '<img src="../../img/down-arrow.svg" class="arrow-img" onClick="toggleIcon()" style="height: 15px;" /> ';


                          return $('<tr/>')
                              .append('<td colspan="5">' + button + group + ' (' + rows.count() + ')</td>')
                              .append('<td>' + hnorm.toFixed() + '</td>')
                              .append('<td>' + h7.toFixed() + '</td>')
                              .append('<td>' + h8.toFixed() + '</td>')
                              .append('<td>' + h9.toFixed() + '</td>')
                              .append('<td>' + h10.toFixed() + '</td>')
                              .append('<td>' + h11.toFixed() + '</td>')
                              .append('<td>' + h12.toFixed() + '</td>')
                              .append('<td>' + h13.toFixed() + '</td>')
                              .append('<td>' + h14.toFixed() + '</td>')
                              .append('<td>' + htotfirst.toFixed() + '</td>')
                              .attr('data-name', group)
                              .toggleClass('collapsed', collapsed);
                      },
                      dataSrc: 4
                  }
              });
              $('.gvv tbody').on('click', 'tr.group-start', function () {
                  var name = $(this).data('name');
                  collapsedGroups[name] = !collapsedGroups[name];
                  table.draw(false);
              });
              var collapsedGroups1 = {};
              var table1 = $('.gvv1').DataTable({
                  "bInfo": false,
                  search: {
                      regex: false,
                      smart: false
                  },
                  dom: 'Bfrtlip',
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
                  "lengthMenu": [[-1, 25, 50, -1], ["All", 25, 50, "All"]],
                  "columnDefs": [
                      {
                          "targets": [5, 7, 8, 9, 10, 11, 12, 13, 14, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 ],
                          "visible": false,
                          "searchable": false
                      }],
                  order: [[4, 'asc']],
                  rowGroup: {
                      startRender: function (rows, group) {
                          var hnorm = rows
                              .data()
                              .pluck(6)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h7 = rows
                              .data()
                              .pluck(15)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var h8 = rows
                              .data()
                              .pluck(16)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h9 = rows
                              .data()
                              .pluck(17)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h10 = rows
                              .data()
                              .pluck(18)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h11 = rows
                              .data()
                              .pluck(19)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h12 = rows
                              .data()
                              .pluck(20)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h13 = rows
                              .data()
                              .pluck(21)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);
                          var h14 = rows
                              .data()
                              .pluck(22)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var htotfirst = rows
                              .data()
                              .pluck(24)
                              .reduce(function (a, b) {
                                  return a + b * 1;
                              }, 0);

                          var collapsed = !!collapsedGroups1[group];

                          rows.nodes().each(function (r) {
                              r.style.display = collapsed ? 'none' : '';
                          });

                          var button = '<img src="../../img/down-arrow.svg" class="arrow-img" onClick="toggleIcon()" style="height: 15px;" /> ';


                          return $('<tr/>')
                              .append('<td colspan="5">' + button + group + ' (' + rows.count() + ')</td>')
                              .append('<td>' + hnorm.toFixed() + '</td>')
                              .append('<td>' + h7.toFixed() + '</td>')
                              .append('<td>' + h8.toFixed() + '</td>')
                              .append('<td>' + h9.toFixed() + '</td>')
                              .append('<td>' + h10.toFixed() + '</td>')
                              .append('<td>' + h11.toFixed() + '</td>')
                              .append('<td>' + h12.toFixed() + '</td>')
                              .append('<td>' + h13.toFixed() + '</td>')
                              .append('<td>' + h14.toFixed() + '</td>')
                              .append('<td>' + htotfirst.toFixed() + '</td>')
                              .attr('data-name', group)
                              .toggleClass('collapsed', collapsed);
                      },
                      dataSrc: 4
                  }
              });
              $('.gvv1 tbody').on('click', 'tr.group-start', function () {
                  var name = $(this).data('name');
                  collapsedGroups1[name] = !collapsedGroups1[name];
                  table1.draw(false);
              });

          }
      }
      function filterJsonConf() {

          $('.gvv tbody').find('tr').each(function () {

              var norm = $(this).find('td').eq(6).text();
              var h7 = $(this).find('td').eq(7).text();
              var h8 = $(this).find('td').eq(8).text();
              var h9 = $(this).find('td').eq(9).text();
              var h10 = $(this).find('td').eq(10).text();
              var h11 = $(this).find('td').eq(11).text();
              var h12 = $(this).find('td').eq(12).text();
              var h13 = $(this).find('td').eq(13).text();
              var h14 = $(this).find('td').eq(14).text();

              var h7dur = $(this).find('td').eq(25).text();
              var h8dur = $(this).find('td').eq(26).text();
              var h9dur = $(this).find('td').eq(27).text();
              var h10dur = $(this).find('td').eq(28).text();
              var h11dur = $(this).find('td').eq(29).text();
              var h12dur = $(this).find('td').eq(30).text();
              var h13dur = $(this).find('td').eq(31).text();
              var h14dur = $(this).find('td').eq(32).text();

              $(this).find('td').eq(7).css('background-color', fillColor(calculatePercentage(h7, norm, h7dur)));
              $(this).find('td').eq(8).css('background-color', fillColor(calculatePercentage(h8, norm, h8dur)));
              $(this).find('td').eq(9).css('background-color', fillColor(calculatePercentage(h9, norm, h9dur)));
              $(this).find('td').eq(10).css('background-color', fillColor(calculatePercentage(h10, norm, h10dur)));
              $(this).find('td').eq(11).css('background-color', fillColor(calculatePercentage(h11, norm, h11dur)));
              $(this).find('td').eq(12).css('background-color', fillColor(calculatePercentage(h12, norm, h12dur)));
              $(this).find('td').eq(13).css('background-color', fillColor(calculatePercentage(h13, norm, h13dur)));
              $(this).find('td').eq(14).css('background-color', fillColor(calculatePercentage(h14, norm, h14dur)));

              $(this).find('td').eq(7).attr('title', '' + parseInt(calculatePercentage(h7, norm, h7dur) || 0).toFixed() + '%');
              $(this).find('td').eq(8).attr('title', '' + parseInt(calculatePercentage(h8, norm, h8dur) || 0).toFixed() + '%');
              $(this).find('td').eq(9).attr('title', '' + parseInt(calculatePercentage(h9, norm, h9dur) || 0).toFixed() + '%');
              $(this).find('td').eq(10).attr('title', '' + parseInt(calculatePercentage(h10, norm, h10dur) || 0).toFixed() + '%');
              $(this).find('td').eq(11).attr('title', '' + parseInt(calculatePercentage(h11, norm, h11dur) || 0).toFixed() + '%');
              $(this).find('td').eq(12).attr('title', '' + parseInt(calculatePercentage(h12, norm, h12dur) || 0).toFixed() + '%');
              $(this).find('td').eq(13).attr('title', '' + parseInt(calculatePercentage(h13, norm, h13dur) || 0).toFixed() + '%');
              $(this).find('td').eq(14).attr('title', '' + parseInt(calculatePercentage(h14, norm, h14dur) || 0).toFixed() + '%');


              var totalRow = 0;
              var totalDuration = 0;

              for (i = 7; i <= 14; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  totalRow = totalRow + value;
              }
              for (i = 25; i <= 32; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  if (value !== 0) {
                      totalDuration = totalDuration + value;
                  }
              }
              $(this).find('td').eq(23).css('background-color', fillColor(calculatePercentageTotal(totalRow, norm, totalDuration)));


              if (h7 == '0' && h8 == '0' && h9 == '0' && h10 == '0' && h11 == '0' && h12 == '0' && h13 == '0' && h14 == '0') {
                  $(this).closest('tr').remove();
              }

          }) 
      }
      function filterJsonStiro() {
          //first shift
          $('.gvv tbody').find('tr').each(function () {

              var norm = $(this).find('td').eq(6).text();

              var h7 = $(this).find('td').eq(7).text();
              var h8 = $(this).find('td').eq(8).text();
              var h9 = $(this).find('td').eq(9).text();
              var h10 = $(this).find('td').eq(10).text();
              var h11 = $(this).find('td').eq(11).text();
              var h12 = $(this).find('td').eq(12).text();
              var h13 = $(this).find('td').eq(13).text();
              var h14 = $(this).find('td').eq(14).text();

              var h7dur = $(this).find('td').eq(25).text();
              var h8dur = $(this).find('td').eq(26).text();
              var h9dur = $(this).find('td').eq(27).text();
              var h10dur = $(this).find('td').eq(28).text();
              var h11dur = $(this).find('td').eq(29).text();
              var h12dur = $(this).find('td').eq(30).text();
              var h13dur = $(this).find('td').eq(31).text();
              var h14dur = $(this).find('td').eq(32).text();

              $(this).find('td').eq(7).css('background-color', fillColor(calculatePercentage(h7, norm, h7dur)));
              $(this).find('td').eq(8).css('background-color', fillColor(calculatePercentage(h8, norm, h8dur)));
              $(this).find('td').eq(9).css('background-color', fillColor(calculatePercentage(h9, norm, h9dur)));
              $(this).find('td').eq(10).css('background-color', fillColor(calculatePercentage(h10, norm, h10dur)));
              $(this).find('td').eq(11).css('background-color', fillColor(calculatePercentage(h11, norm, h11dur)));
              $(this).find('td').eq(12).css('background-color', fillColor(calculatePercentage(h12, norm, h12dur)));
              $(this).find('td').eq(13).css('background-color', fillColor(calculatePercentage(h13, norm, h13dur)));
              $(this).find('td').eq(14).css('background-color', fillColor(calculatePercentage(h14, norm, h14dur)));

              $(this).find('td').eq(7).attr('title', '' + parseInt(calculatePercentage(h7, norm, h7dur) || 0).toFixed() + '%');
              $(this).find('td').eq(8).attr('title', '' + parseInt(calculatePercentage(h8, norm, h8dur) || 0).toFixed() + '%');
              $(this).find('td').eq(9).attr('title', '' + parseInt(calculatePercentage(h9, norm, h9dur) || 0).toFixed() + '%');
              $(this).find('td').eq(10).attr('title', '' + parseInt(calculatePercentage(h10, norm, h10dur) || 0).toFixed() + '%');
              $(this).find('td').eq(11).attr('title', '' + parseInt(calculatePercentage(h11, norm, h11dur) || 0).toFixed() + '%');
              $(this).find('td').eq(12).attr('title', '' + parseInt(calculatePercentage(h12, norm, h12dur) || 0).toFixed() + '%');
              $(this).find('td').eq(13).attr('title', '' + parseInt(calculatePercentage(h13, norm, h13dur) || 0).toFixed() + '%');
              $(this).find('td').eq(14).attr('title', '' + parseInt(calculatePercentage(h14, norm, h14dur) || 0).toFixed() + '%');

              var totalRow = 0;
              var totalDuration = 0;

              for (i = 7; i <= 14; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  totalRow = totalRow + value;
              }
              for (i = 25; i <= 32; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  if (value !== 0) {
                      totalDuration = totalDuration + value;
                  }
              }
              $(this).find('td').eq(23).css('background-color', fillColor(calculatePercentageTotal(totalRow, norm, totalDuration)));



              if (h7 == '0' && h8 == '0' && h9 == '0' && h10 == '0' && h11 == '0' && h12 == '0' && h13 == '0' && h14 == '0') {
                  $(this).closest('tr').remove();
              }

          })

          //second shift
          $('.gvv1 tbody').find('tr').each(function () {

              var norm = $(this).find('td').eq(6).text();

              var h7 = $(this).find('td').eq(15).text();
              var h8 = $(this).find('td').eq(16).text();
              var h9 = $(this).find('td').eq(17).text();
              var h10 = $(this).find('td').eq(18).text();
              var h11 = $(this).find('td').eq(19).text();
              var h12 = $(this).find('td').eq(20).text();
              var h13 = $(this).find('td').eq(21).text();
              var h14 = $(this).find('td').eq(22).text();

              var h7dur = $(this).find('td').eq(33).text();
              var h8dur = $(this).find('td').eq(34).text();
              var h9dur = $(this).find('td').eq(35).text();
              var h10dur = $(this).find('td').eq(36).text();
              var h11dur = $(this).find('td').eq(37).text();
              var h12dur = $(this).find('td').eq(38).text();
              var h13dur = $(this).find('td').eq(39).text();
              var h14dur = $(this).find('td').eq(40).text();

              $(this).find('td').eq(15).css('background-color', fillColor(calculatePercentage(h7, norm, h7dur)));
              $(this).find('td').eq(16).css('background-color', fillColor(calculatePercentage(h8, norm, h8dur)));
              $(this).find('td').eq(17).css('background-color', fillColor(calculatePercentage(h9, norm, h9dur)));
              $(this).find('td').eq(18).css('background-color', fillColor(calculatePercentage(h10, norm, h10dur)));
              $(this).find('td').eq(19).css('background-color', fillColor(calculatePercentage(h11, norm, h11dur)));
              $(this).find('td').eq(20).css('background-color', fillColor(calculatePercentage(h12, norm, h12dur)));
              $(this).find('td').eq(21).css('background-color', fillColor(calculatePercentage(h13, norm, h13dur)));
              $(this).find('td').eq(22).css('background-color', fillColor(calculatePercentage(h14, norm, h14dur)));

              $(this).find('td').eq(15).attr('title', '' + parseInt(calculatePercentage(h7, norm, h7dur) || 0).toFixed() + '%');
              $(this).find('td').eq(16).attr('title', '' + parseInt(calculatePercentage(h8, norm, h8dur) || 0).toFixed() + '%');
              $(this).find('td').eq(17).attr('title', '' + parseInt(calculatePercentage(h9, norm, h9dur) || 0).toFixed() + '%');
              $(this).find('td').eq(18).attr('title', '' + parseInt(calculatePercentage(h10, norm, h10dur) || 0).toFixed() + '%');
              $(this).find('td').eq(19).attr('title', '' + parseInt(calculatePercentage(h11, norm, h11dur) || 0).toFixed() + '%');
              $(this).find('td').eq(20).attr('title', '' + parseInt(calculatePercentage(h12, norm, h12dur) || 0).toFixed() + '%');
              $(this).find('td').eq(21).attr('title', '' + parseInt(calculatePercentage(h13, norm, h13dur) || 0).toFixed() + '%');
              $(this).find('td').eq(22).attr('title', '' + parseInt(calculatePercentage(h14, norm, h14dur) || 0).toFixed() + '%');

              var totalRow = 0;
              var totalDuration = 0;

              for (i = 15; i <= 22; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  totalRow = totalRow + value;
              }
              for (i = 33; i <= 40; i++) {
                  var value = parseInt($(this).find('td').eq(i).text() || 0);
                  if (value !== 0) {
                      totalDuration = totalDuration + value;
                  }
              }
              $(this).find('td').eq(24).css('background-color', fillColor(calculatePercentageTotal(totalRow, norm, totalDuration)));


              if (h7 == '0' && h8 == '0' && h9 == '0' && h10 == '0' && h11 == '0' && h12 == '0' && h13 == '0' && h14 == '0') {
                  $(this).closest('tr').remove();
              }

          })
      }
      function calculatePercentage(workhour, norm, duration) {
          var wrk = parseInt(workhour).toFixed();
          var nrm = parseInt(norm).toFixed();
          var dur = parseInt(duration).toFixed();
          if (!isNaN(wrk)) {
              return sum = (wrk * 100) / ((nrm / 60) * dur);
          } else {
              return sum = 0;
          }
      }
      function calculatePercentageTotal(workhour, norm, duration) {
          var wrk = parseInt(workhour).toFixed();
          var nrm = parseInt(norm).toFixed();
          var dur = parseInt(duration).toFixed();
          if (!isNaN(wrk)) {
              return sum = (wrk * 100) / ((nrm / 60) * dur);
          } else {
              return sum = 0;
          }
      }
      function fillColor(sum) {
          if (sum <= 70 && sum >= 1) {
              return "#dc3545";
          } else if (sum >= 71 && sum < 90) {
              return "#ffc107";
          } else if (sum >= 90 && sum <= 200) {
              return "#28a745";
          } else  {
              return "unset";
          }
      }
  </script>
</body>
</html>
