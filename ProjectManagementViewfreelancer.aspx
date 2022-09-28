<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="ProjectManagementViewfreelancer.aspx.cs" Inherits="ProjectManagementViewfreelancer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="jobs">
        <div class="container">

            <div class="companies">
                <div class="row">
                    <h2>Project Management </h2>
                    <h4>Project #
                        <asp:Label ID="Label2" runat="server" /></h4>
                    <h4>
                        <asp:Label ID="lblPrjname" runat="server" /></h4>
                    <div class="basic-information">
                        <%--	<div class="col-md-3 col-sm-3">
						
                                  <asp:Image ID="Image2" runat="server" alt="" class="img-responsive"/>
						</div>--%>
                          <div class="col-md-3 col-sm-4">
                            <div class="profile-content">
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
                        <div class="col-md-3 col-sm-4">
                            <div class="profile-content">
                                <h2>Files</h2>
                                <h1></h1>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>

                                    <li>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn" OnClick="LinkButton3_Click">View</asp:LinkButton></li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                            </div>
                        </div>
                      
                        <div class="col-md-3 col-sm-4">
                            <div class="profile-content">
                                <h2>Invoices</h2>
                                <h1>
                                    <asp:Label ID="Label8" runat="server" /></h1>
                                <%--	<p>Description:<asp:Label ID="Label9" runat="server" /></p>--%>
                                <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
                                <ul class="information">
                                    <%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>
                                    <%--<li>Offer: Php <asp:Label ID="Label10" runat="server" /></li>
										<li>Time Frame: <asp:Label ID="Label11" runat="server" /></li>--%>
                                    <li>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" OnClick="LinkButton2_Click">View</asp:LinkButton>
                                    </li>
                                    <%--	<li><span>From:</span>1998</li>--%>
                                </ul>
                            </div>
                        </div>
                          <div class="col-md-3 col-sm-4" id ="divrate" runat="server">
                            <div class="profile-content">
                                <h2>Rate & Comment</h2>
                                <h1>
                                    </h1>
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
                        </div>
                    </div>
                       <div style="padding-top:75px;">
            <div class="col-md-6 col-sm-4">
                <div class="profile-content">
                      <h1>Hours Logged: <asp:Label ID="lbltotalhrs" runat="server"></asp:Label></h1>
                  
                    <%--	<p>Description:<asp:Label ID="Label9" runat="server" /></p>--%>
                    <div id="divtime" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        
                        <ContentTemplate>

                            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large"></asp:Label>
                            <asp:Timer ID="tm1" Interval="1000" runat="server" OnTick="tm1_Tick" />
                            <asp:Button ID="btnStart" Text="Start" runat="server" OnClick="Start" />
                            <asp:Button ID="btnStop" Text="Stop" runat="server" OnClick="Stop" />
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
              <div class="col-md-6 col-sm-4">
                <div class="profile-content">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-leaf fa-fw"></i>Deadline: <asp:Label ID="lblETA" runat="server"></asp:Label>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            

	
        <div class="span5">
            <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
    		
        </div>
	

                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <%--	<ul class="social">
							<li><a href="" class="facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
							<li><a href="" class="google"><i class="fa fa-google-plus"></i>Google Plus</a></li>
							<li><a href="" class="twitter"><i class="fa fa-twitter"></i>Twitter</a></li>
							<li><a href="" class="linkedin"><i class="fa fa-linkedin"></i>Linked In</a></li>
							<li><a href="" class="instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
						</ul>--%>
                    <%--<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-user fa-fw"></i> About Microsoft
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
							<p>The front end is the part that users see and interact with, includes the User Interface, the animations, and usually a bunch of logic to talk to the backend. It is the visual bit that the user interacts with.</p>	
							</div>
						</div>--%>
                    <div>
                        <%--	<div class="col-md-3 col-sm-3">
						
                                  <asp:Image ID="Image2" runat="server" alt="" class="img-responsive"/>
						</div>--%>
                        
                        <div class="col-md-6 col-sm-5">
                <div class="profile-content">
                    <div class="panel panel-default">
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
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("timeend") %>'></asp:Label> Date: <asp:Label ID="Label4" runat="server" Text='<%# Eval("datetime","{0:dd/MM/yyyy}") %>'></asp:Label> </b></li>
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
                        <div class="col-md-6 col-sm-5 ">
                            <div class="profile-content">
                                <div class="panel panel-default">
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
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                                <b>[Status: 
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>'></asp:Label>]</b></li>
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

                    <%--	</div>--%>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

