<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
</head>

<body>
    
    <!-- Navigation Start  -->
    <nav class="navbar navbar-default navbar-sticky bootsnav">
        <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="">
                    <img src="img/logo.png" class="logo" width="100" /></a>
            </div>
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href=""><%--img src="img/157027885_340873517247973_412813254201830541_n.jpg" class="logo" width="60" />--%></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
             <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                    <li><a href="default.aspx">Home</a></li>
                    <li><a href="joblistdefault.aspx?ST=&yrs=&cat=">Project List</a></li>
                    <li><a href="aboutus.aspx">About Us</a></li>
                    <li><a href="login.aspx">Login</a></li>
                    <li><a href="register.aspx">Register</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- Navigation End  -->

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <section class="main-banner" style="background: #242c36 url() no-repeat">
        <div class="container">
            <div class="caption">
                <h2>Welcome!</h2>
                <form id="form1" runat="server">
                    <fieldset>
                        <div class="col-md-7 col-sm-7 no-pad">
                            <%--	<input type="text" class="form-control border-right" placeholder="Skills, Designation, Companies" />--%>
                            <asp:TextBox ID="txtSearch" runat="server" class="form-control border-righ" type="text" placeholder="Type Here.." MaxLength="50" oncopy="return false" onpaste="return false" oncut="return false" />

                        </div>
                              <div class="col-md-3 col-sm-3 no-pad">
                           
                               <asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker" data-live-search="true"
                                            AutoPostBack="true"/>
                        </div>
                        <%--<div class="col-md-3 col-sm-3 no-pad">
                      <%--      <asp:DropDownList ID="ddlYears" runat="server" class="selectpicker border-right">
                                <asp:ListItem Selected="true" Text="0" Value="0">Category
                                </asp:ListItem>
                                  <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                 <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                  <asp:ListItem Text="5 or Higher" Value="5"></asp:ListItem>
                            </asp:DropDownList>--%>
                            <%-- <asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker" data-live-search="true"
                                            AutoPostBack="true"/>--%>
                            <%--	<select class="selectpicker border-right">
								  <option>Experience</option>
								  <option>0 Year</option>
								  <option>1 Year</option>
								  <option>2 Year</option>
								  <option>3 Year</option>
								  <option>4 Year</option>
								  <option>5 Year</option>
								  <option>6 Year</option>
								  <option>7 Year</option>
								  <option>8 Year</option>
								  <option>9 Year</option>
								 <option>10 Year</option>
								</select>--%>
                        <%--</div>--%>
                     <%--   <div class="col-md-3 col-sm-3 no-pad">
                           
                               <asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker" data-live-search="true"
                                            AutoPostBack="true"/>
                        </div>--%>
                        <div class="col-md-2 col-sm-2 no-pad">
                             <asp:Button ID="btnsubmit" runat="server" class="btn seub-btn" Text="Search" OnClick="btnsubmit_Click" style="color:white;" />


                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <div class="col-md-4 col-sm-4" onclick="btnCreateAccount">
                <a href="register.aspx">
                    <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-dial"></span></span>
                    <h3>Create Account</h3>
                    <p>Create your account now in order to apply your desired job.</p>
                </div>
                </a>
            </div>

            <div class="col-md-4 col-sm-4">
                <a href="joblistdefault.aspx?ST=&yrs=&cat=">
                    <div class="features-content">
                        <span class="box1"><span aria-hidden="true" class="icon-search"></span></span>
                        <h3>Search Desired Job</h3>
                        <p>All available job offers can be found in one place.</p>
                    </div>
                </a>
            </div>

          <%--  <div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-printer"></span></span>
                    <h3>Send Your Resume</h3>
                    <p>Create and submit your resume conveniently online.</p>
                </div>
            </div>--%>

<%--            <div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-dial"></span></span>
                    <h3>Create Employer Account</h3>
                    <p>Create a client account to post available job .</p>
                </div>
            </div>--%>

            <div class="col-md-4 col-sm-4">
                <a href="aboutus.aspx">
                    <div class="features-content">
                        <span class="box1"><span aria-hidden="true" class="icon-phone"></span></span>
                        <h3>Contact Details</h3>
                        <p>0917-866-9690
                        <br />alrafedain_manpower@yahoo.com</p>
                    </div>
                </a>
            </div>

            <%--<div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-map"></span></span>
                    <h3>Address</h3>
                    <p>2654-D Leveriza Street Corner P. Ocampo Street (Vito Cruz) Malate Manila</p>
                </div>
            </div>--%>

        </div>
    </section>

   

   
    <!-- footer start -->
    <%--<footer>--%>
        <%--<div class="container">
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
        <%--<div class="copy-right">
            <p>&copy;Copyright 2021 Al Refedain <a href="https://themezhub.com/">ThemezHub</a></p>
        </div>
    </footer>--%>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script src="js/bootsnav.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

