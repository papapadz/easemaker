<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountManagement.aspx.cs" Inherits="AccountManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>

    <div class="row">
        <h2 class="text-primary"><b>Account Management List</b></h2>
        <hr />
        <h4><b>Search Freelancer</b></h4>
        <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Name here..." />
                      
                  
         <asp:Button ID="Button1" Text="Search" runat="server"
                            class="btn btn-primary" OnClick="Button1_Click1" />
    </div>
    <hr />
    <div class="table-responsive" style="font-family: Roboto;">
        <asp:UpdatePanel ID="upInv" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lvaccounts" EventName="PagePropertiesChanging" />
            </Triggers>
            <ContentTemplate>
                <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                <%--  <div class="table-responsive-sm">--%>
                <table class="display table" width="100%">

                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Address</th>
                            <th>Contact Number</th>
                            <%--<th>Status</th>--%>
                            <th>Uploaded Photo</th>
                            <th>Identification Front</th>
                            <th>Identification Back</th>
                               <th>Status</th>
                           <%-- <th>Edit</th>--%>

                            <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                            <%-- %><th>View Profile</th> --%>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvaccounts" runat="server" OnPagePropertiesChanging="lvaccounts_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Email")%></td>
                                    <td><%# Eval("PersonName")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%# Eval("ContactNo")%></td>
                                    <%--<td><%# Eval("image")%></td>--%>
                                     <td>
                                        <img id="Img3" runat="server" src='<%# string.Concat("img/", Eval("image")) %>'
                                            class="img-responsive" width="100" /></td>
                                  
                                    <td>
                                        <img id="Img2" runat="server" src='<%# string.Concat("img/", Eval("Id1")) %>'
                                            class="img-responsive" width="100" /></td>
                                    <td>
                                        <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Id2")) %>'
                                            class="img-responsive" width="100" /></td> <td><%# Eval("status")%></td>
                                    
                                    <td>
                                        <a class="btn btn-xs btn-info" href='adminportfolio.aspx?ID=<%# Eval("userid") %>'>View</a>
                                        <asp:HyperLink id="href1" 
                                            onclick="javascript:return confirm('Are you sure you want to Activate User?')"
                                            NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=0") %>'
                                              Text="Deactivate"
                                              runat="server"
                                              class="btn btn-xs btn-danger"
                                              Visible='<%# Eval("status").ToString() == "Active" %>'
                                            />
                                        <asp:HyperLink id="HyperLink1" 
                                            onclick="javascript:return confirm('Are you sure you want to Deactivate User?')"
                                            NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=2") %>'
                                              Text="Activate"
                                              runat="server"
                                              class="btn btn-xs btn-info"  
                                              Visible='<%# Eval("status").ToString() == "Inactive" %>'
                                            />
                                        <asp:HyperLink id="HyperLink2" 
                                            onclick="javascript:return confirm('Are you sure you want to Verify User?')"
                                            NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=1") %>'
                                              Text="Verify"
                                              runat="server"
                                              class="btn btn-xs btn-success"  
                                              Visible='<%# Eval("status").ToString() == "For Verification" %>'
                                            />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="8">
                                        <center><h2>No records found!</h2></center>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
                <asp:DataPager ID="dpAccounts" runat="server" PageSize="20" PagedControlID="lvaccounts">
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

