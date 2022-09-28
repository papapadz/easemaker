<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubscriptionlistAdmin.aspx.cs" Inherits="Subscriptionlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>
  
        <h2>Subscription List</h2>
       <%-- <p><a href="subscription.aspx">Subscrib Now!</a></p>--%>
          <p>
         
                        <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Name here..." />
                      
                  
         <asp:Button ID="Button1" Text="Search" runat="server"
                            class="btn btn-default" OnClick="Button1_Click1" />
            </p>
  

    <div class="table-responsive">
        <asp:UpdatePanel ID="upInv" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lvInventory" EventName="PagePropertiesChanging" />
            </Triggers>
            <ContentTemplate>
                <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                <%--  <div class="table-responsive-sm">--%>
                <table class="display table" width="100%">

                    <thead>
                        <tr>
                            <th>Employer Name</th>
                            <th>Date</th>
                            <th>Expiration Date</th>
                            <th>Quantity</th>
                               <th>Amount</th>
                             <th>Category</th>
                             <th>Status</th>
                            <%--  <th>edit</th>--%>
                         <%--   <th>Edit</th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("companyname")%></td>
                                    <td><%# Eval("date")%></td>
                                    <td><%# Eval("expdate")%></td>
                                      <td><%# Eval("qty")%></td>
                                    <td><%# Eval("category")%></td>
                                      <td><%# Eval("amount")%></td>
                                    <td><%# Eval("Status")%></td>


                                    <%--      <%--<td><%# String.Format("{0:d/MM/yyyy HH:mm:tt}", Eval("BSPCDateadded")) %></td>
                                    --%>
                                    <%--     <td><%# Eval("status")%></td>
                                                        <td>    <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="100" /></td>
                                                    </tr>--%>
                                    <%--<td>
                                        <a href='Editcategory.aspx?ID=<%# Eval("categoryid") %>' onclick="javascript:return confirm('Are you sure you want to Approve?');"><i class="fa fa-pencil"></i></a>
                                    </td>--%>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="6">
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

