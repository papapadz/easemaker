<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageemployer.master" AutoEventWireup="true" CodeFile="Subscriptionlist.aspx.cs" Inherits="Subscriptionlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>
    <div class="container">
        <div class="row">
        <h2 class="text-primary"><b>Subscription List</b> <a class="btn btn-success" href="subscription.aspx"><i class="fa fa-plus"></i></a></h2>
    </div>
    <hr />
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
                            <th>Date</th>
                            <th>Expiration Date</th>
                            
                             <th>Category</th>
                            <th>Quantity</th>
                               <th>Amount</th>
                             <th>Status</th>
                              <th>Action</th>
                        <%--    <th>Edit</th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("date","{0:dd/MM/yyyy}")%></td>
                                    <td><%# Eval("expdate","{0:dd/MM/yyyy}")%></td>
                                    
                                    <td><%# Eval("category")%></td>
                                      <td><%# Eval("qty")%></td>
                                    
                                      <td><%# Eval("amount")%></td>
                                    <td><%# Eval("Status")%></td>


                                    <%--      <%--<td><%# String.Format("{0:d/MM/yyyy HH:mm:tt}", Eval("BSPCDateadded")) %></td>
                                    --%>
                                    <%--     <td><%# Eval("status")%></td>
                                                        <td>    <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="100" /></td>
                                                    </tr>--%>
                                    <td>    
                                        <asp:Hyperlink 
                                            Visible='<%# Eval("Status").ToString() == "Pending"%>'
                                            class="btn btn-xs btn-danger"
                                            Text="Cancel"
                                            onclick="javascript:return confirm('Are you sure you want to cancel?');"
                                            runat="server"
                                            NavigateUrl='string.Concat("cancelsubscription.aspx?ID=",Eval("subscriptionid"))'
                                            />
                                    </td>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="2">
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
    </div>

</asp:Content>

