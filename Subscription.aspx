<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row heading">
        <h2 class="text-primary"><b>Subscription Pricing</b></h2>
        <%--<p>Unlimited Projects for Employers!</p>--%>
    </div>
    <hr />
  
    <fieldset>
        <div class="row">
            <div class="col-md-6">
                <asp:Panel id="mypanel1" runat="server" class="panel panel-warning">
                    <div class="panel-heading text-center"><h3><b>Yearly</b></h3></div>
                    <div class="panel-body">
                        <ul>
                            <li>Verifified Icon <i class="fa fa-check-circle-o text-primary"></i></li>
                            <li>Subscribed in Year</li>
                            <li>Price: 1,2000.00</li>
                        </ul>
                        <div class="row text-center">
                            <asp:Button runat="server" class="btn btn-info" OnClick="select1" Text="Select"/>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-6">
                <asp:Panel id="mypanel2" runat="server" class="panel panel-warning">
                    <div class="panel-heading text-center"><h3><b>Monthly</b></h3></div>
                    <div class="panel-body">
                        <ul>
                            <li>Verifified Icon <i class="fa fa-check-circle-o text-primary"></i></li>
                            <li>Subscribed Monthly</li>
                            <li>Price: 100.00</li>
                        </ul>
                        <div class="row text-center">
                            <asp:button runat="server" class="btn btn-info" OnClick="select2" Text="Select"/>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 text-center">
                <b>Price </b>
                <br />
                Php <asp:Label id="lblPrice" runat="server"/>
            </div>
            <div class="col-md-4"></div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 text-center">
                <b>Quantity</b><br /><asp:textbox id="txtQty" runat="server" value="1" type="number" class="form-control"/>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
             <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Button ID="btnReg" runat="server" Text="Subscribe!" type="button" class="btn btn-success"  Width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
            </div>
             <div class="col-md-4"></div>
        </div>
    </fieldset>
</asp:Content>

