<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_Stiro.aspx.cs" Inherits="Views_Produzione_Stiro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="../../css/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/_stiro_rework.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    
             <header class="header">
        <div class="row header-first flex justify-content-between align-items-center">
          <div class="col-md-auto col-xs-12 d-block first-d">
                 <a href="#" id="btn-eff" class="btn btn-sm mode active">Efficiency</a>
                        <a href="#" id="btn-qty" class="btn btn-sm mode">Quantity</a>
                        <a href="#" id="btn-machine" class="btn btn-sm mode">Machines</a>
                        <asp:Button runat="server" CssClass="btn btn-sm btn-reload mode" OnClick="Reload_Click" Text="Reload" />
          </div>
          <div class="col-md-auto col-xs-12 text-center d-block">
                 <asp:Label runat="server" CssClass="right-eff pr-4" ID="lbl_eff_tot_prezente"></asp:Label>
                   <asp:Label runat="server" CssClass="right-eff" ID="lbl_eff_tot_reparto"></asp:Label>
          </div>
          <div class="col-md-auto col-xs-12 mr-md-4 mt-xs-4 d-flex justify-content-center align-items-center d-block">
             <ul class="product-color">
                            <li>
                            <input type="radio" name="color" class="btn-color-default" id="#A2C2C9" checked="checked"/>
                            <label for="#A2C2C9" style="background-color:#A2C2C9" data-toggle="tooltip" data-placement="bottom" title="mostra tutto"></label>
                          </li>

                            <li>
                            <input type="radio" name="color" class="btn-color-green" id="#4CAF50"/>
                            <label for="#4CAF50" style="background-color:#28a745" data-toggle="tooltip" data-placement="bottom" title="0% -> 70%"></label>
                          </li>

                              <li>
                            <input type="radio" name="color" class="btn-color-yellow" id="#EFDBD4"/>
                            <label for="#EFDBD4" style="background-color:#fef102" data-toggle="tooltip" data-placement="bottom" title="71% -> 89%"></label>
                          </li>

                          <li>
                            <input type="radio" name="color" class="btn-color-red" id="red"/>
                            <label for="red" style="background-color:#dc3545" data-toggle="tooltip" data-placement="bottom" title="90% -> 100%"></label>
                          </li>
                            <li > 
                            <label onclick="openFullscreen()"> 
                                <img src="../../img/expand.svg" style="display:block;"  data-toggle="tooltip" data-placement="bottom" title="Full Screen" />
                            </label>
                        </li>
                        </ul>
          </div>
        </div>
      </header>
    
        <div class="container-fluid">
 
        
            <%-- L1 START --%>
            <div>
                <div class="row">
                    <span class="title-tag">LINEA 1</span>
                </div>
                    <hr />
                <div class="row card-deck text-center main-row justify-content-center">
                    <div class="">
                        <span class="total-span-big"><span class="tot-piego" runat="server" id="PIEGO"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">PIEGO</h6>
                                <span class="span-qty qtypgL1" ></span>

                                <div class="progress">
                                  <div class=" pgL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL1" runat="server" TabIndex="0380"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL1" runat="server" TabIndex="0381"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL1" runat="server" TabIndex="0382"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL1" runat="server" TabIndex="0383"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <span class="total-span-small"><span class="tot-cartellino" runat="server" id="CARTELLINO"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">CARTELLINO</h6>
                                <span class="span-qty qtyctlL1" ></span>
                                <div class="progress">
                                  <div class="ctlL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine cartL1" runat="server" TabIndex="0426"></asp:Label>
                                </div>                            
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <span class="total-span-big"><span class="tot-pressa" runat="server" id="PRESSA"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal" >PRESSA</h6>
                                <span class="span-qty qtypsL1" ></span>
                                <div class="progress">
                                  <div class="psL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar" ></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL1" runat="server" TabIndex="0384"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL1" runat="server" TabIndex="0385"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL1" runat="server" TabIndex="0386"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="">
                            <span class="total-span-small"><span class="tot-rammendo" runat="server" id="RAMMENDO"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">RAMMENDO</h6>
                                <span class="span-qty qtyrmL1" ></span>
                                <div class="progress">
                                  <div class="rmL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-block rammendo-block">
                                    <asp:Label CssClass="machine ramL1" runat="server" TabIndex="0387"></asp:Label>
                                </div>
                                <div class="d-block rammendo-block">
                                    <asp:Label CssClass="machine ramL1" runat="server" TabIndex="0388"></asp:Label>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <span class="total-span-big"><span class="tot-manichino" runat="server" id="MANICHINO"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">MANICHINO</h6>
                                <span class="span-qty qtymnL1" ></span>
                                <div class="progress">
                                  <div class="mnL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL1" runat="server" TabIndex="0389"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL1" runat="server" TabIndex="0390"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL1" runat="server" TabIndex="0391"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <span class="total-span-big"><span class="tot-etichette" runat="server" id="ETICHETTE"></span></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">ETICHETTE</h6>
                                <span class="span-qty qtyetL1" ></span>
                                <div class="progress">
                                  <div class="etL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL1" runat="server" TabIndex="0392"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL1" runat="server" TabIndex="0393"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL1" runat="server" TabIndex="0394"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- L1 END --%>

            <%-- L2 START --%>
            <div>
                <div class="row">
                        <span class="title-tag">LINEA 2</span>
                    </div>
                    <hr />
                <div class="row card-deck   text-center main-row justify-content-center">
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">PIEGO</h6>
                                <span class="span-qty qtypgL2"></span>
                                <div class="progress">
                                  <div class=" pgL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL2" runat="server" TabIndex="0395"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL2" runat="server" TabIndex="0396"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL2" runat="server" TabIndex="0397"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label runat="server" CssClass="machine piegoL2"  TabIndex="0398"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">CARTELLINO</h6>
                                <span class="span-qty qtyctlL2"></span>
                                <div class="progress">
                                  <div class="ctlL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar" ></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine cartL2" runat="server" TabIndex="0427"></asp:Label>
                                </div>                            
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">PRESSA</h6>
                                <span class="span-qty qtypsL2"></span>
                                <div class="progress">
                                  <div class="psL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL2" runat="server" TabIndex="0399"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL2" runat="server" TabIndex="0400"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL2" runat="server" TabIndex="0401"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">RAMMENDO</h6>
                                <span class="span-qty qtyrmL2"></span>
                                <div class="progress">
                                  <div class="rmL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-block rammendo-block ramL2">
                                    <asp:Label CssClass="machine" runat="server" TabIndex="0402"></asp:Label>
                                </div>
                                <div class="d-block rammendo-block">
                                    <asp:Label CssClass="machine ramL2" runat="server" TabIndex="0403"></asp:Label>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">MANICHINO</h6>
                                <span class="span-qty qtymnL2"></span>
                                <div class="progress">
                                  <div class="mnL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL2" runat="server" TabIndex="0404"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL2" runat="server" TabIndex="0405"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL2" runat="server" TabIndex="0406"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">ETICHETTE</h6>
                                <span class="span-qty qtyetL2"></span>
                                <div class="progress">
                                  <div class="etL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL2" runat="server" TabIndex="0407"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL2" runat="server" TabIndex="0408"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL2" runat="server" TabIndex="0409"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- L2 END --%>

            <%-- L3 START --%>
            <div>
                <div class="row">
                        <span class="title-tag">LINEA 3</span>
                    </div>
                    <hr />
                <div class="row card-deck   text-center main-row justify-content-center">
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">PIEGO</h6>
                                <span class="span-qty qtypgL3"></span>
                                <div class="progress">
                                  <div class=" pgL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL3" runat="server" TabIndex="0410"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL3" runat="server" TabIndex="0411"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL3" runat="server" TabIndex="0412"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine piegoL3" runat="server" TabIndex="0413"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">CARTELLINO</h6>
                                <span class="span-qty qtyctlL3"></span>
                                <div class="progress">
                                  <div class="ctlL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine cartL3" runat="server" TabIndex="0428"></asp:Label>
                                </div>                            
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">PRESSA</h6>
                                <span class="span-qty qtypsL3"></span>
                                <div class="progress">
                                  <div class="psL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL3" runat="server" TabIndex="0414"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL3" runat="server" TabIndex="0415"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine presL3" runat="server" TabIndex="0416"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">RAMMENDO</h6>
                                <span class="span-qty qtyrmL3"></span>
                                <div class="progress">
                                  <div class="rmL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-block rammendo-block">
                                    <asp:Label CssClass="machine ramL3" runat="server" TabIndex="0417"></asp:Label>
                                </div>
                                <div class="d-block rammendo-block">
                                    <asp:Label CssClass="machine ramL3" runat="server" TabIndex="0418"></asp:Label>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">MANICHINO</h6>
                                <span class="span-qty qtymnL3"></span>
                                <div class="progress">
                                  <div class="mnL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL3" runat="server" TabIndex="0419"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL3" runat="server" TabIndex="0420"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block manichino-block">
                                    <asp:Label CssClass="machine manL3" runat="server" TabIndex="0421"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal">ETICHETTE</h6>
                                <span class="span-qty qtyetL3"></span>
                                <div class="progress">
                                  <div class="etL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL3" runat="server" TabIndex="0422"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL3" runat="server" TabIndex="0423"></asp:Label>
                                </div>
                                <div class="d-inline-block piego-block">
                                    <asp:Label CssClass="machine eteL3" runat="server" TabIndex="0424"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- L3 END --%>

            <div class="row">
                     <asp:Label runat="server" ID="lbl_time"></asp:Label>
                     <span class="countdown"></span>
            </div>
        </div>
    </form>
    <script src="../../js/jQuery-3.5.1.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../css/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
            $('.machine').each(function () {
                var machineValue = $(this).text();
                var value = machineValue.substring(0, machineValue.length - 1);
                if (parseInt(value) <= 70) {
                    $(this).parent().addClass('red');
                } else if (parseInt(value) >= 71 && parseInt(value) < 90) {
                    $(this).parent().addClass('yellow');
                } else if (parseInt(value) >= 90) {
                    $(this).parent().addClass('green');
                }
            });

            $('.right-eff').each(function () {
                if (parseInt($(this).attr('eff')) <= 70) {
                    //$(this).css({ "color": "#dc3545" });
                    $(this).css({ "color": "black" });
                    $('.header').css({ "background": "#dc3545e3" });
                } else if (parseInt($(this).attr('eff')) >= 71 && parseInt($(this).attr('eff')) < 90) {
                    $(this).css({ "color": "black" });
                    $('.header').css({ "background": "#ffc107" });
                } else if (parseInt($(this).attr('eff')) >= 90) {
                    //$(this).css({ "color": "#28a745" });
                    $(this).css({ "color": "black" });
                    $('.header').css({ "background": "#28a745d4" });
                }
            });
            calculatePercentage('.piegoL1', '.pgL1', '.qtypgL1');
            calculatePercentage('.piegoL2', '.pgL2', '.qtypgL2');
            calculatePercentage('.piegoL3', '.pgL3', '.qtypgL3');
            calculatePercentage('.cartL1', '.ctlL1', '.qtyctlL1');
            calculatePercentage('.cartL2', '.ctlL2', '.qtyctlL2');
            calculatePercentage('.cartL3', '.ctlL3', '.qtyctlL3');
            calculatePercentage('.presL1', '.psL1', '.qtypsL1');
            calculatePercentage('.presL2', '.psL2', '.qtypsL2');
            calculatePercentage('.presL3', '.psL3', '.qtypsL3');
            calculatePercentage('.ramL1', '.rmL1', '.qtyrmL1');
            calculatePercentage('.ramL2', '.rmL2', '.qtyrmL2');
            calculatePercentage('.ramL3', '.rmL3', '.qtyrmL3');
            calculatePercentage('.manL1', '.mnL1', '.qtymnL1');
            calculatePercentage('.manL2', '.mnL2', '.qtymnL2');
            calculatePercentage('.manL3', '.mnL3', '.qtymnL3');
            calculatePercentage('.eteL1', '.etL1', '.qtyetL1');
            calculatePercentage('.eteL2', '.etL2', '.qtyetL2');
            calculatePercentage('.eteL3', '.etL3', '.qtyetL3');

            calculateTotalsByJobType('.piegoL1', '.piegoL2', '.piegoL3', '.tot-piego');
            calculateTotalsByJobType('.cartL1', '.cartL2', '.cartL3', '.tot-cartellino');
            calculateTotalsByJobType('.presL1', '.presL2', '.presL3', '.tot-pressa');
            calculateTotalsByJobType('.ramL1', '.ramL2', '.ramL3', '.tot-rammendo');
            calculateTotalsByJobType('.manL1', '.manL2', '.manL3', '.tot-manichino');
            calculateTotalsByJobType('.eteL1', '.eteL2', '.eteL3', '.tot-etichette');

            $('#btn-eff').click(function () {
                $('.machine').each(function () {
                    if (parseInt($(this).attr('eff')) > 0) {
                        $(this).text($(this).attr('eff') + '%');
                    }
                })
                $('.mode').removeClass('active');
                $(this).addClass('active');
            });
            $('#btn-qty').click(function () {
                $('.machine').each(function () {
                    if (parseInt($(this).attr('qty')) > 0) {
                        $(this).text($(this).attr('qty'));
                    }
                })
                $('.mode').removeClass('active');
                $(this).addClass('active');
            });
            $('#btn-machine').click(function () {
                $('.machine').each(function () {
                        $(this).text($(this).attr('machine'));
                })
                $('.mode').removeClass('active');
                $(this).addClass('active');
            });

        $('.btn-color-default').click(function () {
            $('.green').css('visibility', 'visible');
            $('.yellow').css('visibility', 'visible');
            $('.red').css('visibility', 'visible');
        });
        $('.btn-color-green').click(function () {
            $('.green').css('visibility', 'visible');
            $('.yellow').css('visibility', 'hidden');
            $('.red').css('visibility', 'hidden');
        });
        $('.btn-color-yellow').click(function () {
            $('.green').css('visibility', 'hidden');
            $('.yellow').css('visibility', 'visible');
            $('.red').css('visibility', 'hidden');
        });
        $('.btn-color-red').click(function () {
            $('.green').css('visibility', 'hidden');
            $('.yellow').css('visibility', 'hidden');
            $('.red').css('visibility', 'visible');
        });

            $('[data-toggle="tooltip"]').tooltip();
            timer();
    });

      function calculateTotalsByJobType(L1,L2,L3, exportClass) {
          var TotalQty = 0;
          $(L1).each(function () {
              TotalQty += isNaN(parseInt($(this).attr("qty"))) ? 0 : parseInt($(this).attr("qty"));
          });
          $(L2).each(function () {
              TotalQty += isNaN(parseInt($(this).attr("qty"))) ? 0 : parseInt($(this).attr("qty"));
          });
          $(L3).each(function () {
              TotalQty += isNaN(parseInt($(this).attr("qty"))) ? 0 : parseInt($(this).attr("qty"));
          });

          //$(exportClass).text('Tot: ' + TotalQty);
      }
      function calculatePercentage(className, progressName, qtyShowName) {
            var activeMachinesPiegoL1 = 0;
            var sumPiegoL1 = 0;
            var sumQty = 0;
            
            $(className).each(function () {
                var machineValue = $(this).text();
                var value = machineValue.substring(0, machineValue.length - 1);
                var valueQty = $(this).attr("qty");

                if (parseInt(value) > 0) {
                    activeMachinesPiegoL1++;
                    sumPiegoL1 += parseInt(value);
                }

                if (parseInt(valueQty) > 0) {
                    sumQty += parseInt(valueQty);
                }

                
            });
            var totPiegoL1 = sumPiegoL1 / activeMachinesPiegoL1;
            generateProgressBar(totPiegoL1, progressName);
            $(qtyShowName).text(sumQty);

            
        }
      function generateProgressBar(total, className) {
            if (total > 0) {
            $(className).css('width', total.toFixed(0) + '%');
            $(className).text(total.toFixed(0) + '%');
            $(className).addClass(addProgressBackground(total.toFixed(0)));
            }
        }
      function addProgressBackground(total) {
            if (parseInt(total) <= 70) {
                return 'bg-danger';
            } else if (parseInt(total) >= 71 && parseInt(total) < 90) {
                return 'bg-warning';
            } else if (parseInt(total) >= 90) {
                return 'bg-success';
            }
      }
      function timer(){
          var timer2 = "5:01";
          var interval = setInterval(function () {


              var timer = timer2.split(':');
              //by parsing integer, I avoid all extra string processing
              var minutes = parseInt(timer[0], 10);
              var seconds = parseInt(timer[1], 10);
              --seconds;
              minutes = (seconds < 0) ? --minutes : minutes;
              if (minutes < 0) clearInterval(interval);
              seconds = (seconds < 0) ? 59 : seconds;
              seconds = (seconds < 10) ? '0' + seconds : seconds;
              $('.countdown').html('- Next reload: '+ minutes + ':' + seconds);
              timer2 = minutes + ':' + seconds;
              if (minutes == 0 && seconds == 0) {
                  $('.countdown').hide();
                  $('.btn-reload').click();
              }
          }, 1000);
      } 

      function openFullscreen(elem) {
          elem = elem || document.documentElement;

          if (!document.fullscreenElement && !document.mozFullScreenElement &&
              !document.webkitFullscreenElement && !document.msFullscreenElement) {
              if (elem.requestFullscreen) {
                  elem.requestFullscreen();
              } else if (elem.msRequestFullscreen) {
                  elem.msRequestFullscreen();
              } else if (elem.mozRequestFullScreen) {
                  elem.mozRequestFullScreen();
              } else if (elem.webkitRequestFullscreen) {
                  elem.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
              }
          } else {
              if (document.exitFullscreen) {
                  document.exitFullscreen();
              } else if (document.msExitFullscreen) {
                  document.msExitFullscreen();
              } else if (document.mozCancelFullScreen) {
                  document.mozCancelFullScreen();
              } else if (document.webkitExitFullscreen) {
                  document.webkitExitFullscreen();
              }
          }
      }
  </script>
</body>
</html>
