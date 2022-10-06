<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="billinglistEmployer.aspx.cs" Inherits="billinglistEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
                <h2 class="text-primary"><b>Billing List</b></h2>
                
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
                                    <table  class="display table" width="100%">

                                        <thead>
                                            <tr>
                                                <th>Billing #</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Ref. #</th>
                                                <th>Status</th>
                                                <th>Payment Date</th>
                                                <th>Proof of Payment</th>
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
                                                        <td>  
                                                            
                                                            <asp:image id="Img1" 
                                                                runat="server" 
                                                                src='<%# string.Concat("img/", Eval("Image")) %>'
                                                                class="img-responsive" width="300"
                                                                Visible='<%# Eval("Status").ToString() == "Completed" || Eval("Status").ToString() == "Uploaded Payment" %>'
                                                                ></asp:image>
                                                            <asp:Hyperlink id="hlink1"
                                                                runat="server" 
                                                                NavigateUrl='<%# string.Concat("uploadbillingpayment.aspx?ID=", Eval("Billingid"), "&OID=", Eval("refid")) %>'
                                                                class="btn btn-xs btn-info"
                                                                Text='<i class="fa fa-upload"></i> Upload'
                                                                Visible='<%# Eval("Status").ToString() != "Completed" && Eval("Status").ToString() != "Uploaded Payment"%>'
                                                                ></asp:Hyperlink>
                                        
                                    </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <EmptyDataTemplate>
                                                    <tr>
                                                        <td colspan="7">
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

