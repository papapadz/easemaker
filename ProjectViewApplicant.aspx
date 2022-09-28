<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="ProjectViewApplicant.aspx.cs" Inherits="ProjectViewApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="profile-detail" >
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                    <div class="basic-information" >
						<div class="col-md-3 col-sm-3" >
						 <%--<img src="img/microsoft.png" alt="" class="img-responsive">--%>
                                  <asp:Image ID="Image2" runat="server" alt="" class="img-responsive"/>
						</div>
						<div class="col-md-9 col-sm-9">
							<div class="profile-content" style="padding-top:50px">
									<h2><asp:Label ID="lblCN" runat="server" /></h2>
                                <h1><asp:Label ID="lblJT" runat="server" /></h1>
									<p>Description:<asp:Label ID="lblJD" runat="server" /></p>
                             <%--   <p>Offer: Php <asp:Label ID="lblBudget" runat="server" /></p>
                                <p>Time Frame: <asp:Label ID="lbltl" runat="server" /></p>--%>
									<ul class="information">
									<%--	<li><span>Address:</span><asp:Label ID="lblAddress" runat="server" /></li>--%>
										<li>Offer: Php <asp:Label ID="lblBudget" runat="server" /></li>
										<li>Time Frame: <asp:Label ID="lbltl" runat="server" /></li>
										<li> <asp:Button ID="btnSubmit" runat="server" class="btn"  Text="Apply" OnClick="btnSubmit_Click"/></li>
									<%--	<li><span>From:</span>1998</li>--%>
									</ul>
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
				
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-leaf fa-fw"></i> Requirements:
							</div>
												<!-- /.panel-heading -->
							<div class="panel-body">
                                		  <asp:UpdatePanel ID="upInv" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lbprojects" EventName="PagePropertiesChanging" />
                </Triggers>
                <ContentTemplate>
                    <asp:ListView ID="lbprojects" runat="server" OnPagePropertiesChanging="lbprojects_PagePropertiesChanging" >
                         <ItemTemplate>
							<%--<p>Rapid growth since incorporation has triggered a chain of products, acquisitions and partnerships beyond Google's core search engine (Google Search).</p>	--%>
							<ul>
								<li> <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label></li>
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
        </div>
    </section>

</asp:Content>

