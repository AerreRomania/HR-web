$(document).ready(function () {
    $('#msg_messages .sent').hide();
    $('#msg_messages .replies').hide();

    $("#msg_close").click(function () {
        $("#messages_control").toggleClass("req_msg_hidden");
        $("#messages_control").toggleClass("req_msg_show");    
    });
    
    $(".contact").click(function () {
        $("#msg_selected_usr").text($(this).find('.wrap .meta .name').text());
        $("#msg_selected_img").attr("src", ($(this).find('.wrap img').attr('src')));

        $(".replies img").attr("src", $('#small_profile').attr('src'));

        //Toggle class for li's
        $('#msg_ul .contact').not(this).removeClass('active').addClass('inactive');
        $(this).addClass('active').removeClass('inactive');
        
        //SHOW ACTIVE MESSAGE
        if ($(this).hasClass("active")) {
            var name = $(this).attr('data-name');
            $('#msg_messages .sent').show();
            $('#msg_messages .sent:not(.' + name + ')').hide();
            $('#msg_messages .replies').show();
            $('#msg_messages .replies:not(.' + name + ')').hide();
        } else {
            $('#msg_messages .sent').show();
            $('#msg_messages .replies').show();
        }
        //SCROLL TO BOTTOM
        $('.messages').animate({ scrollTop: $(document).height() + $('.messages').height() });
    });


    $("#msg_submit").on("click", function (e) {
        e.preventDefault();

        //SCROLL TO BOTTOM
        $('.messages').animate({ scrollTop: $(document).height() + $('.messages').height() });

        var sendto = $('.contact.active').data('name');
        var sendfrom = $('#profil_username').text();
        var msgs = $('#msg_text').val();
        
        $('#msg_ul').find('active').data('name');

        var dataToLog = { msg_to: sendto, msg_from: sendfrom, msg: msgs }

            //ADD TO DB
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataToLog),
                url: "WebService.asmx/SendMessage",
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });
    });

    
    $("#chat_control_icon").click(function () {
        $("#messages_control").toggleClass("req_msg_hidden");
        $("#messages_control").toggleClass("req_msg_show");        
    });

    $(".messages").animate({ scrollTop: $(document).height() }, "fast");

    $("#profile-img").click(function () {
        $("#status-options").toggleClass("active");
    });

    $(".expand-button").click(function () {
        $("#profile").toggleClass("expanded");
        $("#contacts").toggleClass("expanded");
    });

    $("#status-options ul li").click(function () {
        $("#profile-img").removeClass();
        $("#status-online").removeClass("active");
        $("#status-away").removeClass("active");
        $("#status-busy").removeClass("active");
        $("#status-offline").removeClass("active");
        $(this).addClass("active");

        if ($("#status-online").hasClass("active")) {
            $("#profile-img").addClass("online");
        } else if ($("#status-away").hasClass("active")) {
            $("#profile-img").addClass("away");
        } else if ($("#status-busy").hasClass("active")) {
            $("#profile-img").addClass("busy");
        } else if ($("#status-offline").hasClass("active")) {
            $("#profile-img").addClass("offline");
        } else {
            $("#profile-img").removeClass();
        };

        $("#status-options").removeClass("active");
    });

    function newMessage() {
        message = $(".message-input input").val();
        if ($.trim(message) == '') {
            return false;
        }

        var img = $('#small_profile').attr('src');
        var msgto = $('.contact.active').data('name');

        $('<li class="replies ' + msgto +'"><img src="' + img+'" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
        $('.message-input input').val(null);
        $('.contact.active .preview').html('<span>You: </span>' + message);
        $(".messages").animate({ scrollTop: $(document).height() }, "fast");
    };

    $('.submit').click(function () {
        newMessage();
    });

    $(window).on('keydown', function (e) {
        if (e.which == 13) {
            $("#msg_submit").click();
            newMessage();           
            return false;
        }
    });

});