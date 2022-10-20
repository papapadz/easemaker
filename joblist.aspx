<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="joblist.aspx.cs" Inherits="Joblist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
        <div class="container">
			<h2 class="text-primary"><b>Project List</b> <a href="AddJob.aspx" class="btn btn-success"><i class="fa fa-plus"></i></a></h2>
			<hr />
			<h4><b>Search Project</b></h4>
            <div class="row">
				<div class="form-inline">
						<asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Project Name here..."/>
						<asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker form-control" data-live-search="true"
                                            AutoPostBack="true"/>
					  
					</div>
				<asp:Button ID="Button1" Text="Search" runat="server" class="btn btn-primary" onclick="Button1_Click1"/>
            </div>
			<hr />
			<div class="table-responsive">
				<table class="table">
						<thead>
							<th>Project ID</th>
							<th>Project Name</th>
							<th>Freelancer</th>
							<th>Date Started</th>
							<th>Date Completed</th>
							<th>Description</th>
							<th>Amount Offered</th>
							<th>Time Frame</th>
							<th>Status</th>
							<th>Action</th>
						</thead>
						<tbody>
							<asp:UpdatePanel ID="upInv" runat="server">
								<Triggers>
									<asp:AsyncPostBackTrigger ControlID="lvjobs" EventName="PagePropertiesChanging" />
								</Triggers>
								<ContentTemplate>
									<asp:ListView ID="lvjobs" runat="server" OnPagePropertiesChanging="lvjobs_PagePropertiesChanging">
										<ItemTemplate>
											<tr>
												<td><%# Eval("jobid") %></td>
												<td><a href="projectview.aspx?ID=<%# Eval("jobid") %>"><%# Eval("Jobtitle") %></a></td>
												<td><a href="employerportfolio.aspx?ID=<%# Eval("PersonID") %>"><%# Eval("PersonName") %></a></td>
												<td><%# Eval("startdate") %></td>
												<td><%# Eval("enddate") %></td>
												<td><%# Eval("JobDescription") %></td>
												<td><%# Eval("amt", "{0:c}") %></td>
												<td><%# Eval("timeframe") %> <%# Eval("timeCat") %></td>
												<td><%# Eval("status") %></td>
												<td>
													<a href='ProjectManagementView.aspx?ID=<%# Eval("jobid") %>&Status=<%# Eval("status") %>&projname=<%# Eval("Jobtitle") %>&eta=<%# Eval("eta", "{0:d}") %>&name=<%# Eval("PersonName") %>&ct=<%# Eval("timeframe") %>&tc=<%# Eval("timecat") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');">View More</a>
												</td>
											</tr>
										</ItemTemplate>
										<EmptyDataTemplate>
											<tr>
												<td colspan="9">
													<center><i>No record found!</i></center>
												</td>
											</tr>
										</EmptyDataTemplate>
									</asp:ListView>
								</ContentTemplate>
							</asp:UpdatePanel>
						</tbody>
					</table>
					<div class="pagination-area">
										<ul>
											<asp:DataPager ID="dpProjects" runat="server" PageSize="20" PagedControlID="lvjobs">
												<Fields>
													<asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
													<asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn" />
													<asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
												</Fields>
											</asp:DataPager>
										</ul>
									</div>
			</div>
	</div>

</asp:Content>

