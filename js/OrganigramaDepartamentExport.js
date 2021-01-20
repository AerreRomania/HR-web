    function onRequestStart(sender, args) {
        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0)
            args.set_enableAjax(false);
        if (args.get_eventTarget().indexOf("ExportToPdfButtonn") >= 0)
            args.set_enableAjax(false);
        if (args.get_eventTarget().indexOf("ExportToCsvButton") >= 0)
            args.set_enableAjax(false);
    }

    function printExcel(sender, args) {
        $('.rgExpCSV').click();
    }

    function printData() {
        $('.rgDataDiv').css('height', '100%');

        $('#RadGrid1').printThis({
            header: "<h1>ORGANIGRAMMA DEPARTAMENT: " + $('#lbl_LastDate').text() + "</h1>",
            pageTitle: "",
            importCSS: true,
            ImportStyle: true,
            copyTagClasses: true,
            loadCSS: "Css/StyleSheet.css"
        });

        $('.rgDataDiv')
            .delay(1000)
            .queue(function (next) {
                $('.rgDataDiv').css('height', '700px').delay(100);
                next();
            });
}

function printData2() {
    window.frames["printf"].focus();
    window.frames["printf"].print();
}

//function printPDF2() {
//    window.frames["printf"].css('height', '100%');
//    var pdf = new jsPDF('p', 'pt', [6500, 1400]);
//    pdf.addHTML($('#RadGrid1')[0], function () {
//        pdf.save('Organigramma Generale.pdf');
//    });
//    $('.rgDataDiv')
//        .delay(1000)
//        .queue(function (next) {
//            $('.rgDataDiv').css('height', '700px').delay(100);
//            next();
//        });

//}

function printDataGenerale() {

    $('#tOrganigrama, #charts').printThis({
        header: "<h1>ORGANIGRAMMA DEPARTAMENT: " + $('#lbl_LastDate').text() + "</h1>",
        pageTitle: "",
        importCSS: true,
        ImportStyle: true,
        copyTagClasses: true,
        loadCSS: "Css/StyleSheet.css"
    });


}

function printPDF() {
    $('.rgDataDiv').css('height','100%');
        var pdf = new jsPDF('p', 'pt', [6500, 1400]);
        pdf.addHTML($('#RadGrid1')[0], function () {
            pdf.save('Organigramma Generale.pdf');
    });
    $('.rgDataDiv')
        .delay(1000)
        .queue(function (next) {
            $('.rgDataDiv').css('height', '700px').delay(100);
            next();
        });

    }
