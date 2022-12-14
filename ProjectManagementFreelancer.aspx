<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="ProjectManagementFreelancer.aspx.cs" Inherits="ProjectManagementFreelancer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-primary"><b>Project Management</b></h2>
                </div>
            </div>
            <hr />
            <div class="row">
            <div class="col-md-6 text-left">
                <h4><b>Search Project Name</b></h4>
                                    <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Project Name here..." />
                                    <asp:Button ID="Button1" Text="Search" runat="server"
                                        class="btn btn-primary" OnClick="Button1_Click1" />
           </div>
                            <div class="col-md-6 text-right">
                                <div class="form-inline">
                                    <span><b>Status:</b></span>
                                    <asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">
                                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="On-Going" Value="On-Going"></asp:ListItem>
                                        <asp:ListItem Text="Done" Value="Done"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
        </div>
            <hr />
        <div class="row">
            <div class="col-md-12">
                <table id="example" class="table">
                            <thead>
                                <th>Project ID</th>
                                <th>Project Name</th>
                                <th>Date Started</th>
                                <th style="text-align: center">Date Completed</th>
                                <th style="text-align: center">Estimated Date</th>
                                <th style="text-align: center">Description</th>
                                <th style="text-align: center">Amount offered</th>

                                <th style="text-align: center">Time Frame</th>
                                <%-- <th>Edit</th>--%>

                                <th>Status</th>
                                <th>Rating & Comments</th>
                                <%--<th>Contract</th>
                            <th>Deliverables</th>
                            <th>Upload Files</th>
                            <th>Invoice</th>--%>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvjobs" runat="server"
                                    OnPagePropertiesChanging="lvjobs_PagePropertiesChanging">
                                    <ItemTemplate>
                                        <tr class='<%# GetClassName(Eval("Jobid").ToString()) %>'>
                                            <td><%# Eval("Jobid") %></td>
                                            <td><%# Eval("jobtitle") %></td>

                                            <td><%# Eval("startdate", "{0:d}") %> </td>
                                            <td><%# Eval("enddate", "{0:d}") %> </td>
                                             <td><%# Eval("eta", "{0:d}") %> </td>
                                            <td><%# Eval("jobdescription") %></td>
                                            <td style="text-align: center"><%# Eval("amt", "{0:c}") %></td>
                                            <td><%# Eval("timeframe") %> <%# Eval("timecat") %></td>
                                            <td><%# Eval("status") %></td>
                                            <td>
                                                <img id="Img3" runat="server" src='<%# string.Concat("img/", Eval("image")) %>'
                                                    class="img-responsive" width="100" /><%# Eval("cOMMENT") %></td>
                                            <td>
													<a href='ProjectManagementViewFreelancer.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');">View More</a>
												</td>
                                             <%-- <td>
                                                <a href='ProjectManagementViewfreelancer.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>&eta=<%# Eval("eta", "{0:d}") %>&projname=<%# Eval("jobtitle") %>&name=<%# Eval("companyname") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');">View More</a>
                                            </td>
                                                 --%>
                                            <%--  <td>
                                            <a href='filesuploadcontractfreelancer.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-pencil"></i></a>
                                        </td>
                                        <td>
                                            <a href='projectrequirementlistfreelancer.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-list-ol"></i></a>
                                        </td>
                                        <td>
                                            <a href='filesupload.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-upload"></i></a>
                                        </td>
                                         <td>
                                <a href='filesuploadinvoice.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-folder-open-o"></i></a>
                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="10">
                                                <h2 class="text-center">No records found.</h2>
                                            </td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                        <asp:DataPager ID="dpjobs" runat="server" PageSize="10" PagedControlID="lvjobs">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Button"
                                    NumericButtonCssClass="btn btn-default"
                                    CurrentPageLabelCssClass="btn btn-info"
                                    NextPreviousButtonCssClass="btn btn-default" />
                            </Fields>
                        </asp:DataPager>
            </div>
        </div>
        </div>
    </section>
</asp:Content>

