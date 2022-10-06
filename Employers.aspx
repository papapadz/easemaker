<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Employers.aspx.cs" Inherits="Employers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>
  
        <div class="row">
            <h2 class="text-primary"><b>Employer List</b></h2>
            <hr />
             <div>
                 <h4><b>Search Employer</b></h4>
                 <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Employer Name here..." />
                 <asp:Button ID="Button1" Text="Search" runat="server" class="btn btn-primary" OnClick="Button1_Click1" />
             </div>
        </div>
    <hr />
        <%--<p><a href="addemployer.aspx">New Employer</a></p>--%>
    

    <div class="table-responsive">
        <asp:UpdatePanel ID="upInv" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lvEmployers" EventName="PagePropertiesChanging" />
            </Triggers>
            <ContentTemplate>
                <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                <%--  <div class="table-responsive-sm">--%>
                <table class="table" width="100%">

                    <thead =>
                        <tr>
                            <th>Logo</th>
                            <th>Email</th>
                            <th>Company Name</th>
                            <th>Contact Person</th>
                            <th>Address</th>
                            <th>Contact Number</th>
                            <th>Business Permit</th>
                            
                            <th>Status</th>
                            <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvEmployers" runat="server" OnPagePropertiesChanging="lvEmployers_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <img id="Logo" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                            class="img-responsive" width="30" />
                                    </td>
                                    <td><%# Eval("Email")%></td>
                                    <td><%# Eval("Companyname")%></td>
                                    <td><%# Eval("PersonName")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%# Eval("ContactNo")%></td>

                                    <%--      <%--<td><%# String.Format("{0:d/MM/yyyy HH:mm:tt}", Eval("BSPCDateadded")) %></td>
                                    --%>
                                    <td>
                                        <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Id1")) %>'
                                            class="img-responsive" width="100" />
                                    </td>
                                    
                                    <td><%# Eval("status")%></td>
                                    <td>
                                        <asp:HyperLink id="href1" 
                                              NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=0") %>'
                                              Text="Deactivate"
                                              runat="server"
                                              class="btn btn-xs btn-danger"
                                              Visible='<%# Eval("status").ToString() == "Active" %>'
                                            />
                                        <asp:HyperLink id="HyperLink1" 
                                              NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=2") %>'
                                              Text="Activate"
                                              runat="server"
                                              class="btn btn-xs btn-info"  
                                              Visible='<%# Eval("status").ToString() == "Inactive" %>'
                                            />
                                        <asp:HyperLink id="HyperLink2" 
                                              NavigateUrl='<%# string.Concat("verifyuser2.aspx?ID=", Eval("userid"),"&UT=", Eval("UserType"), "&flag=1") %>'
                                              Text="Verify"
                                              runat="server"
                                              class="btn btn-xs btn-success"  
                                              Visible='<%# Eval("status").ToString() == "For Verification" %>'
                                            />
                                        <%--<a href='verifyuser2.aspx?ID=<%# Eval("userid") %>&UT=<%# Eval("UserType") %>' onclick="javascript:return confirm('Are you sure you want to Verify?');">
                                            <asp:Label 
                                                runat="server" 
                                                Visible='<%# Eval("status").ToString() == "Active" %>'
                                                Text="Deactivate" />
                                            <asp:Label 
                                                runat="server" 
                                                Visible='<%# Eval("status").ToString() == "InActive" %>'
                                                Text="Activate" />
                                            <asp:Label 
                                                runat="server" 
                                                Visible='<%# Eval("status").ToString() == "For Verification" %>'
                                                Text="Verify" />

                                        </a> --%>
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
                <asp:DataPager ID="dpEmployers" runat="server" PageSize="20" PagedControlID="lvEmployers">
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
