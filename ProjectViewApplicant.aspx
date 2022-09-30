<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="ProjectViewApplicant.aspx.cs" Inherits="ProjectViewApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">

						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-4">
									<asp:Image ID="Image2" runat="server" alt="" class="img-responsive"/>
								</div>
								<div class="col-md-8">
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
									<%--	<li><span>From:</span>1998</li>--%>
									</ul>
										<hr />
										<i class="fa fa-leaf fa-fw"></i> Requirements:
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
														<ul>
															<li>None</li>
														</ul>
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
									<hr />
									<div class="text-right">
										<asp:Button ID="btnSubmit" runat="server" class="btn btn-success text-right"  Text="Apply" OnClick="btnSubmit_Click"/>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>

