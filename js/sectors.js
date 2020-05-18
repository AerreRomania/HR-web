  $(document).ready(function () {
            $("#lvl_dva_produzione").hide();
            $("#conf_dva").hide();
            $("#stir_dva").hide();
            $("#bread").hide();
            $("#dati_base").hide();
            $("#dati_base_stiro").hide();
            $("#dt_lvldva").addClass("active");
            $("#dt_lvldvastiro").addClass("active");

      
            $("#prod").click(function () {
                $("#lvl_jedan_aio").hide();
                $("#lvl_dva_produzione").show();
                $("#bread_lvldva").show();
            });
            $("#bread_lvldva").click(function () {
                $("#lvl_jedan_aio").show();
                $("#lvl_dva_produzione").hide();
            });


            $("#conf").click(function () {
                $("#lvl_dva_produzione").hide();
                $("#conf_dva").show();
            });
            $("#bread_lvlconf").click(function () {
                $("#conf_dva").hide();
                $("#lvl_dva_produzione").show();
            });


            $("#stir").click(function () {
                $("#lvl_dva_produzione").hide();
                $("#stir_dva").show();
            });
            $("#bread_lvldvastir").click(function () {
                $("#stir_dva").hide();
                $("#lvl_dva_produzione").show();
            });

            $("#db_lvldva").click(function () {
                $("#dati_base").show();
                $("#dati_produzione").hide();
                $("#dt_lvldva").removeClass("active");
                $("#db_lvldva").addClass("active");
            });

            $("#dt_lvldva").click(function () {
                $("#dati_base").hide();
                $("#dati_produzione").show();
                $("#db_lvldva").removeClass("active");
                $("#dt_lvldva").addClass("active");

            });

            $("#db_lvldvastiro").click(function () {
                $("#dati_base_stiro").show();
                $("#dati_produzione_stiro").hide();
                $("#dt_lvldvastiro").removeClass("active");
                $("#db_lvldvastiro").addClass("active");
            });

            $("#dt_lvldvastiro").click(function () {
                $("#dati_base_stiro").hide();
                $("#dati_produzione_stiro").show();
                $("#db_lvldvastiro").removeClass("active");
                $("#dt_lvldvastiro").addClass("active");
            });

            //STIRO DP - DT

            $("#frame_stiro_div").hide();
            $("#stiro_frame_start").click(function () {

                //loader
                $('#loader-wrapper').show();
                $('#frame_stiro').load(function () {
                    setTimeout(function () {
                        $('body').addClass('loaded');
                    }, 200);
                });

                
                var iframe = $("#frame_stiro");
                iframe.attr('src', './Stiro.aspx');
                $("#frame_stiro_div").show();
                $("#exit_frame_stiro").show();
                $('body').removeClass('loaded');


            });
            //ORGANIGRAMA
            $("#stiro_organigrama_frame_start").click(function () {

                var iframe = $("#frame_stiro");
                iframe.attr('src', './ReportStiro_Light.aspx');
                $("#frame_stiro_div").show();
                $("#exit_frame_stiro").show();
            });

            //MACHINES
            $("#machine_stiro_frame_start").click(function () {

                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-machine-stiro.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();
            });


            //PERSONS
            $("#persons_stiro_frame_start").click(function () {
                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-addemployee-stiro.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();
            });
            //TABLETS
            $("#tablets_stiro_frame_start").click(function () {
                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-angajati-stiro.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();
            });

            //INTERVALS
            $("#stiro_intervals_frame_start").click(function () {

                //loader
                $('#loader-wrapper').show();
                $('#frame_stiro').load(function () {
                    setTimeout(function () {
                        $('body').addClass('loaded');
                    }, 200);
                });

                var iframe = $("#frame_stiro");
                iframe.attr('src', './form-intervali-stiro.aspx');
                $("#frame_stiro_div").show();
                $("#exit_frame_stiro").show();
                $('body').removeClass('loaded');

            });

            //ARTICLE
            $("#frame_stiro_div_db").hide();
            $("#stiro_article_frame_start").click(function () {
                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-article-stiro.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();

            });

            //FAZE
            $("#frame_stiro_div_db").hide();
            $("#stiro_faze_frame_start").click(function () {
                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-faze-stiro.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();

            });

            //stiro_clieti
            $("#frame_stiro_div_db").hide();
            $("#clieti_stiro_frame_start").click(function () {
                var iframe = $("#frame_stiro_db");
                iframe.attr('src', './form-gestione-clienti.aspx');
                $("#frame_stiro_div_db").show();
                $("#exit_frame_stiro").show();

            });

            //EXIT FRAME STIRO
            $("#exit_frame_stiro").hide();
            $("#exit_frame_stiro").click(function () {

                $("#frame_stiro_div").hide();
                $("#frame_stiro_div_db").hide();

                $("#exit_frame_stiro").hide();

                var iframe = $("#frame_stiro");
                iframe.attr('src', '');
                var iframe1 = $("#frame_stiro_db");
                iframe1.attr('src', '');


            });

            //CONFEZIONE DP - DT
            //CONFZIONE A - Click
            $("#frame_confezione_div").hide();
            $("#confezionea_frame_start").click(function () {

                //loader
                $('#loader-wrapper-confezione').show();
                $('#frame_confezione').load(function () {
                    setTimeout(function () {
                        $('body').addClass('loaded');
                    }, 200);
                });
          
                var iframe = $("#frame_confezione");
                iframe.attr('src', './ConfezioneA.aspx');
                $("#frame_confezione_div").show();
                $("#exit_frame_confezione").show();
                $('body').removeClass('loaded');

            });
            //CONFEZIONE B - Click
            $("#confezioneb_frame_start").click(function () {

                //loader
                $('#loader-wrapper-confezione').show();
                $('#frame_confezione').load(function () {
                    setTimeout(function () {
                        $('body').addClass('loaded');
                    }, 200);
                });


                var iframe = $("#frame_confezione");
                iframe.attr('src', './ConfezioneB.aspx');
                $("#frame_confezione_div").show();
                $("#exit_frame_confezione").show();
                $('body').removeClass('loaded');

            });

            //ORGANIGRAMA - Click
            $("#organigrama_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione");
                iframe.attr('src', './Report_Light.aspx');
                $("#frame_confezione_div").show();
                $("#exit_frame_confezione").show();
            });


            //ARTICLE
            $("#article_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-article.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });

            //MACHINES
            $("#machine_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-machine.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });

            //CLIETI
            $("#clienti_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-gestione-clienti.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });

            //FAZE
            $("#faze_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-faze.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });

            //PERSONS
            $("#persons_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-addemployee.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });
            //TABLETS
            $("#tablets_conf_frame_start").click(function () {
                var iframe = $("#frame_confezione_db");
                iframe.attr('src', './form-angajati.aspx');
                $("#frame_confezione_div_db").show();
                $("#exit_frame_confezione").show();
            });

            //EXIT FRAME CONFEZIONE
            $("#exit_frame_confezione").hide();
            $("#exit_frame_confezione").click(function () {

                $("#frame_confezione_div").hide();
                $("#frame_confezione_div_db").hide();

                $("#exit_frame_confezione").hide();

                var iframe = $("#frame_confezione");
                iframe.attr('src', '');
                var iframe1 = $("#frame_confezione_db");
                iframe1.attr('src', '');

         

            });



            //DB
            $("#frame_confezione_div_db").hide();
            //$("#").click(function () {
            //    var iframe = $("#frame_confezione_db");
            //    iframe.attr('src', './form-article.aspx');
            //    $("#frame_confezione_div_db").show();
            //    $("#exit_frame_confezione").show();
            //});            
        });