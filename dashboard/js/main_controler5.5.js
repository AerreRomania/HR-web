function resizeIframe(obj) {
    //function iOSversion() {
    //    if (/iP(hone|od|ad)/.test(navigator.platform)) {
    //         var v = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);
    //        return [parseInt(v[1], 10), parseInt(v[2], 10), parseInt(v[3] || 0, 10)];
    //    }
    //}

    //ver = iOSversion();

    //if (ver[0] >= 5) {
    //    obj.style.width = 300 + 'px';
    //    obj.style.height = 1024 + 'px';
    //    alert('This is running iOS ' + ver + 'width=' + obj.style.width + '' + 'width=' + obj.style.height + '' );
    //}  

    if ($(window).width() < 700) {
        obj.style.height = obj.contentWindow.document.body.scrollHeight + 25 + 'px';
        obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';
    } else {
        try {
            obj.style.height = obj.contentWindow.document.body.scrollHeight + 25 + 'px';
            obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';
        }
        catch (err) {
            obj.style.height = 740 + 'px';
            obj.style.width = 1520 + 'px';
        }
    } 

    //if (screen.height > screen.width) {
    //    $(".iframe_load").each(function () {
    //        obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    //        obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';

    //        $(".iframe_load").css("width", $(window).height());
    //        $(".iframe_load").css("height", $(window).prop('scrollHeight'));
    //    });
    //} else {
    //    $(".iframe_load").each(function () {
    //        obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    //        obj.style.width = obj.contentWindow.document.body.scrollWidth + 'px';

    //        $(".iframe_load").css("width", $(window).height());
    //        $(".iframe_load").css("height", $(window).prop('scrollHeight'));
    //    });
    //}


}

$(document).ready(function () {

    function doOnOrientationChange() {
        if (screen.height > screen.width) {
            $(".iframe_load").each(function () {
                $(".iframe_load").css("width", $(window).height());
                $(".iframe_load").css("height", $(window).prop('scrollHeight'));
            });
        } else {
            $(".iframe_load").each(function () {
                $(".iframe_load").css("width", $(window).height());
                $(".iframe_load").css("height", $(window).prop('scrollHeight'));
            });
        }
    }

    window.addEventListener('orientationchange', doOnOrientationChange);

    $('.online_user_img').replaceWith("<img src='./images/online_green_status.svg' class='online_user_img'/>");
    $('.btn--menu').click(function () {
        $('.not--x__piece--1, .not--x__piece--2, .not--x__piece--3, .not--x__piece--4').toggleClass('is--x');
        $('.nav').toggleClass('is--visible');
    });

    $("#chat_control").click(function () {
        $("#popup_chat").toggleClass("chat_show");
    });

    $("#close_popup_chat").click(function () {
        $("#popup_chat").toggleClass("chat_show");
    });
    var end;
    $("#reg_notification_control").click(function () {
        $("#req_activation").toggleClass("req_show");
        $("#chat_control").toggleClass("hide");
        end = $("#req_user_drop_down").data('attr');
    });
    $("#req_close").click(function() {
        $("#reg_notification_control").click();
    });
    $("#close_reg_notification_control").click(function () {
        $("#req_activation").toggleClass("req_show");
    });

    $('#req_checkboxes_all').hide();
    $('#req_save_proced').hide();
    $("#req_user_drop_down").change(function () {
        end = this.value;
        $('input:checkbox').prop("checked", false).removeClass("bookselected");
        $('span').removeClass("bookselected");
        $('#req_user_drop_down').addClass("disabled");
        $('#req_checkboxes_all').show();
        $('#req_save_proced').show();
    });

    $(".role_check").on("click", function (e) {
        e.preventDefault();
        var currentElem = $(this);
        var user_drop_down = $("#req_user_drop_down");
        var dataToLog = { UserID: end, RoleID: currentElem.data('guid') };

        $('#req_save_proced').css({ 'border-color': "green" });
        currentElem.toggleClass("bookselected");
        if ($(currentElem).hasClass('bookselected')) {
            currentElem.find('input').prop("checked", true);
            currentElem.removeClass("bookblack");

            //ADD TO DB
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataToLog),
                url: "WebService.asmx/InsertRole",
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });

            $.notify('Perrmission Added', "success", {
                showAnimation: 'slideUp',
                hideAnimation: 'slideDown',
                autohide: true,
                globalPosition: "right bottom",
                clickToHide: true
            });
        }
        else {
            currentElem.find('input').prop("checked", false);
            currentElem.removeClass("bookselected");
            currentElem.addClass("bookblack");

            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataToLog),
                url: "WebService.asmx/DeleteRole",
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });

            $.notify('Perrmission Removed', "success", {
                showAnimation: 'slideUp',
                hideAnimation: 'slideDown',
                autohide: true,
                globalPosition: "right bottom",
                clickToHide: true
            });
        }
    });

    $("#req_save_proced").on("click", function (e) {
        $('input:checkbox').prop("checked", false);
        location.reload();
    });

    //KREIRA DOLE U FAVORITE LI - OVDE
    $(".nekaKlasa1").on("click", function (e) {
        e.preventDefault();
        var currentElem = $(this);
        var dataToLog = { username: $('#profil_username').html(), link: currentElem.data('link'), name: currentElem.data('name') };
        var item = '<a href="#!" class="nekaKlasa2 card__status book" data-name="' + currentElem.data('name') + '" data-img="' + currentElem.data('img') + '" data-link="' + currentElem.data('link') + '" style="background-image:url(' + currentElem.data('img') + ');background-size: 90px; background-attachment: inherit; background-position: 47% 15%;"> <span>' + currentElem.data('name') + ' </span> </a>';
        currentElem.toggleClass("bookyellow");
        if ($(currentElem).hasClass('bookyellow')) {
            currentElem.removeClass("booknone");
            //ADD TO DB
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataToLog),
                url: "WebService.asmx/InsertBookmark",
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });

            $('#favnav').append(item);
            $.notify('Added to list - "' + currentElem.data('name') +'"',"success", {
                showAnimation: 'slideUp',
                hideAnimation: 'slideDown',
                autohide: true,
                globalPosition: "right bottom",
                clickToHide: true
            });
        }
        else {
            currentElem.removeClass("bookyellow");
            currentElem.addClass("booknone");
            //REMOVE FROM DB
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataToLog),
                url: "WebService.asmx/DeleteBookmark",
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });
            $('#favnav').find('[data-name="' + currentElem.data('name') + '"]').removeClass("nekaKlasa2");
            $('#favnav').find('[data-name="' + currentElem.data('name') + '"]').remove();
            $.notify('Removed from list - "' + currentElem.data('name') + '"',"success", {
                showAnimation: 'slideUp',
                hideAnimation: 'slideDown',
                autohide: true,
                globalPosition: "right bottom",
                clickToHide: true
        });
        }
        $("#favnav").addClass("is--visible");
        $(document).load(doSomething());
    });

//////////////////////////////////
///MENU CHANGE / CLICK START/////
///GENERATE IFRAMES MODULES/////
///////////////////////////////

    function doSomething() {
        $('.nekaKlasa2').click(function () {
            $('#loader-wrapper-confezione').show();
            $('#bodyid').css("overflow", "hidden;");

            var link = $(this).data('link');
            var name = $(this).data('name');
            var iframe_elem = '<div style="overflow:auto;-webkit-overflow-scrolling:touch"><iframe src=" ' + link + ' "class="iframe_load" onload="resizeIframe(this)" frameBorder="0" style="overflow:hidden;width:100%;"width="100%" ></iframe></div>';
            var close_frame = '<a href="#" class="closeIframeHolder"><img class="btn_delete" src="./dashboard/images/delete-button.svg" style="height: 15px; width:15px;"/></a>';
            // append a new div to your tab container
            $('.tab_content').find('.tabs_item').hide(); // hide already shown content
            $('.tabs').append('<li class="iframeNameHolder"><a class="tabName" href="#" style="border-top-left-radius: 25px;-webkit-border-top-left-radius:25px;">' + name + close_frame + '</a></li>');
            $('.tab_content').append('<div class="tabs_item" style="display:block;">' + iframe_elem + '</div>');
            $('.tab ul.tabs .current').removeClass('current');
            $('.tab ul.tabs').removeClass('active');
            $('.tab ul.tabs').addClass('active').find('li').last().addClass('current');

            $(".iframe_load").load(function () {
                setTimeout(function () {
                        $('#loader-wrapper-confezione').hide();
                        $('#bodyid').css("overflow", "auto;");
                    },
                    200);
            });
        });
    };

    $(".nekaKlasa").on("click", function (e) {
        e.preventDefault();
            $('#loader-wrapper-confezione').show();
            $('#bodyid').css("overflow", "hidden;");

            var link = $(this).data('link');
            var name = $(this).data('name');
        var iframe_elem = '<div style="overflow:auto;-webkit-overflow-scrolling:touch"><iframe src=" ' + link + ' "class="iframe_load" onload="resizeIframe(this)" frameBorder="0" style="overflow:hidden;width:100%;"width="100%"></iframe></div>';
            var close_frame = '<a href="#" class="closeIframeHolder"><img class="btn_delete" src="./dashboard/images/delete-button.svg" style="height: 15px; width:15px;"/></a>';
            // append a new div to your tab container
            $('.tab_content').find('.tabs_item').hide(); // hide already shown content
            $('.tabs').append('<li class="iframeNameHolder"><a class="tabName" href="#" style="border-top-left-radius: 35px;-webkit-border-top-left-radius:35px;">' + name + close_frame + '</a></li>');
            $('.tab_content').append('<div class="tabs_item" style="display:block;">' + iframe_elem + '</div>');
            $('.tab ul.tabs .current').removeClass('current');
            $('.tab ul.tabs').removeClass('active');
            $('.tab ul.tabs').addClass('active').find('li').last().addClass('current');
            $('.container-fluid').find('.show').removeClass('show').addClass('peki');
            $(".iframe_load").load(function () {
                setTimeout(function () {
                    $('#loader-wrapper-confezione').hide();
                    $('#bodyid').css("overflow", "auto;");
                },
                    200);
            });
    });
    //pomeranje po tabovima i prikazivanje selektovanog
    $('.tab').on('click', '.tabName', function (e) {
        e.preventDefault();
        var tab = $(this).closest('.tab'),
            index = $(this).closest('li').index();
        if ($(this).closest('li').hasClass('current')) {
            $(this).closest('.tab').find('.current').removeClass('current');
            tab.find('.tab_content').find('div.tabs_item').slideUp(); // sakri sve tabove
            console.log('Sakriveno');
            $('.container-fluid').find('.peki').removeClass('peki').addClass('show');
        } else {
            $(this).closest('.tab').find('.current').removeClass('current');
            $(this).closest('li').addClass('current');
            tab.find('.tab_content').find('div.tabs_item').hide(); // sakri sve tabove
            tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();
            console.log('Pokazano');
            $('.container-fluid').find('.show').removeClass('show').addClass('peki');
        }
    });

    
    $(".btnback").on("click", function (e) {
        e.preventDefault();
        $(".iframeNameHolder").removeClass("current");
        $(".tabs_item").hide();
        $('.container-fluid').find('.peki').removeClass('peki').addClass('show');

    });

    $('.tab').on('click', ".closeIframeHolder", function (e) {
        e.preventDefault();
        var orderNumberClicked = $(this).closest('li').index();
        $(this).closest(".iframeNameHolder").remove();
        $('.tab_content').find('.tabs_item').eq(orderNumberClicked).remove();
        $('.tab ul.tabs').addClass('active').find('li').last().addClass('current').find('.tabName').click();
        $('.container-fluid').find('.peki').removeClass('peki').addClass('show');
        $('#loader-wrapper-confezione').hide();
    });

    //DEFAULT HIDDEN
    $("#menu_prod").hide();
    $("#menu_riso").hide();
    $("#menu_riso_scheda_dipedente").hide();

    $("#menu_prod_conf_dp").hide();
    $("#menu_prod_conf_db").hide();
    $("#menu_prod_stiro_dp").hide();
    $("#menu_prod_stiro_db").hide();
    $("#menu_prod_tess_dp").hide();
    $("#menu_prod_tess_db").hide();
    $("#menu_prod_conf").hide();
    $("#menu_prod_stiro").hide();
    $("#menu_prod_tess").hide();

    $("#conf_chooser").hide();
    $("#stiro_chooser").hide();
    $("#tess_chooser").hide();
    ////
    $("#lvl_two_riso_statistiche").hide();
    $("#riso_bread_stat").hide();
    $("#menu_riso_stat").hide();
    ////
    ////
    $("#lvl_two_riso_organigrammi").hide();
    $("#riso_bread_org").hide();
    $("#menu_riso_org").hide();
    ////
    ////
    $("#lvl_two_riso_database").hide();
    $("#riso_bread_db").hide();
    $("#menu_riso_db").hide();
    ////
    ////
    $("#lvl_two_riso_chat").hide();
    $("#riso_bread_chat").hide();
    $("#menu_riso_chat").hide();
    $("#menu_riso_stat_generale").hide();
    $("#menu_riso_stat_tessitura").hide();
    $("#menu_riso_stat_confezione").hide();
    $("#menu_riso_stat_stiro").hide();
    $("#menu_riso_stat_strutura").hide();
    ////
    ////
    $("#lvl_three_riso_statistiche_generale").hide();
    $("#lvl_three_riso_statistiche_tessitura").hide();
    $("#lvl_three_riso_statistiche_confezione").hide();
    $("#lvl_three_riso_statistiche_lavanderia").hide();
    $("#lvl_three_riso_statistiche_stiro").hide();
    $("#lvl_three_riso_statistiche_struttura").hide();
    $("#riso_bread_stat_bck").hide();
    $(".title").show();
    //SMART FACTORY
    $("#lvl_one_smart").hide();
//////////////////////////////////////////////////////////////////////////////
// MENU CHANGE / CLICK END                                                  //
//////////////////////////////////////////////////////////////////////////////
    //DEFAULT
    $("#lvl_one_prod").addClass("hide");
    $("#lvl_one_riso").hide();

    $("#lvl_two_conf").addClass("hide");
    $("#lvl_two_conf").removeClass("show");

    $("#lvl_two_riso_scheda_dipedenti").hide();

    $("#lvl_two_stiro").addClass("hide");
    $("#lvl_two_stiro").removeClass("show");
    $("#lvl_two_tess").addClass("hide");
    $("#lvl_two_tess").removeClass("show");

    $("#conf_bread").hide();
    $("#stiro_bread").hide();
    $("#tess_bread").hide();

    $("#produzione_bread").hide();
    $("#riso_bread").hide();
    $("#riso_bread_scheda_dipedenti").hide();
    $("#default_bread").show();

    //HIDE DEFAULT DATI BASE CONFEZIONE
    $("#db_conf_bread").addClass("hide");
    $("#db_conf_bread").removeClass("show");

    //ALL VIEW (TUTTI)
    $("#tutti_close").addClass("hide");

    $("#all").click(function() {
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
        $(".title").hide();
    });
    //CLOSE TUTTI
    $("#tutti_close").click(function() {
        $("#tutti_close").addClass("hide");
    });

    $("#prior").click(function() {
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
        $(".title").show();
    });
    //MENU ALL - CLICK
    $("#menu_all").click(function() {
        $("#menu").show();
        $("#menu_prod").hide();
        $("#menu_riso").hide();
        $("#menu_riso_scheda_dipedenti").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#conf_chooser").hide();
        $("#stiro_chooser").hide();
        $("#tess_chooser").hide();
        $("#smart_bread").hide();
        $("#menu_smart").hide();
        $("#lvl_one_smart").hide();
        //ALL
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_scheda_dipedenti").hide();
        $("#riso_bread_scheda_dipedenti").hide();
        $("#menu_riso_scheda_dipedente").hide();
        $("#lvl_two_riso_organigrammi").hide();
        $("#riso_bread_org").hide();
        $("#menu_riso_org").hide();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#lvl_two_riso_database").hide();
        $("#riso_bread_db").hide();
        $("#menu_riso_db").hide();
        $("#lvl_two_riso_chat").hide();
        $("#riso_bread_chat").hide();
        $("#menu_riso_chat").hide();
        $("#lvl_three_riso_statistiche_generale").hide();
        $("#lvl_three_riso_statistiche_tessitura").hide();
        $("#lvl_three_riso_statistiche_confezione").hide();
        $("#lvl_three_riso_statistiche_lavanderia").hide();
        $("#lvl_three_riso_statistiche_stiro").hide();
        $("#lvl_three_riso_statistiche_struttura").hide();
        $("#riso_bread_stat_bck").hide();
        $("#menu_riso_stat_generale").hide();
        $("#menu_riso_stat_tessitura").hide();
        $("#menu_riso_stat_confezione").hide();
        $("#menu_riso_stat_stiro").hide();
        $("#menu_riso_stat_strutura").hide();
        $("#btn_back_prod").click();
    });
    //LVL 0 - PROD CLICK EVENT
    $("#prod").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        }
        else {
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
        };
    });
    //PROD BACK
    $("#btn_back_prod").click(function () {
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
        $("#menu_riso").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
    });
    //BACK TO PRODUCTION    
    $("#btn_back_conf").click(function() {
        $("#prod").click();
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
    $("#conf").click(function() {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        } else {
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
            $("#dp_stiro").removeClass("active");
            $("#db_stiro").removeClass("active");
            //CONFEZIONE CHOOSER
            $("#conf_chooser").show();
        }
    });
    //CONFEZIONE CHOOSER
    $("#conf_dp_start").click(function() {
        $("#dp_conf").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");
    });

    $("#conf_db_start").click(function() {
        $("#db_conf").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_conf").addClass("show");
        $("#lvl_two_conf").removeClass("hide");
    });
    //DP CONFEZIONE CLICK
    $("#dp_conf").click(function() {
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
        $("#menu_prod_conf").hide();
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
    $("#db_conf").click(function() {
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
        $("#menu_prod_conf").hide();
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
    //STIRO CLICK EVENT                         //
    //////////////////////////////////////////////
    $("#stiro").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        } else {
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
            $("#dp_stiro").removeClass("active");
            $("#db_stiro").removeClass("active");
            //CONFEZIONE CHOOSER
            $("#stiro_chooser").show();
        }
    });
    //CONFEZIONE CHOOSER
    $("#stiro_dp_start").click(function() {
        $("#dp_stiro").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");
    });

    $("#stiro_db_start").click(function() {
        $("#db_stiro").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_stiro").addClass("show");
        $("#lvl_two_stiro").removeClass("hide");
    });
    //DP STIRO CLICK
    $("#dp_stiro").click(function() {
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
        $("#menu_prod_stiro").hide();
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
    $("#db_stiro").click(function() {
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
        $("#menu_prod_stiro").hide();
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
    $("#btn_back_stiro").click(function() {
        $("#prod").click();
        $("#stiro_chooser").hide();
        $("#stiro_bread").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
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
    //TESSITURA CLICK EVENT
    $("#tess").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        } else {
            //SHOW BREADCRAMP
            $("#menu_prod_tess").show();
            $("#tess_bread").show();
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
            $("#tess_chooser").show();
        }
    });
    //CONFEZIONE CHOOSER
    $("#tess_dp_start").click(function() {
        $("#dp_tess").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_tess").addClass("show");
        $("#lvl_two_tess").removeClass("hide");
    });

    $("#tess_db_start").click(function() {
        $("#db_tess").click();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
        $("#lvl_two_tess").addClass("show");
        $("#lvl_two_tess").removeClass("hide");
    });

    //DP STIRO CLICK
    $("#dp_tess").click(function() {
        $("#frame_tess_div_hide").show();
        $("#tess_chooser").hide();
        //ACTIVE BREADCRAMP
        $("#dp_tess").addClass("active");
        $("#db_tess").removeClass("active");
        //SHOW DP
        $("#dp_tess_bread").addClass("show");
        $("#dp_tess_bread").removeClass("hide");
        //HIDE DB
        $("#db_tess_bread").addClass("hide");
        $("#db_tess_bread").removeClass("show");
        $("#menu_prod_tess_dp").show();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess").hide();
        $("#menu_prod").hide();
        //CLEAR HIDE FRAME
        $("#frame_tess_div").hide();
        $("#frame_tess_div_db").hide();
        var iframe = $("#frame_tess");
        iframe.attr('src', '');
        var iframe1 = $("#frame_tess_db");
        iframe1.attr('src', '');
        $("#db_tess_close").hide();
        $("#lvl_two_tess").addClass("show");
        $("#lvl_two_tess").removeClass("hide");
    });
    //DB STIRO CLICK
    $("#db_tess").click(function() {
        $("#frame_tess_div_db_hide").show();
        $("#tess_chooser").hide();
        //ACTIVE BREADCRAMP
        $("#dp_tess").removeClass("active");
        $("#db_tess").addClass("active");
        //SHOW DB
        $("#db_tess_bread").addClass("show");
        $("#db_tess_bread").removeClass("hide");
        //HIDE DP
        $("#dp_tess_bread").addClass("hide");
        $("#dp_tess_bread").removeClass("show");
        $("#menu_prod_tess").hide();
        $("#menu_prod_tess_db").show();
        $("#menu_prod").hide();
        $("#menu_prod_tess_dp").hide();
        //CLEAR HIDE FRAME
        $("#frame_tess_div").hide();
        $("#frame_tess_div_db").hide();
        var iframe = $("#frame_tess");
        iframe.attr('src', '');
        var iframe1 = $("#frame_tess_db");
        iframe1.attr('src', '');
        $("#db_tess_close").hide();
        $("#lvl_two_tess").addClass("show");
        $("#lvl_two_tess").removeClass("hide");
    });

    $("#db_tess_close").hide();
    //BACK TO PRODUCTION    
    $("#btn_back_tess").click(function() {
        $("#prod").click();
        $("#tess_chooser").hide();
        $("#tess_bread").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
        $("#frame_tess_div_hide").hide();
        $("#frame_tess_div_db_hide").hide();
        //CLEAR HIDE FRAME
        $("#frame_tess_div").hide();
        $("#frame_tess_div_db").hide();
        var iframe = $("#frame_tess");
        iframe.attr('src', '');
        var iframe1 = $("#frame_tess_db");
        iframe1.attr('src', '');
        $("#db_tess_close").hide();
        $("#menu_prod_conf").hide();
        $("#menu_prod_stiro").hide();
        $("#menu_prod_tess").hide();
    });
    //HIDE DEFAULT DATI BASE STIRO
    $("#db_tess_bread").addClass("hide");
    $("#db_tess_bread").removeClass("show");
///////////////////////////////////////////
// RISORSO UMANE                         //
///////////////////////////////////////////
//LVL 0 - RISO CLICK EVENT
    $("#riso").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        }
        else {
            $("#lvl_zero").addClass("hide");
            $("#lvl_zero").removeClass("show");
            //SHOW PRODUCTION
            $("#lvl_one_riso").show();
            $("#riso_bread").show();
            $("#default_bread").hide();
            ////SHOW - HIDE MENUS
            $("#menu_riso").show();
            $("#menu").hide();
            $("#menu_prod_conf_db").hide();
            $("#menu_prod_conf_dp").hide();
            $("#menu_prod_stiro_dp").hide();
            $("#menu_prod_stiro_db").hide();
        }
    });
    //RISO BACK
    $("#btn_back_riso").click(function () {
        $("#riso_bread").hide();
        $("#lvl_zero").addClass("show");
        $("#lvl_zero").removeClass("hide");
        $("#stiro_bread").hide();
        $("#conf_bread").hide();
        $("#default_bread").show();
        //HIDE PRODUCTION
        $("#lvl_one_riso").hide();
        //HIDE CONFEZIONE
        $("#lvl_two_conf").addClass("hide");
        $("#lvl_two_conf").removeClass("show");
        //HIDE STIRO
        $("#lvl_two_stiro").addClass("hide");
        $("#lvl_two_stiro").removeClass("show");
        // SHOW - HIDE MENUS
        $("#menu").show();
        $("#menu_prod").hide();
        $("#menu_riso").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
    });
    //SCHEDA DIPEDENTI CLICK
    $("#riso_scheda").click(function() {
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_scheda_dipedenti").show();
        $("#riso_bread_scheda_dipedenti").show();
        $("#menu_riso_scheda_dipedente").show();
    });

    $("#btn_back_to_riso").click(function () {
        $("#lvl_one_riso").show();
        $("#riso_bread").show();
        $("#menu_riso").show();
        $("#lvl_two_riso_scheda_dipedenti").hide();
        $("#riso_bread_scheda_dipedenti").hide();
        $("#menu_riso_scheda_dipedente").hide();
    });
    //STATISTICHE
    $("#riso_stat").click(function () {
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_statistiche").show();
        $("#riso_bread_stat").show();
        $("#menu_riso_stat").show();
    });

    $("#btn_back_to_riso_u").click(function () {
        $("#lvl_one_riso").show();
        $("#riso_bread").show();
        $("#menu_riso").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
    });

    //STATISTICHE - GENERALE
    $("#riso_stat_generale").click(function () {
        $("#menu_riso_stat_generale").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#lvl_three_riso_statistiche_generale").show();
        $("#riso_bread_stat_bck").show();
    });
    
    $("#btn_back_to_riso_stat").click(function () {
        $("#menu_riso_stat_generale").hide();
        $("#menu_riso_stat_tessitura").hide();
        $("#menu_riso_stat_confezione").hide();
        $("#menu_riso_stat_stiro").hide();
        $("#menu_riso_stat_strutura").hide();
        $("#lvl_three_riso_statistiche_generale").hide();
        $("#lvl_three_riso_statistiche_tessitura").hide();
        $("#lvl_three_riso_statistiche_confezione").hide();
        $("#lvl_three_riso_statistiche_lavanderia").hide();
        $("#lvl_three_riso_statistiche_stiro").hide();
        $("#lvl_three_riso_statistiche_struttura").hide();
        $("#riso_bread_stat_bck").hide();
        $("#lvl_two_riso_statistiche").show();
        $("#riso_bread_stat").show();
        $("#menu_riso_stat").show();
        $("#left-navi").show();
    });
    //STATISTICHE - TESSITURA
    $("#riso_stat_tess").click(function () {
        $("#menu_riso_stat_tessitura").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#lvl_three_riso_statistiche_tessitura").show();
        $("#riso_bread_stat_bck").show();
    });
    //STATISTICHE - CONFEZIONE
    $("#riso_stat_conf").click(function () {
        $("#menu_riso_stat_confezione").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        //$("#left-navi").hide();
        $("#lvl_three_riso_statistiche_confezione").show();
        $("#riso_bread_stat_bck").show();
    });
    //STATISTICHE - LAVANDERIA
    $("#riso_stat_lava").click(function () {
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#left-navi").hide();
        $("#lvl_three_riso_statistiche_lavanderia").show();
        $("#riso_bread_stat_bck").show();
    });
    //STATISTICHE - STIRO
    $("#riso_stat_stiro").click(function () {
        $("#menu_riso_stat_stiro").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#lvl_three_riso_statistiche_stiro").show();
        $("#riso_bread_stat_bck").show();
    });
    //STATISTICHE - STRUTTURA
    $("#riso_stat_strut").click(function () {
        $("#menu_riso_stat_strutura").show();
        $("#lvl_two_riso_statistiche").hide();
        $("#riso_bread_stat").hide();
        $("#menu_riso_stat").hide();
        $("#lvl_three_riso_statistiche_struttura").show();
        $("#riso_bread_stat_bck").show();
    });
    //ORGANIGRAMMI
    $("#riso_organigrammi").click(function () {
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_organigrammi").show();
        $("#riso_bread_org").show();
        $("#menu_riso_org").show();
    });

    $("#btn_back_to_riso_uorg").click(function () {
        $("#lvl_one_riso").show();
        $("#riso_bread").show();
        $("#menu_riso").show();
        $("#lvl_two_riso_organigrammi").hide();
        $("#riso_bread_org").hide();
        $("#menu_riso_org").hide();
    });
    //DATABASE
    $("#riso_database").click(function () {
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_database").show();
        $("#riso_bread_db").show();
        $("#menu_riso_db").show();
    });

    $("#btn_back_to_riso_udb").click(function () {
        $("#lvl_one_riso").show();
        $("#riso_bread").show();
        $("#menu_riso").show();
        $("#lvl_two_riso_database").hide();
        $("#riso_bread_db").hide();
        $("#menu_riso_db").hide();
    });
    //CHAT INTERNA
    $("#riso_chat").click(function() {
        $("#lvl_one_riso").hide();
        $("#menu_riso").hide();
        $("#riso_bread").hide();
        $("#lvl_two_riso_chat").show();
        $("#riso_bread_chat").show();
        $("#menu_riso_chat").show();
    });

    $("#btn_back_to_riso_uchat").click(function() {
        $("#lvl_one_riso").show();
        $("#riso_bread").show();
        $("#menu_riso").show();
        $("#lvl_two_riso_chat").hide();
        $("#riso_bread_chat").hide();
        $("#menu_riso_chat").hide();
    });
 /////////////////
// RISORSO END //
///////////////////////////////////////////
//  SMART FACTORY BEGIN                  //
///////////////////////////////////////////
    $("#smart_bread").hide();
    $("#menu_smart").hide();
    //LVL 0 - RISO CLICK EVENT
    $("#smart").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        }
        else {
            $("#lvl_zero").addClass("hide");
            $("#lvl_zero").removeClass("show");
            //SHOW PRODUCTION
            $("#lvl_one_smart").show();
            $("#smart_bread").show();
            $("#default_bread").hide();
            //SHOW - HIDE MENUS
            $("#menu_smart").show();
            $("#menu").hide();
            $("#menu_prod_conf_db").hide();
            $("#menu_prod_conf_dp").hide();
            $("#menu_prod_stiro_dp").hide();
            $("#menu_prod_stiro_db").hide();
        }
    });
    //RISO BACK
    $("#btn_back_smart").click(function () {
        $("#smart_bread").hide();
        $("#lvl_zero").addClass("show");
        $("#lvl_zero").removeClass("hide");
        $("#stiro_bread").hide();
        $("#conf_bread").hide();
        $("#default_bread").show();
        //HIDE PRODUCTION
        $("#lvl_one_smart").hide();
        //HIDE CONFEZIONE
        $("#lvl_two_conf").addClass("hide");
        $("#lvl_two_conf").removeClass("show");
        //HIDE STIRO
        $("#lvl_two_stiro").addClass("hide");
        $("#lvl_two_stiro").removeClass("show");
        // SHOW - HIDE MENUS
        $("#menu").show();
        $("#menu_prod").hide();
        $("#menu_riso").hide();
        $("#menu_smart").hide();
        $("#menu_prod_conf_db").hide();
        $("#menu_prod_conf_dp").hide();
        $("#menu_prod_stiro_db").hide();
        $("#menu_prod_stiro_dp").hide();
        $("#menu_prod_tess_db").hide();
        $("#menu_prod_tess_dp").hide();
    });
//  SMART FACTORY END
///////////////////////////////////////////////////////////
//                       MENUES                          //
///////////////////////////////////////////////////////////
    $("#m_sinotico").click(function () {
        $("#tess_sinotico").click();
    });
    $("#m_cont").click(function() {
        $("#cont").click();
    });
    $("#m_prod").click(function() {
        $("#prod").click();
    });
    //CONF,STIRO,TESS
    $(".m_menu_all").click(function() {
        $("#menu_all").click();
    });
    $("#m_conf").click(function() {
        $("#conf").click();
    });
    $("#m_stiro").click(function() {
        $("#stiro").click();
    });
    $("#m_tess").click(function() {
        $("#tess").click();
    });
    //CONF,STIRO,TESS - DB,DP
    $("#m_conf_prod_dp").click(function() {
        $("#conf_dp_start").click();
    });
    $("#m_conf_prod_db").click(function() {
        $("#conf_db_start").click();
    });
    $("#m_stiro_prod_dp").click(function() {
        $("#stiro_dp_start").click();
    });
    $("#m_stiro_prod_db").click(function() {
        $("#stiro_db_start").click();
    });
    $("#m_tess_prod_dp").click(function() {
        $("#tess_dp_start").click();
    });
    $("#m_tess_prod_db").click(function() {
        $("#tess_db_start").click();
    });
    //CONFEZIONE DP
    $("#m_confa").click(function() {
        $("#conf_a_layout").click();
    });
    $("#m_confb").click(function() {
        $("#conf_b_layout").click();
    });
    $("#m_conf_org").click(function() {
        $("#conf_organigrama").click();
    });
    //CONFEZIONE DB
    $("#m_conf_faze").click(function() {
        $("#conf_faze").click();
    });
    $("#m_conf_article").click(function() {
        $("#conf_article").click();
    });
    $("#m_conf_clienti").click(function() {
        $("#conf_clienti").click();
    });
    $("#m_conf_machine").click(function() {
        $("#conf_machines").click();
    });
    $("#m_conf_persons").click(function() {
        $("#conf_persons").click();
    });
    $("#m_conf_tablets").click(function() {
        $("#conf_tablets").click();
    });
    //STIRO DP
    $("#m_stiro_lay").click(function() {
        $("#stiro_layout").click();
    });
    $("#m_stiro_org").click(function() {
        $("#stiro_organigramma").click();
    });
    $("#m_stiro_intervali").click(function() {
        $("#stiro_intervals").click();
    });
    //STIRO DB
    $("#m_stiro_faze").click(function() {
        $("#stiro_faze").click();
    });
    $("#m_stiro_article").click(function() {
        $("#stiro_article").click();
    });
    $("#m_stiro_clienti").click(function() {
        $("#stiro_clienti").click();
    });
    $("#m_stiro_machine").click(function() {
        $("#stiro_machines").click();
    });
    $("#m_stiro_persons").click(function() {
        $("#stiro_persons").click();
    });
    $("#m_stiro_tablets").click(function() {
        $("#stiro_tablets").click();
    });
    //RISO
    $("#m_riso").click(function() {
        $("#riso").click();
    });
    $("#m_timbrature").click(function () {
        $("#riso_timbrature").click();
    });
    $("#m_scheda_dipedenti").click(function() {
        $("#riso_scheda").click();
    });
    $("#m_statistiche").click(function() {
        $("#riso_stat").click();
    });
    $("#m_organigrammi").click(function() {
        $("#riso_organigrammi").click();
    });
    $("#m_database").click(function() {
        $("#riso_database").click();
    });
    $("#m_chat_interna").click(function() {
        $("#riso_chat").click();
    });
    //RISO STATISTICHE
    $("#m_riso_generale").click(function () {
        $("#riso_stat_generale").click();
    });
    $("#m_riso_tessitura").click(function () {
        $("#riso_stat_tess").click();
    });
    $("#m_riso_confezione").click(function () {
        $("#riso_stat_conf").click();
    });
    $("#m_riso_lavanderia").click(function () {
        $("#riso_stat_lava").click();
    });
    $("#m_riso_stiro").click(function () {
        $("#riso_stat_stiro").click();
    });
    $("#m_riso_strut").click(function () {
        $("#riso_stat_strut").click();
    });
    //RISO STATISTICHE GENERALE
    $("#m_riso_generale_organico").click(function () {
        $("#riso_org_generale").click();
    });
    $("#m_riso_generale_reparti").click(function () {
        $("#riso_stat_gene_reparti").click();
    });
    $("#m_riso_generale_assenteismo").click(function () {
        $("#riso_assenteismo").click();
    });
    $("#m_riso_generale_straordinario").click(function () {
        $("#riso_stat_gene_stra").click();
    });
    //RISO STATISTICHE TESSITURA
    $("#m_riso_tess_assenteismo").click(function () {
        $("#riso_stat_tess_ass").click();
    });
    $("#m_riso_tess_straordinario").click(function () {
        $("#riso_stat_tess_stra").click();
    });
    $("#m_riso_tess_presenze").click(function () {
        $("#riso_stat_tess_presenze").click();
    });
    //RISO STATISTICHE CONFEZIONE
    $("#m_riso_confa_assenteismo").click(function () {
        $("#riso_confa_ass").click();
    });
    $("#m_riso_confa_straordinario").click(function () {
        $("#riso_confa_stra").click();
    });
    $("#m_riso_confa_presenze").click(function () {
        $("#riso_confa_presenze").click();
    });
    $("#m_riso_confa_eff").click(function () {
        $("#riso_confa_eff").click();
    });
    $("#m_riso_confb_assenteismo").click(function () {
        $("#riso_confb_ass").click();
    });
    $("#m_riso_confb_straordinario").click(function () {
        $("#riso_stat_confb_stra").click();
    });
    $("#m_riso_confb_eff").click(function () {
        $("#riso_confb_eff").click();
    });
    //RISO STATISTICHE STIRO
    $("#m_riso_stiro_assenteismo").click(function () {
        $("#riso_stat_stiro_assenteismo").click();
    });
    $("#m_riso_stiro_straordinario").click(function () {
        $("#riso_stat_stiro_stra").click();
    });
    $("#m_riso_stiro_presenze").click(function () {
        $("#riso_stat_stiro_presenze").click();
    });
    $("#m_riso_stiro_eff").click(function () {
        $("#riso_stat_stiro_eff").click();
    });
    //RISO STATISTICHE STRUTTURA
    $("#m_riso_stat_assenteismo").click(function () {
        $("#riso_stat_stru_ass").click();
    });
    $("#m_riso_stat_straordinario").click(function () {
        $("#riso_stat_stru_stra").click();
    });
    //////////////////////////////////////////////////////////////////////////////
    //              CONTROLO DI GESTIONE - DATI BASE START                      //
    //////////////////////////////////////////////////////////////////////////////
    $("#frame_confezione_div_db").hide();
    $('#loader-wrapper-confezione').hide();
    $("#frame_confezione_div").hide();
    $("#lvl_one_cont").hide();
    $("#left-navi").show();
    $("#cont").click(function () {
        if ($(this).hasClass("disabled")) {
            this.preventDefault();
        }
        else {
            //HIDE DEFAULT MENU
            $("#left-navi").hide();
            //ZERO LVL HIDE
            $("#lvl_zero").addClass("hide");
            $("#lvl_zero").removeClass("show");
            $("#default_bread").hide();
            var iframe = $("#riso_frame");
            iframe.attr('src', 'http://habra.olimpias.it/Onlyou/');
            $("#lvl_one_cont").show();
        }
    });
    $("#lvl_zero").show();
    //EXIT CONTROLO DI GESTIONE
    $("#exit_controlo_di_gestione").click(function () {
        $("#lvl_one_cont").hide();
        $("#lvl_zero").removeClass("hide");
        $("#default_bread").show();
        $("#left-navi").show();
        var iframe = $("#riso_frame");
        iframe.attr('src', '');
    });
//////////////////////////////////////////////////////////////////////////////
//                  CONTROLO DI GESTIONE - DATI BASE END                    //
//////////////////////////////////////////////////////////////////////////////
    //select all checkboxes
    $("#check_cont").change(function () {  //"select all" change 
        var status = this.checked; // "select all" checked status
        $('.cont_checkbox').each(function () { //iterate all listed checkbox items
            this.checked = status; //change ".checkbox" checked status
        });
    });
    $('.cont_checkbox').change(function () { //".checkbox" change 
        //uncheck "select all", if one of the listed checkbox item is unchecked
        if (this.checked === false) { //if this item is unchecked
            $("#check_cont")[0].checked = false; //change "select all" checked status to false
        }
        //check "select all" if all checkbox items are checked
        if ($('cont_checkbox:checked').length === $('.cont_checkbox').length) {
            $("#check_cont")[0].checked = true; //change "select all" checked status to true
        }
    });
//////////////////////////////////////
//             CUSTOM CODE         //
/////////////////////////////////////
    $("#user-hidden").hide();
});

