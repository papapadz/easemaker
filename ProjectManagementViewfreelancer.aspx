<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="ProjectManagementViewfreelancer.aspx.cs" Inherits="ProjectManagementViewfreelancer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <section>
        <asp:TextBox id="hiddentxt" runat="server" hidden/>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-primary"><b>Project Management </b></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4>Project # <asp:Label ID="Label2" runat="server" /></h4> 
                    <h4><asp:Label ID="lblPrjname" runat="server" /></h4>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-primary ">
                        <div class="panel-body">
                            <h2>Contract</h2>
                                <h1></h1>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>

                                    <%--<li> <asp:Button ID="Button3" runat="server" class="btn btn-primary"  Text="Generate Contract" /> </li>--%>
                                    <li><%--<asp:Button ID="Button1" runat="server" class="btn btn-primary"  Text="View More"  /> --%>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" OnClick="LinkButton1_Click">View</asp:LinkButton>
                                    </li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-primary ">
                        <div class="panel-body">
                            <h2>Files</h2>
                                <h1></h1>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>

                                    <%--<li> <asp:Button ID="Button3" runat="server" class="btn btn-primary"  Text="Generate Contract" /> </li>--%>
                                    <li><%--<asp:Button ID="Button1" runat="server" class="btn btn-primary"  Text="View More"  /> --%>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn" OnClick="LinkButton3_Click">View</asp:LinkButton></li>
                                    </li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-primary ">
                        <div class="panel-body">
                            <h2>Invoices</h2>
                                <h1></h1>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>

                                    <%--<li> <asp:Button ID="Button3" runat="server" class="btn btn-primary"  Text="Generate Contract" /> </li>--%>
                                    <li><%--<asp:Button ID="Button1" runat="server" class="btn btn-primary"  Text="View More"  /> --%>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" OnClick="LinkButton2_Click">View</asp:LinkButton>
                                    </li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <asp:Panel class="panel panel-primary" id ="divrate" runat="server">
                            <div class="panel-body">
                                <h2>Rate & Comment</h2>
                                <h1></h1>
                                <%--	<p>Description:<asp:Label ID="Label9" runat="server" /></p>--%>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>
                                    <%--<li>Offer: Php <asp:Label ID="Label10" runat="server" /></li>
										<li>Time Frame: <asp:Label ID="Label11" runat="server" /></li>--%>
                                    <li>
                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn" OnClick="LinkButton4_Click">View</asp:LinkButton>
                                    </li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                            </div>
                        </asp:Panel>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="panel panel-primary ">
                          <h3 class="text-center">Hours Logged: <asp:Label ID="lbltotalhrs" runat="server"></asp:Label></h3>
                  
                        <%--	<p>Description:<asp:Label ID="Label9" runat="server" /></p>--%>
                        <div id="divtime" runat="server" class="text-center">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        
                            <ContentTemplate>

                                <asp:Label ID="Label1" runat="server" Font-Size="XX-Large"></asp:Label>
                                <asp:Timer ID="tm1" Interval="1000" runat="server" OnTick="tm1_Tick" />
                                <br />
                                <asp:Button ID="btnStart" class="btn btn-success" Text="Start" runat="server" OnClick="Start" />
                                <asp:Button ID="btnStop"  class="btn btn-danger" Text="Stop" runat="server" OnClick="Stop" />
                            </ContentTemplate>
                        
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="tm1" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                            </div>
                        <ul class="information">
                            <%--	<li><span>Address:</span><asp:Timer runat="server"></asp:Timer><asp:Label ID="lblAddress" runat="server" /></li>--%>


                            <li>
                      
                            </li>
                            <%--	<li><span>From:</span>1998</li>--%>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="panel panel-primary ">
                            <div class="panel-heading">
                                <i class="fa fa-leaf fa-fw"></i>Deadline: <asp:Label ID="lblETA" runat="server"></asp:Label>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                    <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
                            </div>
                        </div>    
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="panel panel-primary ">
                        <div class="panel-heading">
                            <i class="fa fa-leaf fa-fw"></i>Time Log:
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lbprojects" EventName="PagePropertiesChanging" />
                                </Triggers>
                                <ContentTemplate>
                                    <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanging="lbprojects2_PagePropertiesChanging">
                                        <ItemTemplate>
                                            <%--<p>Rapid growth since incorporation has triggered a chain of products, acquisitions and partnerships beyond Google's core search engine (Google Search).</p>	--%>
                                            <ul>
                                                <li>
                                                    Start:<asp:Label ID="Label3" runat="server" Text='<%# Eval("timestart") %>'></asp:Label>
                                                    <b>End: 
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("timeend") %>'></asp:Label> Date: <asp:Label ID="Label5" runat="server" Text='<%# Eval("datetime","{0:dd/MM/yyyy}") %>'></asp:Label> </b></li>
                                            </ul>
                                            <%--	<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>--%>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <tr>
                                                <td colspan="5">
                                                    <center><h2>No records found!</h2></center>
                                                </td>
                                            </tr>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                          <div class="pagination-area">
                        <ul>
                            <asp:DataPager ID="dpProjects" runat="server" PageSize="5" PagedControlID="ListView1">
                                <Fields>
                                    <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                    <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn" />
                                    <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                </Fields>
                            </asp:DataPager>
                        </ul>
                    </div>

                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                    <%--	<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-coffee fa-fw"></i> Minimum qualifications:
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
							<p>Rapid growth since incorporation has triggered a chain of products.</p>	
							<ul>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
							</ul>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-graduation-cap fa-fw"></i> Preferred qualifications:
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
							<ul>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
							</ul>
							</div>
						</div>--%>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="panel panel-primary ">
                                    <div class="panel-heading">
                                        <i class="fa fa-leaf fa-fw"></i>Deliverable Tracker:
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <asp:UpdatePanel ID="upInv" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="lbprojects" EventName="PagePropertiesChanging" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:ListView ID="lbprojects" runat="server" OnPagePropertiesChanging="lbprojects_PagePropertiesChanging">
                                                    <ItemTemplate>
                                                        <%--<p>Rapid growth since incorporation has triggered a chain of products, acquisitions and partnerships beyond Google's core search engine (Google Search).</p>	--%>
                                                        <ul>
                                                            <li>
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                                <b>[Status: 
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("status") %>'></asp:Label>]</b></li>
                                                        </ul>
                                                        <%--	<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>--%>
                                                    </ItemTemplate>
                                                    <EmptyDataTemplate>
                                                        <tr>
                                                            <td colspan="5">
                                                                <center><h2>No records found!</h2></center>
                                                            </td>
                                                        </tr>
                                                    </EmptyDataTemplate>
                                                </asp:ListView>
                                                <%--      <div class="pagination-area">
                        <ul>
                            <asp:DataPager ID="dpProjects" runat="server" PageSize="20" PagedControlID="lbprojects">
                                <Fields>
                                    <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn btn-primary" />
                                    <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn btn-primary" NextPreviousButtonCssClass="btn btn-primary" />
                                    <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn btn-primary" />
                                </Fields>
                            </asp:DataPager>
                        </ul>
                    </div>--%>

                    </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>

                                <%--	<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-coffee fa-fw"></i> Minimum qualifications:
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
							<p>Rapid growth since incorporation has triggered a chain of products.</p>	
							<ul>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
							</ul>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-graduation-cap fa-fw"></i> Preferred qualifications:
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
							<ul>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software testing in a Web Applications/Mobile environment.</li>
								<li>Software testing in a Web Applications environment.</li>
								<li>Translate designs into responsive web interfaces</li>
								<li>Software Test Plans from Business Requirement Specifications for test engineering group.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
								<li>Run production tests as part of software implementation; Create, deliver and support test plans for testing group to execute.</li>
							</ul>
							</div>
						</div>--%>
                            </div>
            </div>
        </div>
    </section>
   <script src="https://unpkg.com/paymaya-js-sdk@2.0.0/dist/bundle.js"></script>
    <script>
        const SUCCESS_URL = window.location.origin + "/checkPayment.aspx?userid=" + $('#ContentPlaceHolder1_hiddentxt').val()
        const FAILURE_URL = window.location.origin + "/joblistfreelancer.aspx?ST=&yrs=&cat="
        const CANCEL_URL = window.location.origin + "/joblistfreelancer.aspx?ST=&yrs=&cat="

        var cart = {
            "totalAmount": {
                "value": 100,
                "currency": "PHP",
                "details": {
                    "discount": 0,
                    "serviceCharge": 0,
                    "shippingFee": 0,
                    "tax": 0,
                    "subtotal": 100
                }
            },
            "items": [
                {
                    "name": "Canvas Slip Ons",
                    "quantity": 1,
                    "code": "XXXX",
                    "description": "Subscription",
                    "amount": {
                        "value": 100,
                        "details": {
                            "discount": 0,
                            "serviceCharge": 0,
                            "shippingFee": 0,
                            "tax": 0,
                            "subtotal": 100
                        }
                    },
                    "totalAmount": {
                        "value": 100,
                        "details": {
                            "discount": 0,
                            "serviceCharge": 0,
                            "shippingFee": 0,
                            "tax": 0,
                            "subtotal": 100
                        }
                    }
                }
            ],
            "requestReferenceNumber": "1551191039",
            "redirectUrl": {
                "success": SUCCESS_URL,
                "failure": FAILURE_URL,
                "cancel": CANCEL_URL
            }
        }

        PayMayaSDK.init('pk-eo4sL393CWU5KmveJUaW8V730TTei2zY8zE4dHJDxkF', true);
        init()
        
        console.log(cart)

        function send() {

            total = 100
            var self = this

            cart["items"][0]["name"] = "Service Charge"
            cart["items"][0]["amount"]["value"] = total
            cart["items"][0]["amount"]["details"]["subtotal"] = total
            cart["items"][0]["totalAmount"]["value"] = total
            cart["items"][0]["totalAmount"]["details"]["subtotal"] = total
            cart["totalAmount"]["value"] = total
            cart["totalAmount"]["details"]["subtotal"] = total
            cart["requestReferenceNumber"] = Date.now()

            $.ajax({
                headers: {
                    'Authorization': 'Basic cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo='
                },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/checkouts",
                method: "POST",
                data: cart
            }).done(function (response) {
                self.addBilling(response);
                //console.log(response)
            })
        }

        function addBilling(objInfo) {
            $.ajax({
                method: "GET",
                url: "addBilling.aspx",
                data: {
                    checkoutid: objInfo.checkoutId,
                    refno: cart["requestReferenceNumber"],
                    jobid: document.getElementById('ContentPlaceHolder1_Label2').textContent
                }
            }).done(function (response) {
                console.log("Billing success!")
                //window.location.href = "joblist.aspx";
            })
        }

        function init() {
            $.ajax({
                headers: {
                    'Authorization': 'Basic c2stS2ZtZkxKWEZkVjV0MWluWU44bElPd1NydWVDMUcyN1NDQWtsQnFZQ2RyVTo='
                },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/customizations",
                type: "POST",
                data: {
                    logoUrl: window.location.host + "/img/logo.png",
                    iconUrl: window.location.host + "/img/logo.png",
                    appleTouchIconUrl: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-12.png",
                    customTitle: "EaseMaker",
                    colorScheme: "#5bc0de",
                }
            }).done(function (response) {
                console.log(response)
            })
        }
    </script>
</asp:Content>

