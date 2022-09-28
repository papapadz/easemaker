﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>


<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Ease Maker</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- All Plugin Css -->
    <link rel="stylesheet" href="css/plugins.css">

    <!-- Style & Common Css -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <!-- Navigation Start  -->
    <nav class="navbar navbar-default navbar-sticky bootsnav">

        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href=""><%--<img src="img/logo.png" class="logo" alt="">--%> <img src="img/logo.png" class="logo" width="100" /></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                    <li><a href="defaultemployer.aspx">Home</a></li>

                    <%--							<li><a href="companies.html">Companies</a></li> 
                        <li><a href="companies.html">Jobs</a></li> --%>
                    <%--  <li><a href="login.html">Login</a></li>--%>
                 <%--   <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">File Maintenance</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                        
                            <li><a href="applicantlistclient.aspx">Applicant List</a></li>
                        </ul>
                    </li>--%>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Transactions</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                       
                            <li><a href="joblist.aspx">My Project List</a></li>
                             <li><a href="projectmanagement.aspx">Project Management</a></li>
                        </ul>
                    </li>
                    <%--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                            <li class="active"><a href="browse-job.html">Browse Jobs</a></li>
                            <li><a href="company-detail.html">Job Detail</a></li>
                            <li><a href="resume.html">Resume Detail</a></li>
                        </ul>
                    </li>--%>
                    <li><a href="logout.aspx">Logout</a></li>
                      <li><a href="myprofileemployer.aspx">Employer Profile</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- Navigation End  -->

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <section class="jobs">
        <div class="container">

            <div class="companies">
                  <form runat="server" class="well form-horizontal">
                     <asp:ScriptManager ID="ScriptManager1" runat="server" />
                      <div>
 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large"></asp:Label>
            <asp:Timer ID="tm1" Interval="1000" runat="server" OnTick="tm1_Tick" />
            <asp:Button ID="btnStart" Text="Start" runat="server" OnClick="Start" />
            <asp:Button ID="btnStop" Text="Stop" runat="server" OnClick="Stop" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="tm1" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
</div>

             <%--   <asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
                </asp:ContentPlaceHolder>--%>
                      </form>
            </div>

        </div>
    </section>



    <!-- footer start -->
    <footer>
        <%--	<div class="container">
				<div class="col-md-3 col-sm-6">
					<h4>Featured Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Latest Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Reach Us</h4>
					<address>
					<ul>
					<li>1201, Murakeu Market, QUCH07<br>
					United Kingdon</li>
					<li>Email: Support@job.com</li>
					<li>Call: 044 123 458 65879</li>
					<li>Skype: job@skype</li>
					<li>FAX: 123 456 85</li>
					</ul>
					</address>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Drop A Mail</h4>
					<form>
						<input type="text" class="form-control input-lg" placeholder="Your Name">
						<input type="text" class="form-control input-lg" placeholder="Email...">
						<textarea class="form-control" placeholder="Message"></textarea>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
				
				
			</div>--%>
        <div class="copy-right">
            <p>&copy;Copyright 2021 Al Refedain <a href="https://themezhub.com/">ThemezHub</a></p>
        </div>
    </footer>


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script src="js/bootsnav.js"></script>
    <script src="js/main.js"></script>
   
</body>

</html>


