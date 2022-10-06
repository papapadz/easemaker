<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="joblistadmin.aspx.cs" Inherits="joblistadmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <h2 class="text-primary"><b>Project List</b></h2>
        <hr />
        <h4><b>Search Company</b></h4>
        <div class="form-inline">
            <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Company name here..." />
        
            <asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" Width="200" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">
                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Posted" Value="Posted"></asp:ListItem>
                        <asp:ListItem Text="On-Going" Value="On-Going"></asp:ListItem>
                        <asp:ListItem Text="Done" Value="Done"></asp:ListItem>
                    </asp:DropDownList>
        </div>
        
            <asp:Button ID="Button1" Text="Search" runat="server"
                            class="btn btn-primary" OnClick="Button1_Click1" />
    </div>
    <hr />
       <%-- <p>
            <asp:Button ID="btnReg" runat="server" Text="Add Job" type="button" class="btn btn-primary" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
        </p>--%>
  
    <div class="table-responsive">
        <table id="example" class="display table" width="100%">
            <thead>
                 <th>Project ID</th>
                <th>Company</th>
          <th>Project Title</th>

           <%--     <th>date Posted</th>--%>
                <th style="text-align: center">Project Description</th>
                <th style="text-align: center">Category</th>
                <th style="text-align: center">Amount offered</th>
                
                <th style="text-align: center">Time Frame</th>
                <%-- <th>Edit</th>--%>
                
                <th>Status</th>
              
            
               <%-- <th>All Applicants</th>--%>
            </thead>
            <tbody>
                <asp:ListView ID="lvjobs" runat="server"
                    OnPagePropertiesChanging="lvjobs_PagePropertiesChanging">
                    <ItemTemplate>
                        <tr class='<%# GetClassName(Eval("Jobid").ToString()) %>'>
                            <td><%# Eval("Jobid") %></td>
                             <td><%# Eval("companyname") %></td>
                            <td><%# Eval("jobtitle") %></td>
                           
                            <%--<td><%# Eval("date", "{0:d}") %> </td>--%>
                            <td><%# Eval("jobdescription") %></td>
                            <td style="text-align: center"><%# Eval("categoryname")%></td>
                            <td style="text-align: center"><%# Eval("amt", "{0:c}")%></td>
                            <td><%# Eval("timeframe") %> <%# Eval("timecat") %></td>
                            <td><%# Eval("status") %></td>
                           <%--   <td>
                                <a href='editjoborder.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>' onclick="javascript:return confirm('Are you sure you want to Edit?');"><i class="fa fa-pencil"></i></a>
                            </td>--%>
                       
<%--                              <td>
                                <a href='applicantlistclient.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Edit?');"><i class="fa fa-user"></i></a>
                            </td>--%>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <tr>
                            <td colspan="8">
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

