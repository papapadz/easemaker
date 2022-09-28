<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="ApplicantList.aspx.cs" Inherits="ApplicantList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row heading">
                <h2>Applicant List for Project  # <asp:Label ID="Label1" runat="server" class="form-control" Enabled="false"/></h2>
                <p></p>
            </div>
    
          <div class="table-responsive">
                            <asp:UpdatePanel ID="upInv" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lvInventory" EventName="PagePropertiesChanging" />
                                </Triggers>
                                <ContentTemplate>
                                    <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                                    <%--  <div class="table-responsive-sm">--%>
                                    <table  class="display table" width="100%">

                                        <thead>
                                            <tr>
                                                <th>Email</th>
                                                <th>Applicant Name</th>
                                                <th>Address</th>
                                                <th>Contact Number</th>
                                                <th>Status</th>
                                                <th>Image</th>
                                                <th>Rating</th>
                                                <th>Portfolio</th>
                                                <th>Select</th>
                                               <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("Email")%></td>
                                                        <td><%# Eval("PersonName")%></td>
                                                          <td><%# Eval("Address")%></td>
                                                        <td><%# Eval("ContactNo")%></td>
                                                         <td><%# Eval("status")%></td>
                                                      
                                              
                                                        <td>    <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="100" /></td>
                                                         <td>    <img id="Img2" runat="server" src='<%# string.Concat("img/", Eval("Image2")) %>'
                                                    class="img-responsive" width="100" /></td>
                                                         <td>
                                        <a href='viewportfolioemployer.aspx?ID=<%# Eval("userid") %>&JID=<%# Eval("jobid") %>' onclick="javascript:return confirm('Are you sure you want to Continue?');"><i class="fa fa-print"></i></a>
                                    </td>
                                                          <td>
                                        <a href='SelectFreelancer.aspx?ID=<%# Eval("userid") %>&ID2=<%# Eval("useridemp") %>&JID=<%# Eval("jobid") %>&po=<%# Eval("jobtitle") %>' onclick="javascript:return confirm('Are you sure you want to Continue?');"><i class="fa fa-check-square-o"></i></a>
                                    </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <EmptyDataTemplate>
                                                    <tr>
                                                        <td colspan="9">
                                                            <center><h2>No records found!</h2></center>
                                                        </td>
                                                    </tr>
                                                </EmptyDataTemplate>
                                            </asp:ListView>
                                        </tbody>
                                    </table>
                                    <asp:DataPager ID="dpInventory" runat="server" PageSize="20" PagedControlID="lvInventory">
                                        <Fields>
                                            <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                            <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn" />
                                            <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                        </Fields>
                                    </asp:DataPager>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                  
</asp:Content>

