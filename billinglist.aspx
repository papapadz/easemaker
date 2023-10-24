<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="billinglist.aspx.cs" Inherits="billinglist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <script src="js/bootsnav.js"></script>
    <div class="container">
        <div class="row heading">
        <h2 class="text-primary"><b>Billing List</b></h2>
    </div>
    <hr />
    <div class="row">
        <h4><b>Filter by</b></h4>
          <p><asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" Width="200" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">

                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                           <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                    </asp:DropDownList></p>
    </div>
    <hr />
    <div class="table-responsive">
        <asp:updatepanel id="upInv" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lvInventory" EventName="PagePropertiesChanging" />
                                </Triggers>
                                <ContentTemplate>
                                    <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                                    <%--  <div class="table-responsive-sm">--%>
                                    <table  class="display table" width="100%">

                                        <thead>
                                            <tr>
                                                <th>Billing #</th>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Ref. #</th>
                                                <th>Purpose</th>
                                                <th>Payment Date</th>
                                                <th>Status</th>
                                               <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("Billingid")%></td>
                                                        <td><%# Eval("companyname")%> <%# Eval("personname")%></td>
                                                        <td><%# Eval("datetime")%></td>
                                                        <td><%# Eval("amount")%></td>
                                                         <td><%# Eval("refid")%></td>

                                                      
                                                         <td><%# Eval("purpose")%></td>
                                                         <td><%# Eval("datepaid")%></td>
                                                         
                                              
                                                         <td>
                                                             <div class="row">
                                                                 <div class="col-md-6">
                                                                     <asp:Label id="lbl1"
                                                                         Text='<%# Eval("status")%>'
                                                                         runat="server"
                                                                         Visible='<%# Eval("status").ToString() == "Pending" %>'
                                                                         style="color: orange"
                                                                         />
                                                                     <asp:Label id="lbl2"
                                                                         Text='<%# Eval("status")%>'
                                                                         runat="server"
                                                                         Visible='<%# Eval("status").ToString() == "Completed" %>'
                                                                         style="color: green"
                                                                         />

                                                                 </div>
                                                                <div class="col-md-6">
                                                                    <!-- 
                                                                    <asp:HyperLink id="HyperLink2"
                                                                        onclick="javascript:return confirm('Are you sure you want to verify payment?')"
                                                                        NavigateUrl='<%# string.Concat("completed.aspx?ID=", Eval("Billingid"), "&purpose=", Eval("purpose"), "&UID=", Eval("userid"), "&status=Uploaded_Payment", "&JID=", Eval("refid")) %>' 
                                                                        runat="server"
                                                                        class="btn btn-xs btn-success" 
                                                                        Text="Verify" 
                                                                        Visible='<%# Eval("status").ToString() == "Uploaded Payment" %>'
                                                                        /> -->
                                                                 <asp:Panel
                                                                    Visible='<%# Eval("Status").ToString() == "Pending" && Session["usertype"].ToString() != "Admin"%>'
                                                                    runat="server"
                                                                    >
                                                                    <asp:Panel
                                                                        Visible='<%# Eval("purpose").ToString() == "Service Fee" ||  Eval("purpose").ToString() == "Subscription"%>'
                                                                        runat="server">
                                                                        <button class="btn btn-warning btn-xs" type="button" onclick='check("<%# Eval("checkoutid") %>")'>Pay Now</button>
                                                                    </asp:Panel> 
                                                                    <asp:Hyperlink id="hlink1"
                                                                        runat="server" 
                                                                        NavigateUrl='<%# string.Concat("uploadbillingpayment.aspx?ID=", Eval("Billingid"), "&OID=", Eval("refid")) %>'
                                                                        class="btn btn-xs btn-info"
                                                                        Text='<i class="fa fa-upload"></i> Upload'
                                                                        Visible='<%# Eval("purpose").ToString() == "Project Payment"%>'
                                                                        ></asp:Hyperlink>
                                                                </asp:Panel>
                                                                
                                                                    <asp:image id="Img1" 
                                                                        runat="server" 
                                                                        src='<%# string.Concat("img/", Eval("Image")) %>'
                                                                        class="img-responsive" width="300"
                                                                        Visible='<%# Eval("Status").ToString() == "Completed" || Eval("Status").ToString() == "Uploaded Payment" %>'
                                                                        ></asp:image>
                                                                    </div>
                                                             </div>
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
                            </asp:updatepanel>
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

