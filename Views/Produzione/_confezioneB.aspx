<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_confezioneB.aspx.cs" Inherits="Views_Produzione_confezioneB" %>

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
             
            <div class="row card-deck text-center main-row justify-content-center">
                <%-- PANEL L1 --%>
                <asp:Panel runat="server" ID="L1" class="panel">
                        <span class="total-span-big tot-L1"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 1</h6>
                                <span class="span-qty qtyL1" runat="server" id="LINEA1"></span>

                                <div class="progress">
                                  <div class=" pgL1 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L1 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,1" ></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,17" ></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="1,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="1,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L2 --%>
                <asp:Panel runat="server" ID="L2" class="panel">
                        <span class="total-span-big tot-L2"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 2</h6>
                                <span class="span-qty qtyL2"  runat="server" id="LINEA2"></span>

                                <div class="progress">
                                  <div class=" pgL2 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L2 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block circle" runat="server" data-possition="2,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L1 d-inline-block piego-block" runat="server" data-possition="2,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block circle" runat="server" data-possition="2,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L2 d-inline-block piego-block" runat="server" data-possition="2,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L3 --%>
                <asp:Panel runat="server" ID="L3" class="panel">
                        <span class="total-span-big tot-L3"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 3</h6>
                                <span runat="server" class="span-qty qtyL3" id="LINEA3"></span>

                                <div class="progress">
                                  <div class=" pgL3 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L3 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block circle" runat="server" data-possition="3,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L3 d-inline-block piego-block" runat="server" data-possition="3,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L4 --%>
                <asp:Panel runat="server" ID="L4" class="panel">
                        <span class="total-span-big tot-L4"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 4</h6>
                                <span class="span-qty qtyL4" runat="server" id="LINEA4"></span>

                                <div class="progress">
                                  <div class=" pgL4 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L4 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block circle" runat="server" data-possition="4,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L4 d-inline-block piego-block" runat="server" data-possition="4,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L5 --%>
                <asp:Panel runat="server" ID="L5" class="panel">
                        <span class="total-span-big tot-L5"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego" runat="server" id="LINEA5">LINEA 5</h6>
                                <span class="span-qty qtyL5"></span>

                                <div class="progress">
                                  <div class=" pgL5 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L5 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block circle" runat="server" data-possition="5,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L5 d-inline-block piego-block" runat="server" data-possition="5,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 

                <%-- PANEL L6 --%>
                <asp:Panel runat="server" ID="L6" class="panel">
                        <span class="total-span-big tot-L6"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 6</h6>
                                <span class="span-qty qtyL6" runat="server" id="LINEA6"></span>

                                <div class="progress">
                                  <div class=" pgL6 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L6 --%>
                                <div class="container card-body ">
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,2"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,4"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,6"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,10"></asp:Label></div>
                                    </div>  
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,12"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,14"></asp:Label></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block circle" runat="server" data-possition="6,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L6 d-inline-block piego-block" runat="server" data-possition="6,16"></asp:Label></div>
                                    </div> 
                                </div>
                        </div>
                    </asp:Panel> 
            </div>

            <div class="row card-deck text-center main-row justify-content-center">
                <%-- PANEL L12 --%>
                <asp:Panel runat="server" ID="L12" class="panel">
                        <span class="total-span-big tot-L12"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 12</h6>
                                <span class="span-qty qtyL12" runat="server" id="LINEA12"></span>

                                <div class="progress">
                                  <div class=" pgL12 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L12 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block circle" runat="server" data-possition="12,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L12 d-inline-block piego-block" runat="server" data-possition="12,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L11 --%>
                <asp:Panel runat="server" ID="L11" class="panel">
                        <span class="total-span-big tot-L11"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 11</h6>
                                <span class="span-qty qtyL11" runat="server" id="LINEA11"></span>

                                <div class="progress">
                                  <div class=" pgL11 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L11 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block circle" runat="server" data-possition="11,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L11 d-inline-block piego-block" runat="server" data-possition="11,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L10 --%>
                <asp:Panel runat="server" ID="L10" class="panel">
                        <span class="total-span-big tot-L10"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 10</h6>
                                <span class="span-qty qtyL10" runat="server" id="LINEA10"></span>

                                <div class="progress">
                                  <div class=" pgL10 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L10 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block circle" runat="server" data-possition="10,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L10 d-inline-block piego-block" runat="server" data-possition="10,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L9 --%>
                <asp:Panel runat="server" ID="L9" class="panel">
                        <span class="total-span-big tot-L9"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 9</h6>
                                <span class="span-qty qtyL9" runat="server" id="LINEA9"></span>

                                <div class="progress">
                                  <div class=" pgL9 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L9 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block circle" runat="server" data-possition="9,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L9 d-inline-block piego-block" runat="server" data-possition="9,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                  <%-- PANEL L8 --%>
                <asp:Panel runat="server" ID="L8" class="panel">
                        <span class="total-span-big tot-L8"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 8</h6>
                                <span class="span-qty qtyL8" runat="server" id="LINEA8"></span>

                                <div class="progress">
                                  <div class=" pgL8 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L8 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block circle" runat="server" data-possition="8,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L8 d-inline-block piego-block" runat="server" data-possition="8,2"></asp:Label></div>
                                    </div>                                   
                                </div>
                        </div>
                    </asp:Panel> 

                 <%-- PANEL L7 --%>
                <asp:Panel runat="server" ID="L7" class="panel">
                        <span class="total-span-big tot-L7"></span>
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <h6 class="my-0 font-weight-normal h-piego">LINEA 7</h6>
                                <span class="span-qty qtyL7" runat="server" id="LINEA7"></span>

                                <div class="progress">
                                  <div class=" pgL7 progress-bar progress-bar-striped progress-bar-animated" role="progressbar"></div>
                                </div>
                            </div>
                            <%-- L7 --%>
                                <div class="container card-body ">
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,21"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,15"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,16"></asp:Label></div>
                                    </div> 

                                    <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,13"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,14"></asp:Label></div>
                                    </div>
                                      <div class="row mt-1">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,11"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,12"></asp:Label></div>
                                    </div>

                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,20"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,9"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,10"></asp:Label></div>
                                    </div>  

                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,19"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,7"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,8"></asp:Label></div>
                                    </div> 
                                    <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,18"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,5"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,6"></asp:Label></div>
                                    </div> 
                                    
                                     <div class="row mt-1">
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,17"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,3"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block circle" runat="server" data-possition="7,4"></asp:Label></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 offset-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,1"></asp:Label></div>
                                        <div class="col-md-3"><asp:Label CssClass="machine L7 d-inline-block piego-block" runat="server" data-possition="7,2"></asp:Label></div>
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

          calculatePercentage('.L1', '.pgL1', '.qtyL1', '.tot-L1');
          calculatePercentage('.L2', '.pgL2', '.qtyL2', '.tot-L2');
          calculatePercentage('.L3', '.pgL3', '.qtyL3', '.tot-L3');
          calculatePercentage('.L4', '.pgL4', '.qtyL4', '.tot-L4');
          calculatePercentage('.L5', '.pgL5', '.qtyL5', '.tot-L5');
          calculatePercentage('.L6', '.pgL6', '.qtyL6', '.tot-L6');
          calculatePercentage('.L7', '.pgL7', '.qtyL7', '.tot-L7');
          calculatePercentage('.L8', '.pgL8', '.qtyL8', '.tot-L8');
          calculatePercentage('.L9', '.pgL9', '.qtyL9', '.tot-L9');
          calculatePercentage('.L10', '.pgL10', '.qtyL10', '.tot-L10');
          calculatePercentage('.L11', '.pgL11', '.qtyL11', '.tot-L11');
          calculatePercentage('.L12', '.pgL12', '.qtyL12', '.tot-L12');
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
              $('.header-first').css({ "background": "#dc3545e3" });
          } else if (total >= 71 && total < 90) {
              //$('#lbl_eff_tot_prezente').css({ "color": "#ffc107" });
              $('#lbl_eff_tot_prezente').css({ "color": "black" });
              $('.header-first').css({ "background": "#ffc107" });
          } else if (total >= 90) {
              //$('#lbl_eff_tot_prezente').css({ "color": "#28a745" });
              $('#lbl_eff_tot_prezente').css({ "color": "black" });
              $('.header-first').css({ "background": "#28a745d4" });
          }

          $('#lbl_eff_tot_prezente').text('EFF. PREZENTE: ' + total.toFixed() + '%');
      }


      function calculatePercentage(className, progressName, qtyShowName) {
          var activeMachines = 0;
          var sumLine = 0;
          var sumQty = 0;

          $(className).each(function () {
              var machineValue = $(this).text();
              var value = machineValue.substring(0, machineValue.length - 1);
              var valueQty = $(this).attr("qty");

              if (parseInt(value) > 0) {
                  activeMachines++;
                  sumLine += parseInt(value);
              }

              if (parseInt(valueQty) > 0) {
                  sumQty += parseInt(valueQty);
              }


          });
          var totEffLine = sumLine / activeMachines;
          generateProgressBar(totEffLine, progressName);
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
              $('.countdown').html(' Next reload: ' + minutes + ':' + seconds);
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
