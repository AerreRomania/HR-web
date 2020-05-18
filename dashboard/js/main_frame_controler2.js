$(document).ready(function() {

//////////////////////////////////////////////////////////////////////////////
//                  CONFEZIONE - DATI PRODUZIONE START                      //
//////////////////////////////////////////////////////////////////////////////



//CONFZIONE A - Click
    //$("#confezionea_frame_start").dblclick(function() {

//        //loader
//        $('#loader-wrapper-confezione').show();
//        $('#frame_confezione').load(function() {
//            setTimeout(function() {
//                    $('body').addClass('loaded');
//                },
//                200);
//        });

//        var iframe = $("#frame_confezione");
//        iframe.attr('src', './ConfezioneA.aspx');
//        $("#frame_confezione_div").show();
//        $('body').removeClass('loaded');
//        $("#db_conf_close").show();
//        $("#frame_confezione_div_hide").hide();
    //});

////CONFEZIONE B - Click
//    $("#confezioneb_frame_start").dblclick(function () {

//        //loader
//        $('#loader-wrapper-confezione').show();
//        $('#frame_confezione').load(function () {
//            setTimeout(function () {
//                $('body').addClass('loaded');
//            }, 200);
//        });


//        var iframe = $("#frame_confezione");
//        iframe.attr('src', './ConfezioneB.aspx');
//        $("#frame_confezione_div").show();
//        $('body').removeClass('loaded');

//        $("#db_conf_close").show();
//        $("#frame_confezione_div_hide").hide();

//    });

////ORGANIGRAMA - Click
//    $("#organigrama_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione");
//        iframe.attr('src', './Report_Light.aspx');
//        $("#frame_confezione_div").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_hide").hide();

//    });

////EXIT FRAME CONFEZIONE
//    $("#db_conf_close").hide();
//    $("#db_conf_close").dblclick(function () {

//        $("#frame_confezione_div").hide();
//        $("#frame_confezione_div_db").hide();

//        $("#db_conf_close").hide();

//        var iframe = $("#frame_confezione");
//        iframe.attr('src', '');
//        var iframe1 = $("#frame_confezione_db");
//        iframe1.attr('src', '');

//        $("#frame_confezione_div_hide").show();
//        $("#frame_confezione_div_db_hide").show();


//    });


//////////////////////////////////////////////////////////////////////////////
//                  CONFEZIONE - DATI PRODUZIONE END                        //
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//                  CONFEZIONE - DATI BASE START                            //
//////////////////////////////////////////////////////////////////////////////


////ARTICLE
//    $("#article_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-article.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();
//    });

//    //MACHINES
//    $("#machine_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-machine.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();

//    });

//    //CLIETI
//    $("#clienti_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-gestione-clienti.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();

//    });

//    //FAZE
//    $("#faze_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-faze.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();

//    });

//    //PERSONS
//    $("#persons_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-addemployee.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();

//    });
//    //TABLETS
//    $("#tablets_conf_frame_start").dblclick(function () {
//        var iframe = $("#frame_confezione_db");
//        iframe.attr('src', './form-angajati.aspx');
//        $("#frame_confezione_div_db").show();
//        $("#db_conf_close").show();

//        $("#frame_confezione_div_db_hide").hide();

//    });

//////////////////////////////////////////////////////////////////////////////
//                      CONFEZIONE - DATI BASE END                          //
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
//                      STIRO - DATI PRODUZIONE START                       //
//////////////////////////////////////////////////////////////////////////////

    $("#frame_stiro_div").hide();

    //STIRO - LAYOUT
    //$("#stiro_frame_start").dblclick(function () {

    //    //loader
    //    $('#loader-wrapper').show();
    //    $('#frame_stiro').load(function () {
    //        setTimeout(function () {
    //            $('body').addClass('loaded');
    //        }, 200);
    //    });


    //    var iframe = $("#frame_stiro");
    //    iframe.attr('src', './Stiro.aspx');
    //    $("#frame_stiro_div").show();
    //    $('body').removeClass('loaded');

    //    $("#frame_stiro_div_hide").hide();
    //    $("#db_stiro_close").show();
    //});

    //ORGANIGRAMA
    //$("#stiro_organigrama_frame_start").dblclick(function () {

    //    var iframe = $("#frame_stiro");
    //    iframe.attr('src', './ReportStiro_Light.aspx');
    //    $("#frame_stiro_div").show();
    //    $("#db_stiro_close").show();

    //    $("#loader-wrapper").hide();


    //    $("#frame_stiro_div_hide").hide();

    //});

    //INTERVALS
    //$("#stiro_intervals_frame_start").dblclick(function () {

    //    //loader
    //    $('#loader-wrapper').show();
    //    $('#frame_stiro').load(function () {
    //        setTimeout(function () {
    //            $('body').addClass('loaded');
    //        }, 200);
    //    });

    //    var iframe = $("#frame_stiro");
    //    iframe.attr('src', './form-intervali-stiro.aspx');
    //    $("#frame_stiro_div").show();
    //    $('body').removeClass('loaded');

    //    $("#frame_stiro_div_hide").hide();
    //    $("#db_stiro_close").show();


    //});

    //EXIT FRAME STIRO
    //$("#db_stiro_close").hide();
    //$("#db_stiro_close").dblclick(function () {

    //    $("#frame_stiro_div").hide();
    //    $("#frame_stiro_div_db").hide();


    //    var iframe = $("#frame_stiro");
    //    iframe.attr('src', '');
    //    var iframe1 = $("#frame_stiro_db");
    //    iframe1.attr('src', '');

    //    $("#db_stiro_close").hide();
    //    $("#frame_stiro_div_hide").show();
    //    $("#frame_stiro_div_db_hide").show();


    //});

//////////////////////////////////////////////////////////////////////////////
//                    STIRO - DATI PRODUZIONE END                           //
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
//                    STIRO - DATI BASE START                               //
//////////////////////////////////////////////////////////////////////////////

    //MACHINES
    //$("#machine_stiro_frame_start").dblclick(function () {

    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-machine-stiro.aspx');
    //    $("#frame_stiro_div_db").show();

    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();
    //});


    //PERSONS
    //$("#persons_stiro_frame_start").dblclick(function () {
    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-addemployee-stiro.aspx');
    //    $("#frame_stiro_div_db").show();


    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();
    //});
    //TABLETS
    //$("#tablets_stiro_frame_start").dblclick(function () {
    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-angajati-stiro.aspx');
    //    $("#frame_stiro_div_db").show();

    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();
    //});

    //ARTICLE
    //$("#frame_stiro_div_db").hide();
    //$("#stiro_article_frame_start").dblclick(function () {
    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-article-stiro.aspx');
    //    $("#frame_stiro_div_db").show();

    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();

    //});

    //FAZE
    //$("#frame_stiro_div_db").hide();
    //$("#stiro_faze_frame_start").dblclick(function () {
    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-faze-stiro.aspx');
    //    $("#frame_stiro_div_db").show();

    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();

    //});

    //stiro_clieti
    //$("#frame_stiro_div_db").hide();
    //$("#clieti_stiro_frame_start").dblclick(function () {
    //    var iframe = $("#frame_stiro_db");
    //    iframe.attr('src', './form-gestione-clienti.aspx');
    //    $("#frame_stiro_div_db").show();

    //    $("#db_stiro_close").show();
    //    $("#frame_stiro_div_db_hide").hide();

    //});

//////////////////////////////////////////////////////////////////////////////
//                       STIRO - DATI BASE END                              //
//////////////////////////////////////////////////////////////////////////////

 
});