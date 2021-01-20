<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RicaviContoLavoro.aspx.cs" Inherits="Views_Finance_RicaviContoLavoro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <script src="../../src/js/jQuery-3.5.1.min.js"></script>
    <script
      type="text/javascript"
      src="https://www.gstatic.com/charts/loader.js"
    ></script>

    <style>
      * {
        font-family: Calibri;
      }
      .div-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: -webkit-center;
        width: 1200px;
        margin: 0 auto;
      }

      @media screen and (max-width: 1024px) {
        .div-wrapper, .chart-first-two {
          flex-direction: column!important;
        }
      }

      .div-main,
      .div-chart
       {
        width: 100%;
      }
      .div-main {
        margin-right: 20px;
      }
      table {
        overflow: hidden;
      }
      .header {
        background-color: #2e94f2;
        color: white;
      }

      th {
        font-size: 18px;
        font-weight: 400;
        padding: 5px 10px;
        border: 1px solid #2986db;
      }

      td {
        min-width: 50px;
        text-align: center;
        border: 1px inset #2986db38;
      }

      .departament {
        font-weight: 600;
        letter-spacing: 0.1px;
        text-align: center;
        color: RGB(83, 141, 213);
        border: 1px solid RGB(83, 141, 213);
        padding: 0px 15px;
      }
      .central-data {
        text-align: center;
      }
      .column-second {
        white-space: nowrap;
        padding: 5px 20px;
      }

      .last-three {
        white-space: normal;
        max-width: 100px;
        border-right: 1px solid #2986db !important;
        border-left: 1px solid #2986db !important;
      }
      .blank-row {
        background: red;
      }
      .lightblue {
        color: #61b1f8 !important;
        font-weight: 600;
      }
      .consultivo {
        color: red;
      }
      .consultivo-last-two {
        background-color: #c9e5ff;
        font-weight: 600;
      }

      .dep-divider {
        border-bottom: 1px solid #2e94f2;
      }

      .last-row {
        background-color: #2e94f2d9;
        color: white;
      }
      .last-white {
        border: none;
        border-right: 1px solid white;
        background: white;
        border-bottom: 1px solid white;
      }
      .bdg{
          color:#43a6ff;
      }

      .div-chart{
        display: flex;
        flex-wrap: wrap;
        max-width: 1200px;
      }

      .div-chart-dep{
        width: 550px;
        display: block;
        margin: 25px;
      }

      .chart-first-two{
        display: flex;
        flex-direction: row;
        max-width: 1200px;
      }

      .hder > span:nth-of-type(1){
          font-weight:600;
          color: #3366cc;
      }
      .hder > span:nth-of-type(2), span:nth-of-type(3){
          font-size: 14px;
          font-weight: 600;
          color: #a51212;
      }
      th > span{
        position: absolute;
        color: black;
        font-size: 11px;
        margin-top: -45px;
        margin-left: -35px;
      }
    </style>
  </head>
  <body>
    <form id="form1" runat="server">
        <div id="LoginDiv" runat="server" visible="true">
          <asp:TextBox ID="PasswordTextBox" runat="server" placeholder="Password" type="password"></asp:TextBox>
          <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
        </div>

      <div class="div-wrapper" id="MainDiv" runat="server" visible="false">
        <div style="width: 100%; text-align: left;">
          <div class="hder" style="width: 155px; text-align: center;">
          <span>OLIMPIAS KNITTING</span>
          <br>
          <span>RICAVI CONTO LAVORO</span>
          <br>
          <span>Anno 2020</span>
          </div>
        </div>
        <div class="div-main">
          <asp:GridView
            ID="grdReport"
            AutoGenerateColumns="true"
            RowStyle-CssClass="row"
            HeaderStyle-CssClass="header"
            runat="server"
            BackColor="White"
            BorderColor="#3399ff"
            BorderStyle="Dotted"
            BorderWidth="1px"
            CellPadding="3"
            GridLines="Both"
          >
          </asp:GridView>
        
        </div>
          <br />

      <div class="chart-first-two">
        <div id="chart_div"></div>
        <div id="chart_div_bar"></div>
      </div>

          <div class="div-chart">
            <div class="div-chart-dep" id="TESSITURA"></div>
            <div class="div-chart-dep" id="CONFEZIONE"></div>
            <div class="div-chart-dep" id="STIRO"></div>
            <div class="div-chart-dep" id="SARTORIA"></div>
          </div>
       
      </div>
    </form>
    <script type="text/javascript">
      $(function () {

        $('.header').find('th').eq(2).append('<span>cons./Bdg</span>');
        $('.header').find('th').eq(3).append('<span>cons./Bdg</span>');
        $('.header').find('th').eq(4).append('<span>cons./Bdg</span>');

        $('.header').find('th').eq(5).append('<span>cons./Prc1</span>');
        $('.header').find('th').eq(6).append('<span>cons./Prc1</span>');
        $('.header').find('th').eq(7).append('<span>cons./Prc1</span>');
        $('.header').find('th').eq(8).append('<span>cons./Prc1</span>');

        $('.header').find('th').eq(9).append('<span>cons./Prc2</span>');
        $('.header').find('th').eq(10).append('<span>cons./Prc2</span>');
        $('.header').find('th').eq(11).append('<span>cons./Prc2</span>');
        $('.header').find('th').eq(12).append('<span>cons./Prc2</span>');
        $('.header').find('th').eq(13).append('<span>cons./Prc2</span>');
        //cons./Prc2

        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        google.charts.load("current", { packages: ["line"] });
        google.charts.setOnLoadCallback(drawIt);

        dataManipulation();
      });

      function dataManipulation() {
        var counter = 5;
        var counterVal = 0;

        $("table > tbody  > tr").each(function (index, tr) {
          $(this).find("td").eq(14).addClass("last-three");

          if (index == 2){
            $(tr).find("td").eq(14).addClass("tess-cons");
            $(tr).find("td").eq(16).addClass("tess-bdg");
          } else if (index == 7) {
            $(tr).find("td").eq(14).addClass("conf-cons");
            $(tr).find("td").eq(16).addClass("conf-bdg");
          } else if (index == 12){
            $(tr).find("td").eq(14).addClass("stiro-cons");
            $(tr).find("td").eq(16).addClass("stiro-bdg");
          } else if (index == 17){
            $(tr).find("td").eq(14).addClass("sartoria-cons");
            $(tr).find("td").eq(16).addClass("sartoria-bdg");
          }  

          if ($(this).find("td").eq(15).html() !== "&nbsp;" &&
            $(this).find("td").eq(16).html() !== "&nbsp;"
          ) {
            $(this).find("td").eq(15).addClass("consultivo-last-two");
            $(this).find("td").eq(16).addClass("consultivo-last-two");
          } else if ($(this).find("td").eq(16).html() == "&nbsp;") {
            $(this).find("td").eq(16).addClass("last-white");
          }

          $("td").eq(0).addClass("column-first");
          $("td").eq(1).addClass("column-second");

          $(this)
            .find("td")
            .eq(0)
            .each(function () {
              if ($(this).html() != "&nbsp;") {
                $(this).addClass("departament");
                $(this).addClass($(this).text());
                $(this).attr("rowspan", counter);
                $(this).attr("data-index", index + 1);
                counter = 1;
              } else {
                counterVal = counter++;
                $(this).remove();
              }
            });
          for (var i = 2; i <= 16; i++) {
              $("td").eq(i).addClass("central-data");
            }

          if ($(this).find("td").html() == "&nbsp;") {
            $(this).text("");
          }

          $(this)
            .find("td")
            .eq(0)
            .each(function () {
              if ($(this).text() === "Consuntivo") {
                $(this).addClass("lightblue");
                $(this).parent("tr").children("td").addClass("consultivo");
              }

              if ($(this).text() === "bdg **") {
                $(this).addClass("bdg");
                $(this).parent("tr").children("td").addClass("bdg **");
              }

              if ($(this).text() === "a.p.") {
                $(this).parent("tr").children("td").addClass("dep-divider");
              }

              if (
                $(this).text() === "bdg **" ||
                $(this).text() === "delta mese" ||
                $(this).text() === "a.p." ||
                $(this).text() === "delta bdg " ||
                $(this).text() === "bdg"
              ) {
                $(this).css("font-weight", "600");
              }
            });

          $(this)
            .find("td")
            .eq(1)
            .each(function () {
              $(this).addClass("second");
              if ($(this).text() === "giorni lavoro") {
                $(this).css("font-style", "italic");
              }

              if ($(this).text() === "TOTALE") {
                $(this).addClass("lightblue");
              }
            });
        });

        $("table > tbody > tr").last().addClass("last-row");

        $("tr")
          .find("td")
          .filter(function () {
            return $(this).text() == "&nbsp;";
          })
          .addClass("empty");

        for (var i = 14; i <= 16; i++) {
          $("th").eq(i).addClass("last-three");

          if (parseInt($('.last-three').text(),10)){
            $(this).hide();
          }
        }
      }
      //MAIN CHART
      function drawChart() {
        var tess = Math.round(($('.tess-cons').text() / $('.tess-bdg').text() * 100));
        var conf = Math.round(($('.conf-cons').text() / $('.conf-bdg').text() * 100));
        var stiro = Math.round(($('.stiro-cons').text() / $('.stiro-bdg').text() * 100));
        var sartoria = Math.round(($('.sartoria-cons').text() / $('.sartoria-bdg').text() * 100));

        var data = google.visualization.arrayToDataTable([
            ["Departament", "Consultivo", { role: 'annotation' }, "bdg", { role: "style" } ],
            ["TESSITURA", tess, tess + "%", 100 - tess, "#e0e0e0"], 
            ["CONFEZIONE", conf, conf + "%", 100 - conf, "#e0e0e0"], 
            ["STIRO",stiro, stiro + "%", 100 - stiro, "#e0e0e0"], 
            ["SARTORIA", sartoria, sartoria + "%", 100 - sartoria, "#e0e0e0"],
        ]);

        var options = {
          title: "% RAGGIUNGIMENTO BUDGET ANNUALE - 2020",
          width: 600,
          height: 350,
          backgroundColor: "transparent",
          legend: {
            position: "top",
            maxLines: 3,
          },
          bar: { groupWidth: "75%" },
          colors: ['#3366cc', '#e0e0e0'],
          isStacked: true, annotations: {
          alwaysOutside: true,
          textStyle: {
            fontSize: 12,
            auraColor: 'none',
            color: '#555'
          },
          boxStyle: {
            stroke: '#ccc',
            strokeWidth: 1,
            gradient: {
              color1: '#f3e5f5',
              color2: '#f3e5f5',
              x1: '0%', y1: '0%',
              x2: '100%', y2: '100%'
            }
          }
          
        },
        hAxis: {
          title: 'Percentage %',
            minValue: 0,
            maxValue: 100
        },
        vAxis: {
          title: 'Departament'
        }
        };

        var chart = new google.visualization.BarChart(document.getElementById("chart_div"));
        chart.draw(data, options);
      }

      //4 CHARTS
      function drawLineChart(departament) {
        var conIdx = 0;
        var asIdx = 0;

        var data = new google.visualization.DataTable();
        data.addColumn("string", "Mese");
        data.addColumn("number", "Consultivo");
        data.addColumn("number", "a.p");
        
        if (departament == "TESSITURA") {
          conIdx = 2;
          asIdx = 5;
        } else if (departament == "CONFEZIONE") {
          conIdx = 7;
          asIdx = 10;
        } else if (departament == "STIRO") {
          conIdx = 12;
          asIdx = 15;
        } else if (departament == "SARTORIA") {
          conIdx = 17;
          asIdx = 20;
        }
        data.addRows([
          ["gen", returnValue(conIdx, 1), returnValue(asIdx, 1)],
          ["feb", returnValue(conIdx, 2), returnValue(asIdx, 2)],
          ["mar", returnValue(conIdx, 3), returnValue(asIdx, 3)],
          ["apr", returnValue(conIdx, 4), returnValue(asIdx, 4)],
          ["mag", returnValue(conIdx, 5), returnValue(asIdx, 5)],
          ["giu", returnValue(conIdx, 6), returnValue(asIdx, 6)],
          ["lug", returnValue(conIdx, 7), returnValue(asIdx, 7)],
          ["ago", returnValue(conIdx, 8), returnValue(asIdx, 8)],
          ["set", returnValue(conIdx, 9), returnValue(asIdx, 9)],
          ["ott", returnValue(conIdx, 10), returnValue(asIdx, 10)],
          ["nov", returnValue(conIdx, 11), returnValue(asIdx, 11)],
          ["dic", returnValue(conIdx, 12), returnValue(asIdx, 12)],
        ]);

        var options = {
          chart: {
            title: departament,
          },
          animation: {
            duration: 1000,
            easing: "linear",
            startup: true,
          },
          width: 550,
          height: 250
        };

        var chart = new google.charts.Line(
          document.getElementById(departament)
        );

        chart.draw(data, google.charts.Line.convertOptions(options));
      }
      //Return Value
      function returnValue(rowIdx, tdIdx) {
        var el = 0;
        $("table > tbody  > tr").each(function (index, tr) {
          if (index == rowIdx) {
            $(this)
              .find("td")
              .each(function (idx, element) {
                if (idx == tdIdx) {
                  el = element.innerHTML;
                }
              });
          }
        });
        return parseInt(el) | 0;
      }
      function drawIt() {
        drawLineChart("TESSITURA");
        drawLineChart("CONFEZIONE");
        drawLineChart("STIRO");
        drawLineChart("SARTORIA");
      }
    </script>

<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
    var data = google.visualization.arrayToDataTable([
      ['Mese', 'Totale',  'bdg'],
      ['gen',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(2).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(1).text(),10)],
      ['feb',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(3).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(2).text(),10)],
      ['mar',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(4).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(3).text(),10)],
      ['apr',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(5).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(4).text(),10)],
      ['mag',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(6).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(5).text(),10)],
      ['giu',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(7).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(6).text(),10)],
      ['lug',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(8).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(7).text(),10)],
      ['ago',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(9).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(8).text(),10)],
      ['set',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(10).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(9).text(),10)],
      ['ott',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(11).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(10).text(),10)],
      ['nov',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(12).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(11).text(),10)],
      ['dic',  parseInt($("table > tbody  > tr").eq(23).find("td").eq(13).text(),10), parseInt($("table > tbody  > tr").eq(24).find("td").eq(12).text(),10)]
    ]);

    var options = {
      vAxis: {title: 'Totale'},
      hAxis: {title: 'Mese'},
      seriesType: 'bars',
      series: {1: {type: 'line'}},
      width: 600,
          height: 350
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div_bar'));
    chart.draw(data, options);
  }
</script>
  </body>
</html>

