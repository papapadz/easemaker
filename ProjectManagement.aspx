<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="ProjectManagement.aspx.cs" Inherits="ProjectManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    <div class="container">
		<h2 class="text-primary"><b>Project Management</b></h2>
		<hr />
        <div class="row">
			<div class="form-inline">
						<asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Project Name here..."/>
						<asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" Width="200" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">

                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="On-Going" Value="On-Going"></asp:ListItem>
                           <asp:ListItem Text="Done" Value="Done"></asp:ListItem>
                    </asp:DropDownList>
					  
					</div>
			<asp:Button ID="Button2" Text="Search" runat="server" class="btn btn-primary" onclick="Button1_Click1"/>
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
												<td>-</td>
												<td>-</td>
												<td><%# Eval("JobDescription") %></td>
												<td><%# Eval("amt", "{0:c}") %></td>
												<td><%# Eval("timeframe") %> <%# Eval("timeCat") %></td>
												<td><%# Eval("status") %></td>
												<td>
													<a href='ProjectManagementView.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>&projname=<%# Eval("jobtitle") %>&eta=<%# Eval("eta", "{0:d}") %>&name=<%# Eval("personname") %>&ct=<%# Eval("timeframe") %>&tc=<%# Eval("timecat") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');">View More</a>
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
											<asp:DataPager ID="dpjobs" runat="server" PageSize="20" PagedControlID="lvjobs">
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

