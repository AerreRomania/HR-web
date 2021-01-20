<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_confezioneA.aspx.cs" Inherits="Views_Produzione_confezioneA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="../../css/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/_stiro_rework.css" />
    <link rel="stylesheet" href="../../css/_confezione_rework.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
       <header class="header">
        <div class="row header-first flex justify-content-between align-items-center">
          <div class="col-md-auto col-xs-12 d-block first-d">
                 <a href="#" id="btn-eff" class="btn btn-sm mode active">Efficiency</a>
                        <a href="#" id="btn-qty" class="btn btn-sm mode">Quantity</a>
                        <a href="#" id="btn-machine" class="btn btn-sm mode">Machines</a>
                        <asp:Button runat="server" CssClass="btn btn-sm btn-reload mode" OnClick="Unnamed_Click" Text="Reload" />
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

           <%-- <header class="row header">
                <div class="col-lg-4 col-md-6 col-xs-12 header-item">
                    <div class="btn-group-sm">

                        <a href="#" id="btn-eff" class="btn btn-sm mode active">Efficiency</a>
                        <a href="#" id="btn-qty" class="btn btn-sm mode">Quantity</a>
                        <a href="#" id="btn-machine" class="btn btn-sm mode">Machines</a>
                        <asp:Button runat="server" CssClass="btn btn-sm btn-reload mode" OnClick="Unnamed_Click" Text="Reload" />
                    </div>
                </div>
                <div class="col-lg-5 col-md-3 col-xs-12 header-item" style="text-align: center;">
                   <asp:Label runat="server" CssClass="right-eff pr-4" ID="lbl_eff_tot_prezente"></asp:Label>
                   <asp:Label runat="server" CssClass="right-eff" ID="lbl_eff_tot_reparto"></asp:Label>
                </div>
                <div class="col-md-3 col-xs-12 text-right header-item">
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
                            <label for="#EFDBD4" style="background-color:#ffc107" data-toggle="tooltip" data-placement="bottom" title="71% -> 89%"></label>
                          </li>

                          <li>
                            <input type="radio" name="color" class="btn-color-red" id="red"/>
                            <label for="red" style="background-color:#dc3545" data-toggle="tooltip" data-placement="bottom" title="90% -> 100%"></label>
                          </li>
                        </ul>
                    </div>
            </header>--%>
             
            <div class="row card-deck text-center main-row justify-content-center">
                <%-- PANEL L13 --%>
                <asp:Panel runat="server" ID="L13" class="panel col-xs-12">
                        <span class="total-span-big tot-L13"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 13</h6>
                                <span class="span-qty qtyL13" runat="server" id="LINEA13"></span>

                                <div class="progress">
                                  <div class=" pgL13 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L13 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,1" ></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,17" ></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block circle" runat="server" data-possition="13,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L13 d-inline-block piego-block" runat="server" data-possition="13,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L14 --%>
                <asp:Panel runat="server" ID="L14" class="panel col-xs-12">
                        <span class="total-span-big tot-L14"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 14</h6>
                                <span class="span-qty qtyL14" runat="server" id="LINEA14"></span>

                                <div class="progress">
                                  <div class=" pgL14 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L14 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="14,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="14,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block circle" runat="server" data-possition="14,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L14 d-inline-block piego-block" runat="server" data-possition="14,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L15 --%>
                <asp:Panel runat="server" ID="L15" class="panel col-xs-12">
                        <span class="total-span-big tot-L15"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 15</h6>
                                <span class="span-qty qtyL15" runat="server" id="LINEA15"></span>

                                <div class="progress">
                                  <div class=" pgL15 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L15 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block circle" runat="server" data-possition="15,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L15 d-inline-block piego-block" runat="server" data-possition="15,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L16 --%>
                <asp:Panel runat="server" ID="L16" class="panel col-xs-12">
                        <span class="total-span-big tot-L16"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 16</h6>
                                <span class="span-qty qtyL16" runat="server" id="LINEA16"></span>

                                <div class="progress">
                                  <div class=" pgL16 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L16 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block circle" runat="server" data-possition="16,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L16 d-inline-block piego-block" runat="server" data-possition="16,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L17 --%>
                <asp:Panel runat="server" ID="L17" class="panel col-xs-12">
                        <span class="total-span-big tot-L17"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 17</h6>
                                <span class="span-qty qtyL17" runat="server" id="LINEA17"></span>

                                <div class="progress">
                                  <div class=" pgL17 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L17 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block circle" runat="server" data-possition="17,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L17 d-inline-block piego-block" runat="server" data-possition="17,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                <%-- PANEL L18 --%>
                <asp:Panel runat="server" ID="L18" class="panel col-xs-12">
                        <span class="total-span-big tot-L18"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 18</h6>
                                <span class="span-qty qtyL18" runat="server" id="LINEA18"></span>

                                <div class="progress">
                                  <div class=" pgL18 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L18 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block circle" runat="server" data-possition="18,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L18 d-inline-block piego-block" runat="server" data-possition="18,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 
            </div>

            <div class="row card-deck text-center main-row justify-content-center">
                <%-- PANEL L24 --%>
                <asp:Panel runat="server" ID="L24" class="panel col-xs-12">
                        <span class="total-span-big tot-L24"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 24</h6>
                                <span class="span-qty qtyL24" runat="server" id="LINEA24"></span>

                                <div class="progress">
                                  <div class=" pgL24 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L24 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block circle" runat="server" data-possition="24,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L24 d-inline-block piego-block" runat="server" data-possition="24,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L23 --%>
                <asp:Panel runat="server" ID="L23" class="panel col-xs-12">
                        <span class="total-span-big tot-L23"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 23</h6>
                                <span class="span-qty qtyL23" runat="server" id="LINEA23"></span>

                                <div class="progress">
                                  <div class=" pgL23 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L23 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block circle" runat="server" data-possition="23,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L23 d-inline-block piego-block" runat="server" data-possition="23,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L22 --%>
                <asp:Panel runat="server" ID="L22" class="panel col-xs-12">
                        <span class="total-span-big tot-L22"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 22</h6>
                                <span class="span-qty qtyL22" runat="server" id="LINEA22"></span>

                                <div class="progress">
                                  <div class=" pgL22 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L22 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block circle" runat="server" data-possition="22,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L22 d-inline-block piego-block" runat="server" data-possition="22,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L21 --%>
                <asp:Panel runat="server" ID="L21" class="panel col-xs-12">
                        <span class="total-span-big tot-L21"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 21</h6>
                                <span class="span-qty qtyL21" runat="server" id="LINEA21"></span>

                                <div class="progress">
                                  <div class=" pgL21 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L21 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block circle" runat="server" data-possition="21,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L21 d-inline-block piego-block" runat="server" data-possition="21,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                  <%-- PANEL L20 --%>
                <asp:Panel runat="server" ID="L20" class="panel col-xs-12">
                        <span class="total-span-big tot-L20"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 20</h6>
                                <span class="span-qty qtyL20" runat="server" id="LINEA20"></span>

                                <div class="progress">
                                  <div class=" pgL20 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L20 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block circle" runat="server" data-possition="20,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L20 d-inline-block piego-block" runat="server" data-possition="20,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L19 --%>
                <asp:Panel runat="server" ID="L19" class="panel col-xs-12">
                        <span class="total-span-big tot-L19"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 19</h6>
                                <span class="span-qty qtyL19" runat="server" id="LINEA19"></span>

                                <div class="progress">
                                  <div class=" pgL19 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L19 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block circle" runat="server" data-possition="19,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L19 d-inline-block piego-block" runat="server" data-possition="19,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 
            </div>
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
                  $(this).addClass('red');
              } else if (parseInt(value) >= 71 && parseInt(value) < 90) {
                  $(this).addClass('yellow');
              } else if (parseInt(value) >= 90) {
                  $(this).addClass('green');
              }
          });

          $('.right-eff').each(function () {
              if (parseInt($(this).attr('eff')) <= 70) {
                  $(this).css({ "color": "#dc3545" });
              } else if (parseInt($(this).attr('eff')) >= 71 && parseInt($(this).attr('eff')) < 90) {
                  $(this).css({ "color": "#ffc107" });
              } else if (parseInt($(this).attr('eff')) >= 90) {
                  $(this).css({ "color": "#28a745" });
              }
          });
          calculatePercentage('.L13', '.pgL13', '.qtyL13', '.tot-L13');
          calculatePercentage('.L14', '.pgL14', '.qtyL14', '.tot-L14');
          calculatePercentage('.L15', '.pgL15', '.qtyL15', '.tot-L15');
          calculatePercentage('.L16', '.pgL16', '.qtyL16', '.tot-L16');
          calculatePercentage('.L17', '.pgL17', '.qtyL17', '.tot-L17');
          calculatePercentage('.L18', '.pgL18', '.qtyL18', '.tot-L18');
          calculatePercentage('.L19', '.pgL19', '.qtyL19', '.tot-L19');
          calculatePercentage('.L20', '.pgL20', '.qtyL20', '.tot-L20');
          calculatePercentage('.L21', '.pgL21', '.qtyL21', '.tot-L21');
          calculatePercentage('.L22', '.pgL22', '.qtyL22', '.tot-L22');
          calculatePercentage('.L23', '.pgL23', '.qtyL23', '.tot-L23');
          calculatePercentage('.L24', '.pgL24', '.qtyL24', '.tot-L24');
          caluclateGlobalTotalPercentage();
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

      function caluclateGlobalTotalPercentage() {
          var totalEff = 0;
          var counter = 0;
          $('.progress-bar').each(function () {
              var currentEff = $(this).text();
              currentEff.substring(0, currentEff.length - 2);
              totalEff += parseInt(currentEff) || 0;

              if ($(this).hasClass("bg-danger") || $(this).hasClass("bg-warning") || $(this).hasClass("bg-success")) {
                  counter++;
              }
          });

          var total = totalEff / counter;

          if (total <= 70) {
              //$('#lbl_eff_tot_prezente').css({ "color": "#dc3545" });
              $('#lbl_eff_tot_prezente').css({ "color": "black" });
              $('.header').css({ "background": "#dc3545e3" });
          } else if (total >= 71 && total < 90) {
              //$('#lbl_eff_tot_prezente').css({ "color": "#ffc107" });
              $('#lbl_eff_tot_prezente').css({ "color": "black" });
              $('.header').css({ "background": "#ffc107" });
          } else if (total >= 90) {
              //$('#lbl_eff_tot_prezente').css({ "color": "#28a745" });
              $('#lbl_eff_tot_prezente').css({ "color": "black" });
              $('.header').css({ "background": "#28a745d4" });
          }

          $('#lbl_eff_tot_prezente').text('EFF. PREZENTE: ' + total.toFixed() + '%');
      }

      function calculateTotalsByJobType(L1, L2, L3, exportClass) {
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

          $(exportClass).text('Tot: ' + TotalQty);
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
          //$(qtyShowName).text(sumQty);


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
      function timer() {
          var timer2 = "5:01";
          var interval = setInterval(function () {
              var timer = timer2.split(':');
              var minutes = parseInt(timer[0], 10);
              var seconds = parseInt(timer[1], 10);
              --seconds;
              minutes = (seconds < 0) ? --minutes : minutes;
              if (minutes < 0) clearInterval(interval);
              seconds = (seconds < 0) ? 59 : seconds;
              seconds = (seconds < 10) ? '0' + seconds : seconds;
              $('.countdown').html('Next reload: ' + minutes + ':' + seconds);
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
