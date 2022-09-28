<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="ProjectManagement.aspx.cs" Inherits="ProjectManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <h2>Project Management</h2>
     <div>
        <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Project Name here..."/>
        <asp:Button ID="Button1" Text="Search" runat="server" 
                   class="btn btn-default" onclick="Button1_Click1"/>
            </div>
    <div class="row heading">
       <br />
        <p><asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" Width="200" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">

                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="On-Going" Value="On-Going"></asp:ListItem>
                           <asp:ListItem Text="Done" Value="Done"></asp:ListItem>
                    </asp:DropDownList></p>
       
      <%--  <p>
            <asp:Button ID="btnReg" runat="server" Text="Add Project" type="button" class="btn btn-primary" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
        </p>--%>
    </div>
    <div class="table-responsive">
        <table id="example" class="display table" width="100%">
            <thead>
                <th>Project ID</th>
                <th>Project Name</th>
                <th>Freelancer</th>
                <th>Date Started</th>
                <th style="text-align: center">Date Completed</th>
                <th style="text-align: center">Description</th>
                <th style="text-align: center">Amount offered</th>
                
                <th style="text-align: center">Time Frame</th>
                <%-- <th>Edit</th>--%>
                
               <th>Status</th>
                <%--  <th>View More</th>--%>
            <%--<th>Contract</th>
                <th>Deliverables</th>
               <th>Files</th>
                 
               <th>Invoice</th>
               <th>Rate & Comment</th>--%>
            </thead>
            <tbody>
                <asp:ListView ID="lvjobs" runat="server"
                    OnPagePropertiesChanging="lvjobs_PagePropertiesChanging">
                    <ItemTemplate>
                        <tr class='<%# GetClassName(Eval("Jobid").ToString()) %>'>
                            <td><%# Eval("Jobid") %></td>
                              <td><%# Eval("jobtitle") %></td>
                            <td><%# Eval("personname") %></td>
                           
                            <td><%# Eval("startdate", "{0:d}") %> </td>
                            <td><%# Eval("enddate", "{0:d}") %> </td>
                            <td><%# Eval("jobdescription") %></td>
                            <td style="text-align: center"><%# Eval("amt", "{0:c}")%></td>
                            <td><%# Eval("timeframe") %> <%# Eval("timecat") %></td>
                            <td><%# Eval("status") %></td>
                              <td>
                                <a href='ProjectManagementView.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>&projname=<%# Eval("jobtitle") %>&eta=<%# Eval("eta", "{0:d}") %>&name=<%# Eval("personname") %>&ct=<%# Eval("timeframe") %>&tc=<%# Eval("timecat") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');">View More</a>
                            </td>
                       <%--  <td>
                                <a href='projectrequirementlist.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-list-ol"></i></a>
                            </td>
                              <td>
                                <a href='filesdownload.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-download"></i></a>
                            </td>
                             <td>
                                <a href='filesdownloadinvoice.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-folder-open-o"></i></a>
                            </td>
                            <td>
                                <a href='addrating.aspx?ID=<%# Eval("Jobid") %>&name=<%# Eval("personname") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-commenting-o"></i></a>
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
</asp:Content>

