<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_efficienze.aspx.cs" Inherits="Views_Produzione_efficienze" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Efficiency</title>
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
         .dt-button {
                    font-size: 12px!important;
                    background: #7d8da1!important;
                    border-radius: 3px!important;
                    border: 1px solid #7b828a!important;
                    padding: 2px 4px 2px 4px!important;
                    margin: 2px!important;
                    color: white!important;
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

                    <span id="dt_select">Seleziona data: <input type="text" id="datepicker"/></span>

                    <asp:Panel runat="server" ID="pnl_prima">
                    <asp:Panel runat="server" ID="pnl_filter_btns" CssClass="bttns"></asp:Panel>
                        <asp:GridView runat="server" ID="newGrid" AutoGenerateColumns="true" CssClass="gvv table tbl table-striped"></asp:GridView>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_secondo" style="display:none;">
                    <asp:Panel runat="server" ID="pnl_filter_secondo"  CssClass="bttns"></asp:Panel>
                        <asp:GridView runat="server" ID="newGrid1"  AutoGenerateColumns="true" CssClass="gvv1 table tbl table-striped" style="width:100%!important"></asp:GridView>
                    </asp:Panel>


                        <div id="chartContainer" style="height: 270px; width: 100%;"></div>
                        <script src="../../js/canjs.min.js"></script>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:AsyncPostBackTrigger ControlID="datepicker" EventName="TextChanged" />--%>
                </Triggers>
                </asp:UpdatePanel>
        </div>
    </form>

     <script type="text/javascript">
         Sys.Application.add_load(initSomething);

         function initSomething() {
             var urlParams = new URLSearchParams(window.location.search); //get all parameters
             var departamentId = urlParams.get('departament'); //extract the foo parameter - this will return NULL if foo isn't a parameter


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
                         window.location.href = "_efficienze.aspx?departament=1&date=" + this.value;
                     } else if (departamentId == 2) { 
                         window.location.href = "_efficienze.aspx?departament=2&date=" + this.value;
                     }
                     localStorage.setItem('date', this.value);
                 });
             var dateCookie = localStorage.getItem('date');
             if (dateCookie != null) {
                 $("#datepicker").datepicker().datepicker("setDate", dateCookie);
                 localStorage.removeItem('date');
             } else {
                 $("#datepicker").datepicker().datepicker("setDate", new Date(), { dateFormat: 'dd/mm/yy' });
             }



             //Default values array of 7h to 14h
             var arr = [10, 13, 16, 19, 22, 25, 28, 31, 55,52,49,46,43,40,37,34];
             $.each(arr, function (index, val) {
                 $('tbody').find('tr').each(function () {
                         var value = $(this).find('td').eq(val).text();
                         $(this).find('td').eq(val).text(parseInt(value).toFixed() + '%');

                     if (parseInt(value).toFixed() <= 70 && parseInt(value).toFixed() >= 1 ) {
                         $(this).find('td').eq(val).css({ "background-color": "#dc3545" });
                     } else if (parseInt(value).toFixed() >= 71 && parseInt(value).toFixed() < 90) {
                         $(this).find('td').eq(val).css({ "background-color": "#ffc107" });
                     } else if (parseInt(value).toFixed() >= 90) {
                         $(this).find('td').eq(val).css({ "background-color": "#28a745" });
                     } 


                 }); 
             });

             //Convert time format
             $('table tbody tr td:last-child').each(function () {
                 var timeSpan = $(this).text();
                 $(this).text(timeSpan.substr(0, 8));
             });

             //weighted time add %
             $('tbody').find('tr').each(function () {
                 var value = $(this).find('td').eq(56).text();
                 if (parseInt(value).toFixed() <= 70 && parseInt(value).toFixed() >= 1) {
                     $(this).find('td').eq(56).css({ "background-color": "#dc3545" });
                 } else if (parseInt(value).toFixed() >= 71 && parseInt(value).toFixed() < 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#ffc107" });
                 } else if (parseInt(value).toFixed() >= 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#28a745" });
                 } 
                 $(this).find('td').eq(56).text(value + '%');
                 $(this).find('td').eq(56).css('width', '105px');

             });
             $('thead').find('th').eq(56).css('width', '105px');

             //Header nameing
             $('thead').find('th').each(function () {
                 if ($(this).text() == 'Phase') {
                     $(this).text('Fase');
                 } else if ($(this).text() == 'WeightedAverage') {
                     $(this).text('Weighted Avg.');
                 } else if ($(this).text() == 'SpentTimeOnJob') {
                     $(this).text('Total Time')
                 } else if ($(this).text() == 'Name') {
                     $(this).text('Full Name')
                 }

                 for (var i = 7; i <= 22; i++) {
                     if ($(this).text() == 'H' + i + '') {
                         $(this).text(i + 'h');
                     }
                 }
             });

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

             //CONFEZIONE
             if (departamentId == 1) {
                 filterJsonConf();

                 $('.gvv').dataTable({
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
                     "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                     "columnDefs": [
                         {
                             "targets": [3,5,6, 7, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 24, 26, 27, 29, 30, 32, 33, 34 , 35, 36, 38, 39, 41, 42, 44, 45, 47, 48, 50, 51, 53, 54,37,40,43,46,49,52,55,58,59,60,61],
                             "visible": false,
                             "searchable": false
                         }]
                 }); 
             }
             //STIRO
             else if (departamentId == 2) {
               
             filterJsonStiro();
                $('.gvv').dataTable({
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
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    "columnDefs": [
                        {
                            "targets": [3, 5, 6, 7, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 24, 26, 27, 29, 30, 32, 33, 34, 35, 36, 38, 39, 41, 42, 44, 45, 47, 48, 50, 51, 53, 54, 37, 40, 43, 46, 49, 52, 55,  59, 60,58,61],
                            "visible": false,
                            "searchable": false
                        }]
                });
                $('#newGrid1').dataTable({
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
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "columnDefs": [
                    {//57 57,
                        "targets": [3, 5, 6, 7, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 24, 26, 27, 29, 30, 32, 33, 35, 36, 38, 39, 41, 42, 44, 45, 47, 48, 50, 51, 53, 54, 10, 13, 16, 19, 22, 25, 28, 31, 58, 59, 60, 61],
                        "visible": false,
                        "searchable": false
                    }]
            });
             } 

             //filter buttons click
             $(".filter-btn").click(function () {
                     if ($(this).attr('data-name') == 'all') {
                         $('input[type=search]').val('').keyup();
                     } else {
                         $('input[type=search]').val($(this).attr('data-name')).keyup();
                     }
                     $('.filter-btn').removeClass('active');
                     $(this).addClass('active');
             }); 
            $('#dt_select').appendTo('#newGrid_filter');
          if (departamentId == 1){
              $('.head-text').text('Efficienze Confezione');
          } else {
               $('.head-text').text('Efficienze Stiro');
          }
             GetSelectedRowData();
             GetSelectedRowDataSecond();    
         }
          
         function ConvertTimeformat(format, str) {
             var hours = Number(str.match(/^(\d+)/)[1]);
             var minutes = Number(str.match(/:(\d+)/)[1]);
             var AMPM = str.match(/\s?([AaPp][Mm]?)$/)[1];
             var pm = ['P', 'p', 'PM', 'pM', 'pm', 'Pm'];
             var am = ['A', 'a', 'AM', 'aM', 'am', 'Am'];
             if (pm.indexOf(AMPM) >= 0 && hours < 12) hours = hours + 12;
             if (am.indexOf(AMPM) >= 0 && hours == 12) hours = hours - 12;
             var sHours = hours.toString();
             var sMinutes = minutes.toString();
             if (hours < 10) sHours = "0" + sHours;
             if (minutes < 10) sMinutes = "0" + sMinutes;
             if (format == '0000') {
                 return (sHours + sMinutes);
             } else if (format == '00:00') {
                 return (sHours + ":" + sMinutes);
             } else {
                 return false;
             }
         }


         function filterJsonConf() {
             //first shift
             $('.gvv').find('th').eq(55).after('<th>Avarage</th>');

             $('.gvv').find('tr').each(function () {
                 var h15 = $(this).find('td').eq(10).text();
                 var h16 = $(this).find('td').eq(13).text();
                 var h17 = $(this).find('td').eq(16).text();
                 var h18 = $(this).find('td').eq(19).text();
                 var h19 = $(this).find('td').eq(22).text();
                 var h20 = $(this).find('td').eq(25).text();
                 var h21 = $(this).find('td').eq(28).text();
                 var h22 = $(this).find('td').eq(31).text();

                 if (h15 == '0%' && h16 == '0%' && h17 == '0%' && h18 == '0%' && h19 == '0%' && h20 == '0%' && h21 == '0%' && h22 == '0%') {
                     $(this).closest('tr').remove();
                 }
                 var averadge = 0;
                 var counter = 0;
                 var arr = [parseInt(h15.substr(0, h15.length - 1) || 0), parseInt(h16.substr(0, h16.length - 1) || 0), parseInt(h17.substr(0, h17.length - 1) || 0), parseInt(h18.substr(0, h18.length - 1) || 0), parseInt(h19.substr(0, h19.length - 1) || 0), parseInt(h20.substr(0, h20.length - 1) || 0), parseInt(h21.substr(0, h21.length - 1) || 0), parseInt(h22.substr(0, h22.length - 1) || 0)];

                 $.each(arr, function (index, val) {

                     averadge = averadge + val;
                     if (val > 0) {
                         counter++;
                     }
                 });
                 var avaradgeTotal = averadge / counter;
                 $(this).find('td').eq(55).after('<td>' + avaradgeTotal.toFixed() + '%</td>');

                 if (avaradgeTotal.toFixed() <= 70 && avaradgeTotal.toFixed() >= 1) {
                     $(this).find('td').eq(56).css({ "background-color": "#dc3545" });
                 } else if (avaradgeTotal.toFixed() >= 71 && avaradgeTotal.toFixed() < 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#ffc107" });
                 } else if (avaradgeTotal.toFixed() >= 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#28a745" });
                 } 

                 $(this).find('td').eq(56).addClass('highlight');

             })
         }
         function filterJsonStiro() {
             //first shift
             $('.gvv').find('th').eq(55).after('<th>Avarage</th>');

             $('.gvv').find('tr').each(function () {
                 var h15 = $(this).find('td').eq(10).text();
                 var h16 = $(this).find('td').eq(13).text();
                 var h17 = $(this).find('td').eq(16).text();
                 var h18 = $(this).find('td').eq(19).text();
                 var h19 = $(this).find('td').eq(22).text();
                 var h20 = $(this).find('td').eq(25).text();
                 var h21 = $(this).find('td').eq(28).text();
                 var h22 = $(this).find('td').eq(31).text();

                 if (h15 == '0%' && h16 == '0%' && h17 == '0%' && h18 == '0%' && h19 == '0%' && h20 == '0%' && h21 == '0%' && h22 == '0%') {
                     $(this).closest('tr').remove();
                 }
                 var averadge = 0;
                 var counter = 0;
                 var arr = [parseInt(h15.substr(0, h15.length - 1) || 0), parseInt(h16.substr(0, h16.length - 1) || 0), parseInt(h17.substr(0, h17.length - 1) || 0), parseInt(h18.substr(0, h18.length - 1) || 0), parseInt(h19.substr(0, h19.length - 1) || 0), parseInt(h20.substr(0, h20.length - 1) || 0), parseInt(h21.substr(0, h21.length - 1) || 0), parseInt(h22.substr(0, h22.length - 1) || 0)];

                 $.each(arr, function (index, val) {

                     averadge = averadge + val;
                     if (val > 0) {
                         counter++;
                     }
                 });
                 var avaradgeTotal = averadge / counter;
                 $(this).find('td').eq(55).after('<td>' + avaradgeTotal.toFixed() + '%</td>');
                 $(this).find('td').eq(56).addClass('highlight');

                 if (avaradgeTotal.toFixed() <= 70 && avaradgeTotal.toFixed() >= 1) {
                     $(this).find('td').eq(56).css({ "background-color": "#dc3545" });
                 } else if (avaradgeTotal.toFixed() >= 71 && avaradgeTotal.toFixed() < 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#ffc107" });
                 } else if (avaradgeTotal.toFixed() >= 90) {
                     $(this).find('td').eq(56).css({ "background-color": "#28a745" });
                 } 
             })

             //Add avg Header th
             $('.gvv1').find('th').eq(55).after('<th>Avarage</th>'); 
             //second shift
             $('.gvv1').find('tr').each(function () {
                 var h15 = $(this).find('td').eq(34).text();
                 var h16 = $(this).find('td').eq(37).text();
                 var h17 = $(this).find('td').eq(40).text();
                 var h18 = $(this).find('td').eq(43).text();
                 var h19 = $(this).find('td').eq(46).text();
                 var h20 = $(this).find('td').eq(49).text();
                 var h21 = $(this).find('td').eq(52).text();
                 var h22 = $(this).find('td').eq(55).text();

                 if (h15 == '0%' && h16 == '0%' && h17 == '0%' && h18 == '0%' && h19 == '0%' && h20 == '0%' && h21 == '0%' && h22 == '0%') {
                     $(this).closest('tr').remove();
                 }
                 var averadge = 0;
                 var counter = 0;
                 var arr = [parseInt(h15.substr(0, h15.length - 1) || 0), parseInt(h16.substr(0, h16.length - 1) || 0), parseInt(h17.substr(0, h17.length - 1) || 0), parseInt(h18.substr(0, h18.length - 1) || 0), parseInt(h19.substr(0, h19.length - 1) || 0), parseInt(h20.substr(0, h20.length - 1) || 0), parseInt(h21.substr(0, h21.length - 1) || 0), parseInt(h22.substr(0, h22.length - 1) || 0)];

                 $.each(arr, function (index, val) {

                     averadge = averadge + val;
                     if (val > 0) {
                         counter++;
                     }
                 });
                 var avaradgeTotal = averadge / counter;
                 $(this).find('td').eq(55).after('<td>' + avaradgeTotal.toFixed() + '%</td>');
                 $(this).find('td').eq(56).addClass('highlight');
                 if (avaradgeTotal.toFixed() <= 70 && avaradgeTotal.toFixed() >= 1) {
                     $(this).find(56).css({ "background-color": "#dc3545" });
                 } else if (avaradgeTotal.toFixed() >= 71 && avaradgeTotal.toFixed() < 90) {
                     $(this).find(56).css({ "background-color": "#ffc107" });
                 } else if (avaradgeTotal.toFixed() >= 90) {
                     $(this).find(56).css({ "background-color": "#28a745" });
                 } 
             })
         }


         function GetSelectedRowData() {
             let table = $('.gvv').DataTable(),
                 keys = $('th', $('.gvv').children('thead').find('tr')).map(function (index, value) {
                     return $(value).text();
                 }),
                 row = {};

             $('.gvv tbody').on('click', 'tr', function () {
                 var data = table.row($(this)).data();
                 keys.each((i, v) => {
                     var string = `{"${v}":"${data[i]}"}`;
                     Object.assign(row, JSON.parse(string));
                 });

                 $('tr').removeClass('selected');
                 $(this).addClass('selected');

                 var h7 = parseInt(data[10].substr(0, data[10].length - 1));
                 var h8 = parseInt(data[13].substr(0, data[13].length - 1));
                 var h9 = parseInt(data[16].substr(0, data[16].length - 1));
                 var h10 = parseInt(data[19].substr(0, data[19].length - 1));
                 var h11 = parseInt(data[22].substr(0, data[22].length - 1));
                 var h12 = parseInt(data[25].substr(0, data[25].length - 1));
                 var h13 = parseInt(data[28].substr(0, data[28].length - 1));
                 var h14 = parseInt(data[31].substr(0, data[31].length - 1));

                 var chart = new CanvasJS.Chart("chartContainer", {
                     animationEnabled: true,
                     title: {
                         text: data[1],
                         fontSize: 18,
                         fontFamily: "verdana",
                         fontWeight: "normal",
                     },
                     axisY: {
                         title: "Percentage(%)"
                     },
                     data: [{
                         type: "column",
                         indexLabel: "{y}%",
                         indexLabelPlacement: "inside",
                         indexLabelOrientation: "horizontal",
                         showInLegend: false,
                         dataPoints: [
                             { y: h7, label: "7h", color: colorBar(h7) },
                             { y: h8, label: "8h", color: colorBar(h8) },
                             { y: h9, label: "9h", color: colorBar(h9) },
                             { y: h10, label: "10h", color: colorBar(h10) },
                             { y: h11, label: "11h", color: colorBar(h11) },
                             { y: h12, label: "12h", color: colorBar(h12) },
                             { y: h13, label: "13h", color: colorBar(h13) },
                             { y: h14, label: "14h", color: colorBar(h14) }
                         ]
                     }]
                 });
                 chart.render();

             });
         }
         function GetSelectedRowDataSecond() {
             let table = $('.gvv1').DataTable(),
                 keys = $('th', $('.gvv1').children('thead').find('tr')).map(function (index, value) {
                     return $(value).text();
                 }),
                 row = {};

             $('.gvv1 tbody').on('click', 'tr', function () {
                 var data = table.row($(this)).data();
                 keys.each((i, v) => {
                     var string = `{"${v}":"${data[i]}"}`;
                     Object.assign(row, JSON.parse(string));
                 });

                 $('tr').removeClass('selected');
                 $(this).addClass('selected');

                 var h7 = parseInt(data[34].substr(0, data[10].length - 1));
                 var h8 = parseInt(data[37].substr(0, data[13].length - 1));
                 var h9 = parseInt(data[40].substr(0, data[16].length - 1));
                 var h10 = parseInt(data[43].substr(0, data[19].length - 1));
                 var h11 = parseInt(data[46].substr(0, data[22].length - 1));
                 var h12 = parseInt(data[49].substr(0, data[25].length - 1));
                 var h13 = parseInt(data[52].substr(0, data[28].length - 1));
                 var h14 = parseInt(data[55].substr(0, data[31].length - 1));

                 var chart = new CanvasJS.Chart("chartContainer", {
                     animationEnabled: true,
                     title: {
                         text: data[1],
                         fontSize: 18,
                         fontFamily: "verdana",
                         fontWeight: "normal",
                     },
                     axisY: {
                         title: "Percentage(%)"
                     },
                     data: [{
                         type: "column",
                         indexLabel: "{y}%",
                         indexLabelPlacement: "inside",
                         indexLabelOrientation: "horizontal",
                         showInLegend: false,
                         dataPoints: [
                             { y: h7, label: "15h", color: colorBar(h7) },
                             { y: h8, label: "16h", color: colorBar(h8) },
                             { y: h9, label: "17h", color: colorBar(h9) },
                             { y: h10, label: "18h", color: colorBar(h10) },
                             { y: h11, label: "19h", color: colorBar(h11) },
                             { y: h12, label: "20h", color: colorBar(h12) },
                             { y: h13, label: "21h", color: colorBar(h13) },
                             { y: h14, label: "22h", color: colorBar(h14) }
                         ]
                     }]
                 });
                 chart.render();

             });
         }
         function colorBar(percentage) {

             if (percentage <= 70 && percentage >= 1) {
                 return "#dc3545";
             } else if (percentage >= 71 && percentage < 90) {
                 return "#ffc107";
             } else if (percentage >= 90) {
                 return "#28a745";
             } 

         }
         function getJsonTurno(turno) {
             if (turno == 1) {
                 var heads = [];
                 $("thead").find("th").each(function () {
                     heads.push($(this).text().trim());
                 });
                 var rows = [];
                 $("tbody tr").each(function () {
                     cur = {};
                     $(this).find("td").each(function (i, v) {
                         cur[heads[i]] = $(this).text().trim();
                     });
                     rows.push(cur);
                     cur = {};
                 });


                 //return json
             } else if (turno == 2) {
                 var heads = [];
                 $("thead").find("th").each(function () {
                     heads.push($(this).text().trim());
                 });
                 var rows = [];
                 $("tbody tr").each(function () {
                     cur = {};
                     $(this).find("td").each(function (i, v) {
                         cur[heads[i]] = $(this).text().trim();
                     });
                     rows.push(cur);
                     cur = {};
                 });

                 //console.log(rows);
                 //return json
             }
         }
     </script>

</body>
</html>
