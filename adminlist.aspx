<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminlist.aspx.cs" Inherits="adminlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <script src="js/bootsnav.js"></script>
  
                <h2 class="text-primary"><b>Admin List</b> <a class="btn btn-success" href="AddAdmin.aspx"><i class="fa fa-plus"></i></a></h2>
              <p>
         
                        <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Employer Name here..." />
                      
                  
         <asp:Button ID="Button1" Text="Search" runat="server"
                            class="btn btn-primary" OnClick="Button1_Click1" />
            </p>
        
    <hr />
          <div class="table-responsive">
                            <asp:UpdatePanel ID="upInv" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lvInventory" EventName="PagePropertiesChanging" />
                                </Triggers>
                                <ContentTemplate>
                                    <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                                    <%--  <div class="table-responsive-sm">--%>
                                    <table  class="table" width="100%">

                                        <thead>
                                            <tr>
                                                <th>Email</th>
                                                <th>Applicant Name</th>
                                                <th>Address</th>
                                                <th>Contact Number</th>
                                                <th>User Type</th>
                                                <th>Status</th>
                                                <th>Edit</th>
                                               <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("Email")%></td>
                                                        <td><%# Eval("PersonName")%></td>
                                                          <td><%# Eval("Address")%></td>
                                                        <td><%# Eval("ContactNo")%></td>
                                                        <td><%# Eval("UserType")%></td>
                                                         <td><%# Eval("status")%></td>
                                                         <td>
                                <a href='editadmin.aspx?ID=<%# Eval("userid") %>' onclick="javascript:return confirm('Are you sure you want to Edit?');">Edit</a>
                            </td>
                                                  <%--      <%--<td><%# String.Format("{0:d/MM/yyyy HH:mm:tt}", Eval("BSPCDateadded")) %></td>
                                               --%>
                                               <%--     <td><%# Eval("status")%></td>
                                                        <td>    <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                    class="img-responsive" width="100" /></td>
                                                    </tr>--%>
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
                  
</asp:Content>

