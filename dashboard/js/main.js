$(document).ready(function () {



//////////////////////////////////////////////////////////////////////////////
// MENU CHANGE / CLICK START                                                //
//////////////////////////////////////////////////////////////////////////////

    //DEFAULT HIDDEN
    $("#menu_prod").hide();
    $("#menu_prod_conf_dp").hide();
    $("#menu_prod_conf_db").hide();
    $("#menu_prod_stiro_dp").hide();
    $("#menu_prod_stiro_db").hide();
    $("#menu_prod_conf").hide();
    $("#menu_prod_stiro").hide();
    
    $("#conf_chooser").hide();
    $("#stiro_chooser").hide();

//////////////////////////////////////////////////////////////////////////////
// MENU CHANGE / CLICK END                                                  //
//////////////////////////////////////////////////////////////////////////////

    //DEFAULT
    $("#lvl_one_prod").addClass("hide");

    $("#lvl_two_conf").addClass("hide");
    $("#lvl_two_conf").removeClass("show");

    $("#lvl_two_stiro").addClass("hide");
    $("#lvl_two_stiro").removeClass("show");
    
    $("#conf_bread").hide();
    $("#stiro_bread").hide();
    $("#produzione_bread").hide();
    $("#default_bread").show();

    //HIDE DEFAULT DATI BASE CONFEZIONE
    $("#db_conf_bread").addClass("hide");
    $("#db_conf_bread").removeClass("show");

    //ALL VIEW (TUTTI)
    $("#tutti_close").addClass("hide");

    $("#all").dblclick(function() {
        $("#lvl_zero").addClass("hide");
        $("#lvl_zero").removeClass("show");

        $("#tutti_close").removeClass("hide");

        $("#lvl_two_conf").removeClass("hide");
        $("#lvl_two_stiro").removeClass("hide");
        $("#db_conf_bread").removeClass("hide");
        $("#dp_conf_bread").removeClass("hide");
        $("#db_stiro_bread").removeClass("hide");
        $("#dp_stiro_bread").removeClass("hide");

        $("#all").addClass("active");
        $("#prior").removeClass("active");
        
    });

    //CLOSE TUTTI
    $("#tutti_close").dblclick(function() {
        $("#tutti_close").addClass("hide");


        //$("#all").click();
    });

    $("#prior").dblclick(function() {
        $("#lvl_zero").removeClass("hide");
        $("#lvl_zero").addClass("show");
        
        $("#lvl_two_conf").addClass("hide");
        $("#lvl_two_stiro").addClass("hide");
        $("#db_conf_bread").addClass("hide");
        $("#dp_conf_bread").addClass("hide");
        $("#db_stiro_bread").addClass("hide");
        $("#dp_stiro_bread").addClass("hide");
        
        $("#prior").addClass("active");
        $("#all").removeClass("active");
    });

    //MENU ALL - CLICK
    $("#menu_all").dblclick(function () {

        $("#menu").show();

        $("#menu_prod").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

        $("#conf_chooser").hide();
        $("#stiro_chooser").hide();

        //$("#prior").click();
        $("#btn_back_prod").dblclick();
    });


    //LVL 0 - PRODUCTION CLICK EVENT
    $("#prod").dblclick(function () {
        $("#lvl_zero").addClass("hide");
        $("#lvl_zero").removeClass("show");

        //SHOW PRODUCTION
        $("#lvl_one_prod").addClass("show");
        $("#lvl_one_prod").removeClass("hide");

        $("#default_bread").hide();
        $("#produzione_bread").show();

        $("#dp_conf").removeClass("active");
        $("#db_conf").removeClass("active");

        //SHOW - HIDE MENUS
        $("#menu_prod").show();
        $("#menu").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_stiro_db").hide();
    });

    //BACK TO 0 LVL
    $("#btn_back_prod").dblclick(function () {
        $("#produzione_bread").hide();
            $("#lvl_zero").addClass("show");
            $("#lvl_zero").removeClass("hide");
    
            $("#stiro_bread").hide();
            $("#conf_bread").hide();
            $("#default_bread").show();


            //HIDE PRODUCTION
            $("#lvl_one_prod").addClass("hide");
            $("#lvl_one_prod").removeClass("show");

            //HIDE CONFEZIONE
            $("#lvl_two_conf").addClass("hide");
            $("#lvl_two_conf").removeClass("show");

            //HIDE STIRO
            $("#lvl_two_stiro").addClass("hide");
            $("#lvl_two_stiro").removeClass("show");

            // SHOW - HIDE MENUS
            $("#menu").show();
            $("#menu_prod").hide();
            $("#menu_prod_conf_db").hide();
            $("#menu_prod_conf_dp").hide();

    });
    

    //BACK TO PRODUCTION    
    $("#btn_back_conf").dblclick(function () {

        $("#prod").dblclick();
        $("#conf_chooser").hide();
        $("#conf_bread").hide();

        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();

        $("#frame_confezione_div_hide").hide();
        $("#frame_confezione_div_db_hide").hide();

        //CLEAR HIDE FRAME
        $("#frame_confezione_div").hide();
        $("#frame_confezione_div_db").hide();
        var iframe = $("#frame_confezione");
        iframe.attr('src', '');
        var iframe1 = $("#frame_confezione_db");
        iframe1.attr('src', '');
        $("#db_conf_close").hide();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
    });


    //LVL 1 - CONFEZIONE CLIEK EVENT
    $("#conf").dblclick(function () {

        //SHOW BREADCRAMP
        $("#conf_bread").show();
        $("#menu_prod_conf").show();
        //HIDE DEFAULT BREADCRAMP
        $("#stiro_bread").hide();
        $("#default_bread").hide();
        $("#produzione_bread").hide();
        $("#menu_prod").hide();

        //HIDE PRODUCTION
        $("#lvl_one_prod").addClass("hide");
        $("#lvl_one_prod").removeClass("show");

        //SHOW CONFEZIONE
        $("#lvl_two_conf").addClass("hide");
        $("#lvl_two_conf").removeClass("show");

        //HIDE STIRO
        $("#lvl_two_stiro").addClass("hide");
        $("#lvl_two_stiro").removeClass("show");

        //CONFEZIONE CHOOSER
        $("#conf_chooser").show();

    });

    //CONFEZIONE CHOOSER
    $("#conf_dp_start").dblclick(function () {
        $("#dp_conf").dblclick();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");
    });

    $("#conf_db_start").dblclick(function () {
        $("#db_conf").dblclick();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");
    });

    //DP CONFEZIONE CLICK
    $("#dp_conf").dblclick(function () {
        $("#frame_confezione_div_hide").show();
        //SHOW LVL
        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");

        //ACTIVE BREADCRAMP
        $("#dp_conf").addClass("active");
        $("#db_conf").removeClass("active");

        //SHOW DP
        $("#dp_conf_bread").addClass("show");
        $("#dp_conf_bread").removeClass("hide");

        //HIDE DB
        $("#db_conf_bread").addClass("hide");
        $("#db_conf_bread").removeClass("show");

        //SHOW - HIDE MENUS
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").show();
        $("#menu_prod").hide();

        $("#conf_chooser").hide();

        //CLEAR HIDE FRAME
        $("#frame_confezione_div").hide();
        $("#frame_confezione_div_db").hide();
        var iframe = $("#frame_confezione");
        iframe.attr('src', '');
        var iframe1 = $("#frame_confezione_db");
        iframe1.attr('src', '');
        $("#db_conf_close").hide();
    });
    //DB CONFEZIONE CLICK
    $("#db_conf").dblclick(function () {
        $("#frame_confezione_div_db_hide").show();
        //SHOW LVL
        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");

        //ACTIVE BREADCRAMP
        $("#dp_conf").removeClass("active");
        $("#db_conf").addClass("active");

        //SHOW DB
        $("#db_conf_bread").addClass("show");
        $("#db_conf_bread").removeClass("hide");

        //HIDE DP
        $("#dp_conf_bread").addClass("hide");
        $("#dp_conf_bread").removeClass("show");

        //SHOW - HIDE MENUS
        $("#menu_prod_conf_db").show();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod").hide();

        $("#conf_chooser").hide();

        //CLEAR HIDE FRAME
        $("#frame_confezione_div").hide();
        $("#frame_confezione_div_db").hide();
        var iframe = $("#frame_confezione");
        iframe.attr('src', '');
        var iframe1 = $("#frame_confezione_db");
        iframe1.attr('src', '');
        $("#db_conf_close").hide();
       
    });

    //////////////////////////////////////////////
    //STIRO CLICK EVENT
    $("#stiro").dblclick(function () {
        //SHOW BREADCRAMP
        $("#menu_prod_stiro").show();
        $("#stiro_bread").show();

        //HIDE DEFAULT BREADCRAMP
        $("#default_bread").hide();
        $("#produzione_bread").hide();
        $("#menu_prod").hide();


        //HIDE PRODUCTION
        $("#lvl_one_prod").addClass("hide");
        $("#lvl_one_prod").removeClass("show");

        //SHOW CONFEZIONE
        $("#lvl_two_conf").addClass("hide");
        $("#lvl_two_conf").removeClass("show");

        //HIDE STIRO
        $("#lvl_two_stiro").addClass("hide");
        $("#lvl_two_stiro").removeClass("show");

        //CONFEZIONE CHOOSER
        $("#stiro_chooser").show();
    });

    //CONFEZIONE CHOOSER
    $("#stiro_dp_start").dblclick(function () {
        $("#dp_stiro").dblclick();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");
    });

    $("#stiro_db_start").dblclick(function () {
        $("#db_stiro").dblclick();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");
    });

    //DP STIRO CLICK
    $("#dp_stiro").dblclick(function () {
        $("#frame_stiro_div_hide").show();
        $("#stiro_chooser").hide();

        //ACTIVE BREADCRAMP
        $("#dp_stiro").addClass("active");
        $("#db_stiro").removeClass("active");

        //SHOW DP
        $("#dp_stiro_bread").addClass("show");
        $("#dp_stiro_bread").removeClass("hide");

        //HIDE DB
        $("#db_stiro_bread").addClass("hide");
        $("#db_stiro_bread").removeClass("show");

        $("#menu_prod_stiro_dp").show();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod").hide();

        //CLEAR HIDE FRAME
        $("#frame_stiro_div").hide();
        $("#frame_stiro_div_db").hide();
        var iframe = $("#frame_stiro");
        iframe.attr('src', '');
        var iframe1 = $("#frame_stiro_db");
        iframe1.attr('src', '');
        $("#db_stiro_close").hide();

        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");

    });
    //DB STIRO CLICK
    $("#db_stiro").dblclick(function () {
        $("#frame_stiro_div_db_hide").show();
        $("#stiro_chooser").hide();

        //ACTIVE BREADCRAMP
        $("#dp_stiro").removeClass("active");
        $("#db_stiro").addClass("active");

        //SHOW DB
        $("#db_stiro_bread").addClass("show");
        $("#db_stiro_bread").removeClass("hide");

        //HIDE DP
        $("#dp_stiro_bread").addClass("hide");
        $("#dp_stiro_bread").removeClass("show");

        $("#menu_prod_stiro_db").show();
        $("#menu_prod").hide();
        $("#menu_prod_stiro_dp").hide();

        //CLEAR HIDE FRAME
        $("#frame_stiro_div").hide();
        $("#frame_stiro_div_db").hide();
        var iframe = $("#frame_stiro");
        iframe.attr('src', '');
        var iframe1 = $("#frame_stiro_db");
        iframe1.attr('src', '');
        $("#db_stiro_close").hide();

        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");
    });
    
    //BACK TO PRODUCTION    
    $("#btn_back_stiro").dblclick(function () {
        $("#prod").dblclick();

        $("#stiro_chooser").hide();
        $("#stiro_bread").hide();

        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();

        $("#frame_stiro_div_hide").hide();
        $("#frame_stiro_div_db_hide").hide();

        //CLEAR HIDE FRAME
        $("#frame_stiro_div").hide();
        $("#frame_stiro_div_db").hide();
        var iframe = $("#frame_stiro");
        iframe.attr('src', '');
        var iframe1 = $("#frame_stiro_db");
        iframe1.attr('src', '');
        $("#db_stiro_close").hide();

        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();

    });

    //HIDE DEFAULT DATI BASE STIRO
    $("#db_stiro_bread").addClass("hide");
    $("#db_stiro_bread").removeClass("show");


///////////////////////////////////////////////////////////
//                       MENUES                          //
///////////////////////////////////////////////////////////

    $("#m_cont").dblclick(function() {
        $("#cont").dblclick();
    });

    $("#m_prod").dblclick(function () {
        $("#prod").dblclick();
    });


    //CONF,STIRO
    $(".m_menu_all").dblclick(function() {
        $("#menu_all").dblclick();
    });

    $("#m_conf").dblclick(function () {
        $("#conf").dblclick();
    });

    $("#m_stiro").dblclick(function () {
        $("#stiro").dblclick();
    });

    //CONF,STIRO,DB,DP
    $("#m_conf_prod_dp").dblclick(function() {
        $("#conf_dp_start").dblclick();
    });
    $("#m_conf_prod_db").dblclick(function () {
        $("#conf_db_start").dblclick();
    });
    $("#m_stiro_prod_dp").dblclick(function () {
        $("#stiro_dp_start").dblclick();
    });
    $("#m_stiro_prod_db").dblclick(function () {
        $("#stiro_db_start").dblclick();
    });

    //CONFEZIONE DP
    $("#m_confa").dblclick(function () {
        $("#confezionea_frame_start").dblclick();
    });

    $("#m_confb").dblclick(function () {
        $("#confezioneb_frame_start").dblclick();
    });

    $("#m_conf_org").dblclick(function () {
        $("#organigrama_conf_frame_start").dblclick();
    });

    //CONFEZIONE DB
    $("#m_conf_faze").dblclick(function () {
        $("#faze_conf_frame_start").dblclick();
    });

    $("#m_conf_article").dblclick(function () {
        $("#article_conf_frame_start").dblclick();
    });

    $("#m_conf_clienti").dblclick(function () {
        $("#clienti_conf_frame_start").dblclick();
    });

    $("#m_conf_machine").dblclick(function () {
        $("#machine_conf_frame_start").dblclick();
    });

    $("#m_conf_persons").dblclick(function () {
        $("#persons_conf_frame_start").dblclick();
    });

    $("#m_conf_tablets").dblclick(function () {
        $("#tablets_conf_frame_start").dblclick();
    });

    //STIRO DP
    $("#m_stiro_lay").dblclick(function() {
        $("#stiro_frame_start").dblclick();
    });

    $("#m_stiro_org").dblclick(function () {
        $("#stiro_organigrama_frame_start").dblclick();
    });

    $("#m_stiro_intervali").dblclick(function () {
        $("#stiro_intervals_frame_start").dblclick();
    });

    //STIRO DB
    $("#m_stiro_faze").dblclick(function () {
        $("#stiro_faze_frame_start").dblclick();
    });

    $("#m_stiro_article").dblclick(function () {
        $("#stiro_article_frame_start").dblclick();
    });

    $("#m_stiro_clienti").dblclick(function () {
        $("#clieti_stiro_frame_start").dblclick();
    });

    $("#m_stiro_machine").dblclick(function () {
        $("#machine_stiro_frame_start").dblclick();
    });

    $("#m_stiro_persons").dblclick(function () {
        $("#persons_stiro_frame_start").dblclick();
    });

    $("#m_stiro_tablets").dblclick(function () {
        $("#tablets_stiro_frame_start").dblclick();
    });
});
