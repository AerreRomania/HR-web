// RaportAbsente.js
function Lista() {
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteWS.RaportAbsenteLista($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);
}

function ListaFilter() {
    var vrednos = $get("ddlFilterTip").value;

    if (vrednos === 'Ore') {
        $('#tAbsenteProcent').hide();
        $('#tAbsenteOre').show();
        //DRAW DEFAULT CHARTS ORE
        drawChartsDefaultOre();
        $('#hchart').text('Totale Ore:');
    }

    if (vrednos === 'Percentuale') {
        $('#tAbsenteProcent').show();
        $('#tAbsenteOre').hide();
        //DRAW DEFAULT CHARTS ORE
        drawChartsDefaultPercentuale();
        $('#hchart').text('Totale Percentuale %:');
    }
}

function excelExportHtml(table, includeCss) {

    if (includeCss) {
        var styles = [];

        //grab all styles defined on the page
        $("style").each(function (index, domEle) {
            styles.push($(domEle).html());
        });

        //grab all styles referenced by stylesheet links on the page
        var ajaxCalls = [];
        $("[rel=stylesheet]").each(function () {
            ajaxCalls.push($.get(this.href, '', function (data) {
                styles.push(data);
            }));
        });

        return $.when.apply(null, ajaxCalls)
            .then(function () {
                console.log(table.outerHTML);
                return "<html><style type='text/css'>" + styles.join("\n") + "</style>\n" + table.outerHTML + "</html>";
            });
    }
    else {
        return $.when({ owcHtml: table.outerHTML })
            .then(function (result) {
                return "<html>" + result.owcHtml + "</html>";
            });
    }
}




function printData() {

    var vrednos = $("#ddlFilterTip").val();
    if (vrednos === 'Ore') {

        $("#printing-holder").append("<div id='imaginary-friend'></div>");

        $('#tAbsenteOre').clone().appendTo("#imaginary-friend");
        $("#imaginary-friend").append('<br/>');
        $('#bar-chart').clone().appendTo("#imaginary-friend");

        $('#imaginary-friend').printThis({
            header: "<h1>Assenteismo Generale / Ore - Anno: " + $('#ddlFiltruAn').val() + "</h1>",
            pageTitle: "",
            importCSS: true,
            ImportStyle: true,
            copyTagClasses: true,
            loadCSS: "Css/StyleSheet.css"
        });
        $("#imaginary-friend").remove();

    } else {
        $("#printing-holder").append("<div id='imaginary-friend'></div>");


        $('#tAbsenteProcent').clone().appendTo("#imaginary-friend");
        $("#imaginary-friend").append('<br/>');
        $('#bar-chart').clone().appendTo("#imaginary-friend");


        $('#imaginary-friend').printThis({
            header: "<h1>Assenteismo Generale / Percentuale - Anno: " + $('#ddlFiltruAn').val() + "</h1>",
            pageTitle: "",
            importCSS: true,
            ImportStyle: true,
            copyTagClasses: true,
            loadCSS: "Css/StyleSheet.css"
        });
        $("#imaginary-friend").remove();

    }   

}

function printPDF() {
        var vrednos = $("#ddlFilterTip").val();
    if (vrednos === 'Ore') {

        $("#printing-holder").append("<div id='imaginary-friend' style='background:white;'><h3>Assenteismo Generale / Ore -  - Anno: " + $('#ddlFiltruAn').val() + "</h3></div>");

        $('#tAbsenteOre').clone().appendTo("#imaginary-friend");
        $("#imaginary-friend").append('<br/>');
        $('#bar-chart').clone().appendTo("#imaginary-friend");

        //    var pdf = new jsPDF('l', 'pt', 'letter');
        var pdf = new jsPDF('l', 'pt', [600, 1354]);
            pdf.addHTML($('#imaginary-friend')[0], function () {
            pdf.save('Assenteismo Generale.pdf');
            $("#imaginary-friend").remove();
            });
    }
   if (vrednos === 'Percentuale') {

        $("#printing-holder").append("<div id='imaginary-friend' style='background:white;'><h3>Assenteismo Generale / Percentuale -  - Anno: " + $('#ddlFiltruAn').val() + "</h3></div>");

        $('#tAbsenteProcent').clone().appendTo("#imaginary-friend");
        $("#imaginary-friend").append('<br/>');
        $('#bar-chart').clone().appendTo("#imaginary-friend");

            //var pdfs = new jsPDF('p', 'pt', 'letter');
       var pdfs = new jsPDF('l', 'pt', [600, 1354]);
       pdfs.addHTML($('#imaginary-friend')[0], function () {
                    pdfs.save('Assenteismo Generale.pdf');
                    $("#imaginary-friend").remove();

            });
        }   

}


function bExcel_Click() {
    $get('up').style.display = '';
    WbmOlimpias.RaportAbsenteWS.RaportAbsenteExcel($get("ddlFiltruAn").value, SucceededCallback, FailedCallback);
}

function Proprietati() { }

function bdetailed() {

    $("#trConfA").hover(function () {
        $('#grd_ass_ConfA').show();
        $("#trConfA").css("color:red;");
    }, function () {
        $('#grd_ass_ConfA').hide();
        $("#trConfA").css("color:black;");

    });

    $("#trConfB").hover(function () {
        $("#trConfB").css("color:red;");
        $('#grd_ass_ConfB').show();
    }, function () {
        $('#grd_ass_ConfB').hide();
        $("#trConfB").css("color:black;");

    });

    $("#trStiro").hover(function () {
        $("#trStiro").css("color:red;");
        $('#grd_ass_Stiro').show();
    }, function () {
        $('#grd_ass_Stiro').hide();
        $("#trStiro").css("color:black;");

    });


    $("#trTess").hover(function () {
        $("#trTess").css("color:red;");
        $('#grd_ass_Tess').show();
    }, function () {
        $('#grd_ass_Tess').hide();
        $("#trTess").css("color:black;");

    });



    $("#trAmmini").hover(function () {
        $('#grd_ass_Ammin').show();
        $("#trAmmin").css("color:red;");

    }, function () {
        $('#grd_ass_Ammin').hide();
        $("#trAmmin").css("color:black;");

    });

    $("#trStiroS").hover(function () {
        $('#grd_ass_StiroS').show();
        $("#trStiroS").css("color:red;");

    }, function () {
        $('#grd_ass_StiroS').hide();
        $("#trStiroS").css("color:black;");

    });


    $("#trTessS").hover(function () {
        $('#grd_ass_TessS').show();
        $("#trTessS").css("color:red;");

    }, function () {
        $('#grd_ass_TessS').hide();
        $("#trTessS").css("color:black;");

    });


    $("#trTessT").hover(function () {
        $('#grd_ass_TessT').show();
        $("#trTessT").css("color:red;");

    }, function () {
        $('#grd_ass_TessT').hide();
        $("#trTessT").css("color:black;");

    });

    $("#mailreport").show();
}
function bdetailedexit() {
    $("#mailreport").hide();
}

function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("RaportAbsenteLista"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                AfisareAbsente("tAbsenteProcent", result.TabelaAbsenteProcent);
                AfisareAbsente("tAbsenteOre", result.TabelaAbsenteOre);

                sumTotale();
                sumTotaleOre();
                break;
            }
        case ("RaportAbsenteExcel"):
            {
                if (result.Eroare !== '') {
                    window.alert(result.Eroare);
                    return;
                }
                var xlApp, xlWorkbook, xlSheet;
                xlApp = new ActiveXObject("Excel.Application");
                xlWorkbook = xlApp.Workbooks.Add();
                xlSheet = xlApp.ActiveSheet;

                xlSheet.Columns('A').ColumnWidth = 32;
                xlSheet.Columns('B').ColumnWidth = 8;
                xlSheet.Columns('C').ColumnWidth = 8;
                xlSheet.Columns('D').ColumnWidth = 8;
                xlSheet.Columns('E').ColumnWidth = 8;
                xlSheet.Columns('F').ColumnWidth = 8;
                xlSheet.Columns('G').ColumnWidth = 8;
                xlSheet.Columns('H').ColumnWidth = 8;
                xlSheet.Columns('I').ColumnWidth = 8;
                xlSheet.Columns('J').ColumnWidth = 8;
                xlSheet.Columns('K').ColumnWidth = 8;
                xlSheet.Columns('L').ColumnWidth = 8;
                xlSheet.Columns('M').ColumnWidth = 8;
                xlSheet.Columns('N').ColumnWidth = 8;
                xlSheet.Columns('O').ColumnWidth = 8;

                xlSheet.Cells(2, 2).Value = 'RIEPILOGO MENSILE DEI DIPENDENTI';
                xlSheet.Cells(3, 1).Value = result.An;
                xlSheet.Cells(4, 2).Value = 'Gennaio';
                xlSheet.Cells(4, 3).Value = 'Febbraio';
                xlSheet.Cells(4, 4).Value = 'Marzo';
                xlSheet.Cells(4, 5).Value = 'Aprile';
                xlSheet.Cells(4, 6).Value = 'Maggio';
                xlSheet.Cells(4, 7).Value = 'Giugno';
                xlSheet.Cells(4, 8).Value = 'Luglio';
                xlSheet.Cells(4, 9).Value = 'Agosto';
                xlSheet.Cells(4, 10).Value = 'Settembre';
                xlSheet.Cells(4, 11).Value = 'Ottobre';
                xlSheet.Cells(4, 12).Value = 'Novembre';
                xlSheet.Cells(4, 13).Value = 'Dicembre';
                xlSheet.Cells(4, 15).Value = 'MEDIA';
                var i = 0;
                for (var item in result.Tabela) {
                    if (result.Tabela[item].Departament === 'a tempo determinato') {
                        i = i + 2;
                        xlSheet.Cells(i + 5, 1).Value = 'di cui';
                        i++;
                    }
                    if (result.Tabela[item].Departament === 'TOTALE') {
                        xlSheet.Range('B' + (i + 5).toString() + ':M' + (i + 5).toString()).Interior.ColorIndex = 6;
                        xlSheet.Range('O' + (i + 5).toString()).Interior.ColorIndex = 6;
                        result.Tabela[item].Departament = '';
                    }
                    xlSheet.Cells(i + 5, 1).Value = result.Tabela[item].Departament;
                    xlSheet.Cells(i + 5, 2).Value = result.Tabela[item].Ianuarie;
                    xlSheet.Cells(i + 5, 3).Value = result.Tabela[item].Februarie;
                    xlSheet.Cells(i + 5, 4).Value = result.Tabela[item].Martie;
                    xlSheet.Cells(i + 5, 5).Value = result.Tabela[item].Aprilie;
                    xlSheet.Cells(i + 5, 6).Value = result.Tabela[item].Mai;
                    xlSheet.Cells(i + 5, 7).Value = result.Tabela[item].Iunie;
                    xlSheet.Cells(i + 5, 8).Value = result.Tabela[item].Iulie;
                    xlSheet.Cells(i + 5, 9).Value = result.Tabela[item].August;
                    xlSheet.Cells(i + 5, 10).Value = result.Tabela[item].Septembrie;
                    xlSheet.Cells(i + 5, 11).Value = result.Tabela[item].Octombrie;
                    xlSheet.Cells(i + 5, 12).Value = result.Tabela[item].Noiembrie;
                    xlSheet.Cells(i + 5, 13).Value = result.Tabela[item].Decembrie;
                    xlSheet.Cells(i + 5, 15).Value = result.Tabela[item].Medie;
                    i++;
                }
                xlSheet.Range('A1:O' + (i + 5).toString()).Font.Size = 12;
                xlSheet.Range('A1:O' + (i + 5).toString()).Font.Name = 'Calibri';
                xlSheet.Range('B4:O4').Font.Size = 8;
                if (i > 0) {
                    xlSheet.Range('A5:M' + (i - 1).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('O5:O' + (i - 1).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('B' + (i + 3).toString() + ':M' + (i + 4).toString()).Borders.LineStyle = 1;
                    xlSheet.Range('O' + (i + 3).toString() + ':O' + (i + 4).toString()).Borders.LineStyle = 1;
                }
                xlApp.Visible = true;
                break;
            }
        default:
            {
                window.alert('Serviciu inexistent!');
            }
    }
}
function AfisareAbsente(NumeTabela, Tabela) {

    var mytable = $get(NumeTabela);
    while (mytable.rows.length > 1) {
        mytable.deleteRow(1);
    }
    var i = 100;
    var numeClasa = '';
    for (var item in Tabela) {
        numeClasa = Tabela[item].NumeClasa;
        var newrow = mytable.insertRow(-1);
        newrow.id = i.toString();
        var newcell = newrow.insertCell(-1);
        if (Tabela[item].Departament !== '') {
            newcell.id = 'Departament_' + i.toString();
            newcell.rowSpan = 3;
            newcell.className = 'rSubSelectat smanji';
            newcell.innerHTML = Tabela[item].Departament;
            newcell.title = Tabela[item].Departament;
            //newrow = mytable.insertRow(-1);
            newcell = newrow.insertCell(-1);

            Tabela[item].Departament = '';
            i++;
        }

        newcell.id = 'Categorie_' + i.toString();
        
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Categorie;
        newcell.title = Tabela[item].Categorie;


        newcell = newrow.insertCell(-1);
        newcell.id = 'Ianuarie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Ianuarie;
        newcell.title = Tabela[item].Ianuarie;
        newcell = newrow.insertCell(-1);


        newcell.id = 'Februarie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Februarie;
        newcell.title = Tabela[item].Februarie;
        newcell = newrow.insertCell(-1);

        newcell.id = 'Martie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Martie;
        newcell.title = Tabela[item].Martie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Aprilie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Aprilie;
        newcell.title = Tabela[item].Aprilie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Mai_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Mai;
        newcell.title = Tabela[item].Mai;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Iunie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Iunie;
        newcell.title = Tabela[item].Iunie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Iulie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Iulie;
        newcell.title = Tabela[item].Iulie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'August_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].August;
        newcell.title = Tabela[item].August;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Septembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Septembrie;
        newcell.title = Tabela[item].Septembrie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Octombrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Octombrie;
        newcell.title = Tabela[item].Octombrie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Noiembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Noiembrie;
        newcell.title = Tabela[item].Noiembrie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Decembrie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Decembrie;
        newcell.title = Tabela[item].Decembrie;

        newcell = newrow.insertCell(-1);
        newcell.id = 'Medie_' + i.toString();
         
        newcell.className = numeClasa;
        newcell.innerHTML = Tabela[item].Medie;
        newcell.title = Tabela[item].Medie;
        i++;
    }

 
    newcell = newrow.insertCell(1);
    newcell.className = numeClasa;
    //newcell.colSpan = 2;
    //$(".rNeselectat").each(function () {
    //    var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    $(this).attr('title', title);
    //    $(this).html(html);
    //});
}

function sumTotale() {
    //Tess Totale Percent
    var tablePercent = $('#tAbsenteProcent');
    
    //$(".rNeselectat").each(function () {
    //    var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    $(this).attr('title', title);
    //    $(this).html(html);

    //    if ($(this).attr('title').length > 5) {
    //        var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //        var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //        $(this).attr('title', title);
    //        $(this).html(html);

    //        var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '');
    //        var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '');
    //        $(this).attr('title', title);
    //        $(this).html(html);
    //    } 
    //});

    $("#tAbsenteProcent .rSelectat").each(function () {
        var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        $(this).html(html);
    });
    

    var jan1tess = $("#Ianuarie_101").attr("title") || 0;
    var jan2tess = $("#Ianuarie_102").attr("title") || 0;
    var jan3tess = $("#Ianuarie_103").attr("title") || 0;
    var jan_tess_sum = parseFloat(jan1tess) + parseFloat(jan2tess) + parseFloat(jan3tess);

    var feb1tess = $("#Februarie_101").attr("title") || 0;
    var feb2tess = $("#Februarie_102").attr("title") || 0;
    var feb3tess = $("#Februarie_103").attr("title") || 0;
    var feb_tess_sum = parseFloat(feb1tess) + parseFloat(feb2tess) + parseFloat(feb3tess);

    var mar1tess = $("#Martie_101").attr("title") || 0;
    var mar2tess = $("#Martie_102").attr("title") || 0;
    var mar3tess = $("#Martie_103").attr("title") || 0;
    var mar_tess_sum = parseFloat(mar1tess) + parseFloat(mar2tess) + parseFloat(mar3tess);

    var apr1tess = $("#Aprilie_101").attr("title") || 0;
    var apr2tess = $("#Aprilie_102").attr("title") || 0;
    var apr3tess = $("#Aprilie_103").attr("title") || 0;
    var apr_tess_sum = parseFloat(apr1tess) + parseFloat(apr2tess) + parseFloat(apr3tess);

    var may1tess = $("#Mai_101").attr("title") || 0;
    var may2tess = $("#Mai_102").attr("title") || 0;
    var may3tess = $("#Mai_103").attr("title") || 0;
    var may_tess_sum = parseFloat(may1tess) + parseFloat(may2tess) + parseFloat(may3tess);

    var jun1tess = $("#Iunie_101").attr("title") || 0;
    var jun2tess = $("#Iunie_102").attr("title") || 0;
    var jun3tess = $("#Iunie_103").attr("title") || 0;
    var jun_tess_sum = parseFloat(jun1tess) + parseFloat(jun2tess) + parseFloat(jun3tess);

    var july1tess = $("#Iulie_101").attr("title") || 0;
    var july2tess = $("#Iulie_102").attr("title") || 0;
    var july3tess = $("#Iulie_103").attr("title") || 0;
    var july_tess_sum = parseFloat(july1tess) + parseFloat(july2tess) + parseFloat(july3tess);

    var avg1tess = $("#August_101").attr("title") || 0;
    var avg2tess = $("#August_102").attr("title") || 0;
    var avg3tess = $("#August_103").attr("title") || 0;
    var avg_tess_sum = parseFloat(avg1tess) + parseFloat(avg2tess) + parseFloat(avg3tess);

    var sep1tess = $("#Septembrie_101").attr("title") || 0;
    var sep2tess = $("#Septembrie_102").attr("title") || 0;
    var sep3tess = $("#Septembrie_103").attr("title") || 0;
    var sep_tess_sum = parseFloat(sep1tess) + parseFloat(sep2tess) + parseFloat(sep3tess);

    var oct1tess = $("#Octombrie_101").attr("title") || 0;
    var oct2tess = $("#Octombrie_102").attr("title") || 0;
    var oct3tess = $("#Octombrie_103").attr("title") || 0;
    var oct_tess_sum = parseFloat(oct1tess) + parseFloat(oct2tess) + parseFloat(oct3tess);

    var nov1tess = $("#Noiembrie_101").attr("title") || 0;
    var nov2tess = $("#Noiembrie_102").attr("title") || 0;
    var nov3tess = $("#Noiembrie_103").attr("title") || 0;
    var nov_tess_sum = parseFloat(nov1tess) + parseFloat(nov2tess) + parseFloat(nov3tess);

    var dec1tess = $("#Decembrie_101").attr("title") || 0;
    var dec2tess = $("#Decembrie_102").attr("title") || 0;
    var dec3tess = $("#Decembrie_103").attr("title") || 0;
    var dec_tess_sum = parseFloat(dec1tess) + parseFloat(dec2tess) + parseFloat(dec3tess);

    var tess_assenza = $('#Medie_101').attr("title") || 0;
    var tess_infortuni = $('#Medie_102').attr("title") || 0;
    var tess_malatia = $('#Medie_103').attr("title") || 0;
    var tess_tot = parseFloat(tess_assenza) + parseFloat(tess_infortuni) + parseFloat(tess_malatia);

    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_tess"></td>';
    cols += '<td class="td_tess">TOTALE</td>';
    cols += '<td class="td_tess jan_tess">' + jan_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess feb_tess">' + feb_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess mar_tess">' + mar_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess apr_tess">' + apr_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess may_tess">' + may_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess jun_tess">' + jun_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess jul_tess">' + july_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess avg_tess">' + avg_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess sep_tess">' + sep_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess oct_tess">' + oct_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess nov_tess">' + nov_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess dec_tess">' + dec_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess tot_tess">' + tess_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tablePercent.find(".rSubSelectat[title~='TESSITURA']").parent());







    //CONFEZIONE A 
    var jan1confa = $("#Ianuarie_105").attr("title") || 0;
    var jan2confa = $("#Ianuarie_106").attr("title") || 0;
    var jan3confa = $("#Ianuarie_107").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("#Februarie_105").attr("title") || 0;
    var feb2confa = $("#Februarie_106").attr("title") || 0;
    var feb3confa = $("#Februarie_107").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("#Martie_105").attr("title") || 0;
    var mar2confa = $("#Martie_106").attr("title") || 0;
    var mar3confa = $("#Martie_107").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("#Aprilie_105").attr("title") || 0;
    var apr2confa = $("#Aprilie_106").attr("title") || 0;
    var apr3confa = $("#Aprilie_107").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("#Mai_105").attr("title") || 0;
    var may2confa = $("#Mai_106").attr("title") || 0;
    var may3confa = $("#Mai_107").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("#Iunie_105").attr("title") || 0;
    var jun2confa = $("#Iunie_106").attr("title") || 0;
    var jun3confa = $("#Iunie_107").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("#Iulie_105").attr("title") || 0;
    var july2confa = $("#Iulie_106").attr("title") || 0;
    var july3confa = $("#Iulie_107").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("#August_105").attr("title") || 0;
    var avg2confa = $("#August_106").attr("title") || 0;
    var avg3confa = $("#August_107").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("#Septembrie_105").attr("title") || 0;
    var sep2confa = $("#Septembrie_106").attr("title") || 0;
    var sep3confa = $("#Septembrie_107").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("#Octombrie_105").attr("title") || 0;
    var oct2confa = $("#Octombrie_106").attr("title") || 0;
    var oct3confa = $("#Octombrie_107").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("#Noiembrie_105").attr("title") || 0;
    var nov2confa = $("#Noiembrie_106").attr("title") || 0;
    var nov3confa = $("#Noiembrie_107").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("#Decembrie_105").attr("title") || 0;
    var dec2confa = $("#Decembrie_106").attr("title") || 0;
    var dec3confa = $("#Decembrie_107").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var confa_assenza = $('#Medie_105').attr("title") || 0;
    var confa_infortuni = $('#Medie_106').attr("title") || 0;
    var confa_malatia = $('#Medie_107').attr("title") || 0;
    var confa_tot = parseFloat(confa_assenza) + parseFloat(confa_infortuni) + parseFloat(confa_malatia); 
    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_conf"></td>';
    cols += '<td class="td_conf">TOTALE</td>';
    cols += '<td class="td_conf jan_confa">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf feb_confa">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf mar_confa">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf apr_confa">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf may_confa">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jun_confa">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jul_confa">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf avg_confa">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf sep_confa">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf oct_confa">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf nov_confa">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf dec_confa">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf tot_confa">' + confa_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tablePercent.find(".rSubSelectat[title='CONFEZIONE A']").parent());



    //CONFEZIONE B
    var jan1confa = $("#Ianuarie_109").attr("title") || 0;
    var jan2confa = $("#Ianuarie_110").attr("title") || 0;
    var jan3confa = $("#Ianuarie_111").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("#Februarie_109").attr("title") || 0;
    var feb2confa = $("#Februarie_110").attr("title") || 0;
    var feb3confa = $("#Februarie_111").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("#Martie_109").attr("title") || 0;
    var mar2confa = $("#Martie_110").attr("title") || 0;
    var mar3confa = $("#Martie_111").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("#Aprilie_109").attr("title") || 0;
    var apr2confa = $("#Aprilie_110").attr("title") || 0;
    var apr3confa = $("#Aprilie_111").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("#Mai_109").attr("title") || 0;
    var may2confa = $("#Mai_110").attr("title") || 0;
    var may3confa = $("#Mai_111").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("#Iunie_109").attr("title") || 0;
    var jun2confa = $("#Iunie_110").attr("title") || 0;
    var jun3confa = $("#Iunie_111").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("#Iulie_109").attr("title") || 0;
    var july2confa = $("#Iulie_110").attr("title") || 0;
    var july3confa = $("#Iulie_111").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("#August_109").attr("title") || 0;
    var avg2confa = $("#August_110").attr("title") || 0;
    var avg3confa = $("#August_111").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("#Septembrie_109").attr("title") || 0;
    var sep2confa = $("#Septembrie_110").attr("title") || 0;
    var sep3confa = $("#Septembrie_111").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("#Octombrie_109").attr("title") || 0;
    var oct2confa = $("#Octombrie_110").attr("title") || 0;
    var oct3confa = $("#Octombrie_111").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("#Noiembrie_109").attr("title") || 0;
    var nov2confa = $("#Noiembrie_110").attr("title") || 0;
    var nov3confa = $("#Noiembrie_111").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("#Decembrie_109").attr("title") || 0;
    var dec2confa = $("#Decembrie_110").attr("title") || 0;
    var dec3confa = $("#Decembrie_111").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var confb_assenza = $('#Medie_109').attr("title") || 0;
    var confb_infortuni = $('#Medie_110').attr("title") || 0;
    var confb_malatia = $('#Medie_111').attr("title") || 0;
    var confb_tot = parseFloat(confb_assenza) + parseFloat(confb_infortuni) + parseFloat(confb_malatia);


    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_conf"></td>';
    cols += '<td class="td_conf">TOTALE</td>';
    cols += '<td class="td_conf jan_confb">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf feb_confb">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf mar_confb">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf apr_confb">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf may_confb">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jun_confb">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jul_confb">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf avg_confb">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf sep_confb">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf oct_confb">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf nov_confb">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf dec_confb">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf tot_confb">' + confb_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tablePercent.find(".rSubSelectat[title='CONFEZIONE B']").parent());





    //STIRO
    var jan1confa = $("#Ianuarie_113").attr("title") || 0;
    var jan2confa = $("#Ianuarie_114").attr("title") || 0;
    var jan3confa = $("#Ianuarie_115").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("#Februarie_113").attr("title") || 0;
    var feb2confa = $("#Februarie_114").attr("title") || 0;
    var feb3confa = $("#Februarie_115").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("#Martie_113").attr("title") || 0;
    var mar2confa = $("#Martie_114").attr("title") || 0;
    var mar3confa = $("#Martie_115").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("#Aprilie_113").attr("title") || 0;
    var apr2confa = $("#Aprilie_114").attr("title") || 0;
    var apr3confa = $("#Aprilie_115").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("#Mai_113").attr("title") || 0;
    var may2confa = $("#Mai_114").attr("title") || 0;
    var may3confa = $("#Mai_115").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("#Iunie_113").attr("title") || 0;
    var jun2confa = $("#Iunie_114").attr("title") || 0;
    var jun3confa = $("#Iunie_115").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("#Iulie_113").attr("title") || 0;
    var july2confa = $("#Iulie_114").attr("title") || 0;
    var july3confa = $("#Iulie_115").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("#August_113").attr("title") || 0;
    var avg2confa = $("#August_114").attr("title") || 0;
    var avg3confa = $("#August_115").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("#Septembrie_113").attr("title") || 0;
    var sep2confa = $("#Septembrie_114").attr("title") || 0;
    var sep3confa = $("#Septembrie_115").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("#Octombrie_113").attr("title") || 0;
    var oct2confa = $("#Octombrie_114").attr("title") || 0;
    var oct3confa = $("#Octombrie_115").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("#Noiembrie_113").attr("title") || 0;
    var nov2confa = $("#Noiembrie_114").attr("title") || 0;
    var nov3confa = $("#Noiembrie_115").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("#Decembrie_113").attr("title") || 0;
    var dec2confa = $("#Decembrie_114").attr("title") || 0;
    var dec3confa = $("#Decembrie_115").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var stiro_assenza = $('#Medie_113').attr("title") || 0;
    var stiro_infortuni = $('#Medie_114').attr("title") || 0;
    var stiro_malatia = $('#Medie_115').attr("title") || 0;
    var stiro_tot = parseFloat(stiro_assenza) + parseFloat(stiro_infortuni) + parseFloat(stiro_malatia);



    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_stiro"></td>';
    cols += '<td class="td_stiro">TOTALE</td>';
    cols += '<td class="td_stiro jan_stiro">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro feb_stiro">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro mar_stiro">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro apr_stiro">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro may_stiro">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro jun_stiro">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro jul_stiro">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro avg_stiro">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro sep_stiro">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro oct_stiro">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro nov_stiro">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro dec_stiro">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro tot_stiro">' + stiro_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tablePercent.find(".rSubSelectat[title~='STIRO']").parent());


    //AMMINISTRAZIONE
    var jan1confa = $("#Ianuarie_117").attr("title") || 0;
    var jan2confa = $("#Ianuarie_118").attr("title") || 0;
    var jan3confa = $("#Ianuarie_119").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("#Februarie_117").attr("title") || 0;
    var feb2confa = $("#Februarie_118").attr("title") || 0;
    var feb3confa = $("#Februarie_119").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("#Martie_117").attr("title") || 0;
    var mar2confa = $("#Martie_118").attr("title") || 0;
    var mar3confa = $("#Martie_119").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("#Aprilie_117").attr("title") || 0;
    var apr2confa = $("#Aprilie_118").attr("title") || 0;
    var apr3confa = $("#Aprilie_119").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("#Mai_117").attr("title") || 0;
    var may2confa = $("#Mai_118").attr("title") || 0;
    var may3confa = $("#Mai_119").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("#Iunie_117").attr("title") || 0;
    var jun2confa = $("#Iunie_118").attr("title") || 0;
    var jun3confa = $("#Iunie_119").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("#Iulie_117").attr("title") || 0;
    var july2confa = $("#Iulie_118").attr("title") || 0;
    var july3confa = $("#Iulie_119").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("#August_117").attr("title") || 0;
    var avg2confa = $("#August_118").attr("title") || 0;
    var avg3confa = $("#August_119").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("#Septembrie_117").attr("title") || 0;
    var sep2confa = $("#Septembrie_118").attr("title") || 0;
    var sep3confa = $("#Septembrie_119").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("#Octombrie_117").attr("title") || 0;
    var oct2confa = $("#Octombrie_118").attr("title") || 0;
    var oct3confa = $("#Octombrie_119").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("#Noiembrie_117").attr("title") || 0;
    var nov2confa = $("#Noiembrie_118").attr("title") || 0;
    var nov3confa = $("#Noiembrie_119").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("#Decembrie_117").attr("title") || 0;
    var dec2confa = $("#Decembrie_118").attr("title") || 0;
    var dec3confa = $("#Decembrie_119").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var admin_assenza = $('#Medie_117').attr("title") || 0;
    var admin_infortuni = $('#Medie_118').attr("title") || 0;
    var admin_malatia = $('#Medie_119').attr("title") || 0;
    var admin_tot = parseFloat(admin_assenza) + parseFloat(admin_infortuni) + parseFloat(admin_malatia); 

    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_amministrazione"></td>';
    cols += '<td class="td_amministrazione">TOTALE</td>';
    cols += '<td class="td_amministrazione jan_ammin">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione feb_ammin">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione mar_ammin">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione apr_ammin">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione may_ammin">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione jun_ammin">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione jul_ammin">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione avg_ammin">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione sep_ammin">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione oct_ammin">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione nov_ammin">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione dec_ammin">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione tot_ammin">' + admin_tot.toFixed(1) + '</td>';
    newRow.append(cols);
    newRow.insertBefore(tablePercent.find(".rSubSelectat[title~='AMMINISTRAZIONE']").parent());

    //DRAW CHARTS
    drawChartsDefaultPercentuale();

    $('#tAbsenteProcent').find('td').each(function () {
        if ($.isNumeric($(this).text())) {
            $(this).append('%');
        }
    });  


}

//DEFAULT PERCENTAGE CHARTS
function drawChartsDefaultPercentuale() {
    var barData = google.visualization.arrayToDataTable([
        ['Luna', 'TESSITURA', 'CONFEZIONE A', 'CONFEZIONE B', 'STIRO', 'AMMINISTRAZIONE'],
        ['Gennaio', parseInt($('.jan_tess').text()) || 0, parseInt($('.jan_confa').text()) || 0, parseInt($('.jan_confb').text()) || 0, parseInt($('.jan_stiro').text()) || 0, parseInt($('.jan_ammin').text()) || 0],
        ['Febbraio', parseInt($('.feb_tess').text()) || 0, parseInt($('.feb_confa').text()) || 0, parseInt($('.feb_confb').text()) || 0, parseInt($('.feb_stiro').text()) || 0, parseInt($('.feb_ammin').text()) || 0],
        ['Marzo', parseInt($('.mar_tess').text()) || 0, parseInt($('.mar_confa').text()) || 0, parseInt($('.mar_confb').text()) || 0, parseInt($('.mar_stiro').text()) || 0, parseInt($('.mar_ammin').text()) || 0],
        ['Aprile', parseInt($('.apr_tess').text()) || 0, parseInt($('.apr_confa').text()) || 0, parseInt($('.apr_confb').text()) || 0, parseInt($('.apr_stiro').text()) || 0, parseInt($('.apr_ammin').text()) || 0],
        ['Maggio', parseInt($('.may_tess').text()) || 0, parseInt($('.may_confa').text()) || 0, parseInt($('.may_confb').text()) || 0, parseInt($('.may_stiro').text()) || 0, parseInt($('.may_ammin').text()) || 0],
        ['Giugno', parseInt($('.jun_tess').text()) || 0, parseInt($('.jun_confa').text()) || 0, parseInt($('.jun_confb').text()) || 0, parseInt($('.jun_stiro').text()) || 0, parseInt($('.jun_ammin').text()) || 0],
        ['Luglio', parseInt($('.jul_tess').text()) || 0, parseInt($('.jul_confa').text()) || 0, parseInt($('.jul_confb').text()) || 0, parseInt($('.jul_stiro').text()) || 0, parseInt($('.jul_ammin').text()) || 0],
        ['Agosto', parseInt($('.avg_tess').text()) || 0, parseInt($('.avg_confa').text()) || 0, parseInt($('.avg_confb').text()) || 0, parseInt($('.avg_stiro').text()) || 0, parseInt($('.avg_ammin').text()) || 0],
        ['Settembre', parseInt($('.sep_tess').text()) || 0, parseInt($('.sep_confa').text()) || 0, parseInt($('.sep_confb').text()) || 0, parseInt($('.sep_stiro').text()) || 0, parseInt($('.sep_ammin').text()) || 0],
        ['Ottobre', parseInt($('.oct_tess').text()) || 0, parseInt($('.oct_confa').text()) || 0, parseInt($('.oct_confb').text()) || 0, parseInt($('.oct_stiro').text()) || 0, parseInt($('.oct_ammin').text()) || 0],
        ['Novembre', parseInt($('.nov_tess').text()) || 0, parseInt($('.nov_confa').text()) || 0, parseInt($('.nov_confb').text()) || 0, parseInt($('.nov_stiro').text()) || 0, parseInt($('.nov_ammin').text()) || 0],
        ['Dicembre', parseInt($('.dec_tess').text()) || 0, parseInt($('.dec_confa').text()) || 0, parseInt($('.dec_confb').text()) || 0, parseInt($('.dec_stiro').text()) || 0, parseInt($('.dec_ammin').text()) || 0]
    ]);
    // set bar chart options
    var barOptions = {
        pointsVisible: true,
        tooltip: { isHtml: true },
        focusTarget: 'category',
        backgroundColor: 'transparent',
        colors: ['#98604c', '#f32828', '#af1d1d', '#259f11', '#8bc34a'],
        fontName: 'Open Sans',
        chartArea: {
            left: 50,
            top: 10,
            width: '100%',
            height: '70%'
        },
        bar: {
            groupWidth: '80%'
        },
        hAxis: {
            textStyle: {
                fontSize: 11
            }
        },
        vAxis: {
            minValue: 0,
            maxValue: 0,
            baselineColor: '#DDD',
            gridlines: {
                color: '#DDD',
                count: 4
            },
            textStyle: {
                fontSize: 11
            }
        },
        legend: {
            position: 'bottom',
            textStyle: {
                fontSize: 12
            }
        },
        animation: {
            duration: 1200,
            easing: 'out',
            startup: true
        }
    };
    // draw bar chart twice so it animates
    var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
    barChart.draw(barData, barOptions);
}

//DEFAULT ORE CHARTS
function drawChartsDefaultOre() {
    var barData = google.visualization.arrayToDataTable([
        ['Luna', 'TESSITURA', 'CONFEZIONE A', 'CONFEZIONE B', 'STIRO', 'AMMINISTRAZIONE'],
        ['Gennaio',   parseInt($('.jan_tessOre').text()) || 0, parseInt($('.jan_confaOre').text()) || 0, parseInt($('.jan_confbOre').text()) || 0, parseInt($('.jan_stiroOre').text()) || 0, parseInt($('.jan_amminOre').text()) || 0],
        ['Febbraio',  parseInt($('.feb_tessOre').text()) || 0, parseInt($('.feb_confaOre').text()) || 0, parseInt($('.feb_confbOre').text()) || 0, parseInt($('.feb_stiroOre').text()) || 0, parseInt($('.feb_amminOre').text()) || 0],
        ['Marzo',     parseInt($('.mar_tessOre').text()) || 0, parseInt($('.mar_confaOre').text()) || 0, parseInt($('.mar_confbOre').text()) || 0, parseInt($('.mar_stiroOre').text()) || 0, parseInt($('.mar_amminOre').text()) || 0],
        ['Aprile',    parseInt($('.apr_tessOre').text()) || 0, parseInt($('.apr_confaOre').text()) || 0, parseInt($('.apr_confbOre').text()) || 0, parseInt($('.apr_stiroOre').text()) || 0, parseInt($('.apr_amminOre').text()) || 0],
        ['Maggio',    parseInt($('.may_tessOre').text()) || 0, parseInt($('.may_confaOre').text()) || 0, parseInt($('.may_confbOre').text()) || 0, parseInt($('.may_stiroOre').text()) || 0, parseInt($('.may_amminOre').text()) || 0],
        ['Giugno',    parseInt($('.jun_tessOre').text()) || 0, parseInt($('.jun_confaOre').text()) || 0, parseInt($('.jun_confbOre').text()) || 0, parseInt($('.jun_stiroOre').text()) || 0, parseInt($('.jun_amminOre').text()) || 0],
        ['Luglio',    parseInt($('.jul_tessOre').text()) || 0, parseInt($('.jul_confaOre').text()) || 0, parseInt($('.jul_confbOre').text()) || 0, parseInt($('.jul_stiroOre').text()) || 0, parseInt($('.jul_amminOre').text()) || 0],
        ['Agosto',    parseInt($('.avg_tessOre').text()) || 0, parseInt($('.avg_confaOre').text()) || 0, parseInt($('.avg_confbOre').text()) || 0, parseInt($('.avg_stiroOre').text()) || 0, parseInt($('.avg_amminOre').text()) || 0],
        ['Settembre', parseInt($('.sep_tessOre').text()) || 0, parseInt($('.sep_confaOre').text()) || 0, parseInt($('.sep_confbOre').text()) || 0, parseInt($('.sep_stiroOre').text()) || 0, parseInt($('.sep_amminOre').text()) || 0],
        ['Ottobre',   parseInt($('.oct_tessOre').text()) || 0, parseInt($('.oct_confaOre').text()) || 0, parseInt($('.oct_confbOre').text()) || 0, parseInt($('.oct_stiroOre').text()) || 0, parseInt($('.oct_amminOre').text()) || 0],
        ['Novembre',  parseInt($('.nov_tessOre').text()) || 0, parseInt($('.nov_confaOre').text()) || 0, parseInt($('.nov_confbOre').text()) || 0, parseInt($('.nov_stiroOre').text()) || 0, parseInt($('.nov_amminOre').text()) || 0],
        ['Dicembre',  parseInt($('.dec_tessOre').text()) || 0, parseInt($('.dec_confaOre').text()) || 0, parseInt($('.dec_confbOre').text()) || 0, parseInt($('.dec_stiroOre').text()) || 0, parseInt($('.dec_amminOre').text()) || 0]
    ]);
    // set bar chart options
    var barOptions = {
        pointsVisible: true,
        tooltip: { isHtml: true },
        focusTarget: 'category',
        backgroundColor: 'transparent',
        colors: ['#98604c', '#f32828', '#af1d1d', '#259f11', '#8bc34a'],
        fontName: 'Open Sans',
        chartArea: {
            left: 50,
            top: 10,
            width: '100%',
            height: '70%'
        },
        bar: {
            groupWidth: '80%'
        },
        hAxis: {
            textStyle: {
                fontSize: 11
            }
        },
        vAxis: {
            minValue: 0,
            maxValue: 0,
            baselineColor: '#DDD',
            gridlines: {
                color: '#DDD',
                count: 4
            },
            textStyle: {
                fontSize: 11
            }
        },
        legend: {
            position: 'bottom',
            textStyle: {
                fontSize: 12
            }
        },
        animation: {
            duration: 1200,
            easing: 'out',
            startup: true
        }
    };
    // draw bar chart twice so it animates
    var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
    barChart.draw(barData, barOptions);
}

function sumTotaleOre() {
    //$("#tAbsenteOre .rNeselectat").each(function () {
    //    var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
    //    $(this).attr('title', title);
    //    $(this).html(html);
    //});

    $("#tAbsenteOre .rNeselectat").each(function () {
        //var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        //var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
        //$(this).attr('title', title);
        //$(this).html(html);

        if ($(this).attr('title').length > 5) {
        

            var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '');
            var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '');
            $(this).attr('title', title);
            $(this).html(html);

            var title = $(this).attr('title').replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
            var html = $(this).html().replace(/,/g, 'abc').replace(/\./g, ',').replace(/abc/g, '.');
            $(this).attr('title', title);
            $(this).html(html);
        }
    });

    //Tess Totale Ore
    var tableOre = $('#tAbsenteOre');
    //var parseDecimalPoint = Number.parseFloat;
    //parseDecimalComma = str => Number.parseFloat(str.replace('.', '').replace(',', '.'))

    var jan1tess = $("table#tAbsenteOre tbody tr td#Ianuarie_101").attr("title") || 0;
    var jan2tess = $("table#tAbsenteOre tbody tr td#Ianuarie_102").attr("title") || 0;
    var jan3tess = $("table#tAbsenteOre tbody tr td#Ianuarie_103").attr("title") || 0;
    var jan_tess_sum = parseFloat(jan1tess) + parseFloat(jan2tess) + parseFloat(jan3tess);


    var feb1tess = $("table#tAbsenteOre tbody tr td#Februarie_101").attr("title") || 0;
    var feb2tess = $("table#tAbsenteOre tbody tr td#Februarie_102").attr("title") || 0;
    var feb3tess = $("table#tAbsenteOre tbody tr td#Februarie_103").attr("title") || 0;
    var feb_tess_sum = parseFloat(feb1tess) + parseFloat(feb2tess) + parseFloat(feb3tess);

    var mar1tess = $("table#tAbsenteOre tbody tr td#Martie_101").attr("title") || 0;
    var mar2tess = $("table#tAbsenteOre tbody tr td#Martie_102").attr("title") || 0;
    var mar3tess = $("table#tAbsenteOre tbody tr td#Martie_103").attr("title") || 0;
    var mar_tess_sum = parseFloat(mar1tess) + parseFloat(mar2tess) + parseFloat(mar3tess);

    var apr1tess = $("table#tAbsenteOre tbody tr td#Aprilie_101").attr("title") || 0;
    var apr2tess = $("table#tAbsenteOre tbody tr td#Aprilie_102").attr("title") || 0;
    var apr3tess = $("table#tAbsenteOre tbody tr td#Aprilie_103").attr("title") || 0;
    var apr_tess_sum = parseFloat(apr1tess) + parseFloat(apr2tess) + parseFloat(apr3tess);

    var may1tess = $("table#tAbsenteOre tbody tr td#Mai_101").attr("title") || 0;
    var may2tess = $("table#tAbsenteOre tbody tr td#Mai_102").attr("title") || 0;
    var may3tess = $("table#tAbsenteOre tbody tr td#Mai_103").attr("title") || 0;
    var may_tess_sum = parseFloat(may1tess) + parseFloat(may2tess) + parseFloat(may3tess);

    var jun1tess = $("table#tAbsenteOre tbody tr td#Iunie_101").attr("title") || 0;
    var jun2tess = $("table#tAbsenteOre tbody tr td#Iunie_102").attr("title") || 0;
    var jun3tess = $("table#tAbsenteOre tbody tr td#Iunie_103").attr("title") || 0;
    var jun_tess_sum = parseFloat(jun1tess) + parseFloat(jun2tess) + parseFloat(jun3tess);

    var july1tess = $("table#tAbsenteOre tbody tr td#Iulie_101").attr("title") || 0;
    var july2tess = $("table#tAbsenteOre tbody tr td#Iulie_102").attr("title") || 0;
    var july3tess = $("table#tAbsenteOre tbody tr td#Iulie_103").attr("title") || 0;
    var july_tess_sum = parseFloat(july1tess) + parseFloat(july2tess) + parseFloat(july3tess);

    var avg1tess = $("table#tAbsenteOre tbody tr td#August_101").attr("title") || 0;
    var avg2tess = $("table#tAbsenteOre tbody tr td#August_102").attr("title") || 0;
    var avg3tess = $("table#tAbsenteOre tbody tr td#August_103").attr("title") || 0;
    var avg_tess_sum = parseFloat(avg1tess) + parseFloat(avg2tess) + parseFloat(avg3tess);

    var sep1tess = $("table#tAbsenteOre tbody tr td#Septembrie_101").attr("title") || 0;
    var sep2tess = $("table#tAbsenteOre tbody tr td#Septembrie_102").attr("title") || 0;
    var sep3tess = $("table#tAbsenteOre tbody tr td#Septembrie_103").attr("title") || 0;
    var sep_tess_sum = parseFloat(sep1tess) + parseFloat(sep2tess) + parseFloat(sep3tess);

    var oct1tess = $("table#tAbsenteOre tbody tr td#Octombrie_101").attr("title") || 0;
    var oct2tess = $("table#tAbsenteOre tbody tr td#Octombrie_102").attr("title") || 0;
    var oct3tess = $("table#tAbsenteOre tbody tr td#Octombrie_103").attr("title") || 0;
    var oct_tess_sum = parseFloat(oct1tess) + parseFloat(oct2tess) + parseFloat(oct3tess);

    var nov1tess = $("table#tAbsenteOre tbody tr td#Noiembrie_101").attr("title") || 0;
    var nov2tess = $("table#tAbsenteOre tbody tr td#Noiembrie_102").attr("title") || 0;
    var nov3tess = $("table#tAbsenteOre tbody tr td#Noiembrie_103").attr("title") || 0;
    var nov_tess_sum = parseFloat(nov1tess) + parseFloat(nov2tess) + parseFloat(nov3tess);

    var dec1tess = $("table#tAbsenteOre tbody tr td#Decembrie_101").attr("title") || 0;
    var dec2tess = $("table#tAbsenteOre tbody tr td#Decembrie_102").attr("title") || 0;
    var dec3tess = $("table#tAbsenteOre tbody tr td#Decembrie_103").attr("title") || 0;
    var dec_tess_sum = parseFloat(dec1tess) + parseFloat(dec2tess) + parseFloat(dec3tess);

    var tess_assenza = $('table#tAbsenteOre  tbody tr td#Medie_101').attr("title") || 0;
    var tess_infortuni = $('table#tAbsenteOre  tbody tr td#Medie_102').attr("title") || 0;
    var tess_malatia = $('table#tAbsenteOre  tbody tr td#Medie_103').attr("title") || 0;
    var all_tess_sum = parseFloat(tess_assenza) + parseFloat(tess_infortuni) + parseFloat(tess_malatia);

    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_tess"></td>';
    cols += '<td class="td_tess">TOTALE</td>';
    cols += '<td class="td_tess jan_tessOre">' + jan_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess feb_tessOre">' + feb_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess mar_tessOre">' + mar_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess apr_tessOre">' + apr_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess may_tessOre">' + may_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess jun_tessOre">' + jun_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess jul_tessOre">' + july_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess avg_tessOre">' + avg_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess sep_tessOre">' + sep_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess oct_tessOre">' + oct_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess nov_tessOre">' + nov_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess dec_tessOre">' + dec_tess_sum.toFixed(1) + '</td>';
    cols += '<td class="td_tess tot_tessOre" id="tess_sum_tot">' + all_tess_sum.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tableOre.find(".rSubSelectat[title~='TESSITURA']").parent());





    //CONFEZIONE A 
    var jan1confa = $("table#tAbsenteOre tbody tr td#Ianuarie_105").attr("title") || 0;
    var jan2confa = $("table#tAbsenteOre tbody tr td#Ianuarie_106").attr("title") || 0;
    var jan3confa = $("table#tAbsenteOre tbody tr td#Ianuarie_107").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("table#tAbsenteOre tbody tr td#Februarie_105").attr("title") || 0;
    var feb2confa = $("table#tAbsenteOre tbody tr td#Februarie_106").attr("title") || 0;
    var feb3confa = $("table#tAbsenteOre tbody tr td#Februarie_107").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("table#tAbsenteOre tbody tr td#Martie_105").attr("title") || 0;
    var mar2confa = $("table#tAbsenteOre tbody tr td#Martie_106").attr("title") || 0;
    var mar3confa = $("table#tAbsenteOre tbody tr td#Martie_107").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("table#tAbsenteOre tbody tr td#Aprilie_105").attr("title") || 0;
    var apr2confa = $("table#tAbsenteOre tbody tr td#Aprilie_106").attr("title") || 0;
    var apr3confa = $("table#tAbsenteOre tbody tr td#Aprilie_107").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("table#tAbsenteOre tbody tr td#Mai_105").attr("title") || 0;
    var may2confa = $("table#tAbsenteOre tbody tr td#Mai_106").attr("title") || 0;
    var may3confa = $("table#tAbsenteOre tbody tr td#Mai_107").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("table#tAbsenteOre tbody tr td#Iunie_105").attr("title") || 0;
    var jun2confa = $("table#tAbsenteOre tbody tr td#Iunie_106").attr("title") || 0;
    var jun3confa = $("table#tAbsenteOre tbody tr td#Iunie_107").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("table#tAbsenteOre tbody tr td#Iulie_105").attr("title") || 0;
    var july2confa = $("table#tAbsenteOre tbody tr td#Iulie_106").attr("title") || 0;
    var july3confa = $("table#tAbsenteOre tbody tr td#Iulie_107").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("table#tAbsenteOre tbody tr td#August_105").attr("title") || 0;
    var avg2confa = $("table#tAbsenteOre tbody tr td#August_106").attr("title") || 0;
    var avg3confa = $("table#tAbsenteOre tbody tr td#August_107").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("table#tAbsenteOre tbody tr td#Septembrie_105").attr("title") || 0;
    var sep2confa = $("table#tAbsenteOre tbody tr td#Septembrie_106").attr("title") || 0;
    var sep3confa = $("table#tAbsenteOre tbody tr td#Septembrie_107").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("table#tAbsenteOre tbody tr td#Octombrie_105").attr("title") || 0;
    var oct2confa = $("table#tAbsenteOre tbody tr td#Octombrie_106").attr("title") || 0;
    var oct3confa = $("table#tAbsenteOre tbody tr td#Octombrie_107").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("table#tAbsenteOre tbody tr td#Noiembrie_105").attr("title") || 0;
    var nov2confa = $("table#tAbsenteOre tbody tr td#Noiembrie_106").attr("title") || 0;
    var nov3confa = $("table#tAbsenteOre tbody tr td#Noiembrie_107").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("table#tAbsenteOre tbody tr td#Decembrie_105").attr("title") || 0;
    var dec2confa = $("table#tAbsenteOre tbody tr td#Decembrie_106").attr("title") || 0;
    var dec3confa = $("table#tAbsenteOre tbody tr td#Decembrie_107").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var confa_assenza = $('table#tAbsenteOre  tbody tr td#Medie_105').attr("title") || 0;
    var confa_infortuni = $('table#tAbsenteOre  tbody tr td#Medie_106').attr("title") || 0;
    var confa_malatia = $('table#tAbsenteOre  tbody tr td#Medie_107').attr("title") || 0;
    var confa_tot = parseFloat(confa_assenza) + parseFloat(confa_infortuni) + parseFloat(confa_malatia);



    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_conf"></td>';
    cols += '<td class="td_conf">TOTALE</td>';
    cols += '<td class="td_conf jan_confaOre">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf feb_confaOre">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf mar_confaOre">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf apr_confaOre">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf may_confaOre">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jun_confaOre">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jul_confaOre">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf avg_confaOre">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf sep_confaOre">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf oct_confaOre">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf nov_confaOre">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf dec_confaOre">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf tot_confaOre"  id="confa_sum_tot">' + confa_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tableOre.find(".rSubSelectat[title='CONFEZIONE A']").parent());



    //CONFEZIONE B
    var jan1confa = $("table#tAbsenteOre tbody tr td#Ianuarie_109").attr("title") || 0;
    var jan2confa = $("table#tAbsenteOre tbody tr td#Ianuarie_110").attr("title") || 0;
    var jan3confa = $("table#tAbsenteOre tbody tr td#Ianuarie_111").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("table#tAbsenteOre tbody tr td#Februarie_109").attr("title") || 0;
    var feb2confa = $("table#tAbsenteOre tbody tr td#Februarie_110").attr("title") || 0;
    var feb3confa = $("table#tAbsenteOre tbody tr td#Februarie_111").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("table#tAbsenteOre tbody tr td#Martie_109").attr("title") || 0;
    var mar2confa = $("table#tAbsenteOre tbody tr td#Martie_110").attr("title") || 0;
    var mar3confa = $("table#tAbsenteOre tbody tr td#Martie_111").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("table#tAbsenteOre tbody tr td#Aprilie_109").attr("title") || 0;
    var apr2confa = $("table#tAbsenteOre tbody tr td#Aprilie_110").attr("title") || 0;
    var apr3confa = $("table#tAbsenteOre tbody tr td#Aprilie_111").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("table#tAbsenteOre tbody tr td#Mai_109").attr("title") || 0;
    var may2confa = $("table#tAbsenteOre tbody tr td#Mai_110").attr("title") || 0;
    var may3confa = $("table#tAbsenteOre tbody tr td#Mai_111").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("table#tAbsenteOre tbody tr td#Iunie_109").attr("title") || 0;
    var jun2confa = $("table#tAbsenteOre tbody tr td#Iunie_110").attr("title") || 0;
    var jun3confa = $("table#tAbsenteOre tbody tr td#Iunie_111").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("table#tAbsenteOre tbody tr td#Iulie_109").attr("title") || 0;
    var july2confa = $("table#tAbsenteOre tbody tr td#Iulie_110").attr("title") || 0;
    var july3confa = $("table#tAbsenteOre tbody tr td#Iulie_111").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("table#tAbsenteOre tbody tr td#August_109").attr("title") || 0;
    var avg2confa = $("table#tAbsenteOre tbody tr td#August_110").attr("title") || 0;
    var avg3confa = $("table#tAbsenteOre tbody tr td#August_111").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("table#tAbsenteOre tbody tr td#Septembrie_109").attr("title") || 0;
    var sep2confa = $("table#tAbsenteOre tbody tr td#Septembrie_110").attr("title") || 0;
    var sep3confa = $("table#tAbsenteOre tbody tr td#Septembrie_111").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("table#tAbsenteOre tbody tr td#Octombrie_109").attr("title") || 0;
    var oct2confa = $("table#tAbsenteOre tbody tr td#Octombrie_110").attr("title") || 0;
    var oct3confa = $("table#tAbsenteOre tbody tr td#Octombrie_111").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("table#tAbsenteOre tbody tr td#Noiembrie_109").attr("title") || 0;
    var nov2confa = $("table#tAbsenteOre tbody tr td#Noiembrie_110").attr("title") || 0;
    var nov3confa = $("table#tAbsenteOre tbody tr td#Noiembrie_111").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("table#tAbsenteOre tbody tr td#Decembrie_109").attr("title") || 0;
    var dec2confa = $("table#tAbsenteOre tbody tr td#Decembrie_110").attr("title") || 0;
    var dec3confa = $("table#tAbsenteOre tbody tr td#Decembrie_111").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var confb_assenza = $('table#tAbsenteOre  tbody tr td#Medie_109').attr("title") || 0;
    var confb_infortuni = $('table#tAbsenteOre  tbody tr td#Medie_110').attr("title") || 0;
    var confb_malatia = $('table#tAbsenteOre  tbody tr td#Medie_111').attr("title") || 0;
    var confb_tot = parseFloat(confb_assenza) + parseFloat(confb_infortuni) + parseFloat(confb_malatia);


    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_conf"></td>';
    cols += '<td class="td_conf">TOTALE</td>';
    cols += '<td class="td_conf jan_confbOre">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf feb_confbOre">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf mar_confbOre">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf apr_confbOre">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf may_confbOre">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jun_confbOre">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf jul_confbOre">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf avg_confbOre">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf sep_confbOre">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf oct_confbOre">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf nov_confbOre">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf dec_confbOre">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_conf tot_confbOre"  id="confb_sum_tot">' + confb_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tableOre.find(".rSubSelectat[title='CONFEZIONE B']").parent());





    //STIRO
    var jan1confa = $("table#tAbsenteOre tbody tr td#Ianuarie_113").attr("title") || 0;
    var jan2confa = $("table#tAbsenteOre tbody tr td#Ianuarie_114").attr("title") || 0;
    var jan3confa = $("table#tAbsenteOre tbody tr td#Ianuarie_115").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("table#tAbsenteOre tbody tr td#Februarie_113").attr("title") || 0;
    var feb2confa = $("table#tAbsenteOre tbody tr td#Februarie_114").attr("title") || 0;
    var feb3confa = $("table#tAbsenteOre tbody tr td#Februarie_115").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("table#tAbsenteOre tbody tr td#Martie_113").attr("title") || 0;
    var mar2confa = $("table#tAbsenteOre tbody tr td#Martie_114").attr("title") || 0;
    var mar3confa = $("table#tAbsenteOre tbody tr td#Martie_115").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("table#tAbsenteOre tbody tr td#Aprilie_113").attr("title") || 0;
    var apr2confa = $("table#tAbsenteOre tbody tr td#Aprilie_114").attr("title") || 0;
    var apr3confa = $("table#tAbsenteOre tbody tr td#Aprilie_115").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("table#tAbsenteOre tbody tr td#Mai_113").attr("title") || 0;
    var may2confa = $("table#tAbsenteOre tbody tr td#Mai_114").attr("title") || 0;
    var may3confa = $("table#tAbsenteOre tbody tr td#Mai_115").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("table#tAbsenteOre tbody tr td#Iunie_113").attr("title") || 0;
    var jun2confa = $("table#tAbsenteOre tbody tr td#Iunie_114").attr("title") || 0;
    var jun3confa = $("table#tAbsenteOre tbody tr td#Iunie_115").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("table#tAbsenteOre tbody tr td#Iulie_113").attr("title") || 0;
    var july2confa = $("table#tAbsenteOre tbody tr td#Iulie_114").attr("title") || 0;
    var july3confa = $("table#tAbsenteOre tbody tr td#Iulie_115").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("table#tAbsenteOre tbody tr td#August_113").attr("title") || 0;
    var avg2confa = $("table#tAbsenteOre tbody tr td#August_114").attr("title") || 0;
    var avg3confa = $("table#tAbsenteOre tbody tr td#August_115").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("table#tAbsenteOre tbody tr td#Septembrie_113").attr("title") || 0;
    var sep2confa = $("table#tAbsenteOre tbody tr td#Septembrie_114").attr("title") || 0;
    var sep3confa = $("table#tAbsenteOre tbody tr td#Septembrie_115").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("table#tAbsenteOre tbody tr td#Octombrie_113").attr("title") || 0;
    var oct2confa = $("table#tAbsenteOre tbody tr td#Octombrie_114").attr("title") || 0;
    var oct3confa = $("table#tAbsenteOre tbody tr td#Octombrie_115").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("table#tAbsenteOre tbody tr td#Noiembrie_113").attr("title") || 0;
    var nov2confa = $("table#tAbsenteOre tbody tr td#Noiembrie_114").attr("title") || 0;
    var nov3confa = $("table#tAbsenteOre tbody tr td#Noiembrie_115").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("table#tAbsenteOre tbody tr td#Decembrie_113").attr("title") || 0;
    var dec2confa = $("table#tAbsenteOre tbody tr td#Decembrie_114").attr("title") || 0;
    var dec3confa = $("table#tAbsenteOre tbody tr td#Decembrie_115").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var stiro_assenza = $('table#tAbsenteOre  tbody tr td#Medie_113').attr("title") || 0;
    var stiro_infortuni = $('table#tAbsenteOre  tbody tr td#Medie_114').attr("title") || 0;
    var stiro_malatia = $('table#tAbsenteOre  tbody tr td#Medie_115').attr("title") || 0;
    var stiro_tot = parseFloat(stiro_assenza) + parseFloat(stiro_infortuni) + parseFloat(stiro_malatia);

    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_stiro"></td>';
    cols += '<td class="td_stiro">TOTALE</td>';
    cols += '<td class="td_stiro jan_stiroOre">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro feb_stiroOre">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro mar_stiroOre">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro apr_stiroOre">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro may_stiroOre">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro jun_stiroOre">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro jul_stiroOre">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro avg_stiroOre">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro sep_stiroOre">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro oct_stiroOre">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro nov_stiroOre">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro dec_stiroOre">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_stiro tot_stiroOre"  id="stiro_sum_tot">' + stiro_tot.toFixed(1) + '</td>';

    newRow.append(cols);
    newRow.insertBefore(tableOre.find(".rSubSelectat[title~='STIRO']").parent());


    //AMMINISTRAZIONE
    var jan1confa = $("table#tAbsenteOre tbody tr td#Ianuarie_117").attr("title") || 0;
    var jan2confa = $("table#tAbsenteOre tbody tr td#Ianuarie_118").attr("title") || 0;
    var jan3confa = $("table#tAbsenteOre tbody tr td#Ianuarie_119").attr("title") || 0;
    var jan_confa_sum = parseFloat(jan1confa) + parseFloat(jan2confa) + parseFloat(jan3confa);

    var feb1confa = $("table#tAbsenteOre tbody tr td#Februarie_117").attr("title") || 0;
    var feb2confa = $("table#tAbsenteOre tbody tr td#Februarie_118").attr("title") || 0;
    var feb3confa = $("table#tAbsenteOre tbody tr td#Februarie_119").attr("title") || 0;
    var feb_confa_sum = parseFloat(feb1confa) + parseFloat(feb2confa) + parseFloat(feb3confa);

    var mar1confa = $("table#tAbsenteOre tbody tr td#Martie_117").attr("title") || 0;
    var mar2confa = $("table#tAbsenteOre tbody tr td#Martie_118").attr("title") || 0;
    var mar3confa = $("table#tAbsenteOre tbody tr td#Martie_119").attr("title") || 0;
    var mar_confa_sum = parseFloat(mar1confa) + parseFloat(mar2confa) + parseFloat(mar3confa);

    var apr1confa = $("table#tAbsenteOre tbody tr td#Aprilie_117").attr("title") || 0;
    var apr2confa = $("table#tAbsenteOre tbody tr td#Aprilie_118").attr("title") || 0;
    var apr3confa = $("table#tAbsenteOre tbody tr td#Aprilie_119").attr("title") || 0;
    var apr_confa_sum = parseFloat(apr1confa) + parseFloat(apr2confa) + parseFloat(apr3confa);

    var may1confa = $("table#tAbsenteOre tbody tr td#Mai_117").attr("title") || 0;
    var may2confa = $("table#tAbsenteOre tbody tr td#Mai_118").attr("title") || 0;
    var may3confa = $("table#tAbsenteOre tbody tr td#Mai_119").attr("title") || 0;
    var may_confa_sum = parseFloat(may1confa) + parseFloat(may2confa) + parseFloat(may3confa);

    var jun1confa = $("table#tAbsenteOre tbody tr td#Iunie_117").attr("title") || 0;
    var jun2confa = $("table#tAbsenteOre tbody tr td#Iunie_118").attr("title") || 0;
    var jun3confa = $("table#tAbsenteOre tbody tr td#Iunie_119").attr("title") || 0;
    var jun_confa_sum = parseFloat(jun1confa) + parseFloat(jun2confa) + parseFloat(jun3confa);

    var july1confa = $("table#tAbsenteOre tbody tr td#Iulie_117").attr("title") || 0;
    var july2confa = $("table#tAbsenteOre tbody tr td#Iulie_118").attr("title") || 0;
    var july3confa = $("table#tAbsenteOre tbody tr td#Iulie_119").attr("title") || 0;
    var july_confa_sum = parseFloat(july1confa) + parseFloat(july2confa) + parseFloat(july3confa);

    var avg1confa = $("table#tAbsenteOre tbody tr td#August_117").attr("title") || 0;
    var avg2confa = $("table#tAbsenteOre tbody tr td#August_118").attr("title") || 0;
    var avg3confa = $("table#tAbsenteOre tbody tr td#August_119").attr("title") || 0;
    var avg_confa_sum = parseFloat(avg1confa) + parseFloat(avg2confa) + parseFloat(avg3confa);

    var sep1confa = $("table#tAbsenteOre tbody tr td#Septembrie_117").attr("title") || 0;
    var sep2confa = $("table#tAbsenteOre tbody tr td#Septembrie_118").attr("title") || 0;
    var sep3confa = $("table#tAbsenteOre tbody tr td#Septembrie_119").attr("title") || 0;
    var sep_confa_sum = parseFloat(sep1confa) + parseFloat(sep2confa) + parseFloat(sep3confa);

    var oct1confa = $("table#tAbsenteOre tbody tr td#Octombrie_117").attr("title") || 0;
    var oct2confa = $("table#tAbsenteOre tbody tr td#Octombrie_118").attr("title") || 0;
    var oct3confa = $("table#tAbsenteOre tbody tr td#Octombrie_119").attr("title") || 0;
    var oct_confa_sum = parseFloat(oct1confa) + parseFloat(oct2confa) + parseFloat(oct3confa);

    var nov1confa = $("table#tAbsenteOre tbody tr td#Noiembrie_117").attr("title") || 0;
    var nov2confa = $("table#tAbsenteOre tbody tr td#Noiembrie_118").attr("title") || 0;
    var nov3confa = $("table#tAbsenteOre tbody tr td#Noiembrie_119").attr("title") || 0;
    var nov_confa_sum = parseFloat(nov1confa) + parseFloat(nov2confa) + parseFloat(nov3confa);

    var dec1confa = $("table#tAbsenteOre tbody tr td#Decembrie_117").attr("title") || 0;
    var dec2confa = $("table#tAbsenteOre tbody tr td#Decembrie_118").attr("title") || 0;
    var dec3confa = $("table#tAbsenteOre tbody tr td#Decembrie_119").attr("title") || 0;
    var dec_confa_sum = parseFloat(dec1confa) + parseFloat(dec2confa) + parseFloat(dec3confa);

    var admin_assenza = $('table#tAbsenteOre  tbody tr td#Medie_117').attr("title") || 0;
    var admin_infortuni = $('table#tAbsenteOre  tbody tr td#Medie_118').attr("title") || 0;
    var admin_malatia = $('table#tAbsenteOre  tbody tr td#Medie_119').attr("title") || 0;
    var admin_tot = parseFloat(admin_assenza) + parseFloat(admin_infortuni) + parseFloat(admin_malatia);

    var newRow = $("<tr>");
    var cols = "";
    cols += '<td class="td_amministrazione"></td>';
    cols += '<td class="td_amministrazione">TOTALE</td>';
    cols += '<td class="td_amministrazione jan_amminOre">' + jan_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione feb_amminOre">' + feb_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione mar_amminOre">' + mar_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione apr_amminOre">' + apr_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione may_amminOre">' + may_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione jun_amminOre">' + jun_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione jul_amminOre">' + july_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione avg_amminOre">' + avg_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione sep_amminOre">' + sep_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione oct_amminOre">' + oct_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione nov_amminOre">' + nov_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione dec_amminOre">' + dec_confa_sum.toFixed(1) + '</td>';
    cols += '<td class="td_amministrazione tot_amminOre"  id="admin_sum_tot">' + admin_tot.toFixed(1) + '</td>';
    newRow.append(cols);
    newRow.insertBefore(tableOre.find(".rSubSelectat[title~='AMMINISTRAZIONE']").parent());

    //var tess_totale = $("#tess_sum_tot").text();
    //var confa_totale = $("#confa_sum_tot").text();
    //var confb_totale = $("#confb_sum_tot").text();
    //var stiro_totale = $("#stiro_sum_tot").text();
    //var admin_totale = $("#admin_sum_tot").text();

    //$('#td_tess_sum_tot').text($("#tess_sum_tot").text());


}


function FailedCallback(error, userContext, methodName) {
    $get('up').style.display = 'none';
    if (error !== null) {
        window.alert(error.get_message());
    }
}
function pageLoad() {
    Lista();
}
if (typeof (Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
