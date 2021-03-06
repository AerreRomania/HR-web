﻿$(document).ready(function() {
    
    $(".role_check").on("click", function (e) {
        e.preventDefault();
        var currentElem = $(this);
        var user_drop_down = $("#req_user_drop_down");
        var dataToLog = { UserID: end, RoleID: currentElem.data('guid') }

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



    $(".nekaKlasa1").on("click", function (e) {
        e.preventDefault();
        var currentElem = $(this);
        var dataToLog = { username: $('#profil_username').html(), link: currentElem.data('link'), name: currentElem.data('name'), img: currentElem.data('img') }

        //var item = '<a href="#!" data-name="' + currentElem.data('name') + '"  data-link="' + currentElem.data('link') + '"  class="nekaKlasa2 card__status animated bounce">' + currentElem.data('name') + '</a>';
        var item = '<a href="#!" class="nekaKlasa2 card__status book" data-name="' + currentElem.data('name') + '" data-img="' + currentElem.data('img') + '" data-link="' + currentElem.data('link') + '" style="background-image:url(' + currentElem.data('img') + ');background-size: 90px; background-attachment: inherit; background-position: 47% 15%;"> <span>' + currentElem.data('name') + ' </span> </a>'
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

            $.notify('Added to list - "' + currentElem.data('name') + '"', "success", {
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

            $.notify('Removed from list - "' + currentElem.data('name') + '"', "success", {
                showAnimation: 'slideUp',
                hideAnimation: 'slideDown',
                autohide: true,
                globalPosition: "right bottom",
                clickToHide: true
            });

        }



    });


});