<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row heading">
        <h2>Subscription Pricing</h2>
        <p>Unlimited Projects for Employers!</p>
    </div>
    
  
                    <fieldset>
                      
                         <div class="form-group">
                            <label class="col-md-4 control-label">Category</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                                  <asp:DropDownList runat="server" ID="ddlUserType" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlUserType_SelectedIndexChanged">
                        <asp:ListItem Text="Monthly" Value="Monthly"></asp:ListItem>
                        <asp:ListItem Text="Yearly" Value="Yearly"></asp:ListItem>
                    </asp:DropDownList></div>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Price</label>
                            <div class="col-md-8 inputGroupContainer">
                           
                                  Php <asp:Label id="lblPrice" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Quantity</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><%--<span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>--%>
                                  <asp:textbox id="txtQty" runat="server" class="form-control"  required/></div>
                            </div>
                        </div>
                       
                        
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Subscribe!" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>
</asp:Content>

