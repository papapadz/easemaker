<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="employerportfolio.aspx.cs" Inherits="employerportfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>View Portfolio</h2>
        
    </div>


    <fieldset>

        <div class="form-group">
            <label class="col-md-4 control-label">Full Name</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="txtContactPerson" runat="server" Enabled="false" class="form-control" placeholder="Applicant Name here" />
                </div>
            </div>
        </div>
      
         <div class="form-group">
                                              <table class="display table" width="100%">

                                            <thead>
                                                <tr>
                                                  <%--  <th></th>
                                                    <th>Delete</th>--%>
                                                    <%-- <th>Deactivate</th>
                                                <th>Activate</th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <%-- <td><%# Eval("Email")%></td>
                                                        <td><%# Eval("PersonName")%></td>
                                                          <td><%# Eval("Address")%></td>
                                                        <td><%# Eval("ContactNo")%></td>
                                                         <td><%# Eval("status")%></td>--%>


                                                            <td>
                                                                <img id="Img1" runat="server" src='<%# string.Concat("img/", Eval("Image")) %>'
                                                                    class="img-responsive" width="600" /></td>
                                                            <%--                                                         <td>    <img id="Img2" runat="server" src='<%# string.Concat("img/", Eval("Image2")) %>'
                                                    class="img-responsive" width="100" /></td>--%>
                                                         
                                                          
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
                                        <asp:DataPager ID="dpInventory" runat="server" PageSize="1" PagedControlID="lvInventory">
                                            <Fields>
                                                <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn btn-primary" />
                                                <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn btn-primary" NextPreviousButtonCssClass="btn btn-primary" />
                                                <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn btn-primary" />
                                            </Fields>
                                        </asp:DataPager>
                  </div>
        <div class="form-group">

            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-primary" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

            </div>
        </div>
    </fieldset>
</asp:Content>

