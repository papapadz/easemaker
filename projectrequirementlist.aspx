<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="projectrequirementlist.aspx.cs" Inherits="projectrequirementlist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>Project Deliverables for Project # <asp:Label runat="server" ID="lblID"></asp:Label></h2>
        <p></p>
        <p>
            <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-primary" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
        </p>
    </div>
    <div class="table-responsive">
        <table id="example" class="display table" width="100%">
            <thead>
                <th>Project ID</th>
                <th style="text-align: center">Requirement Description</th>
                <%-- <th>Edit</th>--%>
                <th>Date Completed</th>
                <th>Status</th>
                <th>Remarks</th>
                <th>Complete</th>
            </thead>
            <tbody>
                <asp:ListView ID="lvjobs" runat="server"
                    OnPagePropertiesChanging="lvjobs_PagePropertiesChanging">
                    <ItemTemplate>
                        <tr class='<%# GetClassName(Eval("Jobid").ToString()) %>'>
                            <td><%# Eval("Jobid") %></td>
                            <td><%# Eval("description") %></td>
                            <td><%# Eval("completiondate", "{0:d}") %> </td>
                              <td><%# Eval("status") %></td>
                            <td><%# Eval("Remarks") %></td>
                          
                              <td>
                                <a href='requirementcompletion.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>&reqid=<%# Eval("projreqid") %>' onclick="javascript:return confirm('Are you sure you want to Complete?');"><i class="fa fa-check"></i></a>
                            </td>
                         <%--<td>
                                <a href='projectrequirement.aspx?ID=<%# Eval("Jobid") %>&Status=<%# Eval("status") %>' onclick="javascript:return confirm('Are you sure you want to Proceed?');"><i class="fa fa-list-ol"></i></a>
                            </td>
                              <td>
                                <a href='applicantlist.aspx?ID=<%# Eval("Jobid") %>' onclick="javascript:return confirm('Are you sure you want to Edit?');"><i class="fa fa-user"></i></a>
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

