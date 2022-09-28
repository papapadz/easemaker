<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="DefaultEmployer.aspx.cs" Inherits="DefaultEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>Notifications</h2>
        <p></p>
    </div>
    <div class="section">
        <!-- container -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="joblist.aspx">
                            <asp:Label ID="lblPIO" Text="0" runat="server"></asp:Label></a>            <i class="fa fa-file"></i></h2>
                        <span class="desc">Posted Projects</span>
                       <%-- <div class="icon">
                            <i class="fa fa-list"></i>
                        </div>--%>
                    </div>
                </div>
              
                 <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="projectmanagement.aspx">
                            <asp:Label ID="lblEval" Text="0" runat="server"></asp:Label></a></h2>
                        <span class="desc">On-Going Projects</span>
                        <div class="icon">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                    </div>
                </div>
                   <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="projectmanagement.aspx">
                            <asp:Label ID="Label2" Text="0" runat="server"></asp:Label></a></h2>
                        <span class="desc">Completed Projects</span>
                        <div class="icon">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                    </div>
                </div>
                 <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="billinglistemployer.aspx">
                            <asp:Label ID="Label1" Text="0" runat="server"></asp:Label></a></h2>
                        <span class="desc">Pending Billing</span>
                        <div class="icon">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

