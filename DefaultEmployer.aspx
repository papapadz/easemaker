<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="DefaultEmployer.aspx.cs" Inherits="DefaultEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-primary text-center" style="padding:10px">
                        <h2 class="number"><a href="joblist.aspx">
                            <asp:Label ID="lblPIO" Text="0" runat="server"></asp:Label></a>            <i class="fa fa-file text-primary"></i>
                        </h2>
                        <span><b>Posted Projects</b></span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary text-center" style="padding:10px">
                        <h2 class="number"><a href="projectmanagement.aspx?status=On-Going">
                            <asp:Label ID="lblEval" Text="0" runat="server"></asp:Label></a>            <i class="fa fa-shopping-cart text-primary"></i>
                        </h2>
                        <span><b>On-Going Projects</b></span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary text-center" style="padding:10px">
                        <h2 class="number"><a href="projectmanagement.aspx?status=Completed">
                            <asp:Label ID="Label1" Text="0" runat="server"></asp:Label></a>            <i class="fa fa-shopping-cart text-primary"></i>
                        </h2>
                        <span><b>Completed Projects</b></span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary text-center" style="padding:10px">
                        <h2 class="number"><a href="billinglistemployer.aspx">
                            <asp:Label ID="Label2" Text="0" runat="server"></asp:Label></a>            <i class="fa fa-credit-card text-primary"></i>
                        </h2>
                        <span><b>Pending Billing</b></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

