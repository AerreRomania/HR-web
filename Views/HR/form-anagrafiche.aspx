<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form-anagrafiche.aspx.cs" Inherits="Views.HR.form_anagrafiche" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title></title>
        <style type="text/css">
    * {
      box-sizing: border-box;
        font-family: 'Exo', sans-serif !important;
    }

    html {
      width: 100%;
      height: 100%;
      overflow: hidden!important;
    }

    body{
            margin: 0!important;
            margin-top:10px;
    }

    video {
      border-radius: 6px;
    }

    .accordion {
        background-color: #eee;
        color: #444;
        cursor: pointer;
        padding: 18px;
        width: 100%;
        border: none;
        text-align: left;
        outline: none;
        font-size: 15px;
        transition: 0.4s;
    }

    .active, .accordion:hover {
        background-color: #ccc; 
    }

    .panel {
        padding: 0 18px;
        display: none;
        background-color: white;
        overflow: hidden;
    }

    /* video container */
    .videoContainer {
        width: 380px;
        height: 163px;
        position: relative;
        overflow: hidden;
        background: #000;
        margin-top: 50px;
        margin-left: 50px;
        color: #ccc;
        border-radius: 6px;
        border: 1px solid rgba(0, 0, 0, 0.8);
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    }

    .videoContainer:before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.3);
      z-index: 6;
      border-radius: 6px;
      pointer-events: none;
    }

    /* video caption css */
    .caption {
      display: none;
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      padding: 5px 10px;
      color: black;
      font-size: 14px;
      font-weight: 300;
      text-align: center;
      background: #b7b6b6;
      text-transform: uppercase;
      border-radius: 6px 6px 0 0;
      -webkit-backface-visibility: hidden;
      -moz-backface-visibility: hidden;
      -ms-backface-visibility: hidden;
    }

    /*** VIDEO CONTROLS CSS ***/
    /* control holder */
    .control {
      color: #ccc;
      position: absolute;
      bottom: 10px;
      left: 10px;
      width: 360px;
      z-index: 5;
      display: none;
    }

    /* control bottom part */
    .btmControl {
      clear: both;
    }

    .control .btnPlay {
      float: left;
      width: 34px;
      height: 30px;
      padding: 5px;
      background: rgba(0, 0, 0, 0.5);
      cursor: pointer;
      border-radius: 6px 0 0 6px;
      border: 1px solid rgba(0, 0, 0, 0.7);
      box-shadow: inset 0 0 1px rgba(255, 255, 255, 0.5);
    }

    .control .icon-play {
      background: url(https://s.cdpn.io/6035/vp_sprite.png) no-repeat -11px 0;
      width: 6px;
      height: 9px;
      display: block;
      margin: 4px 0 0 8px;
    }

    .control .icon-pause {
      background: url(https://s.cdpn.io/6035/vp_sprite.png) no-repeat -34px -1px;
      width: 8px;
      height: 9px;
      display: block;
      margin: 4px 0 0 8px;
    }

    .control .selected {
      font-size: 15px;
      color: #ccc;
    }

    .control .sound {
      width: 30px;
      height: 30px;
      float: left;
      background: rgba(0, 0, 0, 0.5);
      border: 1px solid rgba(0, 0, 0, 0.7);
      border-left: none;
      box-shadow: inset 0 0 1px rgba(255, 255, 255, 0.5);
      cursor: pointer;
    }

    .control .icon-sound {
      background: url(https://s.cdpn.io/6035/vp_sprite.png) no-repeat -19px 0;
      width: 13px;
      height: 10px;
      display: block;
      margin: 8px 0 0 8px;
    }

    .control .muted .icon-sound {
      width: 7px !important;
    }

    .control .btnFS {
      width: 30px;
      height: 30px;
      border-radius: 0 6px 6px 0;
      float: left;
      background: rgba(0, 0, 0, 0.5);
      border: 1px solid rgba(0, 0, 0, 0.7);
      border-left: none;
      box-shadow: inset 0 0 1px rgba(255, 255, 255, 0.5);
    }

    .control .icon-fullscreen {
      background: url(https://s.cdpn.io/6035/vp_sprite.png) no-repeat 0 0;
      width: 10px;
      height: 10px;
      display: block;
      margin: 8px 0 0 9px;
    }

    /* PROGRESS BAR CSS */
    /* Progress bar */
    .progress-bar {
      height: 30px;
      padding: 10px;
      background: rgba(0, 0, 0, 0.6);
      border: 1px solid rgba(0, 0, 0, 0.7);
      border-left: none;
      box-shadow: inset 0 0 1px rgba(255, 255, 255, 0.5);
      float: left;
    }

    .progress {
      width: 240px;
      height: 7px;
      position: relative;
      cursor: pointer;
      background: rgba(0, 0, 0, 0.4);
      /* fallback */
      box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), inset 0 1px 1px black;
      border-radius: 10px;
    }

    .progress span {
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      display: block;
      border-radius: 10px;
    }

    .timeBar {
      z-index: 10;
      width: 0;
      background: -webkit-linear-gradient(top, #6bcce2 0%, #1da3d0 100%);
      box-shadow: 0 0 7px rgba(107, 204, 226, 0.5);
    }

    .bufferBar {
      z-index: 5;
      width: 0;
      background: rgba(255, 255, 255, 0.2);
    }

    /* VOLUME BAR CSS */
    /* volume bar */
    .volume {
      position: relative;
      cursor: pointer;
      width: 70px;
      height: 10px;
      float: right;
      margin-top: 10px;
      margin-right: 10px;
    }

    .volumeBar {
      display: block;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      background-color: #eee;
      z-index: 10;
    }

    /* Style the buttons that are used to open and close the accordion panel */
    .accordion {
        background-color: #eee;
        color: #444;
        cursor: pointer;
        padding: 18px;
        width: 100%;
        text-align: left;
        border: none;
        outline: none;
        transition: 0.4s;
    }

    /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
    .active, .accordion:hover {
        background-color: #ccc;
    }

    /* Style the accordion panel. Note: hidden by default */
    .panel {
        padding: 0 18px;
        background-color: white;
        display: none;
        overflow: hidden;
    }
</style>



</head>

<body>
<button class="accordion">Upload Section .xlsx - Worksheet ></button>
<div class="panel">
     <form id="form1" runat="server">

         <asp:ScriptManager runat="server">
             <Scripts>

                 <asp:ScriptReference Path="~/js/jquery-1.12.4.min.js" />
                 <%--<asp:ScriptReference Path="js/timbrature-video.js" />--%>
             </Scripts>
         </asp:ScriptManager>

         <table>
             <tr>
                 <td>
                     <h4>STEPS BEFORE UPLOAD FILE:</h4>
                        <ol>
                            <li>Delete all sheets just leave sheet with all informations</li>
                            <li>Save file as Worksheet .xlsx - First in list of save as</li>
                            <li>Chose File</li>
                            <li>Upload File</li>
                            <li><b>IMPORTANT:</b> Do not close window until file is succsessful uploaded!</li>
                            <li>After upload site will inform you that file is uploaded</li>
                        </ol>
                     <asp:HyperLink runat="server" NavigateUrl="~/Images/img/FileUploadTut.mp4" Target="_blank" style="margin-left:20px;margin-bottom:20px;">Watch video tutorial</asp:HyperLink>
                 </td>
                 <td>
                    <%--         <section id="wrapper">
	        <div class="videoContainer">
		
            <video id="myVideo" controls preload="auto" poster="./Images/img/tutorialimg.png" width="380" >
              <source src="./Images/img/FileUploadTut.mp4" type="Images/Video/mp4" />
		          <p>Your browser does not support the video tag.</p>
		        </video>
		        <div class="caption">Video Tutorial</div>
		        <div class="control">
			        <div class="btmControl">
				        <div class="btnPlay btn" title="Play/Pause video"><span class="icon-play"></span></div>
				        <div class="progress-bar">
					        <div class="progress">
						        <span class="bufferBar"></span>
						        <span class="timeBar"></span>
					        </div>
				        </div>
				        <div class="btnFS btn" title="Switch to full screen"><span class="icon-fullscreen"></span></div>
			        </div>
			
		        </div>
	        </div>
        </section>--%>

                 </td>
             </tr>
         </table>



        <div style="margin-left:20px; margin-bottom:20px;">
            <span>Mesec:</span>
            <asp:TextBox runat="server" ID="txt_mesec" TextMode="Number"></asp:TextBox>
            <br />
            <span>Godina:</span>
            <asp:TextBox runat="server" ID="txt_godina" TextMode="Number"></asp:TextBox>
    <asp:FileUpload ID="Upload" runat="server" />
    <asp:Button ID="Button1" OnClick="btnUpload_Click" runat="server" Text="Upload" />
            </div>
        <br />
        <hr />
        <asp:Label runat="server" ID="informer"></asp:Label>

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
</script>
    </form>
</div>



</body>

</html>
