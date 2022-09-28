<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Freelancerlistemployer.aspx.cs" Inherits="Freelancerlistemployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>

        <h2>Freelancer List</h2>
        <p>
         
                        <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Name here..." />
                      
                  
         <asp:Button ID="Button1" Text="Search" runat="server"
                            class="btn btn-default" OnClick="Button1_Click1" />
            </p>
   

    <div class="table-responsive">
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
                        <%--    <th>Address</th>
                            <th>Contact Number</th>--%>
                            <th>Uploaded Photo</th>
                           <%-- <th>Edit</th>--%>

                            <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                            <th>View Portfolio</th>
                           <%-- <th>View more</th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvaccounts" runat="server" OnPagePropertiesChanging="lvaccounts_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Email")%></td>
                                    <td><%# Eval("PersonName")%></td>
                               <%--     <td><%# Eval("Address")%></td>
                                    <td><%# Eval("ContactNo")%></td>--%>
                                   
                                     <td>
                                        <img id="Img3" runat="server" src='<%# string.Concat("img/", Eval("image")) %>'
                                            class="img-responsive" width="100" /></td>
                                  
                         
                                    <td>
                                        <a href='employerportfolio.aspx?ID=<%# Eval("userid") %>' onclick="javascript:return confirm('Are you sure you want to view?');">View</a>
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

