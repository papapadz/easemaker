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
                                        <asp:Panel
                                            Visible='<%# Eval("Status").ToString() == "Pending"%>'
                                            runat="server"
                                            >
                                            <button class="btn btn-warning btn-xs" type="button" onclick='check("<%# Eval("checkoutid") %>")'>Pay Now</button>
                                        </asp:Panel>
                                        <asp:Label
                                            Visible='<%# Eval("Status").ToString() == "Completed"%>'
                                            runat="server"
                                            Text='<%# string.Concat("Paid @ ",Eval("datepaid").ToString()) %>'
                                            class="bg-success"
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

    <script>
        var UPDATE_URL = window.location.origin + "/checkOutSuccess.aspx?checkoutid=";

        function check(x) {
            console.log(x)
            $.ajax({
                contentType: 'application/json',
                headers: { 'Authorization': 'Basic c2stS2ZtZkxKWEZkVjV0MWluWU44bElPd1NydWVDMUcyN1NDQWtsQnFZQ2RyVTo=' },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/checkouts/" + x
            }).done(function (response) {
                console.log(response)
                if (response.paymentStatus == "PAYMENT_SUCCESS")
                    window.location.href = UPDATE_URL + x + "&datepaid=" + response.updatedAt
                else
                    window.location.href = "https://payments-web-sandbox.paymaya.com/checkout?id="+x
            })
        }
    </script>
</asp:Content>

