<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copertina.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Copertina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Copertina</title>
    <meta name="Workbook Frameset" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 15">
    <meta name="Generator" content="Microsoft Excel 15">
    <link id="shLink" href="controllo%20gestione%20(1)%20(2)_files/sheet001.html">
   
   
   
   
   
    <script language="JavaScript">
<!--
    var c_lTabs = 26;

    var c_rgszSh = new Array(c_lTabs);
    c_rgszSh[0] = "MAIN";
    c_rgszSh[1] = "IMPORT BILANCIO";
    c_rgszSh[2] = "Contabilit&agrave;";
    c_rgszSh[3] = "COPERTINA ";
    c_rgszSh[4] = "Ce progress.";
    c_rgszSh[5] = "sostituire Ce Progress";
    c_rgszSh[6] = "Ce mensile";
    c_rgszSh[7] = "budget";
    c_rgszSh[8] = "budget PRC1";
    c_rgszSh[9] = "budget PRC 2";
    c_rgszSh[10] = "saturazione tessitura";
    c_rgszSh[11] = "produzione capi";
    c_rgszSh[12] = "efficienze reparti";
    c_rgszSh[13] = "dati produttivi";
    c_rgszSh[14] = "Costi cons. budget";
    c_rgszSh[15] = "Costi ricavi ";
    c_rgszSh[16] = "Costi reparto";
    c_rgszSh[17] = "Costo energie";
    c_rgszSh[18] = "margini x reparto";
    c_rgszSh[19] = " costo orario fase";
    c_rgszSh[20] = "investimenti";
    c_rgszSh[21] = "manut ord";
    c_rgszSh[22] = "ricavi ";
    c_rgszSh[23] = "organico";
    c_rgszSh[24] = "Assenteismo";
    c_rgszSh[25] = "sit finanza";



    var c_rgszClr = new Array(8);
    c_rgszClr[0] = "window";
    c_rgszClr[1] = "buttonface";
    c_rgszClr[2] = "windowframe";
    c_rgszClr[3] = "windowtext";
    c_rgszClr[4] = "threedlightshadow";
    c_rgszClr[5] = "threedhighlight";
    c_rgszClr[6] = "threeddarkshadow";
    c_rgszClr[7] = "threedshadow";

    var g_iShCur;
    var g_rglTabX = new Array(c_lTabs);

    function fnGetIEVer() {
        var ua = window.navigator.userAgent
        var msie = ua.indexOf("MSIE")
        if (msie > 0 && window.navigator.platform == "Win32")
            return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)));
        else
            return 0;
    }

    function fnBuildFrameset() {
        var szHTML = "<frameset rows=\"*,18\" border=0 width=0 frameborder=no framespacing=0>" +
            "<frame src=\"" + document.all.item("shLink")[3].href + "\" name=\"frSheet\" noresize>" +
            "<frameset cols=\"54,*\" border=0 width=0 frameborder=no framespacing=0>" +
            "<frame src=\"\" name=\"frScroll\" marginwidth=0 marginheight=0 scrolling=no>" +
            "<frame src=\"\" name=\"frTabs\" marginwidth=0 marginheight=0 scrolling=no>" +
            "</frameset></frameset><plaintext>";

        with (document) {
            open("text/html", "replace");
            write(szHTML);
            close();
        }

        fnBuildTabStrip();
    }

    function fnBuildTabStrip() {
        var szHTML =
            "<html><head><style>.clScroll {font:8pt Courier New;color:" + c_rgszClr[6] + ";cursor:default;line-height:10pt;}" +
            ".clScroll2 {font:10pt Arial;color:" + c_rgszClr[6] + ";cursor:default;line-height:11pt;}</style></head>" +
            "<body onclick=\"event.returnValue=false;\" ondragstart=\"event.returnValue=false;\" onselectstart=\"event.returnValue=false;\" bgcolor=" + c_rgszClr[4] + " topmargin=0 leftmargin=0><table cellpadding=0 cellspacing=0 width=100%>" +
            "<tr><td colspan=6 height=1 bgcolor=" + c_rgszClr[2] + "></td></tr>" +
            "<tr><td style=\"font:1pt\">&nbsp;<td>" +
            "<td valign=top id=tdScroll class=\"clScroll\" onclick=\"parent.fnFastScrollTabs(0);\" onmouseover=\"parent.fnMouseOverScroll(0);\" onmouseout=\"parent.fnMouseOutScroll(0);\"><a>&#171;</a></td>" +
            "<td valign=top id=tdScroll class=\"clScroll2\" onclick=\"parent.fnScrollTabs(0);\" ondblclick=\"parent.fnScrollTabs(0);\" onmouseover=\"parent.fnMouseOverScroll(1);\" onmouseout=\"parent.fnMouseOutScroll(1);\"><a>&lt</a></td>" +
            "<td valign=top id=tdScroll class=\"clScroll2\" onclick=\"parent.fnScrollTabs(1);\" ondblclick=\"parent.fnScrollTabs(1);\" onmouseover=\"parent.fnMouseOverScroll(2);\" onmouseout=\"parent.fnMouseOutScroll(2);\"><a>&gt</a></td>" +
            "<td valign=top id=tdScroll class=\"clScroll\" onclick=\"parent.fnFastScrollTabs(1);\" onmouseover=\"parent.fnMouseOverScroll(3);\" onmouseout=\"parent.fnMouseOutScroll(3);\"><a>&#187;</a></td>" +
            "<td style=\"font:1pt\">&nbsp;<td></tr></table></body></html>";

        with (frames['frScroll'].document) {
            open("text/html", "replace");
            write(szHTML);
            close();
        }

        szHTML =
            "<html><head>" +
            "<style>A:link,A:visited,A:active {text-decoration:none;" + "color:" + c_rgszClr[3] + ";}" +
            ".clTab {cursor:hand;background:" + c_rgszClr[1] + ";font:9pt Arial;padding-left:3px;padding-right:3px;text-align:center;}" +
            ".clBorder {background:" + c_rgszClr[2] + ";font:1pt;}" +
            "</style></head><body onload=\"parent.fnInit();\" onselectstart=\"event.returnValue=false;\" ondragstart=\"event.returnValue=false;\" bgcolor=" + c_rgszClr[4] +
            " topmargin=0 leftmargin=0><table id=tbTabs cellpadding=0 cellspacing=0>";

        var iCellCount = (c_lTabs + 1) * 2;

        var i;
        for (i = 0; i < iCellCount; i += 2)
            szHTML += "<col width=1><col>";

        var iRow;
        for (iRow = 0; iRow < 6; iRow++) {

            szHTML += "<tr>";

            if (iRow == 5)
                szHTML += "<td colspan=" + iCellCount + "></td>";
            else {
                if (iRow == 0) {
                    for (i = 0; i < iCellCount; i++)
                        szHTML += "<td height=1 class=\"clBorder\"></td>";
                } else if (iRow == 1) {
                    for (i = 0; i < c_lTabs; i++) {
                        szHTML += "<td height=1 nowrap class=\"clBorder\">&nbsp;</td>";
                        szHTML +=
                            "<td id=tdTab height=1 nowrap class=\"clTab\" onmouseover=\"parent.fnMouseOverTab(" + i + ");\" onmouseout=\"parent.fnMouseOutTab(" + i + ");\">" +
                            "<a href=\"" + document.all.item("shLink")[i].href + "\" target=\"frSheet\" id=aTab>&nbsp;" + c_rgszSh[i] + "&nbsp;</a></td>";
                    }
                    szHTML += "<td id=tdTab height=1 nowrap class=\"clBorder\"><a id=aTab>&nbsp;</a></td><td width=100%></td>";
                } else if (iRow == 2) {
                    for (i = 0; i < c_lTabs; i++)
                        szHTML += "<td height=1></td><td height=1 class=\"clBorder\"></td>";
                    szHTML += "<td height=1></td><td height=1></td>";
                } else if (iRow == 3) {
                    for (i = 0; i < iCellCount; i++)
                        szHTML += "<td height=1></td>";
                } else if (iRow == 4) {
                    for (i = 0; i < c_lTabs; i++)
                        szHTML += "<td height=1 width=1></td><td height=1></td>";
                    szHTML += "<td height=1 width=1></td><td></td>";
                }
            }
            szHTML += "</tr>";
        }

        szHTML += "</table></body></html>";
        with (frames['frTabs'].document) {
            open("text/html", "replace");
            charset = document.charset;
            write(szHTML);
            close();
        }
    }

    function fnInit() {
        g_rglTabX[0] = 0;
        var i;
        for (i = 1; i <= c_lTabs; i++)
            with (frames['frTabs'].document.all.tbTabs.rows[1].cells[fnTabToCol(i - 1)])
            g_rglTabX[i] = offsetLeft + offsetWidth - 6;
    }

    function fnTabToCol(iTab) {
        return 2 * iTab + 1;
    }

    function fnNextTab(fDir) {
        var iNextTab = -1;
        var i;

        with (frames['frTabs'].document.body) {
            if (fDir == 0) {
                if (scrollLeft > 0) {
                    for (i = 0; i < c_lTabs && g_rglTabX[i] < scrollLeft; i++);
                    if (i < c_lTabs)
                        iNextTab = i - 1;
                }
            } else {
                if (g_rglTabX[c_lTabs] + 6 > offsetWidth + scrollLeft) {
                    for (i = 0; i < c_lTabs && g_rglTabX[i] <= scrollLeft; i++);
                    if (i < c_lTabs)
                        iNextTab = i;
                }
            }
        }
        return iNextTab;
    }

    function fnScrollTabs(fDir) {
        var iNextTab = fnNextTab(fDir);

        if (iNextTab >= 0) {
            frames['frTabs'].scroll(g_rglTabX[iNextTab], 0);
            return true;
        } else
            return false;
    }

    function fnFastScrollTabs(fDir) {
        if (c_lTabs > 16)
            frames['frTabs'].scroll(g_rglTabX[fDir ? c_lTabs - 1 : 0], 0);
        else
            if (fnScrollTabs(fDir) > 0) window.setTimeout("fnFastScrollTabs(" + fDir + ");", 5);
    }

    function fnSetTabProps(iTab, fActive) {
        var iCol = fnTabToCol(iTab);
        var i;

        if (iTab >= 0) {
            with (frames['frTabs'].document.all) {
                with (tbTabs) {
                    for (i = 0; i <= 4; i++) {
                        with (rows[i]) {
                            if (i == 0)
                                cells[iCol].style.background = c_rgszClr[fActive ? 0 : 2];
                            else if (i > 0 && i < 4) {
                                if (fActive) {
                                    cells[iCol - 1].style.background = c_rgszClr[2];
                                    cells[iCol].style.background = c_rgszClr[0];
                                    cells[iCol + 1].style.background = c_rgszClr[2];
                                } else {
                                    if (i == 1) {
                                        cells[iCol - 1].style.background = c_rgszClr[2];
                                        cells[iCol].style.background = c_rgszClr[1];
                                        cells[iCol + 1].style.background = c_rgszClr[2];
                                    } else {
                                        cells[iCol - 1].style.background = c_rgszClr[4];
                                        cells[iCol].style.background = c_rgszClr[(i == 2) ? 2 : 4];
                                        cells[iCol + 1].style.background = c_rgszClr[4];
                                    }
                                }
                            } else
                                cells[iCol].style.background = c_rgszClr[fActive ? 2 : 4];
                        }
                    }
                }
                with (aTab[iTab].style) {
                    cursor = (fActive ? "default" : "hand");
                    color = c_rgszClr[3];
                }
            }
        }
    }

    function fnMouseOverScroll(iCtl) {
        frames['frScroll'].document.all.tdScroll[iCtl].style.color = c_rgszClr[7];
    }

    function fnMouseOutScroll(iCtl) {
        frames['frScroll'].document.all.tdScroll[iCtl].style.color = c_rgszClr[6];
    }

    function fnMouseOverTab(iTab) {
        if (iTab != g_iShCur) {
            var iCol = fnTabToCol(iTab);
            with (frames['frTabs'].document.all) {
                tdTab[iTab].style.background = c_rgszClr[5];
            }
        }
    }

    function fnMouseOutTab(iTab) {
        if (iTab >= 0) {
            var elFrom = frames['frTabs'].event.srcElement;
            var elTo = frames['frTabs'].event.toElement;

            if ((!elTo) ||
                (elFrom.tagName == elTo.tagName) ||
                (elTo.tagName == "A" && elTo.parentElement != elFrom) ||
                (elFrom.tagName == "A" && elFrom.parentElement != elTo)) {

                if (iTab != g_iShCur) {
                    with (frames['frTabs'].document.all) {
                        tdTab[iTab].style.background = c_rgszClr[1];
                    }
                }
            }
        }
    }

    function fnSetActiveSheet(iSh) {
        if (iSh != g_iShCur) {
            fnSetTabProps(g_iShCur, false);
            fnSetTabProps(iSh, true);
            g_iShCur = iSh;
        }
    }

    window.g_iIEVer = fnGetIEVer();
    if (window.g_iIEVer >= 4)
        fnBuildFrameset();

    </script>

</head>
   
 <frameset rows="*,39" border="0" width="0" frameborder="no" framespacing="0">
 <frame src="controllo%20gestione%20(1)%20(2)_files/sheet004.html" name="frSheet">
 <frame src="controllo%20gestione%20(1)%20(2)_files/tabstrip.html" name="frTabs" marginwidth="0" marginheight="0">
     <html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<meta name="ProgId" content="Excel.Sheet">
<meta name="Generator" content="Microsoft Excel 15">
<link id="Main-File" rel="Main-File" href="../controllo%20gestione%20(1)%20(2).html">
<link rel="File-List" href="filelist.xml">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<link rel="Stylesheet" href="stylesheet.css">
<style>
<!--table
	{mso-displayed-decimal-separator:"\,";
	mso-displayed-thousand-separator:"\.";}
@page
	{margin:.75in 0in .16in 0in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
-->
</style>
<!--[if !supportTabStrip]--><script language="JavaScript">
<!--
    function fnUpdateTabs() {
        if (parent.window.g_iIEVer >= 4) {
            if (parent.document.readyState == "complete"
                && parent.frames['frTabs'].document.readyState == "complete")
                parent.fnSetActiveSheet(3);
            else
                window.setTimeout("fnUpdateTabs();", 150);
        }
    }

    if (window.name != "frSheet")
        window.location.replace("../controllo%20gestione%20(1)%20(2).html");
    else
        fnUpdateTabs();
//-->
</script>
<!--[endif]-->
</head>

<body link="blue" vlink="purple" class="xl1193">

<table border="0" cellpadding="0" cellspacing="0" width="2832" style="border-collapse:
 collapse;table-layout:fixed;width:2127pt">
 <colgroup><col class="xl1193" width="16" style="mso-width-source:userset;mso-width-alt:585;
 width:12pt">
 <col class="xl1193" width="64" style="width:48pt">
 <col class="xl1193" width="139" style="mso-width-source:userset;mso-width-alt:
 5083;width:104pt">
 <col class="xl1193" width="64" style="width:48pt">
 <col class="xl1193" width="67" style="mso-width-source:userset;mso-width-alt:2450;
 width:50pt">
 <col class="xl1193" width="74" style="mso-width-source:userset;mso-width-alt:2706;
 width:56pt">
 <col class="xl1193" width="70" style="mso-width-source:userset;mso-width-alt:2560;
 width:53pt">
 <col class="xl1193" width="76" style="mso-width-source:userset;mso-width-alt:2779;
 width:57pt">
 <col class="xl1193" width="54" style="mso-width-source:userset;mso-width-alt:1974;
 width:41pt">
 <col class="xl1193" width="116" style="mso-width-source:userset;mso-width-alt:
 4242;width:87pt">
 <col class="xl1193" width="70" style="mso-width-source:userset;mso-width-alt:2560;
 width:53pt">
 <col class="xl1193" width="73" style="mso-width-source:userset;mso-width-alt:2669;
 width:55pt">
 <col class="xl1193" width="230" style="mso-width-source:userset;mso-width-alt:
 8411;width:173pt">
 <col class="xl1193" width="67" span="2" style="mso-width-source:userset;mso-width-alt:
 2450;width:50pt">
 <col class="xl1193" width="23" style="mso-width-source:userset;mso-width-alt:841;
 width:17pt">
 <col class="xl1193" width="22" span="2" style="mso-width-source:userset;mso-width-alt:
 804;width:17pt">
 <col class="xl1193" width="35" style="mso-width-source:userset;mso-width-alt:1280;
 width:26pt">
 <col class="xl1193" width="22" style="mso-width-source:userset;mso-width-alt:804;
 width:17pt">
 <col class="xl1193" width="28" style="mso-width-source:userset;mso-width-alt:1024;
 width:21pt">
 <col class="xl1193" width="25" style="mso-width-source:userset;mso-width-alt:914;
 width:19pt">
 <col class="xl1193" width="64" span="22" style="width:48pt">
 </colgroup><tbody><tr height="34" style="mso-height-source:userset;height:25.5pt">
  <td height="34" class="xl1559" width="16" style="height:25.5pt;width:12pt"><a name="RANGE!A1"><span style="mso-spacerun:yes">&nbsp;</span></a></td>
  <td class="xl1560" width="64" style="width:48pt">&nbsp;</td>
  <td class="xl1561" width="139" style="width:104pt">&nbsp;</td>
  <td class="xl1561" width="64" style="width:48pt">&nbsp;</td>
  <td class="xl1561" width="67" style="width:50pt">&nbsp;</td>
  <td class="xl1561" width="74" style="width:56pt">&nbsp;</td>
  <td class="xl1561" width="70" style="width:53pt">&nbsp;</td>
  <td class="xl1561" width="76" style="width:57pt">&nbsp;</td>
  <td class="xl1560" width="54" style="width:41pt">&nbsp;</td>
  <td class="xl1560" width="116" style="width:87pt">&nbsp;</td>
  <td class="xl1560" width="70" style="width:53pt">&nbsp;</td>
  <td class="xl1560" width="73" style="width:55pt">&nbsp;</td>
  <td colspan="3" height="34" width="364" style="height:25.5pt;width:273pt" align="left" valign="top">
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="Picture_x0020_2086" o:spid="_x0000_s37893" type="#_x0000_t75"
   style='position:absolute;margin-left:255pt;margin-top:6pt;width:28.5pt;
   height:27.75pt;z-index:5;visibility:visible' o:gfxdata="UEsDBBQABgAIAAAAIQBamK3CDAEAABgCAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRwU7DMAyG

   <v:imagedata src="image053.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><!--[if !vml]--><span style="mso-ignore:vglayout;
  position:absolute;z-index:5;margin-left:340px;margin-top:8px;width:38px;
  height:37px"><img width="38" height="37" src="image054.png" v:shapes="Picture_x0020_2086"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td colspan="3" height="34" class="xl3059" width="364" style="height:25.5pt;
    width:273pt">&nbsp;</td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1562" width="23" style="width:17pt">&nbsp;</td>
  <td class="xl1193" width="22" style="width:17pt"></td>
  <td class="xl1193" width="22" style="width:17pt"></td>
  <td class="xl1193" width="35" style="width:26pt"></td>
  <td class="xl2608" colspan="3" width="75" style="mso-ignore:colspan;width:57pt">COD.
  1.3</td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl2408" width="64" style="width:48pt"><a href="#RANGE!A1"><span style="color:red;font-size:16.0pt">Menù</span></a></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
 </tr>
 <tr height="34" style="mso-height-source:userset;height:25.5pt">
  <td height="34" class="xl1563" style="height:25.5pt">&nbsp;</td>
  <td colspan="6" rowspan="2" class="xl3060" width="478" style="width:359pt">OLIMPIAS
  KNITTING doo</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="3" class="xl3061">Indice</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="28" style="mso-height-source:userset;height:21.0pt">
  <td height="28" class="xl1565" style="height:21.0pt">&nbsp;</td>
  <td class="xl1566"></td>
  <td class="xl1567"></td>
  <td align="left" valign="top">
      <span style="mso-ignore:vglayout;
  position:absolute;z-index:16;margin-left:109px;margin-top:0px;width:169px;
  height:42px"><img width="169" height="42" src="image057.png" v:shapes="_x0000_s37904 CasellaDiTesto_x0020_35"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="28" class="xl1567" width="116" style="height:21.0pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="2" class="xl1584"></td>
  <td class="xl2100">Ricavi - mensili</td>
  <td class="xl1285">Pag.</td>
  <td class="xl1285">1</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td colspan="3" class="xl3062">divisione Abbigliamento</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2101">Grafico vendite</td>
  <td class="xl1194">"</td>
  <td class="xl1194">2</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="Immagine_x0020_2"
   o:spid="_x0000_s37908" type="#_x0000_t75" alt="cid:image001.png@01D2DABC.F97B4D40"
   style='position:absolute;margin-left:0;margin-top:10.5pt;width:408.75pt;
   height:3.75pt;z-index:20;visibility:visible' o:gfxdata="UEsDBBQABgAIAAAAIQD0vmNdDgEAABoCAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF
90jcwfIWJQ4sEEJJuiCwhAqVA1j2JDHEY8vjhvb2OEkrQVWQWNoz7//npFzt7MBGCGQcVvw6LzgD
VE4b7Cr+tnnK7jijKFHLwSFUfA/EV/XlRbnZeyCWaKSK9zH6eyFI9WAl5c4DpknrgpUxHUMnvFQf
sgNxUxS3QjmMgDGLUwavywZauR0ie9yl68Xk3UPH2cOyOHVV3NgpYB6Is0yAgU4Y6f1glIzpdWJE
fWKWHazyRM471BtPV0mdn2+YJj+lvhccuJf0OYPRwNYyxGdpk7rQgYQ3Km4DpK3875xJ1FLm2tYo
yJtA64U8iv1WoN0nBhj/m94k7BXGY7qY/2z9BQAA//8DAFBLAwQUAAYACAAAACEACMMYpNQAAACT
AQAACwAAAF9yZWxzLy5yZWxzpJDBasMwDIbvg76D0X1x2sMYo05vg15LC7saW0nMYstIbtq+/UzZ
YBm97ahf6PvEv91d46RmZAmUDKybFhQmRz6kwcDp+P78CkqKTd5OlNDADQV23eppe8DJlnokY8ii
KiWJgbGU/Ka1uBGjlYYyprrpiaMtdeRBZ+s+7YB607Yvmn8zoFsw1d4b4L3fgDrecjX/YcfgmIT6
0jiKmvo+uEdU7emSDjhXiuUBiwHPcg8Z56Y+B/qxd/1Pbw6unBk/qmGh/s6r+ceuF1V2XwAAAP//
AwBQSwMEFAAGAAgAAAAhAIDJe+lEAgAAxwUAABIAAABkcnMvcGljdHVyZXhtbC54bWysVNuO2yAQ
fa/Uf0C8NzZOnIuVeJuNlWql3Taq2g8gGMdobbCATbJ/3wEcp+lT1fRtmIEzZ2bOsHw4tw06cm2E
kitMRjFGXDJVCnlY4Z8/tp/mGBlLZUkbJfkKv3ODH/KPH5bnUmdUslppBBDSZOBY4draLosiw2re
UjNSHZcQrZRuqYWjPkSlpicAb5soieNpZDrNaWlqzm0RIjj32PakNrxp1j5FcFVatcFiqsnJMnIc
nOkfgPGtqvJ4cLuTj2h1yifB7cyLz8XJOE3S6RDzTzzsNZdVA34+G8AHn3syHU9Jeo3dJE4H8NvE
izjtqQKna95Ltk6wcF8ed4LtdJ/v63GnkShXeEwwkrSFiTy1LT0IyVGCUckNgykwUWYCvDyOyaiT
h88xKZJi/bgZbRezx0kxiXF0BQzwNIOUz4q9mn6e9B+m2VIhgZfa1FQe+Np0nFlQ1W8uDdXWbuLO
DSTCDKGswMIfb0reN6LbigaGTDNn380uqPWvtKqqSjBeKPbWcmmDYDVvqIVlMbXoDEY64+2ew0D0
Uwl16qwR8tWfElcezYxm36EL99IOWFZzy+p7sRytClrqeLkRAMkA3I/j2nK3YKYDye1PL6oEsdE3
q2BBaXaudPs/eECL0Rm0kCaTGP6edzATQtK5FwfN+NkiBvGUzBcknmHE4MYknZGFF0/g4fh02tgv
XN3NCTkgmB+0xtdJj8+mb9IlhUsnldPkvQ246N+1uO/9sPesEaC5glp6ufXHj+hXJfzA+S8AAAD/
/wMAUEsDBAoAAAAAAAAAIQDBc0TMLQMAAC0DAAAVAAAAZHJzL21lZGlhL2ltYWdlMS5qcGVn/9j/
4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIo
LTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAACAOMDASIAAhEB
AxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9
AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6
Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ip
qrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEB
AQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJB
UQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RV
VldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6
wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDIooor6o+L
AU2b/j1k+lFFKRpS+Mxx0/CloopHcxR2+tXZOkf+7RRWNbZHt5J/GfoNooormR9QuhPYf8fK1YH9
TRRXgZt/Eierl/wyFpD0b6UUV5R6B0uj/wDINT/eNXaKK8bEfxJHj1PiYVJbf69frRRWZnPZmq33
vxooorle7ONbCGqWp/ch+poorpwnxnFmH8BmdRRRXqdT5zqOT74rmJv9dJ/vn+dFFdmE2POx20Rl
FFFdx5YUUUUAf//ZUEsDBBQABgAIAAAAIQDSKNrbEQEAAIQBAAAPAAAAZHJzL2Rvd25yZXYueG1s
XJBLT8MwEITvSPwHa5G4UTsNaUqoU1UVlXoCtTzE0Uqchxrbke02Dr8ehxZFcJxZf+PZXSydaNCJ
a1MrSSGYEEBcZiqvZUnh7XVzNwdkLJM5a5TkFHpuYJleXy1YkqtO7vhpb0vkQ6RJGIXK2jbB2GQV
F8xMVMulnxVKC2a91CXONet8uGjwlJAZFqyW/oeKtXxd8eywPwpfY7M9ut4R2bX9+ik+fH68v7RT
Sm9v3OoRkOXOjo8v9DanEAYw7OIDIPUFXbOSWaU0Knbc1F++/dkvtBJIq47CPaBMNYM/6OeiMNx6
FYZh5A/hR78WATwkWnXmogsX/+UeyD9sFs6DOBpYPNb5EePx0m8AAAD//wMAUEsDBBQABgAIAAAA
IQCzdLC/7gAAAM4BAAAdAAAAZHJzL19yZWxzL3BpY3R1cmV4bWwueG1sLnJlbHO0kU1PAyEQhu8m
/gcy9y6wjdo0Zdv0w6QHL6b+AAKzLLp8BNC0/15qLzZp4snjwMzzPjCL5dGN5AtTtsEL4A0Dgl4F
bb0R8HZ4nsyA5CK9lmPwKOCEGZbd/d3iFUdZ6lAebMykUnwWMJQS55RmNaCTuQkRfb3pQ3Ky1DIZ
GqX6kAZpy9gjTb8Z0F0xyV4LSHvdAjmcYk3+mx363ircBvXp0JcbEdS6ml2BMhksApTV858jxnjz
Hs2K8e3DbrZZN9Mnxnm7qb9x6X0JuirsjgWTlyPQ2678H10daisvDzi7ojlL0KstdN8AAAD//wMA
UEsBAi0AFAAGAAgAAAAhAPS+Y10OAQAAGgIAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5
cGVzXS54bWxQSwECLQAUAAYACAAAACEACMMYpNQAAACTAQAACwAAAAAAAAAAAAAAAAA/AQAAX3Jl
bHMvLnJlbHNQSwECLQAUAAYACAAAACEAgMl76UQCAADHBQAAEgAAAAAAAAAAAAAAAAA8AgAAZHJz
L3BpY3R1cmV4bWwueG1sUEsBAi0ACgAAAAAAAAAhAMFzRMwtAwAALQMAABUAAAAAAAAAAAAAAAAA
sAQAAGRycy9tZWRpYS9pbWFnZTEuanBlZ1BLAQItABQABgAIAAAAIQDSKNrbEQEAAIQBAAAPAAAA
AAAAAAAAAAAAABAIAABkcnMvZG93bnJldi54bWxQSwECLQAUAAYACAAAACEAs3Swv+4AAADOAQAA
HQAAAAAAAAAAAAAAAABOCQAAZHJzL19yZWxzL3BpY3R1cmV4bWwueG1sLnJlbHNQSwUGAAAAAAYA
BgCFAQAAdwoAAAAA
">
   <v:imagedata src="image058.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><!--[if !vml]--><span style="mso-ignore:vglayout;
  position:absolute;z-index:20;margin-left:0px;margin-top:14px;width:545px;
  height:5px"><img width="545" height="5" src="image059.png" alt="cid:image001.png@01D2DABC.F97B4D40" v:shapes="Immagine_x0020_2"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1195" width="64" style="height:12.95pt;width:48pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:3;margin-left:109px;margin-top:2px;width:166px;
  height:42px"><img width="166" height="42" src="image062.png" v:shapes="_x0000_s37891 CasellaDiTesto_x0020_15"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="2" class="xl1584"></td>
  <td class="xl2102">Conto Economico progressivo</td>
  <td class="xl1285">"</td>
  <td class="xl1285">3</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2102">Conto Economico mensilizzato</td>
  <td class="xl1285">"</td>
  <td class="xl1285">4</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2102">Conto Economico per Centro Profitto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">5</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2102">Conto Economico a costo del venduto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">6</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2103">Contabilità</td>
  <td class="xl1194">"</td>
  <td class="xl1194">7</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td colspan="4" rowspan="2" class="xl3054" width="334" style="width:250pt">Report
  mensile - mese :</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top">
      <span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1606"></td>
  <td class="xl1584"></td>
  <td class="xl2104">Costi consuntivi/budget</td>
  <td class="xl1285">"</td>
  <td class="xl1285">8</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td colspan="3" rowspan="2" class="xl3055" width="220" style="width:166pt">dicembre-20</td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Costi / Ricavi progressivi</td>
  <td class="xl1285">"</td>
  <td class="xl1285">9</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586"></td>
  <td class="xl2104">Costi mensili per Reparto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">10</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586"></td>
  <td class="xl2104">Costo Energie</td>
  <td class="xl1285">"</td>
  <td class="xl1285">11</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1570"></td>
  <td class="xl1587"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Costo Materiali di consumo</td>
  <td class="xl1285">"</td>
  <td class="xl1285">12</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1570"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Sintesi margini x ASA</td>
  <td class="xl1285"></td>
  <td class="xl1285">13</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Grafico costo orario Fase</td>
  <td class="xl1285"></td>
  <td class="xl1285">14</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2105">Costi Diretti / Indiretti x Fase</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1194">15</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1571">mese</td>
  <td class="xl1571">Progr.</td>
  <td class="xl1642">Progr. a.p.</td>
  <td class="xl1636">mese</td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top">
      <span style="mso-ignore:vglayout;
  position:absolute;z-index:6;margin-left:112px;margin-top:1px;width:167px;
  height:42px"><img width="167" height="42" src="image068.png" v:shapes="_x0000_s37894 CasellaDiTesto_x0020_23"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Saturazione Tessitura</td>
  <td class="xl1285">"</td>
  <td class="xl1285">16</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Produzioni mensili capi</td>
  <td class="xl1285">"</td>
  <td class="xl1285">17</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1197">Reparto</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">Eff. rep.</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">std</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1197">CE</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">qualità</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">assenze</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">cash</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
 </tr>
 <tr height="16" style="mso-height-source:userset;height:12.6pt">
  <td height="16" class="xl1563" style="height:12.6pt">&nbsp;</td>
  <td class="xl1572"></td>
  <td class="xl1193"></td>
  <td class="xl1210"></td>
  <td class="xl1210"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Efficienze mensili<span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class="xl1285">"</td>
  <td class="xl1285">18</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">LOR<span style="display:none">DA</span></td>
  <td class="xl1199" style="border-top:none">Tessitura</td>
  <td class="xl1200" style="border-left:none">86,3%</td>
  <td class="xl1200" style="border-left:none">85,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>48,43 </td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>246,07 </td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1202" style="border-left:none">1,0%</td>
  <td class="xl1202" style="border-left:none">2,8%</td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1202" style="border-left:none">6,0%</td>
  <td class="xl1202" style="border-left:none">8,0%</td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>500,00 </td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1573" style="height:12.95pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1588">Fatturato</td>
  <td class="xl1196">&nbsp;</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>534 </td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>7.442 </td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>8.092 </td>
  <td class="xl1637">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>147 </td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2107">Produzione Reparti Interni</td>
  <td class="xl1194">"</td>
  <td class="xl1194">19-21</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">OPE<span style="display:none">RATOIR</span></td>
  <td class="xl1199" style="border-top:none">Confezione</td>
  <td class="xl1203" style="border-top:none;border-left:none">91,5%</td>
  <td class="xl1203" style="border-top:none;border-left:none">80,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1563" style="height:19.5pt">&nbsp;</td>
  <td class="xl1650">euro/000</td>
  <td class="xl1193"></td>
  <td class="xl1590"></td>
  <td class="xl1590"></td>
  <td class="xl1644"></td>
  <td class="xl1638"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1357"></td>
  <td align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:8;margin-left:0px;margin-top:4px;width:166px;
  height:47px"><img width="166" height="47" src="image071.png" v:shapes="_x0000_s37896 CasellaDiTesto_x0020_20"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="26" class="xl1584" width="70" style="height:19.5pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1584"></td>
  <td class="xl2099">Organico per Reparto / mansione</td>
  <td class="xl1285">"</td>
  <td class="xl1285">22</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">OPE<span style="display:none">RATOIR</span></td>
  <td class="xl1199" style="border-top:none">Stiro</td>
  <td class="xl1203" style="border-top:none;border-left:none">69,6%</td>
  <td class="xl1203" style="border-top:none;border-left:none">70,0%</td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1490"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>197,64<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1193"></td>
  <td class="xl1205">1,6%</td>
  <td class="xl1205" style="border-left:none">1,5%</td>
  <td class="xl1205" style="border-left:none">1,0%</td>
  <td class="xl1193"></td>
  <td class="xl1205">7,0%</td>
  <td class="xl1205" style="border-left:none">7,0%</td>
  <td class="xl1205" style="border-left:none">5,0%</td>
  <td class="xl1193"></td>
  <td class="xl1206"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1206" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>375,00 </td>
  <td class="xl1206" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>500,00 </td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Efficienza Stabilimento<font class="font250"> </font><font class="font251">( std 78</font><span style="display:none"><font class="font251">% )</font></span></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">74,0%</td>
  <td class="xl1645">76,5%</td>
  <td class="xl1639">74%</td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2099">Assenteismo e Straordinario</td>
  <td class="xl1285">"</td>
  <td class="xl1285">23-24</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1205" style="border-top:none">82,5%</td>
  <td class="xl1205" style="border-top:none;border-left:none">78,3%</td>
  <td class="xl1205" style="border-left:none">75,0%</td>
  <td class="xl1205" style="border-left:none">77,0%</td>
  <td class="xl1205" style="border-left:none">80,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="18" style="mso-height-source:userset;height:13.5pt">
  <td height="18" class="xl1563" style="height:13.5pt">&nbsp;</td>
  <td class="xl1574"></td>
  <td class="xl1195"></td>
  <td class="xl1592"></td>
  <td class="xl1592"></td>
  <td class="xl1646"></td>
  <td class="xl1640"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189" align="right">2</td>
  <td class="xl2190">Costo del Lavoro</td>
  <td class="xl1194">"</td>
  <td class="xl1194">25</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Risultato economico
  ante</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>246 </td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>854 </td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2.447 </td>
  <td class="xl1641">######</td>
  <td class="xl1357"></td>
  <td align="left" valign="top">

   <v:imagedata src="image073.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><v:shape id="CasellaDiTesto_x0020_24" o:spid="_x0000_s37902"
   type="#_x0000_t75" style='position:absolute;margin-left:8.25pt;margin-top:34.5pt;
   width:117.75pt;height:24pt;z-index:14;visibility:visible;mso-wrap-style:square;
   v-text-anchor:top;
" o:insetmode="auto">
   <v:imagedata src="image074.png" o:title=""/>
   <o:lock v:ext="edit" aspectratio="f"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><v:shape id="CasellaDiTesto_x0020_29" o:spid="_x0000_s37903"
   type="#_x0000_t75" style='position:absolute;margin-left:8.25pt;margin-top:5.25pt;
   width:117.75pt;height:30pt;z-index:15;visibility:visible;mso-wrap-style:square;
   v-text-anchor:top; 
   <v:imagedata src="image075.png" o:title=""/>
   <o:lock v:ext="edit" aspectratio="f"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><!--[if !vml]--><span style="mso-ignore:vglayout;
  position:absolute;z-index:12;margin-left:0px;margin-top:3px;width:168px;
  height:75px"><img width="168" height="75" src="image076.png" v:shapes="_x0000_s37900 _x0000_s37901 CasellaDiTesto_x0020_24 CasellaDiTesto_x0020_29"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1584" width="70" style="height:12.95pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl1582">Situazione Magazzini</td>
  <td class="xl1285">"</td>
  <td class="xl1285">26</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1575" style="height:19.5pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1650">euro/000</td>
  <td class="xl1195"></td>
  <td class="xl1592"></td>
  <td class="xl1592"></td>
  <td class="xl1646"></td>
  <td class="xl1640"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189">&nbsp;</td>
  <td class="xl2191">&nbsp;</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199">Tessitura</td>
  <td class="xl1200" style="border-left:none">86,3%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1575" style="height:12.95pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">2^ sc. Tessitura <font class="font251">( std 1% )</font></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">2,3%</td>
  <td class="xl1645">2,6%</td>
  <td class="xl1639">2%</td>
  <td class="xl1193"></td>
  <td class="xl1584"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2108">Investimenti</td>
  <td class="xl1285">"</td>
  <td class="xl1285">27-28</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">Confezione</td>
  <td class="xl1203" style="border-top:none;border-left:none">75,3%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="18" style="mso-height-source:userset;height:13.5pt">
  <td height="18" class="xl1563" style="height:13.5pt">&nbsp;</td>
  <td class="xl1576"></td>
  <td class="xl1193"></td>
  <td class="xl1593"></td>
  <td class="xl1593"></td>
  <td class="xl1647"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189" align="right">2</td>
  <td class="xl2192">Manutenzioni ordinarie</td>
  <td class="xl1194">"</td>
  <td class="xl1194">29</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">Stiro</td>
  <td class="xl1203" style="border-top:none;border-left:none">63,5%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">% Assenteismo <font class="font251">( std 6% )</font><font class="font250"><span style="mso-spacerun:yes">&nbsp;</span></font></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">8,4%</td>
  <td class="xl1645">7,5%</td>
  <td class="xl1639">8%</td>
  <td class="xl1193"></td>
  <td align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:10;margin-left:0px;margin-top:7px;width:169px;
  height:46px"><img width="169" height="46" src="image079.png" v:shapes="_x0000_s37898 CasellaDiTesto_x0020_26"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1584" width="70" style="height:12.95pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Situazione addebiti</td>
  <td class="xl1285">"</td>
  <td class="xl1285">30</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1205" style="border-top:none">75,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1575" style="height:19.5pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1572"></td>
  <td class="xl1193"></td>
  <td class="xl1594"></td>
  <td class="xl1594"></td>
  <td class="xl1648"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1577"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Situazione Finanziaria</td>
  <td class="xl1285">"</td>
  <td class="xl1285">31</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Attivo finanz. a breve</td>
  <td class="xl1589">&nbsp;</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2.589 </td>
  <td class="xl1637"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1586"></td>
  <td class="xl2100">dati storici</td>
  <td class="xl1285">"</td>
  <td class="xl1285"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="20" style="mso-height-source:userset;height:15.0pt">
  <td height="20" class="xl1575" style="height:15.0pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1650">euro/000</td>
  <td class="xl1193"></td>
  <td class="xl1594"></td>
  <td class="xl1594"></td>
  <td class="xl1649"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1558"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Confronto costi eff / costi tariffa</td>
  <td class="xl1285">"</td>
  <td class="xl1285">n.d.</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="21" style="height:15.75pt">
  <td height="21" class="xl1563" style="height:15.75pt">&nbsp;</td>
  <td class="xl1214" colspan="2" style="mso-ignore:colspan">nr Dipendenti</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>710 </td>
  <td class="xl1589">&nbsp;</td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>664 </td>
  <td class="xl1639">0%</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2193">&nbsp;</td>
  <td class="xl2189">&nbsp;</td>
  <td class="xl2194">&nbsp;</td>
  <td class="xl1194">"</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td class="xl1580">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1193"></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="Grafico_x0020_21"
<span style="mso-ignore:vglayout;
  position:absolute;z-index:18;margin-left:17px;margin-top:10px;width:537px;
  height:208px">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td width="0" height="0"></td>
    <td width="252"></td>
    <td width="61"></td>
    <td width="224"></td>
   </tr>
   <tr>
    <td height="2"></td>
    <td colspan="2"></td>
    <td rowspan="3" align="left" valign="top"><img width="224" height="208" src="image082.png" v:shapes="Grafico_x0020_32"></td>
   </tr>
   <tr>
    <td height="200"></td>
    <td align="left" valign="top"><img width="252" height="200" src="image083.png" v:shapes="Grafico_x0020_21"></td>
   </tr>
   <tr>
    <td height="6"></td>
   </tr>
  </tbody></table>
  </span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" width="64" style="height:12.75pt;width:48pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="9" style="mso-ignore:colspan"></td>
  <td class="xl1651"></td>
  <td></td>
  <td class="xl1651" colspan="2" style="mso-ignore:colspan">NOTE DI EFFICIENZA</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1651"></td>
  <td colspan="3" style="mso-ignore:colspan"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1655">Macro costi</td>
  <td></td>
  <td class="xl1655"></td>
  <td></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costo del Personale</td>
  <td class="xl1848">#REF!</td>
  <td class="xl1848">#REF!</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Consumi Energia</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1652">0</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costo Manutenzioni</td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costi Generali</td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1655" colspan="2" style="mso-ignore:colspan">Conto economico di
  Linea<span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class="xl1655"></td>
  <td class="xl1653"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">TESSITURA</td>
  <td></td>
  <td class="xl1654">&nbsp;</td>
  <td class="xl1776">-1</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">CONFEZIONE</td>
  <td></td>
  <td class="xl1652" style="border-top:none">5</td>
  <td class="xl1652" style="border-top:none">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">STIRO</td>
  <td></td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1517" style="height:12.75pt">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1598">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1211"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193">gennaio</td>
  <td class="xl1193">febbraio</td>
  <td class="xl1193">marzo</td>
  <td class="xl1193">aprile</td>
  <td class="xl1193">maggio</td>
  <td class="xl1193">giugno</td>
  <td class="xl1193">luglio</td>
  <td class="xl1193">agosto</td>
  <td class="xl1193">settembre</td>
  <td class="xl1193">ottobre</td>
  <td class="xl1193">novembre</td>
  <td class="xl1193" colspan="3" style="mso-ignore:colspan">dicembre</td>
  <td class="xl1193" colspan="2" style="mso-ignore:colspan">TOTALE</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Efficienza <span style="display:none">Produttiva</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">74,0%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1469" align="right">74,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1213" colspan="2" style="mso-ignore:colspan">lorda dei reparti</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Risultato <span style="display:none">economico</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>12,0 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>64,9 </td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>14,6 </td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>157,7 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp; </span>104,1 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>197,2 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>206,7 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>37,8 </td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1195"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Qualità te<span style="display:none">ssitura</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">1,6%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1208"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Assenteis<span style="display:none">mo</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">7,0%</td>
  <td class="xl1212" align="right">8,7%</td>
  <td class="xl1212" align="right">19,1%</td>
  <td class="xl1212" align="right">28,5%</td>
  <td class="xl1212" align="right">11,0%</td>
  <td class="xl1212" align="right">9,5%</td>
  <td class="xl1212" align="right">11,9%</td>
  <td class="xl1212" align="right">11,3%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1469" align="right">8,4%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1209"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Attivo fina<span style="display:none">nz. a breve</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>134 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>324 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>342 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>345 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>324 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1286"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">nr dipend<span style="display:none">enti</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl2409" align="right">650</td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl1487"></td>
  <td class="xl2409"></td>
  <td class="xl1487"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">fatturato</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1679" align="right">575</td>
  <td class="xl1679" align="right">685</td>
  <td class="xl1679" align="right">561</td>
  <td class="xl1679" align="right">304</td>
  <td class="xl1679" align="right">702</td>
  <td class="xl1679" align="right">833</td>
  <td class="xl1679" align="right">863</td>
  <td class="xl1679" align="right">686</td>
  <td class="xl1679" align="right">510</td>
  <td class="xl1679" align="right">658</td>
  <td class="xl1679" align="right">550</td>
  <td class="xl1679" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>451 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>657 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>802 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>291 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>730 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>730 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>698 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>682 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>657 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>749 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>646 </td>
  <td class="xl1467" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>124 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>29 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>241 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>13 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>27 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>103 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>164 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>5 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>147 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>91 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>96 </td>
  <td class="xl1487" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <!--[if supportMisalignedColumns]-->
 <tr height="0" style="display:none">
  <td width="16" style="width:12pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="139" style="width:104pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="74" style="width:56pt"></td>
  <td width="70" style="width:53pt"></td>
  <td width="76" style="width:57pt"></td>
  <td width="54" style="width:41pt"></td>
  <td width="116" style="width:87pt"></td>
  <td width="70" style="width:53pt"></td>
  <td width="73" style="width:55pt"></td>
  <td width="230" style="width:173pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="23" style="width:17pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="35" style="width:26pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="28" style="width:21pt"></td>
  <td width="25" style="width:19pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
 </tr>
 <!--[endif]-->
</tbody></table>




</body></html><html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<meta name="ProgId" content="Excel.Sheet">
<meta name="Generator" content="Microsoft Excel 15">
<link id="Main-File" rel="Main-File" href="../controllo%20gestione%20(1)%20(2).html">
<link rel="File-List" href="filelist.xml">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<link rel="Stylesheet" href="stylesheet.css">
<style>
<!--table
	{mso-displayed-decimal-separator:"\,";
	mso-displayed-thousand-separator:"\.";}
@page
	{margin:.75in 0in .16in 0in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
-->
</style>
<!--[if !supportTabStrip]--><script language="JavaScript">
<!--
    function fnUpdateTabs() {
        if (parent.window.g_iIEVer >= 4) {
            if (parent.document.readyState == "complete"
                && parent.frames['frTabs'].document.readyState == "complete")
                parent.fnSetActiveSheet(3);
            else
                window.setTimeout("fnUpdateTabs();", 150);
        }
    }

    if (window.name != "frSheet")
        window.location.replace("../controllo%20gestione%20(1)%20(2).html");
    else
        fnUpdateTabs();
//-->
</script>
<!--[endif]-->
</head>

<body link="blue" vlink="purple" class="xl1193">

<table border="0" cellpadding="0" cellspacing="0" width="2832" style="border-collapse:
 collapse;table-layout:fixed;width:2127pt">
 <colgroup><col class="xl1193" width="16" style="mso-width-source:userset;mso-width-alt:585;
 width:12pt">
 <col class="xl1193" width="64" style="width:48pt">
 <col class="xl1193" width="139" style="mso-width-source:userset;mso-width-alt:
 5083;width:104pt">
 <col class="xl1193" width="64" style="width:48pt">
 <col class="xl1193" width="67" style="mso-width-source:userset;mso-width-alt:2450;
 width:50pt">
 <col class="xl1193" width="74" style="mso-width-source:userset;mso-width-alt:2706;
 width:56pt">
 <col class="xl1193" width="70" style="mso-width-source:userset;mso-width-alt:2560;
 width:53pt">
 <col class="xl1193" width="76" style="mso-width-source:userset;mso-width-alt:2779;
 width:57pt">
 <col class="xl1193" width="54" style="mso-width-source:userset;mso-width-alt:1974;
 width:41pt">
 <col class="xl1193" width="116" style="mso-width-source:userset;mso-width-alt:
 4242;width:87pt">
 <col class="xl1193" width="70" style="mso-width-source:userset;mso-width-alt:2560;
 width:53pt">
 <col class="xl1193" width="73" style="mso-width-source:userset;mso-width-alt:2669;
 width:55pt">
 <col class="xl1193" width="230" style="mso-width-source:userset;mso-width-alt:
 8411;width:173pt">
 <col class="xl1193" width="67" span="2" style="mso-width-source:userset;mso-width-alt:
 2450;width:50pt">
 <col class="xl1193" width="23" style="mso-width-source:userset;mso-width-alt:841;
 width:17pt">
 <col class="xl1193" width="22" span="2" style="mso-width-source:userset;mso-width-alt:
 804;width:17pt">
 <col class="xl1193" width="35" style="mso-width-source:userset;mso-width-alt:1280;
 width:26pt">
 <col class="xl1193" width="22" style="mso-width-source:userset;mso-width-alt:804;
 width:17pt">
 <col class="xl1193" width="28" style="mso-width-source:userset;mso-width-alt:1024;
 width:21pt">
 <col class="xl1193" width="25" style="mso-width-source:userset;mso-width-alt:914;
 width:19pt">
 <col class="xl1193" width="64" span="22" style="width:48pt">
 </colgroup><tbody><tr height="34" style="mso-height-source:userset;height:25.5pt">
  <td height="34" class="xl1559" width="16" style="height:25.5pt;width:12pt"><a name="RANGE!A1"><span style="mso-spacerun:yes">&nbsp;</span></a></td>
  <td class="xl1560" width="64" style="width:48pt">&nbsp;</td>
  <td class="xl1561" width="139" style="width:104pt">&nbsp;</td>
  <td class="xl1561" width="64" style="width:48pt">&nbsp;</td>
  <td class="xl1561" width="67" style="width:50pt">&nbsp;</td>
  <td class="xl1561" width="74" style="width:56pt">&nbsp;</td>
  <td class="xl1561" width="70" style="width:53pt">&nbsp;</td>
  <td class="xl1561" width="76" style="width:57pt">&nbsp;</td>
  <td class="xl1560" width="54" style="width:41pt">&nbsp;</td>
  <td class="xl1560" width="116" style="width:87pt">&nbsp;</td>
  <td class="xl1560" width="70" style="width:53pt">&nbsp;</td>
  <td class="xl1560" width="73" style="width:55pt">&nbsp;</td>
  <td colspan="3" height="34" width="364" style="height:25.5pt;width:273pt" align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:5;margin-left:340px;margin-top:8px;width:38px;
  height:37px"><img width="38" height="37" src="image054.png" v:shapes="Picture_x0020_2086"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td colspan="3" height="34" class="xl3059" width="364" style="height:25.5pt;
    width:273pt">&nbsp;</td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1562" width="23" style="width:17pt">&nbsp;</td>
  <td class="xl1193" width="22" style="width:17pt"></td>
  <td class="xl1193" width="22" style="width:17pt"></td>
  <td class="xl1193" width="35" style="width:26pt"></td>
  <td class="xl2608" colspan="3" width="75" style="mso-ignore:colspan;width:57pt">COD.
  1.3</td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl2408" width="64" style="width:48pt"><a href="#RANGE!A1"><span style="color:red;font-size:16.0pt">Menù</span></a></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
  <td class="xl1193" width="64" style="width:48pt"></td>
 </tr>
 <tr height="34" style="mso-height-source:userset;height:25.5pt">
  <td height="34" class="xl1563" style="height:25.5pt">&nbsp;</td>
  <td colspan="6" rowspan="2" class="xl3060" width="478" style="width:359pt">OLIMPIAS
  KNITTING doo</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="3" class="xl3061">Indice</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="28" style="mso-height-source:userset;height:21.0pt">
  <td height="28" class="xl1565" style="height:21.0pt">&nbsp;</td>
  <td class="xl1566"></td>
  <td class="xl1567"></td>
  <td align="left" valign="top">
   </x:ClientData>
  </v:shape><![endif]--><!--[if !vml]--><span style="mso-ignore:vglayout;
  position:absolute;z-index:16;margin-left:109px;margin-top:0px;width:169px;
  height:42px"><img width="169" height="42" src="image057.png" v:shapes="_x0000_s37904 CasellaDiTesto_x0020_35"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="28" class="xl1567" width="116" style="height:21.0pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="2" class="xl1584"></td>
  <td class="xl2100">Ricavi - mensili</td>
  <td class="xl1285">Pag.</td>
  <td class="xl1285">1</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td colspan="3" class="xl3062">divisione Abbigliamento</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2101">Grafico vendite</td>
  <td class="xl1194">"</td>
  <td class="xl1194">2</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="Immagine_x0020_2"
 

 <span style="mso-ignore:vglayout;
  position:absolute;z-index:20;margin-left:0px;margin-top:14px;width:545px;
  height:5px"><img width="545" height="5" src="image059.png" alt="cid:image001.png@01D2DABC.F97B4D40" v:shapes="Immagine_x0020_2"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1195" width="64" style="height:12.95pt;width:48pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="_x0000_s37891"
 

  

  <span style="mso-ignore:vglayout;
  position:absolute;z-index:3;margin-left:109px;margin-top:2px;width:166px;
  height:42px"><img width="166" height="42" src="image062.png" v:shapes="_x0000_s37891 CasellaDiTesto_x0020_15"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="2" class="xl1584"></td>
  <td class="xl2102">Conto Economico progressivo</td>
  <td class="xl1285">"</td>
  <td class="xl1285">3</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2102">Conto Economico mensilizzato</td>
  <td class="xl1285">"</td>
  <td class="xl1285">4</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2102">Conto Economico per Centro Profitto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">5</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2102">Conto Economico a costo del venduto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">6</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2103">Contabilità</td>
  <td class="xl1194">"</td>
  <td class="xl1194">7</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td colspan="4" rowspan="2" class="xl3054" width="334" style="width:250pt">Report
  mensile - mese :</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="Picture_x0020_1640"
 


  <span style="mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:108px;margin-top:2px;width:173px;
  height:43px"><img width="173" height="43" src="image065.png" v:shapes="Picture_x0020_1640 CasellaDiTesto_x0020_4"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1606"></td>
  <td class="xl1584"></td>
  <td class="xl2104">Costi consuntivi/budget</td>
  <td class="xl1285">"</td>
  <td class="xl1285">8</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td colspan="3" rowspan="2" class="xl3055" width="220" style="width:166pt">dicembre-20</td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Costi / Ricavi progressivi</td>
  <td class="xl1285">"</td>
  <td class="xl1285">9</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586"></td>
  <td class="xl2104">Costi mensili per Reparto</td>
  <td class="xl1285">"</td>
  <td class="xl1285">10</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586"></td>
  <td class="xl2104">Costo Energie</td>
  <td class="xl1285">"</td>
  <td class="xl1285">11</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1570"></td>
  <td class="xl1587"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Costo Materiali di consumo</td>
  <td class="xl1285">"</td>
  <td class="xl1285">12</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1569"></td>
  <td class="xl1570"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Sintesi margini x ASA</td>
  <td class="xl1285"></td>
  <td class="xl1285">13</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1585"></td>
  <td class="xl1585"></td>
  <td class="xl2104">Grafico costo orario Fase</td>
  <td class="xl1285"></td>
  <td class="xl1285">14</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1568"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2105">Costi Diretti / Indiretti x Fase</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1194">15</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1195"></td>
  <td class="xl1195"></td>
  <td class="xl1571">mese</td>
  <td class="xl1571">Progr.</td>
  <td class="xl1642">Progr. a.p.</td>
  <td class="xl1636">mese</td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td align="left" valign="top">
      <span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1357" width="116" style="height:12.95pt;width:87pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Saturazione Tessitura</td>
  <td class="xl1285">"</td>
  <td class="xl1285">16</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Produzioni mensili capi</td>
  <td class="xl1285">"</td>
  <td class="xl1285">17</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1197">Reparto</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">Eff. rep.</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">std</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1197">CE</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">qualità</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">assenze</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
  <td class="xl1193"></td>
  <td class="xl1197">cash</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">bdg</td>
  <td class="xl1198" width="64" style="border-left:none;width:48pt">eff</td>
 </tr>
 <tr height="16" style="mso-height-source:userset;height:12.6pt">
  <td height="16" class="xl1563" style="height:12.6pt">&nbsp;</td>
  <td class="xl1572"></td>
  <td class="xl1193"></td>
  <td class="xl1210"></td>
  <td class="xl1210"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1357"></td>
  <td class="xl1584"></td>
  <td class="xl1584"></td>
  <td class="xl2106">Efficienze mensili<span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class="xl1285">"</td>
  <td class="xl1285">18</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">LOR<span style="display:none">DA</span></td>
  <td class="xl1199" style="border-top:none">Tessitura</td>
  <td class="xl1200" style="border-left:none">86,3%</td>
  <td class="xl1200" style="border-left:none">85,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>48,43 </td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>246,07 </td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1202" style="border-left:none">1,0%</td>
  <td class="xl1202" style="border-left:none">2,8%</td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1202" style="border-left:none">6,0%</td>
  <td class="xl1202" style="border-left:none">8,0%</td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">azienda</td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>500,00 </td>
  <td class="xl1201" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1573" style="height:12.95pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1588">Fatturato</td>
  <td class="xl1196">&nbsp;</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>534 </td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>7.442 </td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>8.092 </td>
  <td class="xl1637">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>147 </td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2107">Produzione Reparti Interni</td>
  <td class="xl1194">"</td>
  <td class="xl1194">19-21</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">OPE<span style="display:none">RATOIR</span></td>
  <td class="xl1199" style="border-top:none">Confezione</td>
  <td class="xl1203" style="border-top:none;border-left:none">91,5%</td>
  <td class="xl1203" style="border-top:none;border-left:none">80,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1563" style="height:19.5pt">&nbsp;</td>
  <td class="xl1650">euro/000</td>
  <td class="xl1193"></td>
  <td class="xl1590"></td>
  <td class="xl1590"></td>
  <td class="xl1644"></td>
  <td class="xl1638"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1357"></td>
  <td align="left" valign="top"><!--[if gte vml 1]><v:shape id="_x0000_s37896"
  
<span style="mso-ignore:vglayout;
  position:absolute;z-index:8;margin-left:0px;margin-top:4px;width:166px;
  height:47px"><img width="166" height="47" src="image071.png" v:shapes="_x0000_s37896 CasellaDiTesto_x0020_20"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="26" class="xl1584" width="70" style="height:19.5pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1584"></td>
  <td class="xl2099">Organico per Reparto / mansione</td>
  <td class="xl1285">"</td>
  <td class="xl1285">22</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1649">OPE<span style="display:none">RATOIR</span></td>
  <td class="xl1199" style="border-top:none">Stiro</td>
  <td class="xl1203" style="border-top:none;border-left:none">69,6%</td>
  <td class="xl1203" style="border-top:none;border-left:none">70,0%</td>
  <td class="xl1204">rosso</td>
  <td class="xl1204">giallo</td>
  <td class="xl1204">verde</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1490"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>197,64<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1193"></td>
  <td class="xl1205">1,6%</td>
  <td class="xl1205" style="border-left:none">1,5%</td>
  <td class="xl1205" style="border-left:none">1,0%</td>
  <td class="xl1193"></td>
  <td class="xl1205">7,0%</td>
  <td class="xl1205" style="border-left:none">7,0%</td>
  <td class="xl1205" style="border-left:none">5,0%</td>
  <td class="xl1193"></td>
  <td class="xl1206"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1206" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>375,00 </td>
  <td class="xl1206" style="border-left:none"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>500,00 </td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Efficienza Stabilimento<font class="font250"> </font><font class="font251">( std 78</font><span style="display:none"><font class="font251">% )</font></span></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">74,0%</td>
  <td class="xl1645">76,5%</td>
  <td class="xl1639">74%</td>
  <td class="xl1357"></td>
  <td class="xl1586"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2099">Assenteismo e Straordinario</td>
  <td class="xl1285">"</td>
  <td class="xl1285">23-24</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1205" style="border-top:none">82,5%</td>
  <td class="xl1205" style="border-top:none;border-left:none">78,3%</td>
  <td class="xl1205" style="border-left:none">75,0%</td>
  <td class="xl1205" style="border-left:none">77,0%</td>
  <td class="xl1205" style="border-left:none">80,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="18" style="mso-height-source:userset;height:13.5pt">
  <td height="18" class="xl1563" style="height:13.5pt">&nbsp;</td>
  <td class="xl1574"></td>
  <td class="xl1195"></td>
  <td class="xl1592"></td>
  <td class="xl1592"></td>
  <td class="xl1646"></td>
  <td class="xl1640"></td>
  <td colspan="2" rowspan="2" class="xl3056" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189" align="right">2</td>
  <td class="xl2190">Costo del Lavoro</td>
  <td class="xl1194">"</td>
  <td class="xl1194">25</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Risultato economico
  ante</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>246 </td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>854 </td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2.447 </td>
  <td class="xl1641">######</td>
  <td class="xl1357"></td>
  <td align="left" valign="top">
 
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><v:shape id="_x0000_s37901" type="#_x0000_t75" style='position:absolute;
   margin-left:0;margin-top:2.25pt;width:92.25pt;height:27.75pt;z-index:13;
   visibility:visible;
   <v:imagedata src="image073.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><v:shape id="CasellaDiTesto_x0020_24" o:spid="_x0000_s37902"
   type="#_x0000_t75" style='position:absolute;margin-left:8.25pt;margin-top:34.5pt;
   width:117.75pt;height:24pt;z-index:14;visibility:visible;mso-wrap-style:square;
   v-text-anchor:top
" o:insetmode="auto">
   <v:imagedata src="image074.png" o:title=""/>
   <o:lock v:ext="edit" aspectratio="f"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><v:shape id="CasellaDiTesto_x0020_29" o:spid="_x0000_s37903"
   type="#_x0000_t75" style='position:absolute;margin-left:8.25pt;margin-top:5.25pt;
   width:117.75pt;height:30pt;z-index:15;visibility:visible;mso-wrap-style:square;
   v-text-anchor:top
" o:insetmode="auto">
   <v:imagedata src="image075.png" o:title=""/>
   <o:lock v:ext="edit" aspectratio="f"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><!--[if !vml]--><span style="mso-ignore:vglayout;
  position:absolute;z-index:12;margin-left:0px;margin-top:3px;width:168px;
  height:75px"><img width="168" height="75" src="image076.png" v:shapes="_x0000_s37900 _x0000_s37901 CasellaDiTesto_x0020_24 CasellaDiTesto_x0020_29"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1584" width="70" style="height:12.95pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl1582">Situazione Magazzini</td>
  <td class="xl1285">"</td>
  <td class="xl1285">26</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1575" style="height:19.5pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1650">euro/000</td>
  <td class="xl1195"></td>
  <td class="xl1592"></td>
  <td class="xl1592"></td>
  <td class="xl1646"></td>
  <td class="xl1640"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189">&nbsp;</td>
  <td class="xl2191">&nbsp;</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199">Tessitura</td>
  <td class="xl1200" style="border-left:none">86,3%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1575" style="height:12.95pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">2^ sc. Tessitura <font class="font251">( std 1% )</font></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">2,3%</td>
  <td class="xl1645">2,6%</td>
  <td class="xl1639">2%</td>
  <td class="xl1193"></td>
  <td class="xl1584"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2108">Investimenti</td>
  <td class="xl1285">"</td>
  <td class="xl1285">27-28</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">Confezione</td>
  <td class="xl1203" style="border-top:none;border-left:none">75,3%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="18" style="mso-height-source:userset;height:13.5pt">
  <td height="18" class="xl1563" style="height:13.5pt">&nbsp;</td>
  <td class="xl1576"></td>
  <td class="xl1193"></td>
  <td class="xl1593"></td>
  <td class="xl1593"></td>
  <td class="xl1647"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2188">&nbsp;</td>
  <td class="xl2189" align="right">2</td>
  <td class="xl2192">Manutenzioni ordinarie</td>
  <td class="xl1194">"</td>
  <td class="xl1194">29</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1199" style="border-top:none">Stiro</td>
  <td class="xl1203" style="border-top:none;border-left:none">63,5%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">% Assenteismo <font class="font251">( std 6% )</font><font class="font250"><span style="mso-spacerun:yes">&nbsp;</span></font></td>
  <td class="xl1591">0,0%</td>
  <td class="xl1591">8,4%</td>
  <td class="xl1645">7,5%</td>
  <td class="xl1639">8%</td>
  <td class="xl1193"></td>
  <td align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:10;margin-left:0px;margin-top:7px;width:169px;
  height:46px"><img width="169" height="46" src="image079.png" v:shapes="_x0000_s37898 CasellaDiTesto_x0020_26"></span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" class="xl1584" width="70" style="height:12.95pt;width:53pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Situazione addebiti</td>
  <td class="xl1285">"</td>
  <td class="xl1285">30</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1205" style="border-top:none">75,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="26" style="mso-height-source:userset;height:19.5pt">
  <td height="26" class="xl1575" style="height:19.5pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1572"></td>
  <td class="xl1193"></td>
  <td class="xl1594"></td>
  <td class="xl1594"></td>
  <td class="xl1648"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1577"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Situazione Finanziaria</td>
  <td class="xl1285">"</td>
  <td class="xl1285">31</td>
  <td class="xl1564">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="mso-height-source:userset;height:12.95pt">
  <td height="17" class="xl1563" style="height:12.95pt">&nbsp;</td>
  <td class="xl1588" colspan="2" style="mso-ignore:colspan">Attivo finanz. a breve</td>
  <td class="xl1589">&nbsp;</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>-<span style="mso-spacerun:yes">&nbsp;&nbsp; </span></td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2.589 </td>
  <td class="xl1637"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1586"></td>
  <td class="xl2100">dati storici</td>
  <td class="xl1285">"</td>
  <td class="xl1285"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="20" style="mso-height-source:userset;height:15.0pt">
  <td height="20" class="xl1575" style="height:15.0pt"><u style="visibility:hidden;
  mso-ignore:visibility">&nbsp;</u></td>
  <td class="xl1650">euro/000</td>
  <td class="xl1193"></td>
  <td class="xl1594"></td>
  <td class="xl1594"></td>
  <td class="xl1649"></td>
  <td class="xl1210"></td>
  <td colspan="2" rowspan="2" class="xl3058" style="border-bottom:.5pt dashed black">&nbsp;</td>
  <td class="xl1193"></td>
  <td class="xl1558"></td>
  <td class="xl1586" align="right">2</td>
  <td class="xl2100">Confronto costi eff / costi tariffa</td>
  <td class="xl1285">"</td>
  <td class="xl1285">n.d.</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="21" style="height:15.75pt">
  <td height="21" class="xl1563" style="height:15.75pt">&nbsp;</td>
  <td class="xl1214" colspan="2" style="mso-ignore:colspan">nr Dipendenti</td>
  <td class="xl1589"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>710 </td>
  <td class="xl1589">&nbsp;</td>
  <td class="xl1643"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>664 </td>
  <td class="xl1639">0%</td>
  <td class="xl1583">&nbsp;</td>
  <td class="xl2193">&nbsp;</td>
  <td class="xl2189">&nbsp;</td>
  <td class="xl2194">&nbsp;</td>
  <td class="xl1194">"</td>
  <td class="xl1194">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td class="xl1580">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1581">&nbsp;</td>
  <td class="xl1193"></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td align="left" valign="top"><span style="mso-ignore:vglayout;
  position:absolute;z-index:18;margin-left:17px;margin-top:10px;width:537px;
  height:208px">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td width="0" height="0"></td>
    <td width="252"></td>
    <td width="61"></td>
    <td width="224"></td>
   </tr>
   <tr>
    <td height="2"></td>
    <td colspan="2"></td>
    <td rowspan="3" align="left" valign="top"><img width="224" height="208" src="image082.png" v:shapes="Grafico_x0020_32"></td>
   </tr>
   <tr>
    <td height="200"></td>
    <td align="left" valign="top"><img width="252" height="200" src="image083.png" v:shapes="Grafico_x0020_21"></td>
   </tr>
   <tr>
    <td height="6"></td>
   </tr>
  </tbody></table>
  </span><!--[endif]--><span style="mso-ignore:vglayout2">
  <table cellpadding="0" cellspacing="0">
   <tbody><tr>
    <td height="17" width="64" style="height:12.75pt;width:48pt"></td>
   </tr>
  </tbody></table>
  </span></td>
  <td colspan="9" style="mso-ignore:colspan"></td>
  <td class="xl1651"></td>
  <td></td>
  <td class="xl1651" colspan="2" style="mso-ignore:colspan">NOTE DI EFFICIENZA</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1651"></td>
  <td colspan="3" style="mso-ignore:colspan"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1563" style="height:12.75pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1655">Macro costi</td>
  <td></td>
  <td class="xl1655"></td>
  <td></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costo del Personale</td>
  <td class="xl1848">#REF!</td>
  <td class="xl1848">#REF!</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Consumi Energia</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1652">0</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costo Manutenzioni</td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656" colspan="2" style="mso-ignore:colspan">Costi Generali</td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1655" colspan="2" style="mso-ignore:colspan">Conto economico di
  Linea<span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class="xl1655"></td>
  <td class="xl1653"></td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">TESSITURA</td>
  <td></td>
  <td class="xl1654">&nbsp;</td>
  <td class="xl1776">-1</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">CONFEZIONE</td>
  <td></td>
  <td class="xl1652" style="border-top:none">5</td>
  <td class="xl1652" style="border-top:none">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="19" style="height:14.25pt">
  <td height="19" class="xl1563" style="height:14.25pt">&nbsp;</td>
  <td colspan="10" style="mso-ignore:colspan"></td>
  <td class="xl1656">STIRO</td>
  <td></td>
  <td class="xl1652">5</td>
  <td class="xl1652">&nbsp;</td>
  <td class="xl1578">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1517" style="height:12.75pt">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1517">&nbsp;</td>
  <td class="xl1598">&nbsp;</td>
  <td colspan="7" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td colspan="22" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1211"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td colspan="12" style="mso-ignore:colspan"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193">gennaio</td>
  <td class="xl1193">febbraio</td>
  <td class="xl1193">marzo</td>
  <td class="xl1193">aprile</td>
  <td class="xl1193">maggio</td>
  <td class="xl1193">giugno</td>
  <td class="xl1193">luglio</td>
  <td class="xl1193">agosto</td>
  <td class="xl1193">settembre</td>
  <td class="xl1193">ottobre</td>
  <td class="xl1193">novembre</td>
  <td class="xl1193" colspan="3" style="mso-ignore:colspan">dicembre</td>
  <td class="xl1193" colspan="2" style="mso-ignore:colspan">TOTALE</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Efficienza <span style="display:none">Produttiva</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">74,0%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1469" align="right">74,0%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1213" colspan="2" style="mso-ignore:colspan">lorda dei reparti</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Risultato <span style="display:none">economico</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>12,0 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>64,9 </td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>14,6 </td>
  <td class="xl1492">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>157,7 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp; </span>104,1 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>197,2 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>206,7 </td>
  <td class="xl1492"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>37,8 </td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1492"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1195"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Qualità te<span style="display:none">ssitura</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">1,6%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1208"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Assenteis<span style="display:none">mo</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1212" align="right">7,0%</td>
  <td class="xl1212" align="right">8,7%</td>
  <td class="xl1212" align="right">19,1%</td>
  <td class="xl1212" align="right">28,5%</td>
  <td class="xl1212" align="right">11,0%</td>
  <td class="xl1212" align="right">9,5%</td>
  <td class="xl1212" align="right">11,9%</td>
  <td class="xl1212" align="right">11,3%</td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1212"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1469" align="right">8,4%</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1209"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">Attivo fina<span style="display:none">nz. a breve</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>134 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>324 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>342 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>345 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>324 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1491"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>435 </td>
  <td class="xl1286"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">nr dipend<span style="display:none">enti</span></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl2409" align="right">650</td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl2409"></td>
  <td class="xl1487"></td>
  <td class="xl2409"></td>
  <td class="xl1487"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1286"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1207">fatturato</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1679" align="right">575</td>
  <td class="xl1679" align="right">685</td>
  <td class="xl1679" align="right">561</td>
  <td class="xl1679" align="right">304</td>
  <td class="xl1679" align="right">702</td>
  <td class="xl1679" align="right">833</td>
  <td class="xl1679" align="right">863</td>
  <td class="xl1679" align="right">686</td>
  <td class="xl1679" align="right">510</td>
  <td class="xl1679" align="right">658</td>
  <td class="xl1679" align="right">550</td>
  <td class="xl1679" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>451 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>657 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>802 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>291 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>730 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>730 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>698 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>682 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>657 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>749 </td>
  <td class="xl1467"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>646 </td>
  <td class="xl1467" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <tr height="17" style="height:12.75pt">
  <td height="17" class="xl1193" style="height:12.75pt"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>124 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>29 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>241 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>13 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>27 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>103 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>164 </td>
  <td class="xl1487"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>5 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>147 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>91 </td>
  <td class="xl1487">-<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>96 </td>
  <td class="xl1487" align="center">##</td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
  <td class="xl1193"></td>
 </tr>
 <!--[if supportMisalignedColumns]-->
 <tr height="0" style="display:none">
  <td width="16" style="width:12pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="139" style="width:104pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="74" style="width:56pt"></td>
  <td width="70" style="width:53pt"></td>
  <td width="76" style="width:57pt"></td>
  <td width="54" style="width:41pt"></td>
  <td width="116" style="width:87pt"></td>
  <td width="70" style="width:53pt"></td>
  <td width="73" style="width:55pt"></td>
  <td width="230" style="width:173pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="67" style="width:50pt"></td>
  <td width="23" style="width:17pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="35" style="width:26pt"></td>
  <td width="22" style="width:17pt"></td>
  <td width="28" style="width:21pt"></td>
  <td width="25" style="width:19pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
  <td width="64" style="width:48pt"></td>
 </tr>
 <!--[endif]-->
</tbody></table>




</body></html>
 <noframes>
  <body>
   <p>This page uses frames, but your browser doesn't support them.</p>
  </body>
 </noframes>
</frameset>

</body>
</html>
