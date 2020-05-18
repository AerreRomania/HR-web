$(document).ready(function () {


    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }


    //showchart();

    $("#spinner").hide();
    $("#cal_button").click(function () {
        $("#spinner").css("display", "block");
    });
    $("#favicon").attr("href", "./Images/navS.png");


    //$("#cal_button").click(function () {
    //        showchart();
    //    });

    //$("[id$=btnexcel]").click(function (e) {
    //    var panel = document.getElementById("gv_intervali");
    //    var printWindow = window.open('', '', 'height=2600,width=1000');
    //    printWindow.document.write('<table>');
    //    printWindow.document.write(panel.innerHTML);
    //    printWindow.document.write('</table>');
    //    window.open('data:application/vnd.ms-excel,' + encodeURIComponent(printWindow).html());

    //    printWindow.document.close();

    //    e.preventDefault();


    //});

    //$('#gv_intervali').DataTable({
    //    dom: 'Bfrtip',
    //    buttons: [
    //        'copy', 'csv', 'excel', 'pdf', 'print'
    //    ]
    //});
});


//$("#get_pdf_intervali").click(function () {
//    getPDF_intervali();
//});


function getPDF_intervali() {
    var pdf = new jsPDF();
    pdf.addHTML($("#gv_intervali"), function () {
        pdf.save('Stiro_interval.pdf');
    });
};


function PrintPage() {
    var panel = document.getElementById("gv_intervali");
    var printWindow = window.open('', '', 'height=2600,width=1000');
    printWindow.document.write('<table>');
    printWindow.document.write(panel.innerHTML);
    printWindow.document.write('</table>');
    printWindow.document.close();
    printWindow.print();

    return false;
};



//function showchart() {
//    var chart = document.getElementById('chart').getContext('2d'),
//        gradient = chart.createLinearGradient(0, 0, 0, 350);

//    gradient.addColorStop(0, 'rgba(76, 175,78, 0.9)');
//    gradient.addColorStop(0.5, 'rgba(255, 193, 7, 0.55)');
//    gradient.addColorStop(1, 'rgba(212, 12, 12, 0.15)');


//    var data = {
//        labels: ['ET.Copp', 'ET.Comp', 'Manichino', 'Rammendo', 'Pressa', 'Piego'],
//        datasets: [{
//            label: 'Totale',
//            backgroundColor: gradient,
//            pointBackgroundColor: 'white',
//            borderWidth: 1,
//            borderColor: '#333333',
//            data: [$("#lbl_et_copp_tot").text(), $("#lbl_et_comp_tot").text(), $("#lbl_et_manichino_tot").text(), $("#lbl_et_rammendo_tot").text(), $("#lbl_et_pressa_tot").text(), $("#lbl_et_piego_tot").text()]
//        }]
//    };


//    var options = {
//        responsive: true,
//        maintainAspectRatio: true,
//        animation: {
//            easing: 'easeInOutQuad',
//            duration: 520
//        },
//        scales: {
//            xAxes: [{
//                gridLines: {
//                    color: 'rgba(0,0,0, 0.05)',
//                    lineWidth: 1
//                }
//            }],
//            yAxes: [{
//                gridLines: {
//                    color: 'rgba(0, 0, 0, 0.08)',
//                    lineWidth: 1
//                }
//            }]
//        },
//        elements: {
//            line: {
//                tension: 0.4
//            }
//        },
//        legend: {
//            display: false
//        },
//        point: {
//            backgroundColor: 'white'
//        },
//        tooltips: {
//            titleFontFamily: 'Quicksand',
//            backgroundColor: 'rgba(0,0,0,0.8)',
//            titleFontColor: 'white',
//            caretSize: 10,
//            cornerRadius: 2,
//            xPadding: 15,
//            yPadding: 15
//        }
//    };


//    var chartInstance = new Chart(chart, {
//        type: 'line',
//        data: data,
//        options: options
//    });

//    return false;
//}





