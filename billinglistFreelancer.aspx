<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="billinglistFreelancer.aspx.cs" Inherits="billinglistFreelancer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="jobs">
        <div class="container">

            <div class="companies">
     <div class="row heading">
                <h2>Billing List</h2>
                
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
                                                <th>Billing #</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Ref. #</th>
                                                <th>Status</th>
                                                <th>Payment Date</th>
                                                <th>Image</th>
                                                <th>Upload Payment</th>
                                               <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("Billingid")%></td>
                                                          <td><%# Eval("datetime")%></td>
                                                        <td><%# Eval("amount")%></td>
                                                         <td><%# Eval("refid")%></td>
                                                       <td><%# Eval("status")%></td>
                                                        <td><%# Eval("dateuploaded")%></td>
                                                        <td>  <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="300" /></td>
                                                         <td>
                                        <a href='uploadbillingpayment.aspx?ID=<%# Eval("Billingid") %>&OID=<%# Eval("refid") %>' onclick="javascript:return confirm('Are you sure you want to complete?');">Upload</a>
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
                </div>
            </div>
         </section>

</asp:Content>

