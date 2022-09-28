<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>Dashboard</h2>
        <p></p>
    </div>
    <div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="billinglist.aspx">
                            <asp:Label ID="lblB" Text="0" runat="server"></asp:Label></a> <i class="fa fa-money"></i></h2>
                        <span class="desc">Pending Billing</span>
                       <%-- <div class="icon">
                            <i class="fa fa-list"></i>
                        </div>--%>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="subscriptionlist.aspx">
                            <asp:Label ID="lblP" Text="0" runat="server"></asp:Label></a> <i class="fa fa-mouse-pointer"></i></h2>
                        <span class="desc">Pending Subscription</span>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="accountmanagement.aspx">
                            <asp:Label ID="lblF" Text="0" runat="server"></asp:Label></a> <i class="fa fa-users"></i></h2>
                        <span class="desc">Pending Freelancer</span>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="employers.aspx">
                            <asp:Label ID="lblE" Text="0" runat="server"></asp:Label></a> <i class="fa fa-users"></i></h2>
                        <span class="desc">Pending Employer</span>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="joblistadmin.aspx">
                            <asp:Label ID="lblPP" Text="0" runat="server"></asp:Label></a> <i class="fa fa-file"></i></h2>
                        <span class="desc">Posted Project</span>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="joblistadmin.aspx">
                            <asp:Label ID="lblOP" Text="0" runat="server"></asp:Label></a> <i class="fa fa-file"></i></h2>
                        <span class="desc">On-Going Project</span>
                </div>
              </div>
            </div>
         </div>
        <div class="col-md-3">
            <div class="panel panel-default text-center">
              <div class="panel-body">
                <div class="statistic__item statistic__item--orange">
                        <h2 class="number"><a href="joblistadmin.aspx">
                            <asp:Label ID="lblCP" Text="0" runat="server"></asp:Label></a> <i class="fa fa-file"></i></h2>
                        <span class="desc">Completed Project</span>
                </div>
              </div>
            </div>
         </div>
    </div>
</asp:Content>

