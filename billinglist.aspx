<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="billinglist.aspx.cs" Inherits="billinglist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <script src="js/bootsnav.js"></script>
    <div class="row heading">
        <h2>Billing List</h2>
          <p><asp:DropDownList runat="server" ID="ddltimecat" class="form-control" AutoPostBack="true" Width="200" OnSelectedIndexChanged="ddltimecat_SelectedIndexChanged">

                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                           <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                    </asp:DropDownList></p>
    </div>

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
                                                <th>Status</th>
                                                  <th>Purpose</th>
                                                  <th>Payment Date</th>
                                                <th>Image</th>
                                                <th>Completed</th>
                                               <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("Billingid")%></td>
                                                        <td><%# Eval("companyname")%><%# Eval("personname")%></td>
                                                          <td><%# Eval("datetime")%></td>
                                                        <td><%# Eval("amount")%></td>
                                                         <td><%# Eval("refid")%></td>

                                                       <td><%# Eval("status")%></td>
                                                         <td><%# Eval("purpose")%></td>
                                                         <td><%# Eval("dateuploaded")%></td>
                                                         <td>  <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="500" /></td>
                                              
                                                         <td>
                                        <a href='completed.aspx?ID=<%# Eval("Billingid") %>&purpose=<%# Eval("purpose") %>&UID=<%# Eval("userid") %>&status=<%# Eval("status") %>&JID=<%# Eval("refid") %>' onclick="javascript:return confirm('Are you sure you want to complete?');">Complete</a>
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
</asp:Content>

