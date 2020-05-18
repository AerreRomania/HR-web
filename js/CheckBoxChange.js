$(document).ready(function () {
    //$('.styleForCheckbox').replaceWith("<img src='./css/resources/Images/img/MachinePic.png' class='styleForCheckbox'/>");
    document.getElementById("cbMorning").style.display = 'none';
    if ($("#cbMorning").prop('checked')) {
        console.log("Morning Checked");
        document.getElementById("imageMorning").src = "./css/resources/Images/img/machine_small.gif";
        var $checkbox = $(this);
        $checkbox.prop('checked', true);
    }
    else {
        console.log("Morning Unchecked");
        document.getElementById("imageMorning").src = "./css/resources/Images/img/MachinePic.png";
        var $checkbox = $(this);
        $checkbox.prop('checked', false);
    }

    $('.styleForCheckbox').click(function () {
        console.log("Here");
        var $image = $(this);
        var $checkbox = $(this);

        $checkbox.prop('checked', !$checkbox.prop('checked'));
        if ($checkbox.prop("checked")) {
            document.getElementById("cbMorning").click();
            document.getElementById("cbMorning").style.display = 'none';
            //$image.attr("src", "./css/resources/Images/img/machine_small.GIF");
            document.getElementById("imageMorning").src = "./css/resources/Images/img/machine_small.gif";
            console.log("1");
        } else {
            document.getElementById("cbMorning").click();
            //document.getElementById("cbMorning").checked = false;
            document.getElementById("cbMorning").style.display = 'none';
            //$image.attr("src", "./css/resources/Images/img/MachinePic.png");
            document.getElementById("imageMorning").src = "./css/resources/Images/img/machine_small.gif";
            console.log("2");
        }
    })
})